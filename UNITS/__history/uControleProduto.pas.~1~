unit uControleCliente;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  SqlExpr,  StrUtils, inifiles,
   uConexao,Data.Win.ADODB,uControle;
 type
 TControleCliente = class

 private
   FConexao  : TConexaoBanco;
   FsqlGeral : TADOQuery;
   FControle : TControle;

 public
   constructor Create();
   destructor  Destroy; override;

   property    sqlGeral : TADOQuery read FsqlGeral write FsqlGeral;

   function pesquisaCliente(pCodigo:integer):TControle;

 end;
implementation

{ TControleCliente }


constructor TControleCliente.Create();
begin
  FControle := TControle.Create();
end;

destructor TControleCliente.Destroy;
begin
  FControle.Free
end;

function TControleCliente.pesquisaCliente(pCodigo: integer):TControle;
begin
  Fcontrole.SqqGeral.Close;
  Fcontrole.SqqGeral.SQL.Clear;
  Fcontrole.SqqGeral.SQL.text := 'select codigo,nome,cidade,uf from cliente where codigo = ' + inttostr(pCodigo);
  Fcontrole.SqqGeral.open;

  result := Fcontrole;
end;

end.
