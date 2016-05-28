{····················Модуль LR8unit для курсовой работы····················}
UNIT LR8unit;
Interface
uses  TPString, TPCrt, TPCmd, TPWindow, TPMenu, TPmouse, Crt;
type ST = array[1..7] of string[70];
    ST1 = string[8];
   TSTR = record
                NT : ST1;
               ART : string[8];
             PRICE : real;
                 Q : word;
          end;
     FL = file of TSTR;    { имя типа для типизированного файла }
   ST10 = string[10];
const C : ST = (
'                      3. Платежное требование                          ',
'╔══════════════╤═════════╤═══════════╤══════════════╤════════════════╗',
'║ Наименование │ Артикул │   Цена    │  Количество  │  Стоимость     ║',
'║ товара       │         │   в руб.  │      шт.     │    в руб.      ║',
'╠══════════════╪═════════╪═══════════╪══════════════╪════════════════╣',
'╟──────────────┼─────────┼───────────┼──────────────┼────────────────╢',
'╚══════════════╧═════════╧═══════════╧══════════════╧════════════════╝'  );
var  Z : TSTR;  { массив записей }
 FI,FR : text;  { файлы для исходных данных и для результатов }
     F : FL;    { типизированный файл }
     M : Menu;
    Ch : Char;
   Key : MenuKey; { (типа longint) }

procedure CHT;
procedure SOZ;
procedure DOP;
procedure KOR;
procedure UDTRC;
procedure SEARCH;
procedure SORT;
procedure InitMenu(var M : Menu);

Implementation
{------------------------Вывод шапки таблицы--------------------------------}
procedure SHAPKA;
var i : 1..5;
begin
for i := 1 to 5 do writeln ( FR, C[i] );
end;
{------------------------Вывод одной строки--------------------------------}
procedure P;
begin
with Z do writeln ( FR, '║ ', NT, '│':14-length(NT), ART, '│':2,
                    PRICE:8:2, '│':4, Q:8, '│':7, Q * PRICE:10:2, '║':7  );
end;
{------------Удаление пробелов в начале и конце строки---------------------}
function FILTER ( TSTR : ST1 ) : ST1;
var i, j, l : integer;
begin
l := length ( TSTR );
for i := 1 to l do    { перебор номеров символов слева направо }
 if TSTR[i] <> ' '    { поиск "непробела" слева                }
  then
   for j := l downto i do    { перебор номеров символов справа }
    if TSTR[j] <> ' ' then   { поиск "непробела" справа        }
                       begin
                        FILTER := copy ( TSTR, i, j-i+1 );
                        exit
                       end;
FILTER := '';
end;
{-----------------------Запись данных в файл-------------------------------}
procedure ZF( NF : ST10 );
var FID : text;  B: char;
begin
assign(FID, NF);    { связывание FID с физическим файлом NF }
reset(FID);         { открытие FID для чтения }
with Z do while not seekEoF(FID) do
           begin                      { ввод данных одной строки }
            readln( FID, NT, ART, PRICE, Q );
            NT := FILTER( NT );
            P;                  { вызов процедуры вывода в FR }
            write( F, Z );      { вызов процедуры вывода в F  }
           end;
