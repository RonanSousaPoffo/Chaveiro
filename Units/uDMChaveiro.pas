unit uDMChaveiro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient;

type
  TDMCHAVEIRO = class(TDataModule)
    FDConnection1: TFDConnection;
    tbCadProd: TFDTable;
    dsTbCadProd: TDataSource;
    tbCadCategoria: TFDTable;
    dsCadCategoria: TDataSource;
    tbCadCategoriaidCategoria: TIntegerField;
    tbCadCategoriabdNomeCategoria: TStringField;
    tbCadProdBDIDPROD: TIntegerField;
    tbCadProdBDNOMEPROD: TStringField;
    tbCadProdBDCATEGORIAPROD: TStringField;
    tbCadProdBDVALORPROD: TSingleField;
    tbCadProdBDQUANTIDADEPROD: TIntegerField;
    tbCadProdBDQUANTIDADENOTIFICAR: TIntegerField;
    tbCadProdBDNOTIFICARESTOQUE: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cdsCadProdTemp:TClientDataSet;
    dsCadProdTemp : TDataSource;

    cdsCadCategoriaTemp:TClientDataSet;
    dsCadCategoriaTemp : TDataSource;
    procedure pCriaTabelaCadProdutoTemporaria;
    procedure pRecebeDadosTBTemp;
    procedure pRecebeDadosMSQL(prDeveAtualProduto,prDeveAtualizarCategoria:Boolean);
  end;

var
  DMCHAVEIRO: TDMCHAVEIRO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCHAVEIRO }

procedure TDMCHAVEIRO.DataModuleCreate(Sender: TObject);
begin
  pCriaTabelaCadProdutoTemporaria;
  pRecebeDadosTBTemp;
end;

procedure TDMCHAVEIRO.pCriaTabelaCadProdutoTemporaria;
begin

  cdsCadProdTemp := TClientDataSet.Create(Self);
  dsCadProdTemp  := TDataSource.Create(Self);
  dsCadProdTemp.DataSet:=cdsCadProdTemp;

  cdsCadProdTemp.FieldDefs.Clear;
  cdsCadProdTemp.IndexDefs.Clear;

  cdsCadProdTemp.FieldDefs.Add('BDIDPROD',ftInteger);
  cdsCadProdTemp.FieldDefs.Add('BDNOMEPROD',ftString, 250);
  cdsCadProdTemp.FieldDefs.Add('BDCATEGORIAPROD',ftString, 250);
  cdsCadProdTemp.FieldDefs.Add('BDVALORPROD',ftCurrency);
  cdsCadProdTemp.FieldDefs.Add('BDQUANTIDADEPROD',ftInteger);

  cdsCadProdTemp.IndexDefs.Add('IBDIDPROD','BDIDPROD',[ixCaseInsensitive]);
  cdsCadProdTemp.IndexDefs.Add('IBDNOMEPROD','BDNOMEPROD',[ixCaseInsensitive]);
  cdsCadProdTemp.IndexDefs.Add('IBDCATEGORIAPROD','BDCATEGORIAPROD',[ixCaseInsensitive]);
  cdsCadProdTemp.IndexDefs.Add('IBDVALORPROD','BDVALORPROD',[ixCaseInsensitive]);
  cdsCadProdTemp.IndexDefs.Add('IDBDQUANTIDADEPROD','BDQUANTIDADEPROD',[ixCaseInsensitive]);

  cdsCadProdTemp.CreateDataSet;
  cdsCadProdTemp.Open;

  //TABELA TEMPORÁRIA DE CATEGORIA
  cdsCadCategoriaTemp:= TClientDataSet.Create(Self);
  dsCadCategoriaTemp := TDataSource.Create(Self);
  dsCadCategoriaTemp.DataSet:=cdsCadCategoriaTemp;

  cdsCadCategoriaTemp.FieldDefs.Clear;
  cdsCadCategoriaTemp.IndexDefs.Clear;

  cdsCadCategoriaTemp.FieldDefs.Add('BDIDCATEGORIA',ftInteger);
  cdsCadCategoriaTemp.FieldDefs.Add('BDCATEGORIA',ftString, 250);

  cdsCadCategoriaTemp.IndexDefs.Add('iBDIDCATEGORIA','BDIDCATEGORIA',[ixCaseInsensitive]);
  cdsCadCategoriaTemp.IndexDefs.Add('iBDCATEGORIA','BDCATEGORIA',[ixCaseInsensitive]);

  cdsCadCategoriaTemp.CreateDataSet;
  cdsCadCategoriaTemp.Open;
end;

procedure TDMCHAVEIRO.pRecebeDadosMSQL(prDeveAtualProduto,prDeveAtualizarCategoria:Boolean);
begin

end;

procedure TDMCHAVEIRO.pRecebeDadosTBTemp;
begin
  pCriaTabelaCadProdutoTemporaria;

  //DADOS DA TABELA DE PRODUTO
  cdsCadProdTemp.EmptyDataSet;
  tbCadProd.First;
  while not tbCadProd.Eof do
     begin
       cdsCadProdTemp.Insert;
       cdsCadProdTemp.FieldByName('BDIDPROD').        AsInteger :=    tbCadProdBDIDPROD.AsInteger;
       cdsCadProdTemp.FieldByName('BDNOMEPROD').      AsString  :=    tbCadProdBDNOMEPROD.AsString;
       cdsCadProdTemp.FieldByName('BDCATEGORIAPROD').  AsString :=    tbCadProdBDCATEGORIAPROD.AsString;
       cdsCadProdTemp.FieldByName('BDVALORPROD').     AsCurrency:=    tbCadProdBDVALORPROD.AsCurrency;
       cdsCadProdTemp.FieldByName('BDQUANTIDADEPROD').AsInteger :=    tbCadProdbdQuantidadeProd.AsInteger;
       cdsCadProdTemp.Post;
       tbCadProd.Next;
     end;

  //DADOS DA TABELA DE CATEGORIA
  cdsCadCategoriaTemp.EmptyDataSet;
  tbCadCategoria.First;
   while not tbCadCategoria.Eof do
     begin
       cdsCadCategoriaTemp.Insert;
       cdsCadCategoriaTemp.FieldByName('BDIDCATEGORIA').AsInteger:=tbCadCategoriaidCategoria.AsInteger;
       cdsCadCategoriaTemp.FieldByName('BDCATEGORIA').AsString:=tbCadCategoriabdNomeCategoria.AsString;
       cdsCadCategoriaTemp.Post;
       tbCadCategoria.Next;
     end;
end;

end.
