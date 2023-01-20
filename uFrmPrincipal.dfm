object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 608
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = -1
    Width = 841
    Height = 74
    Caption = 'Cliente'
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 17
      Width = 45
      Height = 15
      Caption = 'CODIGO'
    end
    object Label2: TLabel
      Left = 122
      Top = 17
      Width = 35
      Height = 15
      Caption = 'NOME'
    end
    object Label3: TLabel
      Left = 578
      Top = 17
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object Label4: TLabel
      Left = 681
      Top = 17
      Width = 41
      Height = 15
      Caption = 'CIDADE'
    end
    object edt_codigo_cliente: TEdit
      Left = 19
      Top = 35
      Width = 97
      Height = 23
      TabOrder = 0
      OnExit = edt_codigo_clienteExit
      OnKeyDown = edt_codigo_clienteKeyDown
      OnKeyPress = edt_codigo_clienteKeyPress
    end
    object edt_nome: TEdit
      Left = 122
      Top = 35
      Width = 450
      Height = 23
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edt_uf: TEdit
      Left = 578
      Top = 35
      Width = 97
      Height = 23
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object edt_cidade: TEdit
      Left = 681
      Top = 35
      Width = 154
      Height = 23
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 79
    Width = 841
    Height = 82
    Caption = 'PRODUTO'
    TabOrder = 1
    object btn_adicionar: TSpeedButton
      Left = 714
      Top = 43
      Width = 121
      Height = 22
      Caption = 'ADICIONAR'
      Flat = True
      OnClick = btn_adicionarClick
    end
    object Label5: TLabel
      Left = 19
      Top = 24
      Width = 45
      Height = 15
      Caption = 'CODIGO'
    end
    object Label6: TLabel
      Left = 122
      Top = 24
      Width = 63
      Height = 15
      Caption = 'DESCRICAO'
    end
    object Label7: TLabel
      Left = 370
      Top = 24
      Width = 37
      Height = 15
      Caption = 'PRE'#199'O'
    end
    object Label8: TLabel
      Left = 473
      Top = 24
      Width = 73
      Height = 15
      Caption = 'QUANTIDADE'
    end
    object Label9: TLabel
      Left = 578
      Top = 24
      Width = 32
      Height = 15
      Caption = 'TOTAL'
    end
    object edt_prod_codigo: TEdit
      Left = 19
      Top = 42
      Width = 97
      Height = 23
      TabOrder = 0
      OnKeyDown = edt_prod_codigoKeyDown
      OnKeyPress = edt_prod_codigoKeyPress
    end
    object edt_prod_descricao: TEdit
      Left = 122
      Top = 42
      Width = 242
      Height = 23
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edt_prod_preco: TEdit
      Left = 370
      Top = 42
      Width = 97
      Height = 23
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object edt_qtde: TEdit
      Left = 473
      Top = 42
      Width = 99
      Height = 23
      NumbersOnly = True
      TabOrder = 3
      OnKeyDown = edt_qtdeKeyDown
      OnKeyPress = edt_qtdeKeyPress
    end
    object edt_total: TEdit
      Left = 578
      Top = 42
      Width = 130
      Height = 23
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 167
    Width = 841
    Height = 442
    Caption = 'PEDIDO'
    TabOrder = 2
    object Label10: TLabel
      Left = 623
      Top = 359
      Width = 76
      Height = 15
      Caption = 'TOTAL PEDIDO'
    end
    object btn_gravar: TSpeedButton
      Left = 688
      Top = 33
      Width = 131
      Height = 30
      Caption = 'GRAVAR'
      OnClick = btn_gravarClick
    end
    object grid_dados: TStringGrid
      Left = 19
      Top = 88
      Width = 807
      Height = 251
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
      TabOrder = 0
      OnKeyDown = grid_dadosKeyDown
      OnKeyPress = grid_dadosKeyPress
    end
    object edt_total_compra: TEdit
      Left = 705
      Top = 356
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object gb_pesquisa: TGroupBox
      Left = 19
      Top = 16
      Width = 448
      Height = 57
      TabOrder = 2
      object Label11: TLabel
        Left = 8
        Top = 8
        Width = 45
        Height = 15
        Caption = 'CODIGO'
      end
      object btn_pesquisar: TSpeedButton
        Left = 175
        Top = 17
        Width = 130
        Height = 30
        Caption = 'PESQUISAR'
        OnClick = btn_pesquisarClick
      end
      object btn_cancelar: TSpeedButton
        Left = 304
        Top = 17
        Width = 130
        Height = 30
        Caption = 'CANCELAR PEDIDO'
        OnClick = btn_cancelarClick
      end
      object edt_pesquisa_pedido: TEdit
        Left = 8
        Top = 25
        Width = 158
        Height = 23
        NumbersOnly = True
        TabOrder = 0
        OnKeyDown = edt_pesquisa_pedidoKeyDown
      end
    end
  end
  object dsgrid: TDataSource
    DataSet = query_pedido
    Left = 936
    Top = 320
  end
  object adoConexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=root;Persist Security Info=True;User' +
      ' ID=root;Data Source=conexao_prova;Initial Catalog=wk_prova'
    LoginPrompt = False
    Left = 936
    Top = 208
  end
  object query_pedido: TADOQuery
    AutoCalcFields = False
    Connection = adoConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      
        '  A.codigoPedidoProduto,A.numeroPedido,A.codigoProduto,A.quantid' +
        'ade,A.vlrUnitario,A.vlrTotal,p.descricao'
      'FROM pedidoprodutos A'
      'INNER JOIN produto p ON A.codigoProduto = p.codigo')
    Left = 936
    Top = 264
    object query_pedidocodigoPedidoProduto: TAutoIncField
      FieldName = 'codigoPedidoProduto'
      ReadOnly = True
    end
    object query_pedidonumeroPedido: TIntegerField
      FieldName = 'numeroPedido'
    end
    object query_pedidocodigoProduto: TIntegerField
      FieldName = 'codigoProduto'
    end
    object query_pedidoquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object query_pedidovlrUnitario: TFMTBCDField
      FieldName = 'vlrUnitario'
      Precision = 20
      Size = 2
    end
    object query_pedidovlrTotal: TFMTBCDField
      FieldName = 'vlrTotal'
      Precision = 20
      Size = 2
    end
    object query_pedidodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 150
    end
  end
end
