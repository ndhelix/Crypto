unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ComCtrls, main;

type
  TfrmTable = class(TForm)
    SG1: TStringGrid;
    SB1: TStatusBar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SG1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTable: TfrmTable;
implementation

{$R *.DFM}

procedure TfrmTable.FormKeyPress(Sender: TObject; var Key: Char);
begin
hide;
end;


procedure TfrmTable.SG1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
//if key <> VK_SPACE then exit;
//ProcessingLevel := ProcessingLevel + 1;
//if ProcessingLevel = 3 then ProcessingLevel := 1;
//hide;
end;

procedure TfrmTable.FormShow(Sender: TObject);
begin
if intCM <> 3 then exit;
//sb1.Visible := true;
//sb1.Panels[0].text := 'Нажмите пробел для продолжения';
//SG1.SetFocus;
end;

end.
