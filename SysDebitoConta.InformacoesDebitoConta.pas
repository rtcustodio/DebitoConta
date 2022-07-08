unit SysDebitoConta.InformacoesDebitoConta;

interface

type
  TInformacoesDebito = class
  private
    FCodigoBanco: string;
    FCodigoConvenio: string;
    FDataGeracao: TDate;
    FNomeEmpresa: string;
    FNumeroSequencial: integer;
    FNomeBanco: string;
    FValorTotalDebitos: double;
    FQuantidadeRegistros: integer;
    procedure SetCodigoBanco(const Value: string);
    procedure SetCodigoConvenio(const Value: string);
    procedure SetDataGeracao(const Value: TDate);
    procedure SetNomeBanco(const Value: string);
    procedure SetNomeEmpresa(const Value: string);
    procedure SetNumeroSequencial(const Value: integer);
    procedure SetQuantidadeRegistros(const Value: integer);
    procedure SetValorTotalDebitos(const Value: double);
  public
    constructor Create;
    destructor Destroy; override;
    property CodigoConvenio : string read FCodigoConvenio write SetCodigoConvenio;
    property NomeEmpresa : string read FNomeEmpresa write SetNomeEmpresa;
    property CodigoBanco : string read FCodigoBanco write SetCodigoBanco;
    property NomeBanco : string read FNomeBanco write SetNomeBanco;
    property DataGeracao : TDate read FDataGeracao write SetDataGeracao;
    property NumeroSequencial : integer read FNumeroSequencial write SetNumeroSequencial;
    property QuantidadeRegistros : integer read FQuantidadeRegistros write SetQuantidadeRegistros;
    property ValorTotalDebitos : double read FValorTotalDebitos write SetValorTotalDebitos;
  end;

implementation

{ TInformacoesDebito }

constructor TInformacoesDebito.Create;
begin

end;

destructor TInformacoesDebito.Destroy;
begin

  inherited;
end;

procedure TInformacoesDebito.SetCodigoBanco(const Value: string);
begin
  FCodigoBanco := Value;
end;

procedure TInformacoesDebito.SetCodigoConvenio(const Value: string);
begin
  FCodigoConvenio := Value;
end;

procedure TInformacoesDebito.SetDataGeracao(const Value: TDate);
begin
  FDataGeracao := Value;
end;

procedure TInformacoesDebito.SetNomeBanco(const Value: string);
begin
  FNomeBanco := Value;
end;

procedure TInformacoesDebito.SetNomeEmpresa(const Value: string);
begin
  FNomeEmpresa := Value;
end;

procedure TInformacoesDebito.SetNumeroSequencial(const Value: integer);
begin
  FNumeroSequencial := Value;
end;

procedure TInformacoesDebito.SetQuantidadeRegistros(const Value: integer);
begin
  FQuantidadeRegistros := Value;
end;

procedure TInformacoesDebito.SetValorTotalDebitos(const Value: double);
begin
  FValorTotalDebitos := Value;
end;

end.
