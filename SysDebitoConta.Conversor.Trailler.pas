unit SysDebitoConta.Conversor.Trailler;

interface

uses
  SysDebitoConta.Conversor.Interfaces,
  System.Generics.Collections,
  SysDebitoConta.RegistroDebitoConta,
  System.SysUtils,
  SysDebitoConta.Utils;

type
  TConversorConteudoTraillerBancoDoBrasil = class(TInterfacedObject, IConversorConteudoTrailler)
  private
    FListaRegistros : TObjectList<TRegistroDebito>;
    FValorTotal : double;
    FQuantidadeRegistros : integer;
    FLinhaCompleta : string;
    F01 : string;
    F04 : string;
    procedure CalcularTotalizadores;
    procedure CalcularValorTotalDebitos(AValue : TObjectList<TRegistroDebito>);
    procedure CalcularQuantidadeRegistros(AValue : TObjectList<TRegistroDebito>);
    procedure InterpretarConteudoLinha;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IConversorConteudoTrailler;
    function GetQuantidadeRegistros : integer;
    function GetValorTotalDebitos : double;
    function SetListaRegistros(AValue : TObjectList<TRegistroDebito>) : IConversorConteudoTrailler;
    function SetLinhaCompleta (AValue : string) : IConversorConteudoTrailler;
    function GetLinhaCompleta : string;
  end;

implementation

{ TConversorConteudoTraillerBancoDoBrasil }

procedure TConversorConteudoTraillerBancoDoBrasil.CalcularQuantidadeRegistros(
  AValue: TObjectList<TRegistroDebito>);
begin
  FQuantidadeRegistros := AValue.Count + 2;
end;

procedure TConversorConteudoTraillerBancoDoBrasil.CalcularTotalizadores;
begin
  CalcularValorTotalDebitos(FListaRegistros);
  CalcularQuantidadeRegistros(FListaRegistros);
end;

procedure TConversorConteudoTraillerBancoDoBrasil.CalcularValorTotalDebitos(
  AValue: TObjectList<TRegistroDebito>);
var
  I: Integer;
begin
  for I := 0 to Pred( AValue.Count ) do
  begin
    FValorTotal := FValorTotal + AValue[I].ValorDebito;
  end;
end;

constructor TConversorConteudoTraillerBancoDoBrasil.Create;
begin
  F01 := 'Z';
end;

destructor TConversorConteudoTraillerBancoDoBrasil.Destroy;
begin

  inherited;
end;

function TConversorConteudoTraillerBancoDoBrasil.GetLinhaCompleta: string;
begin
  CalcularTotalizadores;
  Result :=
    F01.PadRight(1, ' ')+
    FQuantidadeRegistros.ToString.PadLeft(6, '0')+
    DoubleToStrApenasNumeros( FValorTotal ).PadLeft(17, '0')+
    F04.PadRight(126, ' ');
end;

function TConversorConteudoTraillerBancoDoBrasil.GetQuantidadeRegistros: integer;
begin
  Result := FQuantidadeRegistros;
end;

function TConversorConteudoTraillerBancoDoBrasil.GetValorTotalDebitos: double;
begin
  Result := FValorTotal;
end;

procedure TConversorConteudoTraillerBancoDoBrasil.InterpretarConteudoLinha;
begin
  F01 := FLinhaCompleta.Substring(0, 1); //código do registro
  FQuantidadeRegistros := FLinhaCompleta.Substring(1, 6).ToInteger;
  FValorTotal := StrToDouble( FLinhaCompleta.Substring(7, 17), 2 );
  F04 := FLinhaCompleta.Substring(24, 126); //código do registro
end;

class function TConversorConteudoTraillerBancoDoBrasil.New: IConversorConteudoTrailler;
begin
  Result := Self.Create;
end;

function TConversorConteudoTraillerBancoDoBrasil.SetLinhaCompleta(
  AValue: string): IConversorConteudoTrailler;
begin
  Result := Self;
  FLinhaCompleta := AValue;
  InterpretarConteudoLinha;
end;

function TConversorConteudoTraillerBancoDoBrasil.SetListaRegistros(
  AValue: TObjectList<TRegistroDebito>): IConversorConteudoTrailler;
begin
  Result := Self;
  FListaRegistros := AValue;
end;

end.
