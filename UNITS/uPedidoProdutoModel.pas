unit uPedidoProdutoModel;

interface

uses uControlePedidosProduto, uControle;

type
  TPedidoProduto = class
    private

      FNumeroPedido  : Integer;
      FCodigoProduto : Integer;
      FQuantidade    : Integer;
      FValorUnitario : real;
      FValorTotal    : real;

      FControlePedidoProduto  : TControlePedidosProduto;

      function getNumeroPedido  () : Integer;
      function getCodigoProduto () : Integer;
      function getQuantidade    () : Integer;
      function getValorUnitario () : real;
      function getValorTotal    () : real;

      procedure setNumeroPedido  (numeroPedido  : Integer);
      procedure setCodigoProduto (codigoProduto : Integer);
      procedure setQuantidade    (quantidade    : Integer);
      procedure setValorUnitario (valorUnitario : real);
      procedure setValorTotal    (valorTotal    : real);

    public
      constructor Create();
      destructor Destroy; override;

      property numeroPedido   : Integer read FNumeroPedido  write setNumeroPedido;
      property codigoProduto  : Integer read FCodigoProduto write setCodigoProduto;
      property quantidade     : Integer read FQuantidade    write setQuantidade;
      property valorUnitario  : real   read FValorUnitario write setValorUnitario;
      property valorTotal     : real   read FValorTotal    write setValorTotal;

      function pesquisaPedidoProduto(pnumeroPedido:Integer; PedidoProduto:TPedidoProduto):TPedidoProduto;
      function inserirPedidoProduto(pnumeroPedido:integer; pCodigoProduto: Integer ; pQtde: integer; pVlrUnitario : real ; pVlrTotal : real): integer ;
  end;

implementation

{ TPedidoProduto }
constructor TPedidoProduto.Create();
begin
  FControlePedidoProduto  := TControlePedidosProduto.Create();
end;

destructor TPedidoProduto.Destroy;
begin
  inherited;
end;

function TPedidoProduto.getCodigoProduto: Integer;
begin
  result := FCodigoProduto;
end;

function TPedidoProduto.getNumeroPedido: Integer;
begin
  result :=FNumeroPedido;
end;

function TPedidoProduto.getQuantidade: Integer;
begin
  result := FQuantidade;
end;

function TPedidoProduto.getValorTotal: real;
begin
  result := FValorTotal;
end;

function TPedidoProduto.getValorUnitario: real;
begin
  result:= FValorUnitario;
end;

function TPedidoProduto.inserirPedidoProduto(pnumeroPedido, pCodigoProduto,
  pQtde: integer; pVlrUnitario, pVlrTotal: real): integer;
begin
  FControlePedidoProduto.inserirPedidoProduto(pnumeroPedido,pCodigoProduto, pQtde, pVlrUnitario, pVlrTotal);
  Result := 1;
end;

function TPedidoProduto.pesquisaPedidoProduto(pnumeroPedido: Integer;
  PedidoProduto: TPedidoProduto): TPedidoProduto;
var
  FControle : TControle;
begin
  FControle := FControlePedidoProduto.pesquisaPedidoProduto(pnumeroPedido);

  PedidoProduto.numeroPedido := Fcontrole.SqqGeral.FieldByName('numero_pedido').AsInteger;
  PedidoProduto.codigoProduto:= Fcontrole.SqqGeral.FieldByName('codigoProduto').AsInteger;
  PedidoProduto.quantidade   := Fcontrole.SqqGeral.FieldByName('quantidade').AsInteger;
  PedidoProduto.valorUnitario:= Fcontrole.SqqGeral.FieldByName('valorUnitario').AsFloat;
  PedidoProduto.valorTotal   := Fcontrole.SqqGeral.FieldByName('valorTotal').AsFloat;

  Result := PedidoProduto;

end;

procedure TPedidoProduto.setCodigoProduto(codigoProduto: Integer);
begin
  FCodigoProduto := codigoProduto;
end;

procedure TPedidoProduto.setNumeroPedido(numeroPedido: Integer);
begin
  FNumeroPedido := numeroPedido
end;

procedure TPedidoProduto.setQuantidade(quantidade: Integer);
begin
  FQuantidade := quantidade;
end;

procedure TPedidoProduto.setValorTotal(valorTotal: real);
begin
  FValorTotal := valorTotal;
end;

procedure TPedidoProduto.setValorUnitario(valorUnitario: real);
begin
  FValorUnitario := valorUnitario
end;

end.

