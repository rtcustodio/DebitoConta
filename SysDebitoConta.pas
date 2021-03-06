unit SysDebitoConta;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  SysDebitoConta.Conversor.Interfaces,
  SysDebitoConta.InformacoesDebitoConta,
  SysDebitoConta.RegistroDebitoConta;

type
  TBanco = (BancoDoBrasil);

  TDebitoConta = class
  private
    FInformacoesDebito : TInformacoesDebito;
    FListaRegistroDebito : TObjectList<TRegistroDebito>;
    FConteudoArquivo : TStrings;
    FBanco: TBanco;
    procedure SetInformacoesDebito(const Value: TInformacoesDebito);
    procedure SetListaRegistroDebito(const Value: TObjectList<TRegistroDebito>);
    procedure CarregarConteudoArquivo (AValue : string);
    procedure LerArquivo; overload;
    procedure LerInformacoesDebito(AValue : string);
    procedure LerRegistrosDebito(AValue : string);
    procedure LerTrailler(AValue : string);
    procedure EscreverInformacoesDebito;
    procedure EscreverRegistrosDebito;
    procedure EscreverTrailler;
    procedure SetBanco(const Value: TBanco);
  public
    constructor Create;
    destructor Destroy; override;
    property Banco : TBanco read FBanco write SetBanco;
    property InformacoesDebito : TInformacoesDebito read FInformacoesDebito write SetInformacoesDebito;
    property ListaRegistroDebito : TObjectList<TRegistroDebito> read FListaRegistroDebito write SetListaRegistroDebito;
    procedure LerArquivo(PathArquivo : string); overload;
    procedure GerarArquivo (PathArquivo : string);
  end;

implementation

uses
  SysDebitoConta.Conversor.HeaderBancoDoBrasil,
  SysDebitoConta.Utils, SysDebitoConta.Conversor.RegistroDebitoBancoDoBrasil,
  SysDebitoConta.Conversor.Trailler;

{ TDebitoConta }

constructor TDebitoConta.Create;
begin
  FInformacoesDebito := TInformacoesDebito.Create;
  FListaRegistroDebito := TObjectList<TRegistroDebito>.Create;
  FConteudoArquivo := TStringList.Create;
end;

destructor TDebitoConta.Destroy;
begin
  FreeAndNil(FInformacoesDebito);
  FreeAndNil(FListaRegistroDebito);
  FreeAndNil(FConteudoArquivo);
  inherited;
end;

procedure TDebitoConta.EscreverInformacoesDebito;
var
  Header : IConversorConteudoHeader;
begin
  case FBanco of
    BancoDoBrasil : Header := TConversorConteudoHeaderBancoDoBrasil.New;
  end;
  Header.SetInformacoesDebito( FInformacoesDebito );
  FConteudoArquivo.Add( Header.GetLinhaCompleta );
end;

procedure TDebitoConta.EscreverRegistrosDebito;
var
  RegistroDebitoConversor : IConversorConteudoRegistro;
  I: Integer;
begin
  case FBanco of
    BancoDoBrasil: RegistroDebitoConversor := TConversorConteudoRegistroBancoDoBrasil.New;
  end;

  for I := 0 to Pred( FListaRegistroDebito.Count ) do
  begin
    RegistroDebitoConversor.SetInformacoesDebito( FListaRegistroDebito[I] );
    FConteudoArquivo.Add( RegistroDebitoConversor.GetLinhaCompleta );
  end;
end;

procedure TDebitoConta.EscreverTrailler;
var
  TraillerConversor : IConversorConteudoTrailler;
begin
  case FBanco of
    BancoDoBrasil: TraillerConversor := TConversorConteudoTraillerBancoDoBrasil.New;
  end;
  TraillerConversor.SetListaRegistros( FListaRegistroDebito );
  FConteudoArquivo.Add( TraillerConversor.GetLinhaCompleta );
end;

procedure TDebitoConta.GerarArquivo(PathArquivo : string);
begin
  EscreverInformacoesDebito;
  EscreverRegistrosDebito;
  EscreverTrailler;
  FConteudoArquivo.SaveToFile(PathArquivo);
end;

procedure TDebitoConta.LerArquivo(PathArquivo: string);
begin
  CarregarConteudoArquivo(PathArquivo);
  LerArquivo;
end;

