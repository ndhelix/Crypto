unit Sim_Rep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, main, main_add, ComCtrls;

type
  TfrmSimRep = class(TForm)
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

 type TIntArray = array[0..1023] of integer;
//    type TIntArray = array [0..MaxInt DIV sizeof(Integer)-1] of Integer;
//    func = function( direction: boolean; a,b,c,d,dp:integer ) : integer;
 procedure Displacement(direction: boolean; dtype: byte );
 function GetOrd( direction: boolean; c,d,dp:integer;
                  pwd: pchar; dtype: byte ) : integer;
 function GetCyclicOrd( direction: boolean;
                        a,b,c,d,dp:integer ) : integer;
 function GetAthensOrd( direction: boolean;
                        a,b,c,d,dp:integer ) : integer;
 function GCD( n1,n2 : integer ) : integer;//greatest common divisor
 //Caesar keyword
 function GetCaesarKOrd( direction: boolean;
                         pwd: pchar; a,b,c,k:integer ) : integer;
 function PCharToOrdArr( pc: pchar) : TIntArray;
 function GetCKpwd( pwd: pchar) : pchar; //Get Caesar Keyword pwd
//    function PCharToOrdArr( pc: pchar) : array [0..256] of Integer;

var
  frmSimRep: TfrmSimRep;

implementation

{$R *.DFM}

procedure TfrmSimRep.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
end;

// the provedure for next methods (depends on dtype):
// 1: Простая замена с помощью смещения
// 2: Афинная система подстановок
// 3: Система Цезаря с ключевым словом
procedure Displacement(direction: boolean; dtype: byte);
const
 aa = 15; bb = 255; //symbols ord (from ... to)

label L1, L2, L3, L4, L5, L6, L7, L8, L9;
var
 dp, Code,Code1,Code2,Code3, d{displacement}, x,y: integer;
 d1, d2, d3, lb : integer;
 i,j       : integer;
  //Caesar Keyword pwd - pwd without repeating chars
 ckpwd     : pchar;
 b, s1, we : string;
 c, c1     : char;
 strpc     : string;
 CanAdd    : boolean;
 ClickedOK : Boolean;
 // Caesar Symbol Encrypt/Decrypt array
 CSEDA: array[0..2,aa..bb] of integer;
 P: TIntArray; //pwd, "ord" representation
begin
pwd := '';
case dtype of
1: // Простая замена с помощью смещения
 begin
  d := 0;
  L7:
  if direction then we := 'Зашифровать' else we := 'Расшифровать';
   ClickedOK := InputQuery(we, 'Задайте смещение: целое число'+
                           ' от 1 до ' + inttostr(maxdp), b);
  if not ClickedOK then exit;
  val( b, dp, Code );
  if ( Code <> 0 ) or ( dp < 1 ) or ( dp > maxdp ) then
   begin
    MessageDlg('Смещением должно быть целое число от 1 до '
               + inttostr(maxdp) + ' !', mtWarning, [mbOk], 0);
    goto L7;
   end;
 end; // 1:
2: // Афинная система подстановок
 begin
  L8:
  if direction then we := 'Зашифровать'
               else we := 'Расшифровать';
  ClickedOK := InputQuery(we, 'Задайте числа a и b через'+
                              ' пробел, НОД(a,b)=1', b     );
  if not ClickedOK then exit;
  case length(b) of
   3: begin
        if  copy(b,2,1) <> ' '  then goto L1;
        val( copy(b,1,1), d, Code1 );
        val( copy(b,3,1), dp, Code2 );
      end;
   4: begin
        if  copy(b,2,1) = ' '
         then
          begin
           val( copy(b,1,1), d, Code1 );
           val( copy(b,3,2), dp, Code2 );
          end
         else
          if  copy(b,3,1) = ' '
           then
            begin
             val( copy(b,1,2), d, Code1 );
             val( copy(b,4,1), dp, Code2 );
            end
           else goto L1;
      end;
   5: begin
        if  copy(b,3,1) <> ' '  then goto L1;
        val( copy(b,1,2), d, Code1 );
        val( copy(b,4,2), dp, Code2 );
      end;
   else goto L1
  end;
  if ( Code1 <> 0 ) or ( Code2 <> 0 ) or ( d < 1   ) or
     (     d > 99 ) or (    dp  < 1 ) or ( dp > 99 )
    then goto L1;
  if GCD(dp,d) <> 1 then goto L3;
  if (dp = 1) or (d = 1) then goto L6;
  goto L2;
  L1:
   MessageDlg('a и b должны быть целыми числами от 2 до 99,'+
              ' a и b должны быть разделены пробелом !',
              mtWarning, [mbOk], 0                            );
   goto L8;
  L3:
   MessageDlg('Наибольший общий делитель a и b должен быть '+
              'равен 1, а в вашем случае это - ' +
              inttostr(GCD(dp,d)), mtWarning, [mbOk], 0       );
   goto L8;
  L6:
   MessageDlg('Ни одно из чисел не должно быть равно 1',
               mtWarning, [mbOk], 0                     );
   goto L8;
  L2:
 end; // 2:

3: // Caesar Keyword - система подстановки Цезаря
 begin
  L5:
  ckpwd := ''; pwd := '';
  d := 0; // "d" is "k"
  if direction then we := 'Зашифровать' else we := 'Расшифровать';
  ClickedOK := InputQuery(we, 'Задайте смещение и пароль через пробел', b);
  if not ClickedOK then exit;
  lb := length(b);
  d1 := 0; d2 := 0; d3 := 0;
//  s1 := copy(b,1,1); s2 := copy(b,1,2); s3 := copy(b,1,3);
  val( copy(b,1,1), d1, Code1 );
  val( copy(b,1,2), d2, Code2 );
  val( copy(b,1,3), d3, Code3 );
//  val( s1, d1, Code1 );
//  val( s2, d2, Code2 );
//  val( s3, d3, Code3 );
  if ( lb   >= 7 ) and ( copy(b,4,1) = ' ' ) and
     ( Code3 = 0 ) and ( d3 < 128 ) then
   begin // d has 3 digits
    d := d3;
    pwd := pchar( copy(b, 5, lb - 4 ) );
    goto L4;
   end; //if-then
  if ( lb >= 6   ) and ( copy(b,3,1) = ' ' ) and
     ( Code2 = 0 ) then
   begin  // d has 2 digits
    d := d2;
    pwd := pchar( copy(b, 4, lb - 3 ) );
    goto L4;
   end; //if-then
  if ( lb >= 5 ) and ( copy(b,2,1) = ' ' ) and ( Code1 = 0 ) then
    begin // d has 1 digit
     d := d1;
     pwd := pchar( copy(b, 3, lb - 2 ) );
     goto L4;
    end; //if-then
  if ( lb >= 3 ) then
    begin // there is no d, only pwd
     d := 0;
     pwd := pchar( b );
    end //if-then
   else
    begin
     application.MessageBox(pchar('Для данного метода коли'+
        'чество символов в пароле не должно быть менее трех'),
        appname, mb_ok + mb_iconerror);
     goto L5;
    end;

  L4:
  l_pwd := length( pwd );
// BEGIN determining ckpwd (removing repeating symbols)
strpc := '';
//b := '';
s1 := '';
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
//b1:=pchar(b);
//GetCKpwd := b1;
//  s1 := s1 + chr(bb); //it is necessary to avoid equal correspondence
  ckpwd := pchar(s1);
// END determining ckpwd (removing repeating symbols)
// if length(ckpwd) < 3 then begin
//   exit; end;

  if MessageDlg('k = "' + inttostr( d ) + '",  пароль - "'
                + string(ckpwd) + '"', mtConfirmation,
                [mbOK, mbCancel], 0) = mrCancel
   then
    goto L5;
  pwd := ckpwd;
  l_pwd := length(pwd);
//  application.MessageBox( pwd, appname, mb_ok + mb_iconerror);
  P := PCharToOrdArr( pwd );
