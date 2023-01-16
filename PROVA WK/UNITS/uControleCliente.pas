unit uControleCliente;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,
   uConexao,Data.Win.ADODB,uControle,uClienteModel;
 type
 TControleCliente = class

 private
   FConexao  : TConexaoBanco;
   FSqqGeral : TADOQuery;
   Fcontrole : TControle;
 public
   constructor Create(pConexaoControle: TControle);
   destructor  Destroy; override;
   property SqqGeral : TADOQuery read FSqqGeral write FSqqGeral;

   function pesquisaCliente (pCodigo:integer):Tcliente;

 end;
implementation

{ TControleCliente }


constructor TControleCliente.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TControleCliente.Destroy;
begin


end;

function TControleCliente.pesquisaCliente(pCodigo: integer): Tcliente;
var
  cliente : Tcliente;
  FConexao  : tcontrole;

  cidade: string;
  codigo: integer;
  uf: string;
  nome : string;
begin


  Fcontrole.SqqGeral.Close;
  Fcontrole.SqqGeral.SQL.Clear;
  Fcontrole.SqqGeral.SQL.text := 'select codigo,nome,cidade,uf from cliente where codigo = ' + inttostr(pCodigo);
  Fcontrole.SqqGeral.open;
  //Fcontrole.SqqGeral.fieldbyname('nome').asstring;

  cidade  := Fcontrole.SqqGeral.fields.Fields[2].asstring;

  codigo  := Fcontrole.SqqGeral.fields.Fields[0].asinteger;


  uf  := Fcontrole.SqqGeral.fields.Fields[3].asstring;


  nome  := Fcontrole.SqqGeral.fields.Fields[1].asstring;
  cliente.setcidade(cidade);
  cliente.setcodigo(codigo);
  cliente.setuf(uf);
  cliente.setnome(nome);

  //cliente.setcidade(Fcontrole.SqqGeral.fields.Fields[2].asstring);
  cliente.setnome(Fcontrole.SqqGeral.fields.Fields[1].asstring);


  //cliente.setuf(Fcontrole.SqqGeral.fields.Fields[3].asstring);
  //cliente.setcodigo(Fcontrole.SqqGeral.fields.Fields[0].asinteger);
  //cliente.setuf(Fcontrole.SqqGeral.fieldbyname('uf').asstring);
  //cliente.setcodigo(Fcontrole.SqqGeral.fieldbyname('codigo').asinteger);
  //cliente.setnome(Fcontrole.SqqGeral.fieldbyname('nome').asstring);
  result := cliente;
end;

end.
