object DMCHAVEIRO: TDMCHAVEIRO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 285
  Width = 418
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=chaveiro'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object tbCadProd: TFDTable
    Active = True
    IndexFieldNames = 'BDIDPROD'
    Connection = FDConnection1
    TableName = 'chaveiro.cadprodutos'
    Left = 128
    Top = 16
    object tbCadProdBDIDPROD: TIntegerField
      FieldName = 'BDIDPROD'
      Origin = 'BDIDPROD'
      Required = True
    end
    object tbCadProdBDNOMEPROD: TStringField
      FieldName = 'BDNOMEPROD'
      Origin = 'BDNOMEPROD'
      Required = True
      Size = 250
    end
    object tbCadProdBDCATEGORIAPROD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BDCATEGORIAPROD'
      Origin = 'BDCATEGORIAPROD'
      Size = 250
    end
    object tbCadProdBDVALORPROD: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'BDVALORPROD'
      Origin = 'BDVALORPROD'
    end
    object tbCadProdBDQUANTIDADEPROD: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BDQUANTIDADEPROD'
      Origin = 'BDQUANTIDADEPROD'
    end
  end
  object dsTbCadProd: TDataSource
    DataSet = tbCadProd
    Left = 216
    Top = 16
  end
  object tbCadCategoria: TFDTable
    Active = True
    IndexFieldNames = 'idCategoria'
    Connection = FDConnection1
    TableName = 'chaveiro.cadcategoria'
    Left = 128
    Top = 80
    object tbCadCategoriaidCategoria: TIntegerField
      FieldName = 'idCategoria'
      Origin = 'idCategoria'
      Required = True
    end
    object tbCadCategoriabdNomeCategoria: TStringField
      FieldName = 'bdNomeCategoria'
      Origin = 'bdNomeCategoria'
      Required = True
      Size = 40
    end
  end
  object dsCadCategoria: TDataSource
    DataSet = tbCadProd
    Left = 216
    Top = 80
  end
end
