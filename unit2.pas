UNIT UNIT2;
//Contains procedures concerned with table crypto methods
//and the main Encrypt procedure
INTERFACE
{$R+}
USES SysUtils, Dialogs, main, StdCtrls,  Graphics, Forms,
 Unit3, Unit32, Unit33, Windows, MagSqr, Sim_Rep, Tris, UnitDES, Vizh;
type pwdOrderArray = array[1..255] of integer;

    procedure DefaultSaving;
    procedure SetActiveMemo (nn: integer);
    procedure MemoSaving (MemoN: integer);
    procedure Encrypt (method: integer; direction: boolean);
    procedure TableClearing;
     //Шифрующая таблица без ключевого слова
    procedure CTWKW(direction: boolean);
     //Шифрующая таблица с ключевым словом
    procedure KWCT(direction: boolean);
     //Шифрующая таблица с перестановкой
    procedure ICCT(direction: boolean);
     //magic square
    procedure Mag_Sqr(direction: boolean);
    function GetOrder ( X : PChar ) : pwdOrderArray;
    function GetPwdOrderNumbers
              ( X : pwdOrderArray; l: integer ) : pwdOrderArray;

IMPLEMENTATION

procedure DefaultSaving;
begin
with form1 do
    begin
     Fname := form1.SaveDialog1.FileName;
//     AssignFile( cfile, Fname );
//     Rewrite(CFile);
     MemoSaving(AMN);
//     CloseFile(CFile);
     nofile := false;
     cfact := false;
     exit;
    end;
end;


procedure SetActiveMemo (nn: integer);
begin
AMN := nn;
if IsMemosBackgroundColorChanged = True
 then exit;
if nn = 1 then
  begin
      form1.memo1.Color := clWindow;
      form1.memo2.Color := clInactiveBorder;
  end;
if nn = 2 then
  begin
      form1.memo2.Color := clWindow;
      form1.memo1.Color := clInactiveBorder;
  end;
end;

procedure MemoSaving (MemoN: integer);
begin
if memoN = 1 then form1.Memo1.Lines.SaveToFile (FName);
if memoN = 2 then form1.Memo2.Lines.SaveToFile (FName);
form1.Caption := appname + ' - ' + fname;
end;

procedure Encrypt (method: integer; direction: boolean {encrypt/decrypt});
begin
case method of
//Шифрующая таблица без ключевого слова
 1: MaxTextSize := 2000;
//Шифрующая таблица с ключевым словом
 2: MaxTextSize := 2000;
//Шифрующая таблица с перестановкой
 3: MaxTextSize := 2000;
//Метод магического квадрата
 4: MaxTextSize := 2000;
// Простая замена с помощью смещения
 5: MaxTextSize := 150000;
// Афинная система подстановок
 6: MaxTextSize := 150000;
// Система Цезаря с ключевым словом
 7: MaxTextSize := 150000;
// Таблица Трисимуса
 8: MaxTextSize := 150000;
// Шифр многоалфавитной замены Вижинера
 9: MaxTextSize := 150000;
// Метод DES
 10: MaxTextSize := 150000;

end;
//form1.memo1.SelectAll;
l :=  length( form1.memo1.Text ) ;
if intCM <> 10 then begin
 if l < MinTextSize
   then
     begin
      application.MessageBox('Слишком малое количество '+
                 'символов', appname, mb_ok + mb_iconerror);
      exit;
     end;
 if l > MaxTextSize
   then
     begin
      application.MessageBox('Слишком большое количество'+
                ' символов', appname, mb_ok + mb_iconerror);
      exit;
     end;
 end;
form1.memo1.SelLength := 0;
form1.memo2.Clear;
case method of
//Шифрующая таблица без ключевого слова
 1: CTWKW( direction );
//Шифрующая таблица с ключевым словом
 2: KWCT( direction );
//Шифрующая таблица с перестановкой
 3: ICCT( direction );
//Метод магического квадрата
 4: Mag_Sqr( direction );
// Простая замена с помощью смещения
 5: Displacement( direction, 1 );
