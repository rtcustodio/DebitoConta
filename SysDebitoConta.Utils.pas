unit SysDebitoConta.Utils;

interface

  function Date_AAAAMMDD_ToDate(ADate: string) : TDate;
  function StrToDouble(AValor : string; CasasDecimais : integer) : double;
  function DoubleToStrApenasNumeros(AValue : double) : string;

implementation

uses
  System.SysUtils;

function Date_AAAAMMDD_ToDate (ADate: string) : TDate;
var
  Ano, Mes, Dia : word;
begin
  Ano := Copy(ADate, 1, 4).ToInteger;
  Mes := Copy(ADate, 5, 2).ToInteger;
  Dia := Copy(ADate, 7, 2).ToInteger;
  Result := EncodeDate(Ano, Mes, Dia);
end;

function StrToDouble(AValor : string; CasasDecimais : integer) : double;
var
  Valor : double;
  Dividendo : integer;
  Zeros : string;
begin
  Zeros := Zeros.PadLeft(CasasDecimais, '0');
  Dividendo := StrToInt( '1' + Zeros );
  Valor := StrToInt64(AValor);
  Result := Valor / Dividendo;
end;

function DoubleToStrApenasNumeros(AValue : double) : string;
begin
  Result := AValue.ToString;
  Result.Replace('.', '');
  Result.Replace(',', '');
end;

end.