procedure TDebitoConta.LerArquivo;
var
  I: Integer;
begin
  for I := 0 to Pred(FConteudoArquivo.Count) do
  begin
    if Copy(FConteudoArquivo[I], 0, 1).Equals('A') then
      LerInformacoesDebito(FConteudoArquivo[I]);
    if Copy(FConteudoArquivo[I], 0, 1).Equals('E') then
      LerRegistrosDebito(FConteudoArquivo[I]);
    if Copy(FConteudoArquivo[I], 0, 1).Equals('Z') then
      LerTrailler(FConteudoArquivo[I]);
  end;
  FConteudoArquivo.Clear;
end;

procedure TDebitoConta.LerInformacoesDebito(AValue : string);
var
  Header : IConversorConteudoHeader;
begin
  case FBanco of
    BancoDoBrasil : Header := TConversorConteudoHeaderBancoDoBrasil.New;
  end;

  Header.SetLinhaCompleta(AValue);
  FInformacoesDebito.CodigoBanco     := Header.Get05;
  FInformacoesDebito.CodigoConvenio  := Header.Get03;
  FInformacoesDebito.DataGeracao     := Date_AAAAMMDD_ToDate( Header.Get07 );
  FInformacoesDebito.NomeEmpresa     := Header.Get04;
  FInformacoesDebito.NumeroSequencial:= Header.Get08.ToInteger;
  FInformacoesDebito.NomeBanco       := Header.Get06;
end;

procedure TDebitoConta.LerRegistrosDebito(AValue : string);
var
  RegistroDebitoConversor : IConversorConteudoRegistro;
  RegistroDebito : TRegistroDebito;
begin
  case FBanco of
    BancoDoBrasil: RegistroDebitoConversor := TConversorConteudoRegistroBancoDoBrasil.New;
  end;
  RegistroDebito := TRegistroDebito.Create;

  RegistroDebitoConversor.SetLinhaCompleta(AValue);
  RegistroDebito.AgenciaDebito               := RegistroDebitoConversor.Get03;
  RegistroDebito.CodigoMovimento             := RegistroDebitoConversor.Get10;
  RegistroDebito.DataVencimento              := Date_AAAAMMDD_ToDate( RegistroDebitoConversor.Get05 );
  RegistroDebito.UsoEmpresa                  := RegistroDebitoConversor.Get08;
  RegistroDebito.IdentificacaoClienteEmpresa := RegistroDebitoConversor.Get02;
  RegistroDebito.CodigoMoeda                 := RegistroDebitoConversor.Get07;
  RegistroDebito.IdentificacaoClienteBanco   := RegistroDebitoConversor.Get04;

  if RegistroDebitoConversor.Get07.Equals('01') then
    RegistroDebito.ValorDebito := StrToDouble( RegistroDebitoConversor.Get06, 5);
  if RegistroDebitoConversor.Get07.Equals('03') then
    RegistroDebito.ValorDebito := StrToDouble( RegistroDebitoConversor.Get06, 2);

  FListaRegistroDebito.Add( RegistroDebito );
end;

procedure TDebitoConta.LerTrailler(AValue: string);
var
  TraillerConversor : IConversorConteudoTrailler;
begin
  case FBanco of
    BancoDoBrasil: TraillerConversor := TConversorConteudoTraillerBancoDoBrasil.New;
  end;
  TraillerConversor.SetLinhaCompleta(AValue);
  FInformacoesDebito.QuantidadeRegistros := TraillerConversor.GetQuantidadeRegistros;
  FInformacoesDebito.ValorTotalDebitos := TraillerConversor.GetValorTotalDebitos;
end;

procedure TDebitoConta.CarregarConteudoArquivo(AValue: string);
begin
  if not FileExists(AValue) then
    raise Exception.Create('Arquivo n?o localizado: ' + AValue);

  FConteudoArquivo.LoadFromFile(AValue);
end;

procedure TDebitoConta.SetBanco(const Value: TBanco);
begin
  FBanco := Value;
end;

procedure TDebitoConta.SetInformacoesDebito(const Value: TInformacoesDebito);
begin
  FInformacoesDebito := Value;
end;

procedure TDebitoConta.SetListaRegistroDebito(
  const Value: TObjectList<TRegistroDebito>);
begin
  FListaRegistroDebito := Value;
end;

end.