// Афинная система подстановок
 6: Displacement( direction, 2 );
// Система Цезаря с ключевым словом
 7: Displacement( direction, 3 );
// Таблица Трисимуса
 8: TrisIt( direction );
// Шифр многоалфавитной замены Вижинера
 9: VizhIt( direction );
// Шифр многоалфавитной замены Вижинера
 10: DES( direction );

end;
end;



//Шифрующая таблица без ключевого слова (Crypto table without keyword)
procedure CTWKW(direction: boolean);
var
 i,j              : integer;
 x,y, w, pw, Code : integer;
 b, we            : string;
 ClickedOK        : boolean;
label L1;
begin
with form1 do
begin
TableClearing;
L1:
if direction then we := 'Зашифровать' else we := 'Расшифровать';
ClickedOK := InputQuery(we, 'Введите число от 1 до '+ inttostr(l), b);
if not ClickedOK then exit;
pwd := pchar(b);
val(b, pw, Code);
if ( Code <> 0 ) then
 begin
  MessageDlg('Ключ должен быть целым числом!', mtWarning, [mbOk], 0);
  goto L1;
 end;
if( pw < 1 ) or ( pw > l ) then
 begin
  MessageDlg('Число должно быть от 1 до '+
             inttostr(l)+ '!', mtWarning, [mbOk], 0);
  goto L1;
 end;

form1.memo1.SelectAll;
//ColQty := round(int(sqrt(l)))+1;
//ColQty := round(sqrt(l));
ColQty := pw;
if (l div ColQty) = l/ColQty
 then RowQty := l div ColQty
 else RowQty := l div ColQty + 1;
//оформление заголовка таблицы
for i := 1 to RowQty do
 frmTable.sg1.Cells[0,i] := inttostr(i);
for i := 1 to ColQty do
 frmTable.sg1.Cells[i,0] := inttostr(i);
IF direction = true THEN
BEGIN // encrypt
 x := 0; y := 0;
 for i := 1 to l do
  begin
    memo1.SelStart := i-1;
    memo1.SelLength := 1;
    x := i - (((i-1) div ColQty) * ColQty);
    y := (i-1) div ColQty + 1;
    b := copy(memo1.SelText,1,1);
    if b = #$D then b := par_s; //paragraph
    if b = #$A then b := eol_s; // EOL
    frmTable.SG1.Cells[ x , y ] := b;
  end;
 i := 0; j := 0;
 x := 0; y := 0;
 repeat
  i := i + 1;
  x := (i-1) div RowQty + 1;
  y := i - (((i-1) div RowQty) * RowQty);
  b := frmTable.SG1.Cells[ x , y ];
  if b = '' then continue;
//  if b <> #$D then
  memo2.text := memo2.text + b;
  j := j + 1;
 until j = l; //it should be put chars j times
END
ELSE // decrypt
BEGIN
x := 1; y := 1;
//the number of element of the string when matrix "changes" the size from N*N to N*N-1 x := 1; y := 1;
w := (l mod ColQty) * RowQty;
 for i := 1 to l do
  begin
    memo1.SelStart := i-1;
    memo1.SelLength := 1;
    b := memo1.SelText;
    frmTable.SG1.Cells[ x, y ] := b;
    if (i <= w) or ((l mod ColQty) = 0)
     //still square matrix
     then if i div RowQty = i / RowQty
            then begin x := x + 1; y := 1; end
            else y := y + 1
     //matrix is no longer square
     else if (i-w) div (RowQty-1) = (i-w) / (RowQty-1)
            then begin x := x + 1;  y := 1 end
            else y := y + 1;
  end;
 i := 1; j := 0; x := 1; y := 1;
//frmTable.Show;
//exit;
 repeat
//  x := (i-1) div RowQty + 1;
//  y := i - (((i-1) div RowQty) * RowQty);
  b := frmTable.SG1.Cells[ y , x ];
 if (i div ColQty) = i / ColQty
  then begin
         x := x + 1;
         y := 1
       end
  else y := y + 1;
