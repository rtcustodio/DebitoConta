unit SysDebitoConta.RegistroDebitoConta;

interface

type
  TRegistroDebito = class
  private
    FAgenciaDebito: string;
    FCodigoMovimento: string;
    FValorDebito: Double;
    FDataVencimento: TDate;
    FUsoEmpresa: string;
    FIdentificacaoClienteEmpresa: string;
    FCodigoMoeda: string;
    FIdentificacaoClienteBanco: string;
    procedure SetAgenciaDebito(const Value: string);
    procedure SetCodigoMoeda(const Value: string);
    procedure SetCodigoMovimento(const Value: string);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetIdentificacaoClienteBanco(const Value: string);
    procedure SetIdentificacaoClienteEmpresa(const Value: string);
    procedure SetUsoEmpresa(const Value: string);
    procedure SetValorDebito(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;
    property IdentificacaoClienteEmpresa : string read FIdentificacaoClienteEmpresa write SetIdentificacaoClienteEmpresa;
    property IdentificacaoClienteBanco : string read FIdentificacaoClienteBanco write SetIdentificacaoClienteBanco;
    property AgenciaDebito : string read FAgenciaDebito write SetAgenciaDebito;
    property DataVencimento : TDate read FDataVencimento write SetDataVencimento;
    property ValorDebito : Double read FValorDebito write SetValorDebito;
    property CodigoMoeda : string read FCodigoMoeda write SetCodigoMoeda;
    property UsoEmpresa : string read FUsoEmpresa write SetUsoEmpresa;
    property CodigoMovimento : string read FCodigoMovimento write SetCodigoMovimento;
  end;

implementation

{ TRegistroDebito }

constructor TRegistroDebito.Create;
begin

end;

destructor TRegistroDebito.Destroy;
begin

  inherited;
end;

procedure TRegistroDebito.SetAgenciaDebito(const Value: string);
begin
  FAgenciaDebito := Value;
end;

procedure TRegistroDebito.SetCodigoMoeda(const Value: string);
begin
  FCodigoMoeda := Value;
end;

procedure TRegistroDebito.SetCodigoMovimento(const Value: string);
begin
  FCodigoMovimento := Value;
end;

procedure TRegistroDebito.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TRegistroDebito.SetIdentificacaoClienteBanco(const Value: string);
begin
  FIdentificacaoClienteBanco := Value;
end;

procedure TRegistroDebito.SetIdentificacaoClienteEmpresa(const Value: string);
begin
  FIdentificacaoClienteEmpresa := Value;
end;

procedure TRegistroDebito.SetUsoEmpresa(const Value: string);
begin
  FUsoEmpresa := Value;
end;

procedure TRegistroDebito.SetValorDebito(const Value: Double);
begin
  FValorDebito := Value;
end;

end.
