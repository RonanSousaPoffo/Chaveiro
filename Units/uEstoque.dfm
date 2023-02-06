object frEstoque: TfrEstoque
  Left = 0
  Top = 0
  Caption = 'Estoque'
  ClientHeight = 470
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbFiltroEstoque: TLabel
    Left = 9
    Top = 158
    Width = 34
    Height = 16
    Caption = 'Filtrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCodigo: TLabel
    Left = 34
    Top = 8
    Width = 39
    Height = 16
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbNomeProd: TLabel
    Left = 137
    Top = 8
    Width = 49
    Height = 16
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbQuantidade: TLabel
    Left = 8
    Top = 62
    Width = 65
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbNomeProduto: TLabel
    Left = 193
    Top = 8
    Width = 87
    Height = 16
    Caption = 'NomeProduto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgEstoque: TDBGrid
    Left = 0
    Top = 184
    Width = 701
    Height = 286
    Align = alBottom
    DataSource = DMCHAVEIRO.dsCadCategoria
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BDIDPROD'
        Title.Caption = 'Codigo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEPROD'
        Title.Caption = 'Produto'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDVALORPROD'
        Title.Caption = 'Valor'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCATEGORIAPROD'
        Title.Caption = 'Categoria'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDQUANTIDADEPROD'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object cbFiltroEstoque: TComboBox
    Left = 49
    Top = 154
    Width = 145
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Items.Strings = (
      'ID'
      'NOME'
      'VALOR'
      'CATEGORIA'
      'QUANTIDADE')
  end
  object edFiltro: TEdit
    Left = 200
    Top = 154
    Width = 435
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnChange = edFiltroChange
  end
  object edCodprod: TEdit
    Left = 79
    Top = 8
    Width = 42
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edCodprodChange
    OnKeyPress = edCodprodKeyPress
  end
  object edQuantidade: TEdit
    Left = 79
    Top = 59
    Width = 42
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edQuantidadeKeyPress
  end
  object ckVenda: TCheckBox
    Left = 176
    Top = 38
    Width = 72
    Height = 17
    Caption = 'Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ckVendaClick
  end
  object ckCompra: TCheckBox
    Left = 176
    Top = 66
    Width = 72
    Height = 17
    Caption = 'Compra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ckCompraClick
  end
  object btVenderOuComprar: TButton
    Left = 85
    Top = 112
    Width = 109
    Height = 25
    Caption = 'Vender Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btVenderOuComprarClick
  end
end