//  if b = '' then continue;
//  := #$13;//chr(13);//#$D;
  if b = par_s then memo2.lines.Add('')
               else if b <> eol_s
                then memo2.text := memo2.text + b;
  j := j + 1;
  i := i + 1;
 until j = l; //it should be put chars j times
END; // IF direction = true
end; //with
frmTable.SG1.FixedCols := 1;
frmTable.SG1.FixedRows := 1;
frmTable.Show;
end;




//Шифрующая таблица с ключевым словом (Keyword crypto table)
procedure KWCT( direction: boolean );

var
 i,j : integer;
 x,y : integer;
 CA  : PChar; //Char Array (text to encrypt/decrypt)
 POA : pwdOrderArray; //the "weight" of each char in password accordingly
 PON : pwdOrderArray; //contains POA numbers, e.g., if POA=(2,4,3,1) then PON=(4,1,3,2)
 b,we: string;
 c   : char;
 ClickedOK: Boolean;
label L1;
begin
with form1 do
begin
TableClearing;
L1:
if direction
 then we := 'Зашифровать'
 else we := 'Расшифровать';
ClickedOK := InputQuery(we, 'Введите пароль', b);
pwd := pchar(b);
if not ClickedOK then exit;
l_pwd := length( pwd );
form1.memo1.SelectAll;
CA := PChar(form1.memo1.SelText);
IF direction = true THEN
BEGIN // encrypt
 if l_pwd > l then
  begin
   application.MessageBox('Количество символов в пароле не'+
                  ' может быть больше, чем в самом тексте!',
                  appname, mb_ok + mb_iconerror              );
   goto L1;
  end;
 if l_pwd < min_l_pwd then
  begin
   application.MessageBox(pchar('Количество символов в пар'+
          'оле не должно быть менее '+ inttostr(min_l_pwd)),
          appname, mb_ok + mb_iconerror);
   goto L1;
  end;
 ColQty := l_pwd;
 frmTable.SG1.FixedRows := 2;
 POA := GetOrder( pchar(string(pwd)) ); // "pchar(string(pwd))" is to avoid changing pwd
 PON := GetPwdOrderNumbers( POA, l_pwd );
 if l div ColQty = l / ColQty
  then RowQty := l div ColQty
  else RowQty := l div ColQty + 1;
 for i:= 2 to RowQty+1 do
  frmTable.sg1.Cells[0,i] := inttostr(i-1);
 for i:= 1 to ColQty do
  frmTable.sg1.Cells[i,0] := pwd[i-1];
 for i:= 1 to ColQty do
  frmTable.sg1.Cells[i,1] := INTTOSTR(POA[i]);
 for i := 1 to ColQty do
  for j := 1 to RowQty do
   begin
    if (i-1)*RowQty+j <= l
     then begin
            c := CA[(i-1)*RowQty+j-1];
            if c = #$D then c := par_s; //paragraph
            if c = #$A then c := eol_s; // EOL
          end
     else c := es_s;
    frmTable.SG1.Cells[ i , j+1 ] := c;
   end;
 i := 1; j := 0;
 x := PON[1]; y := 0;
 repeat
  if j mod ColQty = 0
   then begin
         y := y + 1;
         x := PON[1];
         i := 1;
        end
   else begin
         if i < l_pwd then i := i + 1;// else i := 1;
         x := PON[i];
        end;
  b := frmTable.SG1.Cells[ x , y+1 ];
  memo2.text := memo2.text + b;
  j := j + 1;
 until j = RowQty*ColQty; //it should be put chars j times
 frmTable.Show;
END
ELSE // decrypt
BEGIN
 if (l_pwd < min_l_pwd) or (l_pwd > l) or (l mod l_pwd <> 0)
  then
   begin
    application.MessageBox('Неверный пароль', appname, mb_ok + mb_iconerror);
    goto L1;
   end;
 ColQty := l_pwd;
 RowQty := l div ColQty;
 frmTable.SG1.FixedRows := 2;
 POA := GetOrder( pchar(string(pwd)) ); // "pchar(string(pwd))" is to avoid changing pwd
