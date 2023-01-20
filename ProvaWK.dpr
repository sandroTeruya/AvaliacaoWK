program ProvaWK;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {Form1},
  uClienteModel in 'UNITS\uClienteModel.pas',
  uConexao in 'UNITS\uConexao.pas',
  uControle in 'UNITS\uControle.pas',
  uControleCliente in 'UNITS\uControleCliente.pas',
  uProdutoModel in 'UNITS\uProdutoModel.pas',
  uControleProduto in 'UNITS\uControleProduto.pas',
  uControleDadosGerais in 'UNITS\uControleDadosGerais.pas',
  uDadosGeraisModel in 'UNITS\uDadosGeraisModel.pas',
  uPedidoProdutoModel in 'UNITS\uPedidoProdutoModel.pas',
  uControlePedidosProduto in 'UNITS\uControlePedidosProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