//    CSEDA: [0,i] -> [1,i] - encrypting
//    CSEDA: [0,i] -> [2,i] - decrypting
  for i := aa to bb do CSEDA[0,i] := i;

  for i := aa + d to aa + d + l_pwd - 1 do
   begin
    CSEDA[1,i] := P[i-aa-d];
    CSEDA[2, CSEDA[1,i] ] := i;
   end;
  d1 := aa;
  d2 := aa + d + l_pwd;

 repeat
   CanAdd := true;
   for j := 0 to l_pwd - 1 do
    if d1 = P[j] then
     begin
      CanAdd := false;
      break;
     end;
    if CanAdd then
     begin
      CSEDA[1,d2] := d1;
      CSEDA[2, CSEDA[1,d2] ] := d2;
      d2 := d2 + 1;
     end;
    d1 := d1 + 1;
 until d2 = bb + 1;
 d2 := aa;
 if d > 0 then
  repeat
   CanAdd := true;
   for j := 0 to l_pwd - 1 do
    if d1 = P[j] then
     begin
      CanAdd := false;
      break;
     end;
    if CanAdd then
     begin
      CSEDA[1,d2] := d1;
      CSEDA[2, CSEDA[1,d2] ] := d2;
      d2 := d2 + 1;
     end;
    d1 := d1 + 1;
  until d2 = aa + d

 end; // 3: Caesar Keyword
