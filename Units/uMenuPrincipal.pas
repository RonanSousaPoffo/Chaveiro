unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,uCadProd,uCadCategoria,uEstoque,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Categoria1: TMenuItem;
    Estoque1: TMenuItem;
    EstoqueAtual1: TMenuItem;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure EstoqueAtual1Click(Sender: TObject);
  private
    { Private declarations }
    uCadProd:TfrCadProd;
    uCadCategoria: TfrCadCategoria;
    uEstoque : TfrEstoque;
  public
    { Public declarations }
  end;

var
  frMenuPrincipal: TfrMenuPrincipal;

implementation

{$R *.dfm}

procedure TfrMenuPrincipal.Categoria1Click(Sender: TObject);
begin
  uCadCategoria:= TfrCadCategoria.create(Self);
  uCadCategoria.show;
end;

procedure TfrMenuPrincipal.EstoqueAtual1Click(Sender: TObject);
begin
  uEstoque:= TfrEstoque.create(Self);
  uEstoque.show;
end;

procedure TfrMenuPrincipal.FormCreate(Sender: TObject);
begin
   uCadProd:=TfrCadProd.Create(Self);
end;

procedure TfrMenuPrincipal.Produtos1Click(Sender: TObject);
begin
 uCadProd.Show;
end;

end.
