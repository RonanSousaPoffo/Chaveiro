object frCadCategoria: TfrCadCategoria
  Left = 0
  Top = 0
  Caption = 'Cadastro de Categoria'
  ClientHeight = 136
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCategoria: TLabel
    Left = 8
    Top = 35
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
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edCategoria: TEdit
    Left = 47
    Top = 35
    Width = 290
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btCadCategoria: TButton
    Left = 136
    Top = 65
    Width = 81
    Height = 29
    Caption = 'CADASTRAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btCadCategoriaClick
  end
  object edCodigo: TEdit
    Left = 47
    Top = 8
    Width = 58
    Height = 21
    TabOrder = 0
    OnChange = edCodigoChange
    OnKeyPress = edCodigoKeyPress
  end
  object btDeletar: TButton
    Left = 136
    Top = 100
    Width = 81
    Height = 29
    Caption = 'DELETAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = btDeletarClick
  end
  object btGerarCodigo: TButton
    Left = 111
    Top = 8
    Width = 39
    Height = 21
    Hint = 
      'Gerar um novo c'#243'digo. Essa op'#231#227'o ir'#225' gerar um c'#243'digo que n'#227'o est' +
      #225' sendo utilizado.'
    Caption = 'Gerar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btGerarCodigoClick
  end
end
