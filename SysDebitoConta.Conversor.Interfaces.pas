unit SysDebitoConta.Conversor.Interfaces;

interface

uses
  SysDebitoConta.InformacoesDebitoConta,
  SysDebitoConta.RegistroDebitoConta, System.Generics.Collections;

type
  IConversorConteudoHeader = interface
    ['{E3777729-F62A-44D9-A7F2-E55C1AC9464D}']
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

  IConversorConteudoRegistro = interface
    ['{31480FBA-C89C-437D-9CB7-952BF9336FFD}']
    function SetLinhaCompleta( AValue : string ) : IConversorConteudoRegistro;
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
    function SetInformacoesDebito (AValue : TRegistroDebito) : IConversorConteudoRegistro;
    function GetLinhaCompleta : string;
  end;

  IConversorConteudoTrailler = interface
    ['{8DB40D5E-111C-40E4-9859-30599BABB0F7}']
    function GetQuantidadeRegistros : integer;
    function GetValorTotalDebitos : double;
    function SetListaRegistros(AValue : TObjectList<TRegistroDebito>) : IConversorConteudoTrailler;
    function SetLinhaCompleta (AValue : string) : IConversorConteudoTrailler;
    function GetLinhaCompleta : string;
  end;

implementation

end.