// PON := GetPwdOrderNumbers( POA, l_pwd );
 for i:= 2 to RowQty+1 do
  frmTable.sg1.Cells[0,i] := inttostr(i-1);
 for i:= 1 to ColQty do
  frmTable.sg1.Cells[i,0] := pwd[i-1];
 for i:= 1 to ColQty do
  frmTable.sg1.Cells[i,1] := INTTOSTR(POA[i]);
 for j := 1 to RowQty do
  for i := 1 to ColQty do
   frmTable.SG1.Cells[ i , j+1 ] := CA[(j-1)*ColQty+i-1];

 i := 0; j := 0;
 x := POA[1]; y := 1;
 repeat
  if j mod RowQty <> 0
   then y := y + 1
   else begin
         y := 1;
         if i < l_pwd then i := i + 1;// else i := 1;
         x := POA[i];
        end;
  b := frmTable.SG1.Cells[ x , y+1 ];
  if b = es_s then break;
  if b = par_s then memo2.lines.Add('')
               else  if b <> eol_s then memo2.text := memo2.text + b;
  j := j + 1;
 until (j = RowQty*ColQty); //it should be put chars j times
 frmTable.Show;
END; // IF direction = true
end; //with
end;


//interchanging crypto table
procedure ICCT(direction: boolean); //Шифрующая таблица с перестановкой
var
 i,j  : integer;
 x,y  : integer;
 b, we: string;
 c    : char;
 POA1 : pwdOrderArray; //the "weight" of each char in password accordingly, cols
 POA2 : pwdOrderArray; //the "weight" of each char in password accordingly, rows
 PON1 : pwdOrderArray; //contains POA1 numbers, e.g., if POA1=(2,4,3,1) then PON1=(4,1,3,2)
 PON2 : pwdOrderArray; //contains POA2 numbers, e.g., if POA2=(2,4,3,1) then PON2=(4,1,3,2)
 pwd1, pwd2: PChar; //parts of pwd, pwd = pwd1 + pwd2
 CA: array[1..9,1..9] of string[1]; //Char Array (text to encrypt/decrypt)
 ClickedOK: Boolean;

procedure ICCTTableHeadline;
var i: integer;
begin
 frmTable.SG1.FixedRows := 2;
 frmTable.SG1.FixedCols := 2;
 pwd1 := pchar( copy(pwd, 0, ColQty) );
 pwd2 := pchar( copy(pwd, ColQty+1, RowQty) );
 POA1 := GetOrder( pchar(string(pwd1)) ); // "pchar(string(pwd))" is to avoid changing pwd1
 POA2 := GetOrder( pchar(string(pwd2)) ); // "pchar(string(pwd))" is to avoid changing pwd2
 PON1 := GetPwdOrderNumbers( POA1, ColQty );
 PON2 := GetPwdOrderNumbers( POA2, RowQty );
 for i:= 2 to RowQty+1 do frmTable.sg1.Cells[0,i] := pwd2[i-2];
 for i:= 2 to RowQty+1 do frmTable.sg1.Cells[1,i] := INTTOSTR(POA2[i-1]);
 for i:= 2 to ColQty+1 do frmTable.sg1.Cells[i,0] := pwd1[i-2];
 for i:= 2 to ColQty+1 do frmTable.sg1.Cells[i,1] := INTTOSTR(POA1[i-1]);
end;

label L1;
begin // procedure ICCT
with form1 do
begin
if l > 81 then begin
   application.MessageBox('Для данного метода количество сим'+
    'волов должно быть не больше 81', appname, mb_ok + mb_iconerror);
   exit;       end;
TableClearing;
ColQty := round(sqrt(l));
if   ( sqrt(l) - round(int(sqrt(l))) >= 0.5 )
  or ( sqrt(l) - round(int(sqrt(l))) = 0 )
 then RowQty := ColQty      //matrix is N * N
 else RowQty := ColQty + 1; //matrix is N+1 * N
l_pwd := RowQty + ColQty;

