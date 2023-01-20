unit uProdutoModel;

interface

uses uControle, uControleProduto;

type
  TProduto = class
    private
      FCodigo       : Integer;
      FDescricao    : string;
      FPrecoDeVenda : real;

      FControleProduto  : TControleProduto;

      function getCodigo()       : Integer;
      function getdescricao()    : string;
      function getPrecoDeVenda() : real;

      procedure setCodigo(codigo : Integer);
      procedure setdescricao  (descricao   : string );
      procedure setPrecoDeVenda(precoDeVenda : real );
    public
      constructor Create();
      destructor Destroy; override;

      property codigo       : Integer read FCodigo       write setCodigo;
      property descricao    : string  read FDescricao    write setdescricao;
      property precoDeVenda : real    read FPrecoDeVenda write setPrecoDeVenda;

      function pesquisaProduto(pCodigo:Integer; produto: Tproduto):TProduto;
      function calculaPrecoTotalProdudo(pprecoDeVenda: real ; pQtde : integer):real;
  end;

implementation

{ TProduto }


//uses uControleProduto;
function TProduto.calculaPrecoTotalProdudo(pprecoDeVenda: real;  pQtde: integer): real;
begin
  result := pprecoDeVenda * pQtde;
end;

constructor TProduto.Create();
begin
  FControleProduto  := TControleProduto.Create();
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

function TProduto.getCodigo: Integer;
begin
  result := FCodigo;
end;

function TProduto.getdescricao: string;
begin
  result := FDescricao;
end;

function TProduto.getPrecoDeVenda: real;
begin
  result := FPrecoDeVenda;
end;

procedure TProduto.setCodigo(codigo: Integer);
begin
  FCodigo := codigo;
end;

procedure TProduto.setdescricao(descricao: string) ;
begin
  FDescricao := descricao;
end;

procedure TProduto.setPrecoDeVenda(precoDeVenda: real) ;
begin
  FPrecoDeVenda := precoDeVenda;
end;


function TProduto.pesquisaProduto(pCodigo: integer; produto : Tproduto):TProduto;
var Fcontrole : TControle;
begin
  FControle := FControleProduto.pesquisaProduto(pCodigo);

  produto.codigo       := Fcontrole.SqqGeral.FieldByName('codigo').AsInteger;
  produto.descricao    := Fcontrole.SqqGeral.FieldByName('descricao').AsString;
  produto.precoDeVenda := Fcontrole.SqqGeral.FieldByName('precoDeVenda').asfloat;

  Result := produto;
end;



end.

