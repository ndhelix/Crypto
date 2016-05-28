unit Tris;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, main, main_add, Sim_Rep, ComCtrls;

type
  TfrmTris = class(TForm)
    SG1: TStringGrid;
    SB1: TStatusBar;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    procedure TrisIt(direction: boolean );

var
  frmTris: TfrmTris;

implementation

{$R *.DFM}

procedure TfrmTris.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
end;

procedure TrisIt(direction: boolean);
const aa = 224{а}; bb = 255{я}; //symbols ord (from ... to)
label L1, L2, L3, L4, L5;
var
 dp, Code,Code1,Code2,z, k, x,y: integer;
 b, s1,s2,s3 : string;
 pc    : PChar;
 c, c1 : char;
 i,j   : integer;
 lb    : integer;
 //Tris Keyword pwd - pwd without repeating chars and non-case sensitive
 tkpwd : pchar;
 pch1  : pchar;
 // Trisemus array
 TRA   : array[1..4,1..8] of integer;
 // Trisemus decrypt array
 TRD   : array[1..2,aa..bb] of integer;
 ClickedOK: Boolean;
 P     : TIntArray; //pwd, "ord" representation
 strpc : string;
 CanAdd: boolean;

begin
L5:
tkpwd := ''; pwd := ''; strpc := ''; b:='';
ClickedOK := InputQuery(EDDT, 'Введите пароль', b);
if not ClickedOK then exit;
lb := length(b);
L4:
pwd := PChar(b);
l_pwd := length( pwd );
// ignoring non-cyrillic symbols and caps
for i := 0 to l_pwd-1 do
 if ord(pwd[i]) >= aa
  then s1 := s1 + pwd[i]
  else if ord(pwd[i]) >= aa - 32
        then s1 := s1 + chr( ord(pwd[i]) + 32 );
tkpwd := pchar(s1);
pwd   := tkpwd;
l_pwd := length( pwd );
lb    := length(tkpwd);
if ( lb < 1 ) then
 begin
  application.MessageBox(pchar('Пароль должен содержать'+
                     ' как минимум один символ кириллицы'),
                     appname, mb_ok + mb_iconerror);
  goto L5;
 end;

// removing repeating symbols
strpc := '';
//s1 := '';
strpc := string(pwd);
s1 := strpc[1];
for i := 2 to l_pwd do
begin
 CanAdd := True;
 for j := 1 to length(s1) do
  if strpc[i] = copy(s1,j,1) then
   begin
    CanAdd := False;
    break;
   end;
 if CanAdd then
   s1 := s1 + strpc[i];
end; // for i
  pwd := pchar(s1);
tkpwd := pchar(s1);

lb := length(tkpwd);
  if ( lb >= 31 ) then begin
     application.MessageBox(pchar('Пароль не должен'+
                ' содержать более 30 символов'),
                appname, mb_ok + mb_iconerror);
     exit;
    end;

//  if MessageDlg('Пароль - "' + string(tkpwd) + '"',
//                 mtConfirmation, [mbOK, mbCancel], 0)
//          = mrCancel
//   then
//    goto L5;
  pwd := tkpwd;
  l_pwd := length(pwd);
  P := PCharToOrdArr( pwd );

x:=1; y:=1;
for i := 1 to l_pwd do begin
  x := (i + 8 - 1) div 8;
  if i mod 8 = 0
   then y := 8
   else y := i mod 8;
  TRA[x,y] := P[i-1];
  TRD[1, P[i-1]] := x;
  TRD[2, P[i-1]] := y;
 end;
z := aa;
i := l_pwd + 1;
repeat
   CanAdd := true;
   for j := 0 to l_pwd - 1 do
    if z = P[j] then begin
      CanAdd := false;
      break;
    end;
    if CanAdd then begin
     x := (i + 8 - 1) div 8;
     if i mod 8 = 0
      then y := 8
      else y := i mod 8;
     TRA[x, y] := z;
     TRD[1, z] := x;
     TRD[2, z] := y;
     i := i + 1;
    end;
    z := z + 1;
until z = bb + 1;

x := 0; y := 0;
form1.memo1.lines.SaveToFile ( tmpfile1 );
AssignFile( CBFile1, tmpfile1 );
Reset( CBFile1 );
AssignFile( CBFile2, tmpfile2 );
Rewrite( CBFile2 );
for i := 1 to l do
begin
 read(CBFile1, c);
 if c = #26 then
  begin
   application.MessageBox('Недопустимый символ в файле (#26)',
                           appname, mb_ok + mb_iconerror);
   CloseFile( CBFile1 );
   CloseFile( CBFile2 );
   exit;
  end;
 if (c = #1) and not IsEncrypting then c := #26;
  if ord(c) < 192 {А}
   then c1 := chr(ord(c))
   else if ord(c) < 224 {а}
    then
     if direction = true
      then
       if TRD[1,ord(c)+32] = 4
        then c1 := chr( TRA[ 1, TRD[2,ord(c)+32]] -32 )
        else c1 := chr( TRA[ TRD[1,ord(c)+32]+1, TRD[2,ord(c)+32]] -32 )
      else
       if TRD[1,ord(c)+32] = 1
        then c1 := chr( TRA[ 4, TRD[2,ord(c)+32]] -32 )
        else c1 := chr( TRA[ TRD[1,ord(c)+32]-1, TRD[2,ord(c)+32]] -32 )
    else {224 <= ord(c) <= 255}
     if direction = true
     then
       if TRD[1,ord(c)] = 4
        then c1 := chr( TRA[ 1, TRD[2,ord(c)]] )
        else c1 := chr( TRA[ TRD[1,ord(c)]+1, TRD[2,ord(c)]] )
      else
       if TRD[1,ord(c)] = 1
        then c1 := chr( TRA[ 4, TRD[2,ord(c)]] )
        else c1 := chr( TRA[ TRD[1,ord(c)]-1, TRD[2,ord(c)]] );

    if (c1 = #26) and IsEncrypting then c1 := #1;
    write(CBFile2, c1);
end; //for i := 1 to l do
CloseFile( CBFile1 );
CloseFile( CBFile2 );
form1.memo2.lines.LoadFromFile ( tmpfile2 );

with frmTris.sg1 do // filling SG
 for i := 0 to 7 do
  for j := 0 to 3 do
   Cells[i,j] := ' ' + chr(TRA[j+1,i+1]);
frmTris.Show;
end;



end.