IF direction = true THEN
BEGIN // encrypt
 L1:
 if direction then we := 'Зашифровать' else we := 'Расшифровать';
 ClickedOK := InputQuery(we, 'Введите пароль, ' +
                         inttostr(l_pwd) + ' символов', b);
 if not ClickedOK then exit;
 pwd := pchar(b);
 if length(pwd) <> l_pwd then
  begin
   application.MessageBox(pchar('Пароль должен состоять из '
     + inttostr(l_pwd) + ' символов'), appname, mb_ok + mb_iconerror);
   goto L1;
  end;
 ICCTTableHeadline;
 x := 0; y := 0;
 for i := 1 to RowQty*ColQty do
  begin
    memo1.SelStart := i-1;
    memo1.SelLength := 1;
    x := i - (((i-1) div ColQty) * ColQty);
    y := (i-1) div ColQty;
    if i > l then
     begin
      frmTable.SG1.Cells[ x+1 , y+2 ] := es_s;
      continue;
     end;
    b := copy(memo1.SelText,1,1);
    if b = #$D then b := par_s; //paragraph
    if b = #$A then b := eol_s; // EOL
    frmTable.SG1.Cells[ x+1 , y+2 ] := b;
  end;
 for i := 1 to ColQty do
  for j := 1 to RowQty do
   CA[i,j] := frmTable.SG1.Cells[ i+1 , j+1 ];
 for i := 1 to ColQty do
  frmTable2.SG1.Cells[ i , 0 ] := inttostr(i);
 for j := 1 to RowQty do
  frmTable2.SG1.Cells[ 0 , j ] := inttostr( POA2[j] );
 for i := 1 to ColQty do
  frmTable3.SG1.Cells[ i , 0 ] := inttostr(i);
 for j := 1 to RowQty do
  frmTable3.SG1.Cells[ 0 , j ] := inttostr(j);
 for i := 1 to ColQty do
  for j := 1 to RowQty do
   begin
    frmTable2.SG1.Cells[ i , j ] := CA[ PON1[i],j ];
    frmTable3.SG1.Cells[ i , j ] := CA[ PON1[i],PON2[j] ];
//    memo2.text := memo2.text + CA[ PON1[i],PON2[j] ];
   end;
 for j := 1 to RowQty do
  for i := 1 to ColQty do
   memo2.text := memo2.text + CA[ PON1[i],PON2[j] ];
 frmTable.Show;
 frmTable2.Show;
 frmTable3.Show;

END
ELSE // decrypt
BEGIN
 if l <> ColQty*RowQty then
  begin
   application.MessageBox('Файл поврежден!', appname, mb_ok + mb_iconerror);
   exit;
  end;
 if direction then we := 'Зашифровать' else we := 'Расшифровать';
 ClickedOK := InputQuery(we, 'Введите пароль', b);
 if not ClickedOK then exit;
 pwd := pchar(b);
 if length(pwd) <> l_pwd then
  begin
   application.MessageBox('Неверный пароль', appname, mb_ok + mb_iconerror);
   goto L1;
  end;
// frmTable.Show;
 ICCTTableHeadline;
 x := 0; y := 0;
 for i := 1 to RowQty*ColQty do
  begin
    memo1.SelStart := i-1;
    memo1.SelLength := 1;
    x := i - (((i-1) div ColQty) * ColQty);
    y := (i-1) div ColQty;
    if i > l then
     begin
      frmTable.SG1.Cells[ x+1 , y+2 ] := es_s;
      continue;
     end;
    b := copy(memo1.SelText,1,1);
    if b = #$D then b := par_s; //paragraph
    if b = #$A then b := eol_s; // EOL
    frmTable.SG1.Cells[ x+1 , y+2 ] := b;
  end;
 for i := 1 to ColQty do
  for j := 1 to RowQty do
   CA[i,j] := frmTable.SG1.Cells[ i+1 , j+1 ];
{ frmTable2.Show;
 frmTable3.Show;
 for i := 1 to ColQty do frmTable2.SG1.Cells[ i , 0 ] := inttostr(i);
 for j := 1 to RowQty do frmTable2.SG1.Cells[ 0 , j ] := inttostr( POA2[j] );
 for i := 1 to ColQty do frmTable3.SG1.Cells[ i , 0 ] := inttostr(i);
 for j := 1 to RowQty do frmTable3.SG1.Cells[ 0 , j ] := inttostr(j);
}
  for j := 1 to RowQty do
  for i := 1 to ColQty do
   begin
