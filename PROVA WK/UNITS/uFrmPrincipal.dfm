object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 441
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object SpeedButton1: TSpeedButton
    Left = 456
    Top = 45
    Width = 121
    Height = 22
  end
  object edt_codigo_cliente: TEdit
    Left = 24
    Top = 16
    Width = 97
    Height = 23
    TabOrder = 0
    OnKeyPress = edt_codigo_clienteKeyPress
  end
  object edt_nome: TEdit
    Left = 127
    Top = 16
    Width = 450
    Height = 23
    ReadOnly = True
    TabOrder = 1
  end
  object edt_uf: TEdit
    Left = 24
    Top = 45
    Width = 97
    Height = 23
    ReadOnly = True
    TabOrder = 2
  end
  object edt_cidade: TEdit
    Left = 127
    Top = 45
    Width = 314
    Height = 23
    ReadOnly = True
    TabOrder = 3
  end
  object grid_pedido: TDBGrid
    Left = 24
    Top = 74
    Width = 553
    Height = 231
    DataSource = dsgrid
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dsgrid: TDataSource
    DataSet = query_peido
    Left = 776
    Top = 144
  end
  object adoConexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=root;Persist Security Info=True;User' +
      ' ID=root;Data Source=conexao_prova;Initial Catalog=wk_prova'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 776
    Top = 32
  end
  object query_peido: TADOQuery
    Connection = adoConexao
    Parameters = <>
    Left = 776
    Top = 88
  end
end