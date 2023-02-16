object frEstoque: TfrEstoque
  Left = 0
  Top = 0
  Caption = 'Estoque'
  ClientHeight = 531
  ClientWidth = 709
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
  object PageControl1: TPageControl
    Left = 0
    Top = -1
    Width = 713
    Height = 537
    ActivePage = tabEstoque
    TabOrder = 0
    object tabEstoque: TTabSheet
      Caption = 'Estoque'
      object lbCodigo: TLabel
        Left = 29
        Top = 3
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
      object lbFiltroEstoque: TLabel
        Left = 5
        Top = 126
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
      object lbNomeProduto: TLabel
        Left = 201
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
      object lbQuantidade: TLabel
        Left = 3
        Top = 44
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
      object edCodprod: TEdit
        Left = 82
        Top = 3
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
        Left = 82
        Top = 41
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
        Left = 137
        Top = 30
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
        Left = 137
        Top = 53
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
        Left = 77
        Top = 76
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
      object cbFiltroEstoque: TComboBox
        Left = 45
        Top = 122
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = cbFiltroEstoqueChange
        Items.Strings = (
          'ID'
          'NOME'
          'VALOR'
          'CATEGORIA'
          'QUANTIDADE')
      end
      object edFiltro: TEdit
        Left = 196
        Top = 122
        Width = 498
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = edFiltroChange
        OnKeyPress = edFiltroKeyPress
      end
      object dbgEstoque: TDBGrid
        Left = 0
        Top = 158
        Width = 705
        Height = 351
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
    end
    object tabConfig: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      object Label1: TLabel
        Left = 46
        Top = 19
        Width = 143
        Height = 13
        Caption = 'Definir Notifica'#231#227'o De Compra'
      end
      object Label2: TLabel
        Left = 46
        Top = 41
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbProdutoEspecifico: TLabel
        Left = 140
        Top = 38
        Width = 110
        Height = 13
        Caption = 'lbProdutoEspecifico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbQuantidadeNotificar: TLabel
        Left = 23
        Top = 65
        Width = 56
        Height = 13
        Hint = 
          'Campo para escolher quando ser'#225' notificado de acordo com a quant' +
          'idade em estoque'
        Caption = 'Quantidade'
      end
      object edCodProdNotificar: TEdit
        Left = 85
        Top = 38
        Width = 40
        Height = 21
        TabOrder = 0
        OnChange = edCodProdNotificarChange
      end
      object edQuantidadeNotificar: TEdit
        Left = 85
        Top = 65
        Width = 40
        Height = 21
        TabOrder = 1
      end
      object btDefinir: TButton
        Left = 46
        Top = 116
        Width = 75
        Height = 25
        Caption = 'Definir'
        TabOrder = 2
        OnClick = btDefinirClick
      end
      object ckNotificar: TCheckBox
        Left = 140
        Top = 69
        Width = 97
        Height = 17
        Caption = 'Notificar'
        TabOrder = 3
      end
      object ckListaNotificar: TCheckListBox
        Left = 272
        Top = 19
        Width = 401
        Height = 470
        OnClickCheck = ckListaNotificarClickCheck
        ItemHeight = 13
        TabOrder = 4
      end
    end
  end
end