//    frmTable2.SG1.Cells[ i , j ] := CA[ PON1[i],j ];
//    frmTable3.SG1.Cells[ i , j ] := CA[ PON1[i],PON2[j] ];
    b := CA[ POA1[i],POA2[j] ];
    if b = es_s then continue;
    if b = par_s
     then memo2.lines.Add('')
     else if b <> eol_s then memo2.text := memo2.text + b;
   end;
END; // IF direction = true
end; //with
end;


procedure TableClearing;
var i,j: integer;
begin
for i := 0 to frmTable.sg1.ColCount do
 for j := 0 to frmTable.sg1.RowCount do
    frmTable.sg1.cells[j,i] := '';
end;

function GetOrder ( X : PChar ) : pwdOrderArray;
var
 l, i, j : integer;
 A       : pwdOrderArray;
begin
l := length(X);
//for i := 1 to l do A[i] := i;
for i := 1 to l do A[i] := 1;
for i := 0 to l-1 do
 for j := i+1 to l-1 do
  if ( X[i] > X[j] )
   then A[i+1] := A[i+1] + 1
   else A[j+1] := A[j+1] + 1;
GetOrder := A;
end;

function GetPwdOrderNumbers ( X : pwdOrderArray; l: integer ) : pwdOrderArray;
var
 i, j : integer;
 A    : pwdOrderArray;
begin
for i := 1 to l do
 begin
  j := X[i];
  A[X[i]] := i;
 end;
GetPwdOrderNumbers := A;
end;


procedure Mag_Sqr(direction: boolean); //magic square
//Универсальные методы составления магических квадратов произвольного четного
//порядка пока неизвестны. Однако, разработаны индивидуальные подходы для
//различных частных случаев, например для магических квадратов, порядок
//которых является экспонентой 2
//const MS4: array[1..4,1..4] of byte =  //magic square
//        ((16,5,9,4),(3,10,6,15),(2,11,7,14),(13,8,12,1));
type TMS = array[1..9,1..9] of byte;
type TRGC55 = array[1..5,1..5,1..5,1..5,1..5] of word;
const
 MS4: TMS =
        ((16, 5, 9, 4, 0, 0, 0, 0, 0),
         (3 ,10, 6,15, 0, 0, 0, 0, 0),
         (2 ,11, 7,14, 0, 0, 0, 0, 0),
         (13, 8,12, 1, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0) );

 MS5: TMS =
        ((21, 3,10,12,19, 0, 0, 0, 0),
         ( 2, 9,11,18,25, 0, 0, 0, 0),
         ( 8,15,17,24, 1, 0, 0, 0, 0),
         (14,16,23, 5, 7, 0, 0, 0, 0),
         (20,22, 4,	6,13, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0) );

 MS7: TMS =
        ((28,19,10, 1,48,39,30, 0, 0),
         (29,27,18,	9, 7,47,38, 0, 0),
         (37,35,26,17, 8,6 ,46, 0, 0),
         (45,36,34,25,16,14, 5, 0, 0),
         (4	,44,42,33,24,15,13, 0, 0),
         (12, 3,43,41,32,23,21, 0, 0),
         (20,11, 2,49,40,31,22, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0) );

 MS8: TMS =
        ((64, 2, 3,61,60, 6, 7,57, 0),
         ( 9,55,54,12,13,51,50,16, 0),
         (17,47,46,20,21,43,42,24, 0),
         (40,26,27,37,36,30,31,33, 0),
         (32,34,35,29,28,38,39,25, 0),
         (41,23,22,44,45,19,18,48, 0),
         (49,15,14,52,53,11,10,56, 0),
         ( 8,58,59,	5, 4,62,63,	1, 0),
         (0 , 0, 0, 0, 0, 0, 0, 0, 0) );

 MS9: TMS =
        ((63,	65,	76,	6 ,	17,	19,	30,	41,	52),
         (64,	75,	5 ,	16,	27,	29,	40,	51,	62),
         (74,	4 ,	15,	26,	28,	39,	50,	61,	72),
         ( 3,	14,	25,	36,	38,	49,	60,	71,	73),
         (13,	24,	35,	37,	48,	59,	70,	81,	2 ),
         (23,	34,	45,	47,	58,	69,	80,	1 ,	12),
         (33,	44,	46,	57,	68,	79,	9 ,	11,	22),
         (43,	54,	56,	67,	78,	8 ,	10,	21,	32),
         (53,	55,	66,	77,	7 ,	18,	20,	31,	42) );


