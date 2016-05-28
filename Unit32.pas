unit Unit32;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ComCtrls, main;

type
  TfrmTable2 = class(TForm)
    SG1: TStringGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SG1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTable2: TfrmTable2;
implementation

{$R *.DFM}

procedure TfrmTable2.FormKeyPress(Sender: TObject; var Key: Char);
begin
hide;
end;


procedure TfrmTable2.SG1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
//if key <> VK_SPACE then exit;
//ProcessingLevel := ProcessingLevel + 1;
//if ProcessingLevel = 3 then ProcessingLevel := 1;
//hide;
end;

procedure TfrmTable2.FormShow(Sender: TObject);
begin
//if intCM <> 3 then exit;
//sb1.Visible := true;
//sb1.Panels[0].text := 'Нажмите пробел для продолжения';
//SG1.SetFocus;
end;

end.
