unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    edt_codigo_cliente: TEdit;
    edt_nome: TEdit;
    edt_uf: TEdit;
    edt_cidade: TEdit;
    dsgrid: TDataSource;
    adoConexao: TADOConnection;
    query_peido: TADOQuery;
    grid_pedido: TDBGrid;
    procedure edt_codigo_clienteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uClienteModel, uControle, uConexao, uControleCliente;


procedure TForm1.edt_codigo_clienteKeyPress(Sender: TObject; var Key: Char);
var
  cliente : Tcliente;
  controle : TControle;
begin
  if(key = #13)then
  begin

    controle := TControle.Create;
    //controle.Create;

    cliente := Tcliente.create(controle);
    cliente := cliente.pesquisaCliente(strtoint(edt_codigo_cliente.Text));

    edt_nome.Text   := cliente.getnome;
    edt_cidade.Text := cliente.getcidade;
    edt_uf.Text     := cliente.getuf;

  end;
end;

end.
