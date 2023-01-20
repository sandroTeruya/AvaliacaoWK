unit uConexao;

interface

uses
  SqlExpr, inifiles, SysUtils, Forms,Dialogs, Data.Win.ADODB;
type
    TConexaoBanco = class
    private
    FConexaoBanco : TADOConnection;
    public
    constructor Create;
    destructor  Destroy; override;
    function GetConexao   : TADOConnection;
    property ConexaoBanco : TADOConnection   read GetConexao;
   end;


implementation
 constructor TConexaoBanco.Create;
begin
     Try
     FConexaoBanco := TADOConnection.Create(Application);
     FConexaoBanco.ConnectionString := 'MSDASQL.1;Password=root;Persist Security Info=True;User ID=root;Data Source=conexao_prova;Initial Catalog=wk_prova';

     FConexaoBanco.LoginPrompt := False;
     FConexaoBanco.Connected   := true;
   except
     showmessage('Erro ao Conectar o Banco de dados. Verifique as preferencias do sistema!');
   end;
end;

destructor TConexaoBanco.Destroy;
begin
  FConexaoBanco.Free;
  inherited;
end;

function TConexaoBanco.GetConexao: TADOConnection;
begin
   Result := FConexaoBanco;
end;


end.
