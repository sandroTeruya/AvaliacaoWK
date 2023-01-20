unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    dsgrid: TDataSource;
    adoConexao: TADOConnection;
    query_pedido: TADOQuery;
    query_pedidocodigoPedidoProduto: TAutoIncField;
    query_pedidonumeroPedido: TIntegerField;
    query_pedidocodigoProduto: TIntegerField;
    query_pedidoquantidade: TIntegerField;
    query_pedidovlrUnitario: TFMTBCDField;
    query_pedidovlrTotal: TFMTBCDField;
    query_pedidodescricao: TWideStringField;
    GroupBox1: TGroupBox;
    edt_codigo_cliente: TEdit;
    edt_nome: TEdit;
    edt_uf: TEdit;
    edt_cidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    btn_adicionar: TSpeedButton;
    edt_prod_codigo: TEdit;
    edt_prod_descricao: TEdit;
    edt_prod_preco: TEdit;
    edt_qtde: TEdit;
    edt_total: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    grid_dados: TStringGrid;
    edt_total_compra: TEdit;
    Label10: TLabel;
    gb_pesquisa: TGroupBox;
    edt_pesquisa_pedido: TEdit;
    Label11: TLabel;
    btn_pesquisar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_gravar: TSpeedButton;
    procedure edt_codigo_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_prod_codigoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_qtdeKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure grid_dadosKeyPress(Sender: TObject; var Key: Char);
    procedure grid_dadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_adicionarClick(Sender: TObject);
    procedure edt_qtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_codigo_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_prod_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_codigo_clienteExit(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_pesquisa_pedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_gravarClick(Sender: TObject);
  private
    { Private declarations }
    v_editando :  boolean;
    v_linha : integer;

    procedure adicionaProduto;
    procedure trataNumeroInteiro(key: Word);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uClienteModel, uControle, uControleCliente, uProdutoModel,
  uDadosGeraisModel, uPedidoProdutoModel;


procedure TForm1.adicionaProduto;
var
  i : integer;
  total : real;
begin
  total := 0;

  if(v_editando = false)then
  begin
    grid_dados.RowCount := grid_dados.RowCount +1;

    grid_dados.Cells[0,grid_dados.RowCount - 1] := edt_prod_codigo.Text;
    grid_dados.Cells[1,grid_dados.RowCount - 1] := edt_prod_descricao.Text;
    grid_dados.Cells[2,grid_dados.RowCount - 1] := edt_qtde.Text;
    grid_dados.Cells[3,grid_dados.RowCount - 1] := edt_prod_preco.Text;
    grid_dados.Cells[4,grid_dados.RowCount - 1] := edt_total.Text;
  end
  else
  begin
    grid_dados.Cells[0,v_linha] := edt_prod_codigo.Text;
    grid_dados.Cells[1,v_linha] := edt_prod_descricao.Text;
    grid_dados.Cells[2,v_linha] := edt_qtde.Text;
    grid_dados.Cells[3,v_linha] := edt_prod_preco.Text;
    grid_dados.Cells[4,v_linha] := edt_total.Text;

    v_editando := false;
  end;

  for i := 1 to grid_dados.RowCount -1 do
    total := total +  strtofloat(grid_dados.Cells[4,i]);

  edt_total_compra.Text := floattostr(total);

end;

procedure TForm1.btn_adicionarClick(Sender: TObject);
begin
  if(edt_codigo_cliente.Text = '')then
    Application.MessageBox('SELECIONE UM CLIENTE!','ATENÇÃO', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)

  else if(edt_prod_codigo.Text = '')then
    Application.MessageBox('SELECIONE UM PRODUTO!','ATENÇÃO', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)

  else if(edt_qtde.Text = '')then
    Application.MessageBox('INFORME A QUANTIDADE!','ATENÇÃO', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
  else
    adicionaProduto;


end;

procedure TForm1.edt_codigo_clienteExit(Sender: TObject);
begin
  if(edt_codigo_cliente.Text = '')then
    gb_pesquisa.Visible := true
  else
    gb_pesquisa.Visible := false
end;

procedure TForm1.edt_codigo_clienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  trataNumeroInteiro(key);
end;

procedure TForm1.edt_codigo_clienteKeyPress(Sender: TObject; var Key: Char);
var
  cliente : TCliente;
begin

  if(key = #13)and(edt_codigo_cliente.Text <> '')then
  begin
    cliente := TCliente.Create();
    cliente.pesquisaCliente(StrToInt(edt_codigo_cliente.Text), cliente);

    edt_nome.Text   := cliente.nome;
    edt_cidade.Text := cliente.cidade;
    edt_uf.Text     := cliente.uf;

    edt_prod_codigo.SetFocus;

  end;
end;

procedure TForm1.edt_pesquisa_pedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not(key in[0..9])then
    Key := VK_BACK;
end;

procedure TForm1.edt_prod_codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  trataNumeroInteiro(key);
end;

procedure TForm1.edt_prod_codigoKeyPress(Sender: TObject; var Key: Char);
var
  produto : Tproduto;
begin
  if(key = #13)and(edt_prod_codigo.Text <> '')then
  begin
    produto := TProduto.Create();
    produto.pesquisaProduto(StrToInt(edt_prod_codigo.Text), produto);

    edt_prod_descricao.Text := produto.descricao;
    edt_prod_preco.Text     := floattostr(produto.precoDeVenda);

    edt_qtde.SetFocus;

  end;

end;

procedure TForm1.edt_qtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  trataNumeroInteiro(key);
end;

procedure TForm1.edt_qtdeKeyPress(Sender: TObject; var Key: Char);
var
  produto : TProduto;
begin
  if(key = #13)and(edt_qtde.Text <> '')then
  begin
    edt_total.Text := floattostr(produto.calculaPrecoTotalProdudo(strtofloat(edt_prod_preco.text),strtoint(edt_qtde.Text)));
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  grid_dados.Cells[0,0]   := 'Codigo';
  grid_dados.ColWidths[0] := 80;

  grid_dados.Cells[1,0] := 'Descricao';
  grid_dados.ColWidths[1] := 380;

  grid_dados.Cells[2,0] := 'Quantidade';
  grid_dados.ColWidths[2] := 80;

  grid_dados.Cells[3,0] := 'Valor';
  grid_dados.ColWidths[3] := 80;

  grid_dados.Cells[4,0] := 'Total';
  grid_dados.ColWidths[4] := 150;
end;

procedure TForm1.grid_dadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var
     i,linha : integer;
begin
  if(Key = VK_DELETE)then
  begin
    linha := grid_dados.Row;

    for I := linha to grid_dados.RowCount - 1 do
    begin
      grid_dados.Cells[0,linha] :=  grid_dados.Cells[0,linha + 1];
      grid_dados.Cells[1,linha] :=  grid_dados.Cells[1,linha + 1];
      grid_dados.Cells[2,linha] :=  grid_dados.Cells[2,linha + 1];
      grid_dados.Cells[3,linha] :=  grid_dados.Cells[3,linha + 1];
    end;

    grid_dados.RowCount := grid_dados.RowCount -1;
  end;
end;

procedure TForm1.grid_dadosKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    v_linha := grid_dados.Row;

    edt_prod_codigo.Text    := grid_dados.Cells[0,v_linha];
    edt_prod_descricao.Text := grid_dados.Cells[1,v_linha];
    edt_qtde.Text           := grid_dados.Cells[2,v_linha];
    edt_prod_preco.Text     := grid_dados.Cells[3,v_linha];

    edt_qtde.SetFocus;

    v_editando := true;
  end;
end;
procedure TForm1.btn_pesquisarClick(Sender: TObject);
var
  cliente : TCliente;
  dadosgerais : TDadosGerais;
begin
 if(edt_pesquisa_pedido.Text = '')then
    Application.MessageBox('INFORME UM CÓDIGO DE PEDIDO PARA PESQUISA!','ATENÇÃO', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)

  else
  begin
    dadosgerais := TDadosGerais.Create();
    dadosgerais.pesquisaDadosGerais(strtoint((edt_pesquisa_pedido.Text)),dadosgerais);

    cliente := TCliente.Create();
    cliente.pesquisaCliente(dadosgerais.codigoCliente, cliente);

    edt_codigo_cliente.Text := inttostr(cliente.codigo);
    edt_nome.Text           := cliente.nome;
    edt_cidade.Text         := cliente.cidade;
    edt_uf.Text             := cliente.uf;
  end;



end;

procedure TForm1.btn_cancelarClick(Sender: TObject);

begin
 if(edt_prod_codigo.Text = '')then
    Application.MessageBox('INFORME UM CÓDIGO DE PEDIDO PARA CANCELAR!','ATENÇÃO', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)

end;

procedure TForm1.btn_gravarClick(Sender: TObject);
var
  v_numero_pedido : Integer;
  v_indice        : integer;

  dadosgerais : TDadosGerais;
  pedidoProduto : TPedidoProduto;
begin
  dadosgerais := TDadosGerais.Create();
  pedidoProduto := TPedidoProduto.Create();

  v_numero_pedido := 0;

  v_numero_pedido := dadosgerais.inserirDadosGerais(Now,StrToInt(edt_codigo_cliente.Text),StrToFloat(edt_total_compra.Text));

  for v_indice := 1 to grid_dados.RowCount -1 do
  begin
    pedidoProduto.inserirPedidoProduto(v_numero_pedido,strtoint(grid_dados.Cells[0,v_indice]),strtoint(grid_dados.Cells[2,v_indice]),strtofloat(grid_dados.Cells[3,v_indice]), strtofloat(grid_dados.Cells[4,v_indice]));
  end;

end;

procedure TForm1.trataNumeroInteiro(key: Word);
begin
  if not(key in[0..9])then
    Key := VK_BACK;
end;

end.
