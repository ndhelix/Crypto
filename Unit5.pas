unit Unit5;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    Version: TLabel;
    ProductName: TLabel;
    Copyright: TLabel;
    Panel1: TPanel;
    P: TPaintBox;
    Shape1: TShape;
    lblPhysMem: TLabel;
    lblAvailPhys: TLabel;
    os: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKButtonKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Done: boolean;
    NoDrawing: boolean;
    procedure GetOSInfo;
    { Private declarations }
  public
    { Public declarations }
  end;

const
   //about array
   AA: array[0..4,0..4] of char = (('C','r','y','p','t'),
                                   ('o',' ','1','.','0'),
                                   (' ','©',' ','2','0'),
                                   ('0','2',' ','n','d'),
                                   ('h','e','l','i','x'));

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.GetOSInfo;
var
  Platform: string;
  BuildNumber: Integer;
begin
  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        Platform := 'Windows 9x';
        BuildNumber := Win32BuildNumber and $0000FFFF;
      end;
    VER_PLATFORM_WIN32_NT:
      begin
        Platform := 'Windows NT';
        BuildNumber := Win32BuildNumber;
      end;
      else
      begin
        Platform := 'Windows';
        BuildNumber := 0;
      end;
  end;
    Platform := 'ОС ' + Platform;
  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or
    (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
    if Win32CSDVersion = '' then
      OS.Caption := Format('%s %d.%d (Build %d)', [Platform,
            Win32MajorVersion, Win32MinorVersion, BuildNumber])
    else
      OS.Caption := Format('%s %d.%d (Build %d%s)', [Platform,
       Win32MajorVersion, Win32MinorVersion, BuildNumber, Win32CSDVersion]);
  end
  else
    OS.Caption := Format('%s %d.%d', [Platform, Win32MajorVersion,
      Win32MinorVersion]);
end;


Procedure Line(X,Y, X1, Y1 : integer);
begin
With aboutbox.P.Canvas do BEGIN
         Moveto(X,Y);
         LineTo(X1, Y1);
                               END;

end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
if done = false then done := true
                else aboutbox.close;
end;


procedure TAboutBox.FormActivate(Sender: TObject);
const n1 = 4; n2 = 4;
var
//there should be a table 5x5 with these "separators"
 X: array[1..n1] of integer;
 Y: array[1..n2] of integer;
 i,j: integer;
 MS: TMemoryStatus;

Procedure SlowLine(X1, Y1, X2, Y2 : integer; d:word{delay}; step:word);
var k:extended; b:integer; // y = kx + b
var  xi : integer; a : array[1..4] of boolean;

Procedure HSlowLine;
var i: integer; b, bb : boolean;
begin
if x1 < x2 then b := true else b := false;
xi := x1;
With aboutbox.p.Canvas do
 BEGIN
  Moveto(X1,Y1);
    repeat
     if b then xi := xi+step else xi := xi-step;
     LineTo(xi, Y1);
     Application.ProcessMessages;
     if Done then exit;
     sleep(d);
     if (xi >= x2) and b or (xi <= x2) and not b
      then bb := true
      else bb := false;
    until bb;
 END;
end;

Procedure VSlowLine;
var i,yi: integer; b, bb : boolean;
begin
if y1 < y2 then b := true else b := false;
yi := y1;
With aboutbox.p.Canvas do
 BEGIN
  Moveto(X1,Y1);
    repeat
     if b then yi := yi+step else yi := yi-step;
     LineTo(x1, yi);
     Application.ProcessMessages;
     if Done then exit;
     sleep(d);
     if (yi >= y2) and b or (yi <= y2) and not b
      then bb := true
      else bb := false;
    until bb;
 END;
end;

Procedure AngleSlowLine;
var i : integer;
begin
k := 0; b:=0;
for i := 1 to 4 do a[i] := false;
if (x1 < x2) and (y1 < y2) then a[1] := true;
if (x1 < x2) and (y1 > y2) then a[2] := true;
if (x1 > x2) and (y1 < y2) then a[3] := true;
if (x1 > x2) and (y1 > y2) then a[4] := true;
b := y1-x1; k := (y2-y1)/(x2-x1);
xi := x1;
With aboutbox.p.Canvas do
 BEGIN
  Moveto(X1,Y1);
  if a[1] or a[2] then
   begin
    repeat
     xi := xi+step;
     LineTo(xi, round((xi-x1)*k + x1+b) );
     Application.ProcessMessages;
     if Done then exit;
     sleep(d);
    until xi >= x2;
   end;
  if a[3] or a[4] then
   begin
    repeat
     xi := xi-step;
     LineTo(xi, round((xi-x1)*k + x1+b) );
     Application.ProcessMessages;
     if Done then exit;
     sleep(d);
    until xi <= x2;
   end;
 END;
end;

begin // SlowLine
Application.ProcessMessages;
if Done then exit;
if (x1 <> x2) and (y1 <> y2)
 then AngleSlowLine
 else if x1 = x2 then VSlowLine
                 else HSlowLine;
end; // SlowLine

var po1,po2: integer; //point

procedure SmallRectFill(X,Y: integer; BorderColor: TColor);
begin
with p.canvas do
begin
 floodfill(X*po1+2,Y*po2+2,BorderColor,fsborder);
end;
end;

procedure SetChars( d: word );
var i,j, d1,d2, ind : integer;
begin
d1 := P.Width  div 5;
d2 := P.Height div 5;
ind := 5;
//textout
p.canvas.Font.Color := clWhite;
with p.canvas do
 for i := 0 to 4 do for j := 0 to 4 do
    begin
      TextOut(i * d1 + ind, j * d2 + ind, AA[j,i]);
      Application.ProcessMessages;
      if Done then exit;
      Sleep(d);
    end;
end;

begin     //begin - in fact
// b := 156;
// b := GetFreeSpace( b );
// d := GlobalMemoryStatus( memorystatus.dwMemoryLoad );
//lblGetFreeSpace.Caption := inttostr(d);
GetOSInfo;
MS.dwLength := SizeOf(TMemoryStatus);
GlobalMemoryStatus(MS);
lblPhysMem.Caption := 'Физическая память: ' +
       FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024);
lblAvailPhys.Caption := 'Свободные ресурсы: ' +
       FormatFloat('#,###" KB"', MS.dwAvailPhys div 1024);
po1 := p.Width div (n1+1);
po2 := p.Height div (n2+1);
for i := 1 to n1 do X[i] := po1 * i;
for i := 1 to n2 do Y[i] := po2 * i;
with P.canvas do
begin
 Done := false;
 brush.color := $00FF5555;
 brush.Style := bssolid;
// floodfill(10,10,clyellow{clBtnFace},fsborder);
// FillRect(Rect(0,0,p.width,p.height));
//  pen.mode := pmnot;
// slowline(0,y[1],6 ,y[1],  1, 6{step});
 pen.color := clWhite;
 pen.width := 3;
 for j := 1 to n1 do // horiz. lines
   slowline(0,y[j],width,y[j],  1, 11{step});
 for i := 1 to n2 do // vert. lines
   slowline(x[i],0,x[i],height, 1, 11{step});
 SetChars( 26 );
 Done := true;
end;
end;

procedure TAboutBox.OKButtonKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if key = 13 then exit;
//if done = false then done := true
//                else aboutbox.close;
end;

end.

