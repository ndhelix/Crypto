unit Vizh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, main, main_add, Sim_Rep, ComCtrls;

type
  TfrmVizh = class(TForm)
    SG1: TStringGrid;
    SB1: TStatusBar;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    procedure VizhIt(direction: boolean );

var
  frmVizh: TfrmVizh;

implementation

{$R *.DFM}

procedure TfrmVizh.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
end;

procedure VizhIt(direction: boolean);
const aa = 224{а}; bb = 255{€}; //symbols ord (from ... to)
label L1, L2, L3, L4, L5;
var
 o, x,y: integer;
 b, s1 : string;
 c, c1 : char;
 i,j   : integer;
 lb    : integer;
 tkpwd : pchar;
 //Vizh Keyword pwd - pwd without repeating chars and non-case sensitive
 CYRA  : array[1..64] of integer;
 ClickedOK: Boolean;
 // "Cyrillic array" - аб...ю€аб...ю€ to fill SG
 P: TIntArray; //pwd, "ord" representation

begin
  L5:
  tkpwd := ''; pwd := '';
  ClickedOK := InputQuery(EDDT, '¬ведите пароль', b);
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
pwd := tkpwd;
l_pwd := length( pwd );
lb := length(tkpwd);
if ( lb < 1 ) then
 begin
  application.MessageBox(pchar('ѕароль должен содержать как ми'+
   'нимум один символ кириллицы'), appname, mb_ok + mb_iconerror);
  goto L5;
 end;

lb := length(tkpwd);
if ( lb >= 31 ) then
 begin
  application.MessageBox(pchar('ѕароль не должен содержать '+
          'более 30 символов'), appname, mb_ok + mb_iconerror);
  goto L5;
 end;
  pwd := tkpwd;
  l_pwd := length(pwd);
  P := PCharToOrdArr( pwd );

x := 0; y := 0;
form1.memo1.lines.SaveToFile ( tmpfile1 );
AssignFile( CBFile1, tmpfile1 );
Reset( CBFile1 );
AssignFile( CBFile2, tmpfile2 );
Rewrite( CBFile2 );
for i := 1 to l do
begin
 y := P[x];
 read(CBFile1, c);
 o := ord(c);
{  if c = #10 then continue;
  if c = #13 then begin
    writeln(CBFile2); continue;
   end;}
 if c = #26 then
   begin
    application.MessageBox('Ќедопустимый символ в файле (#26)',
                           appname, mb_ok + mb_iconerror);
    CloseFile( CBFile1 );
    CloseFile( CBFile2 );
    exit;
   end;
  if (c = #1) and not IsEncrypting then c := #26;
   if o < 192 {ј}
    then
     begin
      write(CBFile2, c);
      continue;
     end
    else if o < 224 {а}
     then
      begin
       o := o - 191;
       y := y - 191;
       if direction = true
        then
         if (o+y-1) mod 32 = 0
          then c1 := chr( 32 + 191 )
          else c1 := chr( ((o+y-1) mod 32) + 191 )
        else
         begin
          if y <= o
           then c1 := chr( o - y + 1 + 191 )
           else c1 := chr( o + y + (33-y-y) + 191 );
          if ord(c1) < 192 then c1 := chr(ord(c1)+32)
         end
      end
     else {224 <= ord(c) <= 255}
      begin
       o := o - 223;
       y := y - 223;
       if direction = true
        then
         if (o+y-1) mod 32 = 0
          then c1 := chr( 32 + 223 )
          else c1 := chr( ((o+y-1) mod 32) + 223 )
        else
         if y <= o
          then c1 := chr( o - y + 1 + 223 )
          else c1 := chr( o + y + (33-y-y) + 223 )
      end;
  if (c1 = #26) and IsEncrypting then c1 := #1;
  write(CBFile2, c1);
  if x = l_pwd - 1 then x := 0 else x := x + 1;
end; //for i := 1 to l do
CloseFile( CBFile1 );
CloseFile( CBFile2 );
form1.memo2.lines.LoadFromFile ( tmpfile2 );

for i := 1 to 32 do CYRA[i] := 191 + i;
for i := 1 to 32 do CYRA[32+i] := 191 + i;

with frmVizh.sg1 do // filling SG
 for i := 0 to 31 do
  for j := 0 to 31 do
   Cells[i,j] := chr(CYRA[j+i+1]);
frmVizh.Show;
end;

end.
