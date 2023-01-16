unit uClienteModel;

interface

uses uControle;

type
  Tcliente = class
    private
      Fcodigo: Integer;
      Fnome:   string;
      Fcidade: string;
      Fuf:     string;
      fConexaoControle : TControle;
    public
      constructor Create(pConexaoControle: TControle);
      destructor Destroy; override;

      property codigo: Integer read Fcodigo;
      property nome:   string  read Fnome;
      property cidade: string  read Fcidade;
      property uf:     string  read Fuf;

      function getCodigo  () : Integer;
      function getnome    () : string;
      function getcidade  () : string;
      function getuf      () : string;

      function setcodigo( codigo : integer ) : integer ;
      function setnome( nome : string )    : string ;
      function setcidade( cidade : string )  : string ;
      function setuf( uf : string )      : string ;

      function pesquisaCliente (pCodigo:integer):Tcliente;
  end;

implementation

{ Tcliente }

uses uControleCliente, uConexao;



constructor Tcliente.Create(pConexaoControle: TControle);
var ControleCliente: tControleCliente;
begin
  fConexaoControle := pConexaoControle;
end;

destructor Tcliente.Destroy;
begin

  inherited;
end;

function Tcliente.getcidade: string;
begin
  result := Fcidade
end;

function Tcliente.getCodigo: Integer;
begin
  result := Fcodigo;
end;

function Tcliente.getnome: string;
begin
  result := Fnome;
end;

function Tcliente.getuf: string;
begin
  result := Fuf;
end;

function Tcliente.setcidade(cidade: string): string;
begin
  Fcidade := cidade;
end;

function Tcliente.setcodigo(codigo: integer): integer;
begin
  Fcodigo := codigo;
end;

function Tcliente.setnome(nome: string): string;
begin
  Fnome := nome;
end;

function Tcliente.setuf(uf: string): string;
begin
  Fuf := uf;
end;


function Tcliente.pesquisaCliente(pCodigo: integer): Tcliente;
var
  ControleCliente : TControleCliente;
  FConexao  : TConexaoBanco;

begin
  ControleCliente := TControleCliente.Create(fConexaoControle);
  //ControleCliente := TControleCliente.Create(FConexao);

  result := ControleCliente.pesquisaCliente(pCodigo);
end;







end.

