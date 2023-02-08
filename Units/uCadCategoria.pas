unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls ,uDMChaveiro,uUtil;

type
  TfrCadCategoria = class(TForm)
    lbCategoria: TLabel;
    edCategoria: TEdit;
    btCadCategoria: TButton;
    Label1: TLabel;
    edCodigo: TEdit;
    btDeletar: TButton;
    btGerarCodigo: TButton;
    procedure btCadCategoriaClick(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoChange(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btGerarCodigoClick(Sender: TObject);
  private
    { Private declarations }
    uUtil : tUtil;
  public
    { Public declarations }
  end;

var
  frCadCategoria: TfrCadCategoria;

implementation

{$R *.dfm}

procedure TfrCadCategoria.btCadCategoriaClick(Sender: TObject);
VAR
  wEditando:boolean;
begin
  if edCategoria.text<>'' then
     begin

       DMCHAVEIRO.tbCadCategoria.IndexFieldNames:='IDCATEGORIA';
       if DMCHAVEIRO.tbCadCategoria.FindKey([edCodigo.Text]) then
          begin
            btCadCategoria.Caption:= 'EDITAR';
            DMCHAVEIRO.tbCadCategoria.Edit;

          end
       else
          begin
            btCadCategoria.Caption:='CADASTRAR';
            DMCHAVEIRO.tbCadCategoria.Insert;
            DMCHAVEIRO.tbCadCategoriaidCategoria.AsInteger := StrToInt(edCodigo.Text);

          end;

          DMCHAVEIRO.tbCadCategoriabdNomeCategoria.AsString  :=edCategoria.Text;
          DMCHAVEIRO.tbCadCategoria.Post;
     end
  else
     begin
       ShowMessage('Necessário Inserir O Nome da Categoria');
       edCategoria.SetFocus;
     end;

end;

procedure TfrCadCategoria.btDeletarClick(Sender: TObject);
begin
 DMCHAVEIRO.tbCadCategoria.IndexFieldNames:='IDCATEGORIA';
  if MessageDlg('Deseja realmente excluir a categoria '+UpperCase(edCategoria.Text)+' ?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
    if DMCHAVEIRO.tbCadCategoria.FindKey([edCodigo.Text]) then
       begin
         DMCHAVEIRO.tbCadCategoria.Delete;
         edCategoria.Text:='';
       end
  end;
end;

procedure TfrCadCategoria.btGerarCodigoClick(Sender: TObject);
var
  wGeraNovoCodigo:integer;
begin
  DMCHAVEIRO.tbCadCategoria.First;
  wGeraNovoCodigo:= 0;
  DMCHAVEIRO.tbCadCategoria.IndexFieldNames:='IDCATEGORIA';
  while DMCHAVEIRO.tbCadCategoria.FindKey([wGeraNovoCodigo]) do
     begin
       DMCHAVEIRO.tbCadCategoria.Next;
       wGeraNovoCodigo:=wGeraNovoCodigo+1;
     end;
  edCodigo.Text:=IntToStr(wGeraNovoCodigo);

end;

procedure TfrCadCategoria.edCodigoChange(Sender: TObject);
begin
  DMCHAVEIRO.tbCadCategoria.IndexFieldNames:='IDCATEGORIA';
  if DMCHAVEIRO.tbCadCategoria.FindKey([edCodigo.Text]) then
     begin
       edCategoria.Text:=  DMCHAVEIRO.tbCadCategoriabdNomeCategoria.AsString;
       btCadCategoria.Caption:= 'EDITAR';
       btDeletar.Visible:=true;
     end
  else
     begin
       btCadCategoria.Caption:='CADASTRAR';
       edCategoria.Text:='';
       btDeletar.Visible:=False;
     end;
end;

procedure TfrCadCategoria.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

end.
