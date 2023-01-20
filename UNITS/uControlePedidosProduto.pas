unit uControlePedidosProduto;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  SqlExpr,  StrUtils, inifiles,
   uConexao,Data.Win.ADODB,uControle;
 type
 TControlePedidosProduto = class

 private
   FConexao  : TConexaoBanco;
   FsqlGeral : TADOQuery;
   FControle : TControle;

 public
   constructor Create();
   destructor  Destroy; override;

   property    sqlGeral : TADOQuery read FsqlGeral write FsqlGeral;

   function pesquisaPedidoProduto(pnumero_pedido:integer):TControle;
   function inserirPedidoProduto(pnumeroPedido:integer; pCodigoProduto: Integer ; pQtde: integer; pVlrUnitario : real ; pVlrTotal : real): integer ;

 end;
implementation

{ TControlePedidosProduto }


constructor TControlePedidosProduto.Create();
begin
  FControle := TControle.Create();
end;

destructor TControlePedidosProduto.Destroy;
begin
  FControle.Free
end;

function TControlePedidosProduto.inserirPedidoProduto(pnumeroPedido,
  pCodigoProduto, pQtde: integer; pVlrUnitario, pVlrTotal: real): integer;

begin
  try
    Fcontrole.SqqGeral.Close;
    Fcontrole.SqqGeral.SQL.Clear;
    Fcontrole.SqqGeral.SQL.text := 'Insert into pedidoProdutos(numeroPedido, codigoProduto, quantidade, vlrUnitario, vlrTotal)values('
                                   + inttostr(pnumeroPedido) + ',' + inttostr(pCodigoProduto) + ',' + inttostr(pQtde) + ',' + StringReplace(FloatToStr(pVlrUnitario),',','.',[rfReplaceAll,rfIgnoreCase]) + ',' + StringReplace(FloatToStr(pVlrTotal),',','.',[rfReplaceAll,rfIgnoreCase]) +');';
    Fcontrole.SqqGeral.ExecSQL;
    result := 0;
  except
    result := 1;
  end;
end;

function TControlePedidosProduto.pesquisaPedidoProduto(pnumero_pedido: integer):TControle;
begin
  Fcontrole.SqqGeral.Close;
  Fcontrole.SqqGeral.SQL.Clear;
  Fcontrole.SqqGeral.SQL.text := 'SELECT codigopedidoproduto,numeropedido, codigoProduto, quantidade, vlrunitario, vlrTotal FROM PedidoProdutos WHERE numeropedido = ' + inttostr(pnumero_pedido);
  Fcontrole.SqqGeral.open;

  result := Fcontrole;
end;

end.
