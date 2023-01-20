unit uDadosGeraisModel;

interface

uses uControleDadosGerais, uControle,sysutils;

type
  TDadosGerais = class
    private
      FNumeroPedido : Integer;
      FDataEmissao  : Tdate;
      FCodigoCliente: Integer;
      FValorTotal   : real;

      FControleDadosGerais  : TControleDadosGerais;

      function getnumeroPedido  () : Integer;
      function getdataEmissao   () : Tdate;
      function getcodigoCliente () : Integer;
      function getvalorTotal    () : real;

      procedure setnumeroPedido (numeroPedido   : Integer);
      procedure setdataEmissao  (dataEmissao    : Tdate);
      procedure setcodigoCliente(codigoCliente  : Integer);
      procedure setvalorTotal   (valorTotal     : real);

    public
      constructor Create();
      destructor Destroy; override;

      property numeroPedido  : Integer read FNumeroPedido  write setnumeroPedido;
      property dataEmissao   : Tdate    read FDataEmissao   write setdataEmissao;
      property codigoCliente : Integer read FCodigoCliente write setcodigoCliente;
      property valorTotal    : real   read FValorTotal    write setvalorTotal;

      function pesquisaDadosGerais(pnumeroPedido:Integer; dadosGerais:TDadosGerais):TDadosGerais;
      function inserirDadosGerais(dpataEmissao:TDateTime; pcodigoCliente: Integer ; pvalorTotal: real):integer;
  end;

implementation

{ TDadosGerais }
constructor TDadosGerais.Create();
begin
  FControleDadosGerais  := TControleDadosGerais.Create();
end;

destructor TDadosGerais.Destroy;
begin
  inherited;
end;

function TDadosGerais.getnumeroPedido: Integer;
begin
  result := FNumeroPedido;
end;

function TDadosGerais.getdataEmissao: Tdate;
begin
  result := FDataEmissao;
end;

function TDadosGerais.getcodigoCliente: Integer;
begin
  result := FCodigoCliente;
end;

function TDadosGerais.getvalorTotal: real;
begin
  result := FValorTotal;
end;


function TDadosGerais.inserirDadosGerais(dpataEmissao: TDateTime;
  pcodigoCliente: Integer; pvalorTotal: real): integer;
var f_numeroPedido : integer;
begin
  f_numeroPedido := FControleDadosGerais.inserirDadosGerais(dpataEmissao,pcodigoCliente,pvalorTotal);
  Result := f_numeroPedido;
end;

procedure TDadosGerais.setnumeroPedido(numeroPedido: Integer);
begin
  FNumeroPedido := numeroPedido;
end;

procedure TDadosGerais.setdataEmissao(dataEmissao: Tdate);
begin
  FDataEmissao := dataEmissao;
end;

procedure TDadosGerais.setcodigoCliente(codigoCliente: Integer);
begin
  FCodigoCliente := codigoCliente;
end;

procedure TDadosGerais.setvalorTotal(valorTotal: real);
begin
  FValorTotal := valorTotal;
end;


function TDadosGerais.pesquisaDadosGerais(pnumeroPedido: Integer;
  dadosGerais: TDadosGerais): TDadosGerais;
var Fcontrole : TControle;
begin
  FControle := FControleDadosGerais.pesquisaDadosGerais(pnumeroPedido);

  dadosGerais.numeroPedido := Fcontrole.SqqGeral.FieldByName('numero_pedido').AsInteger;
  dadosGerais.dataEmissao  := Fcontrole.SqqGeral.FieldByName('dataEmissao').AsDateTime;
  dadosGerais.codigoCliente:= Fcontrole.SqqGeral.FieldByName('codigoCliente').AsInteger;
  dadosGerais.valorTotal   := Fcontrole.SqqGeral.FieldByName('valorTotal').AsFloat;

  Result := dadosGerais;
end;

end.

