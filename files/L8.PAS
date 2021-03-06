{������������������������� LR8unit ��� ���ᮢ�� ࠡ�����������������������}
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
     FL = file of TSTR;    { ��� ⨯� ��� ⨯���஢������ 䠩�� }
   ST10 = string[10];
const C : ST = (
'                      3. ���⥦��� �ॡ������                          ',
'��������������������������������������������������������������������ͻ',
'� ������������ � ��⨪� �   ����    �  ������⢮  �  �⮨�����     �',
'� ⮢��       �         �   � ��.  �      ��.     �    � ��.      �',
'��������������������������������������������������������������������͹',
'��������������������������������������������������������������������Ķ',
'��������������������������������������������������������������������ͼ'  );
var  Z : TSTR;  { ���ᨢ ����ᥩ }
 FI,FR : text;  { 䠩�� ��� ��室��� ������ � ��� १���⮢ }
     F : FL;    { ⨯���஢���� 䠩� }
     M : Menu;
    Ch : Char;
   Key : MenuKey; { (⨯� longint) }

procedure CHT;
procedure SOZ;
procedure DOP;
procedure KOR;
procedure UDTRC;
procedure SEARCH;
procedure SORT;
procedure InitMenu(var M : Menu);

Implementation
{------------------------�뢮� 蠯�� ⠡����--------------------------------}
procedure SHAPKA;
var i : 1..5;
begin
for i := 1 to 5 do writeln ( FR, C[i] );
end;
{------------------------�뢮� ����� ��ப�--------------------------------}
procedure P;
begin
with Z do writeln ( FR, '� ', NT, '�':14-length(NT), ART, '�':2,
                    PRICE:8:2, '�':4, Q:8, '�':7, Q * PRICE:10:2, '�':7  );
end;
{------------�������� �஡���� � ��砫� � ���� ��ப�---------------------}
function FILTER ( TSTR : ST1 ) : ST1;
var i, j, l : integer;
begin
l := length ( TSTR );
for i := 1 to l do    { ��ॡ�� ����஢ ᨬ����� ᫥�� ���ࠢ� }
 if TSTR[i] <> ' '    { ���� "���஡���" ᫥��                }
  then
   for j := l downto i do    { ��ॡ�� ����஢ ᨬ����� �ࠢ� }
    if TSTR[j] <> ' ' then   { ���� "���஡���" �ࠢ�        }
                       begin
                        FILTER := copy ( TSTR, i, j-i+1 );
                        exit
                       end;
FILTER := '';
end;
{-----------------------������ ������ � 䠩�-------------------------------}
procedure ZF( NF : ST10 );
var FID : text;  B: char;
begin
assign(FID, NF);    { ��뢠��� FID � 䨧��᪨� 䠩��� NF }
reset(FID);         { ����⨥ FID ��� �⥭�� }
with Z do while not seekEoF(FID) do
           begin                      { ���� ������ ����� ��ப� }
            readln( FID, NT, ART, PRICE, Q );
            NT := FILTER( NT );
            P;                  { �맮� ��楤��� �뢮�� � FR }
            write( F, Z );      { �맮� ��楤��� �뢮�� � F  }
           end;