end; //case
x := 0;
y := 0;
form1.memo1.lines.SaveToFile ( tmpfile1 );
AssignFile( CBFile1, tmpfile1 );
Reset     ( CBFile1 );
AssignFile( CBFile2, tmpfile2 );
Rewrite   ( CBFile2 );
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
 if dtype = 3
  then
   if ord(c) < 15
    then c1 := chr(ord(c))
    else
     if direction = true
      then c1 := chr( CSEDA[1, ord(c)] )
      else c1 := chr( CSEDA[2, ord(c)] )
  else c1 := chr( GetOrd(direction, ord(c), d, dp, pwd, dtype) );
 if (c1 = #26) and IsEncrypting then c1 := #1;
 write(CBFile2, c1);
    //    memo2.text := memo2.text + chr (GetOrd(direction, ord(pc[0]), d, dp, herefn) );
end;//for i := 1 to l do
CloseFile( CBFile1 );
CloseFile( CBFile2 );
form1.memo2.lines.LoadFromFile ( tmpfile2 );
//try // there is "3 468" problem
with frmSimRep.sg1 do // filling SG
for i := 0 to 255 do
begin
 cells[x,  y] := inttostr( i );
 cells[x+1,y] := chr( i );
 if dtype = 3
  then
   if i < 15
    then begin
          cells[x+2,y] := inttostr( i );
          cells[x+3,y] := chr( i )
         end
    else
     if direction = true
      then begin
            cells[x+2,y] := inttostr( CSEDA[1, i] );
            cells[x+3,y] := chr( CSEDA[1, i] )
           end
           else begin
            cells[x+2,y] := inttostr( CSEDA[2, i] );
            cells[x+3,y] := chr( CSEDA[2, i] )
           end
      else
       begin //dtype <> 3
        cells[x+2,y] := inttostr( GetOrd(direction,
                               i, d, dp, pwd, dtype) );
        cells[x+3,y] :=   chr   ( GetOrd(direction,
                               i, d, dp, pwd, dtype) );
       end;
    if (i+1) mod RowCount = 0 then begin y := 0; x := x + 5; end
                              else y := y + 1;
end; //for i := 0 to 255 do
frmSimRep.Show;
//except
//  on EExternal do application.MessageBox('Переполнение!', appname, mb_ok + mb_iconerror);
//else
//  application.MessageBox('Ошибка в функции НОД', appname, mb_ok + mb_iconerror);
//end;
end;


function GetOrd( direction: boolean; c,d,dp:integer;
                 pwd: pchar; dtype: byte ) : integer;
var r: integer;
begin
r := c;
if dtype = 2 then // Athens
 begin
  if c >= 15 then
   r := GetAthensOrd(direction,  15,  255, c, d, dp); //255-15+1 is prime number
  GetOrd := r;
  exit;
 end;
case c of // Cyclic
  1..6  : r := GetCyclicOrd(direction,   1,   6, c, 0,  2);
 15..64 : r := GetCyclicOrd(direction,  15,  64, c, d, dp);
 65..90 : r := GetCyclicOrd(direction,  65,  90, c, d, dp);
 91..96 : r := GetCyclicOrd(direction,  91,  96, c, 0,  2);
 97..122: r := GetCyclicOrd(direction,  97, 122, c, d, dp);
123..190: r := GetCyclicOrd(direction, 123, 190, c, d, dp);
192..223: r := GetCyclicOrd(direction, 192, 223, c, d, dp);
224..255: r := GetCyclicOrd(direction, 224, 255, c, d, dp);
end; //case
GetOrd := r;
end;

function GetCyclicOrd( direction: boolean; a,b,c,d,dp:integer ) : integer;
var r: integer;
begin
IF direction = true THEN
 if c <= b - dp then r := c + dp
                else r := a + c - b + dp - 1
                    ELSE
 if c >= a + dp then r := c - dp
                else r := b - a + c - dp + 1;
GetCyclicOrd := r;
end;

procedure TfrmSimRep.SG1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
case (ACol + 1) mod 5 of
 1:SB1.Panels[0].text := 'Код заменяемого символа';
 2:SB1.Panels[0].text := 'Заменяемый символ';
 3:SB1.Panels[0].text := 'Код заменяющего символа';
 4:SB1.Panels[0].text := 'Заменяющий символ';
 0:SB1.Panels[0].text := 'Столбец-разделитель';
end;
end;

procedure TfrmSimRep.FormActivate(Sender: TObject);
begin
SB1.panels[0].text := 'Выделите ячейку для получения подсказки';
end;

//Афинная система подстановок Цезаря, E[d,dp](c) = (d*c + dp) mod m
function GetAthensOrd( direction: boolean; a,b,c,d,dp:integer ) : integer;
const fmax = 200;
var
 r, m : integer;
 f : integer; //factor (multiplier)
begin
r := c;
if d = 0 then begin GetAthensOrd := c; exit; end;
m := b - a + 1; //  = 241
if m mod d = 0 then
 begin
  GetAthensOrd := ord('E');
  exit;
 end; //error
IF direction = true
 then c := c - a + 1
 else c := c - a;
IF direction = true
 THEN  r := ( d * c + dp ) mod m //d as "a", dp as "b"
 ELSE
  for f := 0 to fmax do
   if ( c + f * m - dp ) mod d = 0  // how do you like it!
    then
     begin
      r := ( c + f * m - dp ) div d - 1;
      break;
     end;
//if r = -1 then r := 240;
if r < 0 then r := r + m;
GetAthensOrd := a + r;
end;


function GCD( n1,n2 : integer ) : integer;//greatest common divisor
var q: integer;
begin
try
If n1 * n2 = 0 Then Exit;
repeat
  q := n1 Mod n2;
  n1 := n2;
  n2 := q;
until q = 0;
GCD := n1;
Exit;
except
 on EZeroDivide do
  application.MessageBox('Деление на ноль!',
                         appname, mb_ok + mb_iconerror);
 on EOverflow do
  application.MessageBox('Переполнение!',
                         appname, mb_ok + mb_iconerror);
 on EMathError do
  application.MessageBox('Математическая ошибка в '+
         'функции НОД!', appname, mb_ok + mb_iconerror);
else
 application.MessageBox('Ошибка в функции НОД',
                         appname, mb_ok + mb_iconerror);
end;
end;

procedure TfrmSimRep.SB1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if X < SB1.Panels[0].Width then exit;
If form1.FontDialog1.Execute
 then SG1.Font := form1.FontDialog1.font;

end;

//Caesar keyword
function GetCaesarKOrd( direction: boolean; pwd: pchar; a,
                        b,c,k:integer ) : integer;
begin
IF direction = true
 THEN
//  if
 ELSE
end;


function PCharToOrdArr( pc: pchar) : TIntArray;
//function PCharToOrdArr( pc: pchar) : array [0..MaxInt DIV sizeof(Integer)-1] of Integer;
var i, l : integer;
    A : TIntArray;
//    A:array [0..MaxInt DIV sizeof(Integer)-1] of Integer;
begin
A[1]:=1;
A[0]:=1;
l := length( pc );
for i := 0 to l-1 do
  A[i] := ord( pc[i] );
PCharToOrdArr := A;
end;

function GetCKpwd( pwd: pchar) : pchar; //Get Caesar Keyword pwd
var
 i,j: integer; strpc, s1: string;
 b1: pchar; CanAdd: boolean;
begin
strpc := ''; s1 := '';
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
  if CanAdd then s1 := s1 + strpc[i];
 end; // for i
b1:=pchar(s1);
GetCKpwd := b1;
end;

end.
