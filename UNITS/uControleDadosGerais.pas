unit uControleDadosGerais;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  SqlExpr,  StrUtils, inifiles,
   uConexao,Data.Win.ADODB,uControle;
 type
 TControleDadosGerais = class

 private
   FConexao  : TConexaoBanco;
   FsqlGeral : TADOQuery;
   FControle : TControle;

 public
   constructor Create();
   destructor  Destroy; override;

   property    sqlGeral : TADOQuery read FsqlGeral write FsqlGeral;

   function pesquisaDadosGerais(pnumero_pedido:integer):Tcontrole;
   function inserirDadosGerais(dpataEmissao:TDateTime; pcodigoCliente: Integer ; pvalorTotal: real):integer;
 end;
implementation

{ TDadosGerais }


constructor TControleDadosGerais.Create();
begin
  FControle := TControle.Create();
end;

destructor TControleDadosGerais.Destroy;
begin
  FControle.Free
end;

function TControleDadosGerais.inserirDadosGerais(dpataEmissao: TDateTime;
  pcodigoCliente: Integer; pvalorTotal: real): integer;

var
  v1 : string;
begin
  v1 := FormatDateTime('YYYY-mm-DD' , dpataEmissao);
  try
    Fcontrole.SqqGeral.Close;
    Fcontrole.SqqGeral.SQL.Clear;
    Fcontrole.SqqGeral.SQL.text := 'Insert into dadosgerais(dataEmissao, codigoCliente, valorTotal)values(' + #39 + v1 + #39 + ',' + IntToStr(pcodigoCliente) + ',' + StringReplace(FloatToStr(pvalorTotal),',','.',[rfReplaceAll,rfIgnoreCase]) + ');';
    Fcontrole.SqqGeral.ExecSQL;

    Fcontrole.SqqGeral.Close;
    //Fcontrole.SqqGeral.SQL.Clear;
    Fcontrole.SqqGeral.SQL.text := 'SELECT max(numero_pedido)as codigo FROM dadosgerais;';
    Fcontrole.SqqGeral.open;

    result := FControle.SqqGeral.FieldByName('codigo').AsInteger;

  except
    result := 1;
  end;
end;

function TControleDadosGerais.pesquisaDadosGerais(pnumero_pedido: integer):Tcontrole;
begin
  Fcontrole.SqqGeral.Close;
  Fcontrole.SqqGeral.SQL.Clear;
  Fcontrole.SqqGeral.SQL.text := 'SELECT numero_pedido, dataEmissao, codigoCliente, valorTotal FROM dadosgerais WHERE numero_pedido = ' + inttostr(pnumero_pedido);
  Fcontrole.SqqGeral.open;

  result := Fcontrole

end;

end.