writeln( FR, C[7] );   close( FID );
end;
{----------------�⥭�� ����ᥩ �� ⨯���஢������ 䠩��-------------------}
procedure CHT;
var N : integer; S : real; { ���-�� ����ᥩ � 䠩�� � �㬬�ୠ� �⮨����� }
begin
writeln( FR, '  ������ �����' );  reset( F );
N := 0;   S := 0;   SHAPKA;
repeat  read ( F, Z );  P; S := S + Z.PRICE * Z.Q;  N := N + 1;
until   EoF ( F );
close( F );
writeln( FR, C[7] );
writeln( FR, ' S =', S:8:2, '   N = ', N );
end;
{--------------------�������� ⨯���஢������ 䠩��------------------------}
procedure SOZ;
var i : integer;
begin
writeln( FR, '  �������� ��������������� �����' );
rewrite( F );          { ����⨥ F ��� ᮧ����� 䠩�� }
for i := 1 to 5 do writeln( FR, C[i] );
ZF ( 'LR8SOZ.DAT' );   { �맮� ZF ��� ᮧ����� 䠩��   }
close( F );
{write( FR, #10#13, ' ��᫥ ᮧ����� 䠩��:' );   CHT;}
end;
{-------------------���������� ⨯���஢������ 䠩��------------------------}
procedure DOP;
begin
writeln( FR, #10#13, '  ���������� ��������������� �����' );
reset( F );               { ����⨥ F ��� ���������� 䠩�� }
seek( F, filesize(F) );   { ��⠭����� 㪠��⥫� � ����� F  }
ZF ( 'LR8DOP.DAT' );      { �맮� ZF ��� ���������� 䠩��   }
close( F );
write( FR, #10#13, ' ��᫥ ���������� 䠩��:' );   CHT;
end;
{----------------����䨪��� ������ ⨯���஢������ 䠩��------------------}
procedure KOR;
label MK;
var TT : ST1;  newPRICE : real;  { �ॡ㥬� ⮢�� � ����� 業� }
begin
writeln( FR, #10#13, '  ����������� �����' );
assign( FI, 'LR8KOR.DAT' );   reset( FI );   reset( F );
repeat
 readln( FI, TT, newPRICE );  {  ���� ������ ��� ����䨪�樨 }
 TT := FILTER ( TT );
 writeln( FR, ' ����� � ��� ����� 業�:' );
 writeln( FR, '''',TT,'''', ', newPRICE = ', newPRICE:5:2 );
 if TT = '' then begin    { ������ ������ ⮢�� }
                  writeln( FR, ' ��� ������ ��� �����������' );  continue;
                 end;
 seek( F, 0 );   { ������ ���᪠ �����; 㪠��⥫� F - � ��砫� 䠩�� }
 repeat          { ��砫� ���᪠ � 䠩�� F }
  read( F, Z );  { �⥭�� ��।��� ����� }
  if TT = Z.NT then begin
                     P;  Z.PRICE := newPRICE;  P;  { ����䨪��� ����� }
                     seek( F, FILEPOS( F ) - 1 );
                     write( F, Z );                { ������ �����     }
                     GOTO MK;
                    end;
 until EoF( F );
 writeln( FR, ' ������ ⮢�� ��� � ����稨' );   MK:
until EoF( FI );
close( FI );   close( F );
writeln( FR, #10#13, ' ��᫥ ����䨪�樨 䠩��:');   CHT;
end;
{--------------�������� � ᤢ���� ����ᥩ � � ��祭��� 䠩��--------------}
Procedure UDTRC;
label MK;
var TT : ST1;
 KL, i : integer;     { ������⢮ ����ᥩ � 䠩�� }
begin
assign( FI, 'LR8UD.dat');   reset(FI);
writeln(  FR, #10#13, '------ �������� ������� � ��������� �����------ ');
reset(F);
KL := filesize(F);
repeat        { ��砫� 横�� ����� ������ ��� ���᪠ }
 readln( FI, TT );
 TT := FILTER( TT );
 writeln(  FR, ' �������� �����, ᮤ�ঠ饩 ⮢�� ', '''', TT, '''' );
 if TT = '' then begin writeln( FR, ' ��� ������ ��� ��������');  continue  end;
 seek( F, 0 );
 repeat       { ��砫� 横�� ���᪠ 㤠�塞�� ����� }
  read( F, Z );
  if TT = Z.NT
   then begin
         writeln( FR, ' ����塞 ������:');   P;
         KL := KL - 1;
         if EOF(F) then seek( F, KL )
                   else      { ᤢ�� ��⠢���� ����ᥩ � ��砫� 䠩�� }
                    for i := filepos(F) to KL do
                         begin
                          seek( F, i );      read( F, Z );
                          seek( F, i - 1 );  write( F, Z );
                         end;
         GOTO MK;
        end;
 until EOF(F);
 writeln( FR, ' ����� ��������');
 MK:
until EOF(FI);
seek( F, KL );  truncate(F);   { ��祭�� 䠩�� F }
close(F);  close(FI);
write( FR, ' ����� �������� � ��������� �����: ');   CHT;
end;
{--------����  � ⨯���஢����� 䠩�� ������ �� ������������ ⮢��--------}
procedure SEARCH;
var TT : ST1;       { �ॡ㥬� ⮢�� }
label MK;
begin
writeln ( FR, #10#13, ' ----- ����� �������� �� ������������ ������-----' );
assign ( FI, 'LR8POI.DAT' );  reset ( FI );  reset( F );
repeat
 readln ( FI, TT );      { ���� ������������ �ॡ㥬��� ⮢�� }
 TT := FILTER ( TT );
 writeln ( FR, ' ���� ⮢��: ', '''',TT,'''' );
 if TT = '' then begin
                  writeln ( FR, ' ��� ⮢�� ��� ���᪠' );
                  continue;
                 end;
 seek( F, 0 );
 repeat
  read( F, Z );
   if TT = Z.NT then begin P; GOTO MK; end;  { ������ ������� }
 until EoF ( F );
 writeln ( FR, ' ������ ⮢�� ��� � ����稨' ); MK:
until EoF ( FI );
close ( FI );  close( F );
writeln ( FR, ' ���� �����祭' );
end;
{--------------����஢�� � ��䠢�⭮� ���浪� ��⮤�� �����--------------}
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
for k := 1 to D do     { ��ॡ�� ����஢ ��㯯 }
{ ��砫� ���஢�� k-��㯯� ��⮤�� ����쪮���� ����祭�� }
 begin
  i := k + D;
  while i <= nn do { ��ॡ�� ����஢ 㯮�冷稢����� ������⮢ }
   begin
    B := A[i];  M := i; { ����������� 㯮�冷稢������ ������� }
    j := i - D;
    while j >= k do  { ���� ���� 㯮�冷祭���� ������� �।� 㯮�冷祭��� }
     begin
      if A[j].NT <= B.NT then break; { ������� ���� ��� 㯮�冷稢������ ������� }
      A[M] := A[j];  M := j;   { ᤢ�� ������ ������⮢ ��ࠢ� }
      j := j - D;
     end;
    A[M] := B; { ��⠭���� ������� �� �ॡ㥬�� ���� }
    i := i + D;
   end;
 end;
if D > 1 then begin D := D div 2;  GOTO H;  end;
rewrite ( f );
for i := 1 to nn do write ( f, a[i] );
close ( f );
writeln ( FR, #10#13, '  ���������� ������� ������� �����' );
CHT;
end;

procedure InitMenu(var M : Menu);
const
  Color1 : MenuColorArray = ($0E, $2E, $03, $1E, $0B, $0E, $19, $78);
  Frame1 : FrameArray = '�Ȼ�ͺ';

begin
  M := NewMenu([], nil);                        { ���樠������ ������ ���� }

  SubMenu(1,2,1,Horizontal,Frame1,Color1,'');   { ��砫� ���� (��������)    }
    MenuWidth(75);                              { �ਭ� ���� � ᨬ�����    }
    MenuItem('������',5,1,1,'������');
    SubMenu(6,4,1,Vertical,Frame1,Color1,'');   { ��砫� �������            }
      MenuItem('��������',1,1,5,'ᮧ�����');
      MenuItem('����������',2,1,6,'����������');
      PopSublevel;                             { ����砭�� ⥪�饣� ������� }
    MenuItem('������',23,1,2,'�⥭��');
    MenuItem('���������',43,1,3,'��ࠡ�⪠');
    SubMenu(44,4,1,Vertical,Frame1,Color1,'');
      MenuItem('�����������',1,1,7,'����䨪���');
      MenuItem('�����',2,1,8,'����');
      MenuItem('��������',3,1,9,'㤠�����');
      MenuItem('����������',4,1,10,'���஢�� ��⮤�� �����');
      PopSublevel;
    MenuItem('�����',65,1,4,'��室');
    PopSublevel;

  ResetMenu(M);                 { ��⠭���� �롮� �� ����� ⥬� }
end;
end.




