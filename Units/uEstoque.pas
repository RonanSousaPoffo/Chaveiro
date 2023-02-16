unit uEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,uDMChaveiro,
  Vcl.StdCtrls, Vcl.CheckLst,uUtil,DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls ;

type
  TfrEstoque = class(TForm)
    dbgEstoque: TDBGrid;
    lbFiltroEstoque: TLabel;
    cbFiltroEstoque: TComboBox;
    edFiltro: TEdit;
    edCodprod: TEdit;
    lbCodigo: TLabel;
    lbNomeProd: TLabel;
    lbQuantidade: TLabel;
    edQuantidade: TEdit;
    ckVenda: TCheckBox;
    ckCompra: TCheckBox;
    btVenderOuComprar: TButton;
    lbNomeProduto: TLabel;
    PageControl1: TPageControl;
    tabEstoque: TTabSheet;
    tabConfig: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    lbProdutoEspecifico: TLabel;
    edCodProdNotificar: TEdit;
    edQuantidadeNotificar: TEdit;
    lbQuantidadeNotificar: TLabel;
    btDefinir: TButton;
    ckNotificar: TCheckBox;
    ckListaNotificar: TCheckListBox;
    procedure ckVendaClick(Sender: TObject);
    procedure ckCompraClick(Sender: TObject);
    procedure edCodprodChange(Sender: TObject);
    procedure btVenderOuComprarClick(Sender: TObject);
    procedure edCodprodKeyPress(Sender: TObject; var Key: Char);
    procedure edQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edFiltroChange(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure cbFiltroEstoqueChange(Sender: TObject);
    procedure edCodProdNotificarChange(Sender: TObject);
    procedure btDefinirClick(Sender: TObject);
    procedure ckListaNotificarClickCheck(Sender: TObject);
  private
    { Private declarations }
    uUtil:tUtil;
    procedure pAtualizaCkListaNotificar;


  public
    { Public declarations }
  end;

var
  frEstoque: TfrEstoque;

implementation

{$R *.dfm}

procedure TfrEstoque.btDefinirClick(Sender: TObject);
begin
   DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
   if DMCHAVEIRO.tbCadProd.FindKey([edCodProdNotificar.Text]) then
      begin
        DMCHAVEIRO.tbCadProd.Edit;
        DMCHAVEIRO.tbCadProdBDQUANTIDADENOTIFICAR.AsInteger:= StrToInt(edQuantidadeNotificar.Text);

        if ckNotificar.Checked then
           DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean:=True
        else
            DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean:=False;
        DMCHAVEIRO.tbCadProd.Post;
        pAtualizaCkListaNotificar;
      end
   else
     ShowMessage('Produto Não Cadastrado');
end;

procedure TfrEstoque.btVenderOuComprarClick(Sender: TObject);
begin
  if edQuantidade.Text<>'' then
     begin
       if ( ckVenda.Checked) or (ckCompra.Checked) then
          begin

            DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
            if DMCHAVEIRO.tbCadProd.FindKey([edCodprod.Text]) then
               begin
                 DMCHAVEIRO.tbCadProd.Edit;
                 if ckCompra.Checked then
                    begin
                      DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger:=DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger+StrToInt(edQuantidade.Text);
                      uUtil.pSalvaLog('Realizada COMPRA ID: '+ IntToStr(DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger) +' produto: '+ DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString + ' Quantidade: '+edQuantidade.Text+' Data:  '+ FormatDateTime('dd.mm.yyyy hh:MM:ss', Now));
                    end;
                  if ckVenda.Checked then
                     begin
                       if (DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger=0) or  (DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger-StrToInt(edQuantidade.Text)<0) then
                          ShowMessage('Não foi possível realizar a venda pois a quantidade em estoque é inferior ou igual a 0')
                       else
                          begin
                            DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger:=DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger-StrToInt(edQuantidade.Text);
                            uUtil.pSalvaLog('Realizada VENDA ID: '+ IntToStr(DMCHAVEIRO.tbCadProdbdQuantidadeProd.AsInteger)+' Produto: ' + DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString + ' Quantidade: '+edQuantidade.Text+' Data: '+ FormatDateTime('dd.mm.yyyy hh:MM:ss', Now));
                          end;
                     end;
                 DMCHAVEIRO.tbCadProd.Post;
               end
            else
               begin
                 ShowMessage('Necessário Inserir Um Produto Cadastrado');
               end;


          end
       else
         ShowMessage('Necessário Selecionar a Opção de Venda Ou de Compra');
     end
  else
     begin
       ShowMessage('Necessário Inserir a Quantidade');
       edQuantidade.SetFocus;
     end;
end;

procedure TfrEstoque.cbFiltroEstoqueChange(Sender: TObject);
begin
  edFiltro.Text:='';
end;

procedure TfrEstoque.ckCompraClick(Sender: TObject);
begin

  if ckCompra.Checked then
     begin
       btVenderOuComprar.Caption:='Comprar Produto';
       ckVenda.Checked:=False;
     end;
end;

procedure TfrEstoque.ckListaNotificarClickCheck(Sender: TObject);
var
 wi:integer;
begin
  for wi := 0 to ckListaNotificar.Count-1 do
     begin
       DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
       if DMCHAVEIRO.tbCadProd.FindKey([copy(ckListaNotificar.Items[wi],0,pos(' ',ckListaNotificar.Items[wi])-1)]) then
          begin
          DMCHAVEIRO.tbCadProd.Edit;
             if ckListaNotificar.Checked[wi] then
               begin
                 DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean:=True;
               end
             else
                DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean:=False;
          end;
     end;
     DMCHAVEIRO.tbCadProd.Post;
     pAtualizaCkListaNotificar;
end;

procedure TfrEstoque.ckVendaClick(Sender: TObject);
begin

  if ckVenda.Checked then
     begin
       btVenderOuComprar.Caption:='Vender Produto';
       ckCompra.Checked:=False;
     end;

end;

procedure TfrEstoque.edCodprodChange(Sender: TObject);
begin
  DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
  if DMCHAVEIRO.tbCadProd.FindKey([edCodprod.Text]) then
     begin
       lbNomeProduto.Caption:=DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString;
     end
  else
     lbNomeProduto.Caption:='';
end;

procedure TfrEstoque.edCodprodKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
     key := #0;
end;

procedure TfrEstoque.edCodProdNotificarChange(Sender: TObject);
begin
   DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
  if DMCHAVEIRO.tbCadProd.FindKey([edCodProdNotificar.Text]) then
     begin
       lbProdutoEspecifico.Caption:=DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString;
       edQuantidadeNotificar.Text:=DMCHAVEIRO.tbCadProdBDQUANTIDADENOTIFICAR.AsString;
       if DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean  then
          ckNotificar.Checked:=True
       else
          ckNotificar.Checked:=False;
     end
  else
     begin
     lbProdutoEspecifico.Caption:='';
     end;
end;

procedure TfrEstoque.edFiltroChange(Sender: TObject);
begin

   DMCHAVEIRO.tbCadProd.Filter:='';
   DMCHAVEIRO.tbCadProd.Filtered:=True;

  if (cbFiltroEstoque.ItemIndex=0) and (edFiltro.Text<>'') then  //ID
     begin
        DMCHAVEIRO.tbCadProd.Filter := 'BDIDPROD =' + QuotedStr(edFiltro.Text);
     end

  else if (cbFiltroEstoque.ItemIndex=1) and (edFiltro.Text<>'') then  //NOME
     begin
       DMCHAVEIRO.tbCadProd.Filter := 'UPPER(BDNOMEPROD) LIKE' +QuotedStr('%'+UpperCase(edFiltro.Text)+'%');
     end

  else if (cbFiltroEstoque.ItemIndex=2) and (edFiltro.Text<>'') then  //VALOR
     begin
        DMCHAVEIRO.tbCadProd.Filter := 'BDVALORPROD =' + QuotedStr(edFiltro.Text);
     end

  else if (cbFiltroEstoque.ItemIndex=3) and (edFiltro.Text<>'') then  //CATEGORIA
     begin
       DMCHAVEIRO.tbCadProd.Filter := 'UPPER(BDCATEGORIAPROD) LIKE' +QuotedStr('%'+UpperCase(edFiltro.Text)+'%');
     end

  else if (cbFiltroEstoque.ItemIndex=4) and (edFiltro.Text<>'') then  //QUANTIDADE
     begin
       DMCHAVEIRO.tbCadProd.Filter := 'BDQUANTIDADEPROD =' + QuotedStr(edFiltro.Text);
     end
  else
    DMCHAVEIRO.tbCadProd.Filtered:=False;

end;

procedure TfrEstoque.edFiltroKeyPress(Sender: TObject; var Key: Char);
begin
    if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) and (cbFiltroEstoque.ItemIndex in [0,4]) then
     key := #0;

   if ((key in ['0'..'9',',','.'] = false) and (word(key) <> vk_back)) and (cbFiltroEstoque.ItemIndex = 2) then
     key := #0;
end;

procedure TfrEstoque.edQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TfrEstoque.FormCreate(Sender: TObject);
var
  wPercorreLista: integer;
begin
  uUtil:=tUtil.Create;
  lbProdutoEspecifico.Caption:='';
  pAtualizaCkListaNotificar;
end;

procedure TfrEstoque.FormShow(Sender: TObject);
begin
  lbNomeProduto.Caption:='';
end;

procedure TfrEstoque.pAtualizaCkListaNotificar;
var
  wi:integer;
  wAdicionaStringCK : string;
  wString : String;
begin
  wi:=0;
  ckListaNotificar.Clear;
  DMCHAVEIRO.tbCadProd.First;
  while not DMCHAVEIRO.tbCadProd.Eof do
     begin
       wAdicionaStringCK := DMCHAVEIRO.tbCadProdBDIDPROD.AsString + ' | ' + DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString;
       ckListaNotificar.Items.Add(wAdicionaStringCK);
       if DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean then
          ckListaNotificar.Checked[wi]:=True;
       DMCHAVEIRO.tbCadProd.Next;
       inc(wi);
     end;


end;

end.
