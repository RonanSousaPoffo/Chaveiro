unit uCadProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,uDMChaveiro;

type
  TfrCadProd = class(TForm)
    lbNome: TLabel;
    lbCategoria: TLabel;
    lbValor: TLabel;
    lbTitulo: TLabel;
    edNomeProduto: TEdit;
    edValorProduto: TEdit;
    cbCategoriaProduto: TComboBox;
    btCadProduto: TButton;
    lbCodigo: TLabel;
    edCodigo: TEdit;
    btDeletar: TButton;
    Button1: TButton;
    procedure btCadProdutoClick(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btDeletarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    wNome : String;
    wCodigoProd,wCategoria : Integer;
    wValor     :currency;
    procedure pCadProd;
  public
    { Public declarations }
  end;

var
  frCadProd: TfrCadProd;


implementation

{$R *.dfm}

procedure TfrCadProd.btCadProdutoClick(Sender: TObject);
begin
  //Cadastro De Produtos

  if edNomeProduto.Text='' then
     begin
       ShowMessage('Necessário Preencher o Nome do Produto');
       edNomeProduto.SetFocus;
     end
  else if cbCategoriaProduto.Text ='' then
     begin
       ShowMessage('Necessário Preencher a Categoria do Produto');
       cbCategoriaProduto.SetFocus;
     end
  else if edValorProduto.text ='' then
     begin
     ShowMessage('Necessário Preencher o Valor do Produto');
       edValorProduto.SetFocus;
     end
  else
     pCadProd;

end;

procedure TfrCadProd.btDeletarClick(Sender: TObject);
begin

  DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
  if MessageDlg('Deseja realmente excluir o produto '+UpperCase(edNomeProduto.Text)+' ?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
     begin
        if DMCHAVEIRO.tbCadProd.FindKey([edCodigo.Text]) then
           begin
             DMCHAVEIRO.tbCadProd.Delete;
             btDeletar.Visible            := False;
             btCadProduto.Caption         :='CADASTRAR';
             edNomeProduto.Text           :='';
             cbCategoriaProduto.ItemIndex := -1;
             cbCategoriaProduto.Text      :='';
             edValorProduto.Text          :='';
             edCodigo.Text                :='';
           end;
     end;
end;

procedure TfrCadProd.Button1Click(Sender: TObject);
var
  wGeraNovoCodigo: integer;
begin

  DMCHAVEIRO.tbCadProd.First;
  wGeraNovoCodigo:= 0;
  DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
  while DMCHAVEIRO.tbCadProd.FindKey([wGeraNovoCodigo]) do
     begin
       DMCHAVEIRO.tbCadProd.Next;
       wGeraNovoCodigo:= wGeraNovoCodigo+1;
     end;
  edCodigo.Text:=IntToStr(wGeraNovoCodigo);

end;

procedure TfrCadProd.edCodigoChange(Sender: TObject);
begin
  DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
  if DMCHAVEIRO.tbCadProd.FindKey([edCodigo.Text]) then
     begin
       edNomeProduto.Text      :=  DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString;
       cbCategoriaProduto.Text :=  DMCHAVEIRO.tbCadProdBDCATEGORIAPROD.AsString;
       edValorProduto.Text     := CurrToStr(DMCHAVEIRO.tbCadProdBDVALORPROD.AsCurrency);
       btCadProduto.Caption    := 'EDITAR';
       btDeletar.Visible       := True;
     end
  else
     begin
       btDeletar.Visible            := False;
       btCadProduto.Caption         :='CADASTRAR';
       edNomeProduto.Text           :='';
       cbCategoriaProduto.ItemIndex := -1;
       cbCategoriaProduto.Text      :='';
       edValorProduto.Text          :='';
     end;


end;

procedure TfrCadProd.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
     key := #0;
end;

procedure TfrCadProd.FormShow(Sender: TObject);
begin
   cbCategoriaProduto.Clear;
   DMCHAVEIRO.tbCadCategoria.First;
   while not DMCHAVEIRO.tbCadCategoria.Eof do
      begin
        cbCategoriaProduto.Items.Add(DMCHAVEIRO.tbCadCategoriabdNomeCategoria.AsString);
        DMCHAVEIRO.tbCadCategoria.Next;
      end;

end;

procedure TfrCadProd.pCadProd;
var
  wEditando:boolean;
  wCod:integer;
begin

  DMCHAVEIRO.tbCadProd.IndexFieldNames:='BDIDPROD';
  if DMCHAVEIRO.tbCadProd.FindKey([edCodigo.Text]) then
     begin
       DMCHAVEIRO.tbCadProd.Edit;
     end
  else
     begin
       DMCHAVEIRO.tbCadProd.Insert;
       DMCHAVEIRO.tbCadProdBDIDPROD.AsInteger          := StrToInt(edCodigo.Text);
     end;

  DMCHAVEIRO.tbCadProdBDNOMEPROD.AsString                   := edNomeProduto.Text;
  DMCHAVEIRO.tbCadProdBDCATEGORIAPROD.AsString              := cbCategoriaProduto.Text;
  DMCHAVEIRO.tbCadProdBDVALORPROD.AsCurrency                := StrToCurr(edValorProduto.Text);
  DMCHAVEIRO.tbCadProdBDQUANTIDADENOTIFICAR.AsInteger       := 0;
  DMCHAVEIRO.tbCadProdBDQUANTIDADEPROD.AsInteger            := 0;
  DMCHAVEIRO.tbCadProdBDNOTIFICARESTOQUE.AsBoolean          := False;
  DMCHAVEIRO.tbCadProd.Post;
  DMCHAVEIRO.tbCadProd.Refresh;

end;
end.