writeln( FR, C[7] );   close( FID );
end;
{----------------Чтение записей из типизированного файла-------------------}
procedure CHT;
var N : integer; S : real; { кол-во записей в файле и суммарная стоимость }
begin
writeln( FR, '  ЧТЕНИЕ ФАЙЛА' );  reset( F );
N := 0;   S := 0;   SHAPKA;
repeat  read ( F, Z );  P; S := S + Z.PRICE * Z.Q;  N := N + 1;
until   EoF ( F );
close( F );
writeln( FR, C[7] );
writeln( FR, ' S =', S:8:2, '   N = ', N );
end;
{--------------------Создание типизированного файла------------------------}
procedure SOZ;
var i : integer;
begin
writeln( FR, '  СОЗДАНИЕ ТИПИЗИРОВАННОГО ФАЙЛА' );
rewrite( F );          { открытие F для создания файла }
for i := 1 to 5 do writeln( FR, C[i] );
ZF ( 'LR8SOZ.DAT' );   { вызов ZF для создания файла   }
close( F );
{write( FR, #10#13, ' После создания файла:' );   CHT;}
end;
{-------------------Доподнение типизированного файла------------------------}
procedure DOP;
begin
writeln( FR, #10#13, '  ДОПОЛНЕНИЕ ТИПИЗИРОВАННОГО ФАЙЛА' );
reset( F );               { открытие F для дополнения файла }
seek( F, filesize(F) );   { установить указатель в конец F  }
ZF ( 'LR8DOP.DAT' );      { вызов ZF для дополнения файла   }
close( F );
write( FR, #10#13, ' После дополнения файла:' );   CHT;
end;
{----------------Модификация данных типизированного файла------------------}
procedure KOR;
label MK;
var TT : ST1;  newPRICE : real;  { требуемый товар и новая цена }
begin
writeln( FR, #10#13, '  МОДИФИКАЦИЯ ФАЙЛА' );
assign( FI, 'LR8KOR.DAT' );   reset( FI );   reset( F );
repeat
 readln( FI, TT, newPRICE );  {  ввод данных для модификации }
 TT := FILTER ( TT );
 writeln( FR, ' Товар и его новая цена:' );
 writeln( FR, '''',TT,'''', ', newPRICE = ', newPRICE:5:2 );
 if TT = '' then begin    { анализ наличия товара }
                  writeln( FR, ' НЕТ ТОВАРА ДЛЯ МОДИФИКАЦИИ' );  continue;
                 end;
 seek( F, 0 );   { НАЧАЛО поиска записи; указатель F - в начало файла }
 repeat          { начало поиска в файле F }
  read( F, Z );  { чтение очередной записи }
  if TT = Z.NT then begin
                     P;  Z.PRICE := newPRICE;  P;  { модификация записи }
                     seek( F, FILEPOS( F ) - 1 );
                     write( F, Z );                { возврат записи     }
                     GOTO MK;
                    end;
 until EoF( F );
 writeln( FR, ' Такого товара нет в наличии' );   MK:
until EoF( FI );
close( FI );   close( F );
writeln( FR, #10#13, ' После модификации файла:');   CHT;
end;
{--------------Удаление со сдвигом записей и с усечением файла--------------}
Procedure UDTRC;
label MK;
var TT : ST1;
 KL, i : integer;     { количество записей в файле }
begin
assign( FI, 'LR8UD.dat');   reset(FI);
writeln(  FR, #10#13, '------ УДАЛЕНИЕ ЗАПИСЕЙ С УСЕЧЕНИЕМ ФАЙЛА------ ');
reset(F);
KL := filesize(F);
repeat        { начало цикла ввода данных для поиска }
 readln( FI, TT );
 TT := FILTER( TT );
 writeln(  FR, ' Удаление записи, содержащей товар ', '''', TT, '''' );
 if TT = '' then begin writeln( FR, ' НЕТ ТОВАРА ДЛЯ УДАЛЕНИЯ');  continue  end;
 seek( F, 0 );
 repeat       { начало цикла поиска удаляемой записи }
  read( F, Z );
  if TT = Z.NT
   then begin
         writeln( FR, ' Удаляем запись:');   P;
         KL := KL - 1;
         if EOF(F) then seek( F, KL )
                   else      { сдвиг оставшихся записей к началу файла }
                    for i := filepos(F) to KL do
                         begin
                          seek( F, i );      read( F, Z );
                          seek( F, i - 1 );  write( F, Z );
                         end;
         GOTO MK;
        end;
 until EOF(F);
 writeln( FR, ' ТОВАР ОШИБОЧЕН');
 MK:
until EOF(FI);
seek( F, KL );  truncate(F);   { усечение файла F }
close(F);  close(FI);
write( FR, ' ПОСЛЕ УДАЛЕНИЯ С УСЕЧЕНИЕМ ФАЙЛА: ');   CHT;
end;
{--------Поиск  в типизированном файле данных по наименованию товара--------}
procedure SEARCH;
var TT : ST1;       { требуемый товар }
label MK;
begin
writeln ( FR, #10#13, ' ----- ПОИСК СВЕДЕНИЙ ПО НАИМЕНОВАНИЮ ТОВАРА-----' );
assign ( FI, 'LR8POI.DAT' );  reset ( FI );  reset( F );
repeat
 readln ( FI, TT );      { ввод наименования требуемого товара }
 TT := FILTER ( TT );
 writeln ( FR, ' Найти товар: ', '''',TT,'''' );
 if TT = '' then begin
                  writeln ( FR, ' Нет товара для поиска' );
                  continue;
                 end;
 seek( F, 0 );
 repeat
  read( F, Z );
   if TT = Z.NT then begin P; GOTO MK; end;  { запись найдена }
 until EoF ( F );
 writeln ( FR, ' Такого товара нет в наличии' ); MK:
until EoF ( FI );
close ( FI );  close( F );
writeln ( FR, ' Поиск закончен' );
end;
{--------------Сортировка в алфавитном порядке методом Шелла--------------}
procedure SORT;
const    n = 10;
type   TA = array [1..n] of tstr;
var  A : ta;  k, M, nn, D, i,j : integer;   B : tstr;
label H;
begin
assign ( f, 'lr8.typ');  reset ( f );
seek( f, 0 );     nn := filesize( f );
for i := 1 to nn do  begin  read ( f, z );   a[i] := z;    end;
D := 1;
while D < nn div 2 do D := D * 2;
H:
for k := 1 to D do     { перебор номеров групп }
{ Начало сортировки k-группы методом пузырькового включения }
 begin
  i := k + D;
  while i <= nn do { перебор номеров упорядочиваемых элементов }
   begin
    B := A[i];  M := i; { запоминание упорядочиваемого элемента }
    j := i - D;
    while j >= k do  { поиск места упорядоченного элемента среди упорядоченных }
     begin
      if A[j].NT <= B.NT then break; { найдено место для упорядочиваемого элемента }
      A[M] := A[j];  M := j;   { сдвиг больших элементов вправо }
      j := j - D;
     end;
    A[M] := B; { установка элемента на требуемое место }
    i := i + D;
   end;
 end;
if D > 1 then begin D := D div 2;  GOTO H;  end;
rewrite ( f );
for i := 1 to nn do write ( f, a[i] );
close ( f );
writeln ( FR, #10#13, '  СОРТИРОВКА ЗАПИСЕЙ МЕТОДОМ ШЕЛЛА' );
CHT;
end;

procedure InitMenu(var M : Menu);
const
  Color1 : MenuColorArray = ($0E, $2E, $03, $1E, $0B, $0E, $19, $78);
  Frame1 : FrameArray = '╔╚╗╝═║';

begin
  M := NewMenu([], nil);                        { инициализация нового меню }

  SubMenu(1,2,1,Horizontal,Frame1,Color1,'');   { начало меню (главного)    }
    MenuWidth(75);                              { ширина меню в символах    }
    MenuItem('ЗАПИСЬ',5,1,1,'запись');
    SubMenu(6,4,1,Vertical,Frame1,Color1,'');   { начало подменю            }
      MenuItem('СОЗДАНИЕ',1,1,5,'создание');
      MenuItem('ДОПОЛНЕНИЕ',2,1,6,'дополнение');
      PopSublevel;                             { окончание текущего подменю }
    MenuItem('ЧТЕНИЕ',23,1,2,'чтение');
    MenuItem('ОБРАБОТКА',43,1,3,'обработка');
    SubMenu(44,4,1,Vertical,Frame1,Color1,'');
      MenuItem('МОДИФИКАЦИЯ',1,1,7,'модификация');
      MenuItem('ПОИСК',2,1,8,'поиск');
      MenuItem('УДАЛЕНИЕ',3,1,9,'удаление');
      MenuItem('СОРТИРОВКА',4,1,10,'сортировка методом Шелла');
      PopSublevel;
    MenuItem('ВЫХОД',65,1,4,'выход');
    PopSublevel;

  ResetMenu(M);                 { установка выбора на первую тему }
end;
end.




