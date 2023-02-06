program projectChaveiro;

uses
  Vcl.Forms,
  uMenuPrincipal in 'Units\uMenuPrincipal.pas' {frMenuPrincipal},
  uDMChaveiro in 'Units\uDMChaveiro.pas' {DMCHAVEIRO: TDataModule},
  uCadProd in 'Units\uCadProd.pas' {frCadProd},
  uCadCategoria in 'Units\uCadCategoria.pas' {frCadCategoria},
  uEstoque in 'Units\uEstoque.pas' {frEstoque},
  uUtil in 'Units\uUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMCHAVEIRO, DMCHAVEIRO);
  Application.CreateForm(TfrMenuPrincipal, frMenuPrincipal);
  Application.Run;
end.
