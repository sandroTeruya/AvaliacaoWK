unit uClienteModel;

interface

uses uControleCliente, uControle;

type
  TCliente = class
    private
      FCodigo : Integer;
      FNome   : string;
      FCidade : string;
      FUf     : string;

      FControleCliente  : TControleCliente;

      function getCodigo() : Integer;
      function getNome  () : string;
      function getCidade() : string;
      function getUf    () : string;

      procedure setCodigo(codigo : Integer);
      procedure setNome  (nome   : string );
      procedure setCidade(cidade : string );
      procedure setUf    (uf     : string );
    public
      constructor Create();
      destructor Destroy; override;

      property codigo : Integer read FCodigo write setCodigo;
      property nome   : string  read FNome   write setNome;
      property cidade : string  read FCidade write setCidade;
      property uf     : string  read FUf     write setUf;

      function pesquisaCliente(pCodigo:Integer; cliente:TCliente):TCliente;
  end;

implementation

{ Tcliente }
constructor TCliente.Create();
begin
  FControleCliente  := TControleCliente.Create();
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

function TCliente.getCodigo: Integer;
begin
  result := FCodigo;
end;

function TCliente.getNome: string;
begin
  result := FNome;
end;

function TCliente.getCidade: string;
begin
  result := FCidade
end;

function TCliente.getUf: string;
begin
  result := FUf;
end;

procedure TCliente.setCodigo(codigo: Integer);
begin
  FCodigo := codigo;
end;

procedure TCliente.setNome(nome: string) ;
begin
  FNome := nome;
end;

procedure TCliente.setCidade(cidade: string) ;
begin
  FCidade := cidade;
end;

procedure TCliente.setUf(uf: string);
begin
  FUf := uf;
end;

function TCliente.pesquisaCliente(pCodigo: integer; cliente :Tcliente):TCliente;
var Fcontrole : TControle;
begin
  FControle := FControleCliente.pesquisaCliente(pCodigo);

  cliente.codigo := Fcontrole.SqqGeral.FieldByName('codigo').AsInteger;
  cliente.nome   := Fcontrole.SqqGeral.FieldByName('nome').AsString;
  cliente.cidade := Fcontrole.SqqGeral.FieldByName('cidade').AsString;
  cliente.uf     := Fcontrole.SqqGeral.FieldByName('uf').AsString;

  Result := cliente;
end;



end.

