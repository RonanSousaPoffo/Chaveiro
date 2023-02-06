unit uUtil;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,uDMChaveiro,
  Vcl.StdCtrls, Vcl.CheckLst;

type

  tUtil = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  procedure pSalvaLog (prTexto:String);
  published
    { published declarations }
  end;

  implementation

{ tUtil }

{ tUtil }

procedure tUtil.pSalvaLog(prTexto: String);
var
  wLog: TStringList;
begin
 wLog:= TStringList.Create;
  if FileExists('C:\LogProjetoChaveiro.txt') then
     wLog.LoadFromFile('C:\LogProjetoChaveiro.txt');

  wLog.Add(prTexto);
  wLog.SaveToFile('C:\LogProjetoChaveiro.txt');

end;

end.

implementation

end.
