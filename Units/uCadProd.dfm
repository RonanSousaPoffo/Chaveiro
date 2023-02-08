object frCadProd: TfrCadProd
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 291
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel
    Left = 57
    Top = 107
    Width = 33
    Height = 16
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCategoria: TLabel
    Left = 37
    Top = 134
    Width = 55
    Height = 16
    Caption = 'Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbValor: TLabel
    Left = 60
    Top = 156
    Width = 30
    Height = 16
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbTitulo: TLabel
    Left = 29
    Top = 24
    Width = 252
    Height = 23
    Caption = 'CADASTRO DE PRODUTOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCodigo: TLabel
    Left = 60
    Top = 72
    Width = 39
    Height = 16
    Caption = 'Codigo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edNomeProduto: TEdit
    Left = 105
    Top = 104
    Width = 145
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edValorProduto: TEdit
    Left = 105
    Top = 160
    Width = 145
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object cbCategoriaProduto: TComboBox
    Left = 105
    Top = 131
    Width = 145
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btCadProduto: TButton
    Left = 137
    Top = 200
    Width = 83
    Height = 25
    Caption = 'CADASTRAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btCadProdutoClick
  end
  object edCodigo: TEdit
    Left = 105
    Top = 74
    Width = 145
    Height = 24
    Hint = 'CASO SEJA UM NOVO PRODUTO O C'#211'DIGO SER'#193' GERADO AUTOMATICAMENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = edCodigoChange
    OnKeyPress = edCodigoKeyPress
  end
  object btDeletar: TButton
    Left = 137
    Top = 231
    Width = 83
    Height = 25
    Caption = 'DELETAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = btDeletarClick
  end
  object Button1: TButton
    Left = 256
    Top = 74
    Width = 39
    Height = 25
    Hint = 
      'Gerar um novo c'#243'digo. Essa op'#231#227'o ir'#225' gerar um c'#243'digo que n'#227'o est' +
      #225' sendo utilizado.'
    Caption = 'Gerar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button1Click
  end
end