var
 i,j  : integer;
 a, k : integer;
 b    : string;
 //contains MS coordinates in series from "1" to "81"
 PON  : array[1..2,1..81] of byte;
 MS   : TMS; // magic square

begin
case l of
 1..16 : begin k := 4; MS := MS4; end;
 17..25: begin k := 5; MS := MS5; end;
 26..49: begin k := 7; MS := MS7; end;
 50..64: begin k := 8; MS := MS8; end;
 65..81: begin k := 9; MS := MS9; end;
 else
  begin
   application.MessageBox('Для данного метода количество сим'+
     'волов должно быть не больше 81', appname, mb_ok + mb_iconerror);
   exit;
  end;
end;

for i := 1 to k do
 for j := 1 to k do
  begin
   PON[ 1 , MS[i,j] ] := i;
   PON[ 2 , MS[i,j] ] := j;
  end;
with form1 do
begin
for j := 0 to 9 do
 for i := 0 to 9 do
  frmmagsqr.SG1.cells[j,i] := '';
for j := 0 to 9 do
 for i := 0 to 9 do
  frmmagsqr.SG2.cells[j,i] := '';
IF direction = true THEN
BEGIN // encrypt
 a := 0;
 for i := 1 to k do
  for j := 1 to k do
   begin
    frmmagsqr.SG1.Cells[ i-1 , j-1 ] := inttostr( MS[ i , j ] );
    a := a + 1;
    memo1.SelStart := a-1;
    memo1.SelLength := 1;
    if a > l then
     begin
      frmmagsqr.SG2.Cells[ PON[1,a] - 1 , PON[2,a] - 1 ] := es_s;
      continue;
     end;
    b := copy(memo1.SelText,1,1);
    if b = #$D then b := par_s; //paragraph
    if b = #$A then b := eol_s; // EOL
    frmmagsqr.SG2.Cells[ PON[1,a] - 1 , PON[2,a] - 1 ] := b;
   end;
 for j := 1 to k do
  for i := 1 to k do
   memo2.text := memo2.text + frmmagsqr.SG2.Cells[ i-1 , j-1 ];
 frmmagsqr.Show;
END
ELSE // decrypt
BEGIN
 a := 0;
 for i := 1 to k do
  for j := 1 to k do
   begin
    frmmagsqr.SG1.Cells[ i-1 , j-1 ] := inttostr( MS[ i , j ] );
    a := a + 1;
    memo1.SelStart := a-1;
    memo1.SelLength := 1;
    b := copy(memo1.SelText,1,1);
    frmmagsqr.SG2.Cells[ j - 1 , i - 1 ] := b;
   end;
 a := 0;
 for j := 1 to k do
  for i := 1 to k do
   begin
    a := a + 1;
    b := frmmagsqr.SG2.Cells[ PON[1,a] - 1 , PON[2,a] - 1 ];
    if b = es_s then continue;
    if b = par_s
     then memo2.lines.Add('')
     else if b <> eol_s then memo2.text := memo2.text + b;
   end;
 frmmagsqr.Show;
END; // IF direction = true
end; //with
end;


END.
