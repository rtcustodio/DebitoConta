unit SysDebitoConta.Conversor.HeaderBancoDoBrasil;

interface

uses
  SysDebitoConta.Conversor.Interfaces,
  System.SysUtils, SysDebitoConta, SysDebitoConta.InformacoesDebitoConta;

type
  TConversorConteudoHeaderBancoDoBrasil = class(TInterfacedObject, IConversorConteudoHeader)
  private
    FConteudoLinha : string;
    F01 : string;
    F02 : string;
    F03 : string;
    F04 : string;
    F05 : string;
    F06 : string;
    F07 : string;
    F08 : string;
    F09 : string;
    F10 : string;
    F11 : string;
    function Set01 (AValue : string) : IConversorConteudoHeader;
    function Set02 (AValue : string) : IConversorConteudoHeader;
    function Set03 (AValue : string) : IConversorConteudoHeader;
    function Set04 (AValue : string) : IConversorConteudoHeader;
    function Set05 (AValue : string) : IConversorConteudoHeader;
    function Set06 (AValue : string) : IConversorConteudoHeader;
    function Set07 (AValue : string) : IConversorConteudoHeader;
    function Set08 (AValue : string) : IConversorConteudoHeader;
    function Set09 (AValue : string) : IConversorConteudoHeader;
    function Set10 (AValue : string) : IConversorConteudoHeader;
    function Set11 (AValue : string) : IConversorConteudoHeader;
    procedure InterpretarConteudoLinha;
    procedure GerarConteudoLinha;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IConversorConteudoHeader;
    function SetLinhaCompleta( AValue : string ) : IConversorConteudoHeader;
    function Get01 : string;
    function Get02 : string;
    function Get03 : string;
    function Get04 : string;
    function Get05 : string;
    function Get06 : string;
    function Get07 : string;
    function Get08 : string;
    function Get09 : string;
    function Get10 : string;
    function Get11 : string;
    function SetInformacoesDebito (AValue : TInformacoesDebito) : IConversorConteudoHeader;
    function GetLinhaCompleta : string;
  end;

implementation

{ TConversorStringParaConteudoHeaderBancoDoBrasil }

constructor TConversorConteudoHeaderBancoDoBrasil.Create;
begin

end;

destructor TConversorConteudoHeaderBancoDoBrasil.Destroy;
begin

  inherited;
end;

procedure TConversorConteudoHeaderBancoDoBrasil.GerarConteudoLinha;
begin
  FConteudoLinha :=
    F01.PadRight(1, ' ') +
    F02.PadLeft(1, '0') +
    F03.PadRight(20, ' ') +
    F04.PadRight(20, ' ') +
    F05.PadLeft(3, '0') +
    F06.PadRight(20, ' ') +
    F07.PadRight(8, ' ') +
    F08.PadLeft(6, '0') +
    F09.PadRight(2, ' ') +
    F10.PadRight(17, ' ') +
    F11.PadRight(52, ' ') ;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get01: string;
begin
  Result := F01;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get02: string;
begin
  Result := F02;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get03: string;
begin
  Result := F03;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get04: string;
begin
  Result := F04;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get05: string;
begin
  Result := F05;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get06: string;
begin
  Result := F06;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get07: string;
begin
  Result := F07;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get08: string;
begin
  Result := F08;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get09: string;
begin
  Result := F09;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get10: string;
begin
  Result := F10;
end;

function TConversorConteudoHeaderBancoDoBrasil.Get11: string;
begin
  Result := F11;
end;

function TConversorConteudoHeaderBancoDoBrasil.GetLinhaCompleta: string;
begin
  GerarConteudoLinha;
  Result := FConteudoLinha;
end;

procedure TConversorConteudoHeaderBancoDoBrasil.InterpretarConteudoLinha;
begin
  F01 := FConteudoLinha.Substring(0, 1); //c?digo do registro
  F02 := FConteudoLinha.Substring(1, 1); //c?digo de remessa
  F03 := FConteudoLinha.Substring(2, 20); //c?digo do conv?nio
  F04 := FConteudoLinha.Substring(22, 20); //nome da empresa
  F05 := FConteudoLinha.Substring(42, 3); //c?digo do banco
  F06 := FConteudoLinha.Substring(45, 20); //nome do banco
  F07 := FConteudoLinha.Substring(65, 8); //data de gera??o
  F08 := FConteudoLinha.Substring(73, 6); //numero sequencial do arquivo
  F09 := FConteudoLinha.Substring(79, 1); //vers?o do layout
  F10 := FConteudoLinha.Substring(81, 17); //identifica??o do servi?o
  F11 := FConteudoLinha.Substring(98, 52); //reservado
end;

class function TConversorConteudoHeaderBancoDoBrasil.New: IConversorConteudoHeader;
begin
  Result := Self.Create;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set01(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F01 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set02(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F02 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set03(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F03 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set04(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F04 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set05(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F05 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set06(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F06 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set07(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F07 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set08(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F08 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set09(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F09 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set10(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F10 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.Set11(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  F11 := AValue;
end;

function TConversorConteudoHeaderBancoDoBrasil.SetInformacoesDebito(
  AValue: TInformacoesDebito): IConversorConteudoHeader;
begin
  Set01('A');
  Set02('1');
  Set03(AValue.CodigoConvenio);
  Set04(AValue.NomeEmpresa);
  Set05(AValue.CodigoBanco);
  Set06(AValue.NomeBanco);
  Set07( FormatDateTime('yyyymmdd', AValue.DataGeracao) );
  Set08(AValue.NumeroSequencial.ToString);
  Set09('04');
  Set10('DEBITO AUTOMATICO');
end;

function TConversorConteudoHeaderBancoDoBrasil.SetLinhaCompleta(
  AValue: string): IConversorConteudoHeader;
begin
  Result := Self;
  FConteudoLinha := AValue;
  InterpretarConteudoLinha;
end;

end.
