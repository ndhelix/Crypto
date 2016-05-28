unit Stat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, main, main_add, ComCtrls;

type
  TfrmStat = class(TForm)
    SG1: TStringGrid;
    SB1: TStatusBar;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure SB1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    procedure ShowStatistics;

var
  frmStat: TfrmStat;

implementation

{$R *.DFM}

procedure ShowStatistics;
var i,j : integer;
    SA: array[0..255] of word; //contains qty of each symbol
    c: char;
    x,y: integer;
begin
    if l = 0  then begin
     MessageDlg('Нет ни одного символа' , mtWarning, [mbOk], 0);
       exit;       end;
for i := 0 to 255 do SA[i] := 0;
form1.memo1.lines.SaveToFile ( tmpfile1 );
AssignFile( CBFile1, tmpfile1 );
Reset( CBFile1 );
 for i := 1 to l do
  begin
    read(CBFile1, c);
//    if c = #26 then                                     begin
//      application.MessageBox('Недопустимый символ в файле (#26)', appname, mb_ok + mb_iconerror);
//      CloseFile( CBFile1 );                       exit; end;
    SA[ ord(c) ] := SA[ ord(c) ] + 1;
  end;
CloseFile( CBFile1 );
frmStat.show;
x := 0; y := 0;
with frmStat.SG1 do
 for i := 0 to 255 do
  begin
    cells[x,  y] := inttostr( i );
    cells[x+1,y] := chr( i );
    cells[x+2,y] := inttostr( SA[i] );
    cells[x+3,y] := FormatFloat( '0.0', SA[i] / l * 100 ) + '%';
    if (i+1) mod RowCount = 0 then begin y := 0; x := x + 5; end
                              else y := y + 1;
  end; // with, for
end;

procedure TfrmStat.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
end;


procedure TfrmStat.SG1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
case (ACol + 1) mod 5 of
 1:SB1.Panels[0].text := 'Код символа';
 2:SB1.Panels[0].text := 'Cимвол';
 3:SB1.Panels[0].text := 'Число соответствующих символов в тексте';
 4:SB1.Panels[0].text := 'Доля соответствующих символов в тексте';
 0:SB1.Panels[0].text := 'Столбец-разделитель';
end;
end;

procedure TfrmStat.FormActivate(Sender: TObject);
begin
SB1.panels[0].text := 'Выделите ячейку для получения подсказки';
end;


procedure TfrmStat.SB1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if X < SB1.Panels[0].Width then exit;
If form1.FontDialog1.Execute
 then SG1.Font := form1.FontDialog1.font;

end;

end.
