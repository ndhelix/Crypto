{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Menus, StdCtrls, ComCtrls, ExtCtrls, Buttons, ToolWin, ImgList, ShellApi;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuNew: TMenuItem;
    mnuOpen: TMenuItem;
    mnuSave: TMenuItem;
    mnuSaveAs: TMenuItem;
    N6: TMenuItem;
    mnuExit: TMenuItem;
    N11: TMenuItem;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    N2: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    mnuFont: TMenuItem;
    mnuLeftBackColor: TMenuItem;
    Memo1: TMemo;
    Memo2: TMemo;
    mnuMethod: TMenuItem;
    mnuTables: TMenuItem;
    mnuSimpleReplace: TMenuItem;
    NN1: TMenuItem;
    NN2: TMenuItem;
    NN3: TMenuItem;
    N4: TMenuItem;
    mnuEncrypt: TMenuItem;
    mnuDecrypt: TMenuItem;
    NN4: TMenuItem;
    NN5: TMenuItem;
    NN6: TMenuItem;
    NN7: TMenuItem;
    NN8: TMenuItem;
    mnuRightBackColor: TMenuItem;
    mnuSwapPanels: TMenuItem;
    N3: TMenuItem;
    mnuSymbStat: TMenuItem;
    NN9: TMenuItem;
    NN10: TMenuItem;
    N5: TMenuItem;
    mnuUndo: TMenuItem;
    N7: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    mnuDelete: TMenuItem;
    N8: TMenuItem;
    mnuSelectAll: TMenuItem;
    mnuWordWrap: TMenuItem;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    PopupMenu1: TPopupMenu;
    procedure mnuSaveClick(Sender: TObject);
    procedure mnuSaveAsClick(Sender: TObject);
    procedure mnuNewClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuOpenClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo2Enter(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure mnuEncryptClick(Sender: TObject);
    procedure mnuDecryptClick(Sender: TObject);
    procedure NN1Click(Sender: TObject);
    procedure NN2Click(Sender: TObject);
    procedure NN3Click(Sender: TObject);
    procedure NN4Click(Sender: TObject);
    procedure NN5Click(Sender: TObject);
    procedure mnuFontClick(Sender: TObject);
    procedure mnuLeftBackColorClick(Sender: TObject);
    procedure mnuRightBackColorClick(Sender: TObject);
    procedure NN6Click(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
//    procedure FormPaint(Sender: TObject);
    procedure mnuSwapPanelsClick(Sender: TObject);
    procedure NN7Click(Sender: TObject);
    procedure mnuSymbStatClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NN8Click(Sender: TObject);
    procedure NN9Click(Sender: TObject);
    procedure NN10Click(Sender: TObject);
    procedure mnuUndoClick(Sender: TObject);
    procedure mnuCutClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure mnuPasteClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuWordWrapClick(Sender: TObject);
    procedure PN1Click(Sender: TObject);
    procedure PN2Click(Sender: TObject);
    procedure PN3Click(Sender: TObject);
    procedure PN4Click(Sender: TObject);
    procedure PN5Click(Sender: TObject);
    procedure PN6Click(Sender: TObject);
    procedure PN7Click(Sender: TObject);
    procedure PN8Click(Sender: TObject);
    procedure PN9Click(Sender: TObject);
    procedure PN10Click(Sender: TObject);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Memo1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuHelpClick(Sender: TObject);
  private
    { Private declarations }
    InterResizing: Boolean; //means that the sizes of memos are in transition respectively
  public
    { Public declarations }
  end;

const
    MaxRow = 10000; //the maximum possible number of rows
    AppName = 'Crypto'; //ApplicationName
    tmpfile1 = 'crypto1.tmp'; // Application temporary file
    tmpfile2 = 'crypto2.tmp'; // Application temporary file
    par_s: char = chr(28);//chr(182); //encrypted paragraph symbol
    eol_s: char = chr(22);//chr(175); //encrypted EOL symbol
    es_s: char = chr(18); //encrypted "empty string" symbol
 CM : array[1..10] of string =
 ( 'Шифрующая таблица без ключевого слова',     //1
   'Шифрующая таблица с ключевым словом',       //2
   'Шифрующая таблица с перестановкой',         //3
   'Метод магического квадрата',                //4
   'Простая замена с помощью смещения',         //5
   'Аффинная система подстановок',               //6
   'Система Цезаря с ключевым словом',          //7
   'Таблица Трисемуса',                          //8
   'Шифр многоалфавитной замены Вижинера',       //9
   'DES'                                  //10
 );


 var
  Form1 : TForm1;
  CFact : boolean; //change fact
  CFile : TextFile; //current file
  FName : string; //current file
  NoFile: boolean; //no current file
  IErr  : boolean; //input error
  n     : integer;
  AMN   : integer; //active Memo number
  intCM : integer; //current crypto method
  ColQty: integer; //crypto table col qty
  RowQty: integer; //crypto table row qty
  l     : integer; //the length of the text in characters to be encrypted
  pwd   : pchar;//string; //password
  l_pwd : integer; // length(pwd)
  AppCanClose : boolean;
  min_l_pwd   : integer; // min length(pwd)
  max_l_pwd   : integer; // max length(pwd)
  MinTextSize : integer;    //min lenght of the text to be encrypted
  MaxTextSize : integer;
  IsEncrypting: boolean; //whether text is to be encrypted or decrypted
  maxdp       : byte; //maximum displacement
  CBFile1, CBFile2 : TextFile; //"clipboard" files
  ProcessingLevel  : integer;
  IsMemosBackgroundColorChanged: boolean;
  HelpDir: string; //path to help file
Implementation

Uses  unit2, Unit3, Unit32, Unit33, Unit5, main_add, Stat;

{$R *.DFM}



procedure TForm1.mnuSaveClick(Sender: TObject);
begin
form1.SaveDialog1.title := '';
if ierr then exit;
ForceCurrentDirectory := True;
savedialog1.InitialDir := 'files';
if nofile = true
 then
  If form1.SaveDialog1.Execute
   then DefaultSaving
   else exit;
//Rewrite(CFile); //if nofile = false
MemoSaving( AMN );
//CloseFile(CFile);
cfact := false;
end;

procedure TForm1.mnuSaveAsClick(Sender: TObject);
begin
form1.SaveDialog1.title := '';
if ierr then exit;
ForceCurrentDirectory := True;
savedialog1.InitialDir := 'files';
If form1.SaveDialog1.Execute
   then DefaultSaving;

end;

procedure TForm1.mnuNewClick(Sender: TObject);
var id : integer;
label L;
begin
if (cfact=false){ or (nofile=true) }then goto L;
id := application.MessageBox('Файл был изменен. Сохранить?', appname, mb_yesnocancel+mb_iconquestion);
if nofile and (id = idYes)
 then
  begin
    AMN := 1; //to save what was in the 1-st memo
    mnusaveasclick(sender);
    if ierr then exit;
    goto L;
  end;
case id of
 6: begin //idYes
     Rewrite(CFile);
     MemoSaving( AMN );
     if ierr then exit;
     CloseFile(CFile);
     goto L;
    end;
 7: goto L; //idNo
 2: exit; //idCancel
end;
L:
memo1.Clear;
end;

procedure TForm1.mnuExitClick(Sender: TObject);
var id: integer;
begin
if (cfact=false) or (memo1.Modified=false)
 then application.terminate;
id := application.MessageBox('Файл был изменен. Сохранить?',
                      appname, mb_yesnocancel+mb_iconquestion);
//if ierr then exit;
if nofile and (id = idYes)
 then
  begin
    AMN := 1; //to save what was in the 1-st memo
    mnusaveasclick(sender);
    if ierr then exit;
    application.terminate;
  end;
case id of
 6: begin //idYes
//     Rewrite(CFile);
     if (cfact=true) and (memo1.Modified=true) then MemoSaving(1);
//     CloseFile(CFile);
     application.terminate;
    end;
 7: application.terminate; //idNo
end;
AppCanClose := False;
end;

procedure TForm1.mnuOpenClick(Sender: TObject);
var
 id: integer;
 f: file of Byte; //cause FileSize can't be used on a text file
label ll;
begin
form1.openDialog1.title := '';
if (cfact=false) {or (nofile=true)} then goto ll;
id := application.MessageBox('Файл был изменен. Сохранить?',
                      appname, mb_yesnocancel+mb_iconquestion);
if nofile and (id = idYes)
 then
  begin
    mnusaveasclick(sender);
    if ierr then exit;
    goto ll;
  end;
case id of
 6: begin //idYes
     Rewrite(CFile);
//     memo1.lines.LoadFromFile (
     if ierr then exit;
     CloseFile(CFile);
     goto ll;
    end;
 7: goto ll; //idNo
 2: exit; //idCancel
end;
ll:

ForceCurrentDirectory := True;
opendialog1.InitialDir := 'files';
//opendialog1.initialdir := 'tables';
If OpenDialog1.Execute then
 begin
  Fname := OpenDialog1.FileName;
  AssignFile(f, OpenDialog1.FileName);
  Reset(f);
  if FileSize(f) > 57686  then
   begin
    MessageDlg('Данный файл размером ' + inttostr(FileSize(f))
               + ' байт не может быть открыт, так как окно '+
               'редактирования TMemo не поддерживает файлы '+
               'размером более 57686 байт', mtWarning, [mbOk], 0);
    CloseFile(f);
    exit;
   end;
  CloseFile(f);
  AssignFile( cFile, FName );
  memo1.lines.LoadFromFile (FName);
 end;
//    read(cFile, b);
//closefile(cfile);
nofile := false;
Memo1Change(Sender);
cfact := false;
form1.Caption := appname + ' - ' + fname;
end;




procedure TForm1.mnuAboutClick(Sender: TObject);
begin
aboutbox.show;
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//exit;
DeleteFile(tmpfile1);
DeleteFile(tmpfile2);
mnuExitClick(Sender);
if appcanclose = false then canclose := false;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
memo1.Width := (form1.width-10) div 2;
memo2.Width := memo1.Width;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
form1.Caption := appname;
AMN := 1;       //active Memo number
nofile := true;
SetCM(1);       //initial crypto method
MinTextSize := 4;    //min lenght of the text to be encrypted
MaxTextSize := 2000;
maxdp := 15;
min_l_pwd := 2;
max_l_pwd := 255;
ProcessingLevel := 1;
l := length( Memo1.Text );
cfact := False;
IsMemosBackgroundColorChanged := False;
HelpDir := GetCurrentDir;
end;

procedure TForm1.Memo1Enter(Sender: TObject);
begin
SetActiveMemo (1);
memo1change(sender);
cfact := false;
end;

procedure TForm1.Memo2Enter(Sender: TObject);
begin
SetActiveMemo (2);
memo2change(sender);
cfact := false;
end;


procedure TForm1.Memo1Change(Sender: TObject);
begin
l := length( form1.memo1.Text );
cfact := true;
//statusbar1.Panels[1].text := 'Количество символов: ' + inttostr( length( form1.memo1.Text ) );
statusbar1.Panels[1].text := 'Символ ' + inttostr(memo1.SelStart)
  + ' из ' + inttostr(length( form1.memo1.Text ));
end;

procedure TForm1.mnuEncryptClick(Sender: TObject);
begin
IsEncrypting := true;
Encrypt( intCM, IsEncrypting );
end;

procedure TForm1.mnuDecryptClick(Sender: TObject);
begin
IsEncrypting := false;
Encrypt( intCM, IsEncrypting );
end;

procedure TForm1.NN1Click(Sender: TObject);
begin
SetCM(1);
end;

procedure TForm1.NN2Click(Sender: TObject);
begin
SetCM(2);
end;

procedure TForm1.NN3Click(Sender: TObject);
begin
SetCM(3);
end;


procedure TForm1.NN4Click(Sender: TObject);
begin
SetCM(4);
end;

procedure TForm1.NN5Click(Sender: TObject);
begin
SetCM(5);
end;

procedure TForm1.mnuFontClick(Sender: TObject);
begin
If FontDialog1.Execute
 then begin Memo1.Font := FontDialog1.font; Memo2.Font := FontDialog1.font; end;
end;

procedure TForm1.mnuLeftBackColorClick(Sender: TObject);
begin
If ColorDialog1.Execute
 then begin
   Memo1.Color := ColorDialog1.Color;
   IsMemosBackgroundColorChanged := True;
  end;
end;

procedure TForm1.mnuRightBackColorClick(Sender: TObject);
begin
If ColorDialog1.Execute
 then begin
   Memo2.Color := ColorDialog1.Color;
   IsMemosBackgroundColorChanged := True;
  end;
end;

procedure TForm1.NN6Click(Sender: TObject);
begin
SetCM(6);
end;

procedure TForm1.Memo2Change(Sender: TObject);
begin
// :) cfact := true;
statusbar1.Panels[1].text := 'Символ ' + inttostr(memo2.SelStart)
  + ' из ' + inttostr(length( form1.memo2.Text ));
end;

//procedure TForm1.FormPaint(Sender: TObject);
//begin
//Memo2Change(Sender);
//Memo1Change(Sender);
//cfact := false;
//end;

procedure TForm1.mnuSwapPanelsClick(Sender: TObject);
begin
memo1.lines.SaveToFile ( tmpfile1 );
memo2.lines.SaveToFile ( tmpfile2 );
memo1.lines.LoadFromFile ( tmpfile2 );
memo2.lines.LoadFromFile ( tmpfile1 );
Memo2Change(Sender);
Memo1Change(Sender);
cfact := false;
end;

procedure TForm1.NN7Click(Sender: TObject);
begin
SetCM(7);
end;

procedure TForm1.mnuSymbStatClick(Sender: TObject);
begin
ShowStatistics;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if ( X > memo1.Width - 50 ) and ( X < memo1.Width + 50 )
 then Cursor := crSizeWE;
if (InterResizing=true) and (X > 50) and (X < Form1.Width - 50 )then
 begin Memo1.Width := X;
       Memo2.Width := form1.width - 10 - Memo1.Width;
 end;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ( X > memo1.Width - 30 ) and ( X < memo1.Width + 30 )
 then  InterResizing := true;

end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if InterResizing = true then InterResizing := False;
end;

procedure TForm1.NN8Click(Sender: TObject);
begin
SetCM(8);
end;

procedure TForm1.NN9Click(Sender: TObject);
begin
SetCM(9);
end;

procedure TForm1.NN10Click(Sender: TObject);
begin
SetCM(10);
end;

procedure TForm1.mnuUndoClick(Sender: TObject);
begin
if AMN = 1 then form1.Memo1.Undo;
if AMN = 2 then form1.Memo2.Undo;
end;

procedure TForm1.mnuCutClick(Sender: TObject);
begin
if AMN = 1 then form1.Memo1.CutToClipboard;
if AMN = 2 then form1.Memo2.CutToClipboard;
end;

procedure TForm1.mnuCopyClick(Sender: TObject);
begin
if AMN = 1 then form1.Memo1.CopyToClipboard;
if AMN = 2 then form1.Memo2.CopyToClipboard;
end;

procedure TForm1.mnuPasteClick(Sender: TObject);
begin
if AMN = 1 then form1.Memo1.PasteFromClipboard;
if AMN = 2 then form1.Memo2.PasteFromClipboard;
end;


procedure TForm1.mnuDeleteClick(Sender: TObject);
begin
if AMN = 1 then form1.Memo1.ClearSelection;
if AMN = 2 then form1.Memo2.ClearSelection;
end;

procedure TForm1.mnuSelectAllClick(Sender: TObject);
begin
if AMN = 1 then form1.Memo1.SelectAll;
if AMN = 2 then form1.Memo2.SelectAll;
end;

procedure TForm1.mnuWordWrapClick(Sender: TObject);
begin
if mnuWordWrap.Checked = True then begin
  form1.Memo1.WordWrap := False;
  form1.Memo2.WordWrap := False;
  mnuWordWrap.Checked := False
 end
 else begin
  form1.Memo1.WordWrap := True ;
  form1.Memo2.WordWrap := True ;
  mnuWordWrap.Checked := True;
 end;
end;


procedure TForm1.PN1Click(Sender: TObject);
begin
SetCM(1);
end;

procedure TForm1.PN2Click(Sender: TObject);
begin
SetCM(2);
end;

procedure TForm1.PN3Click(Sender: TObject);
begin
SetCM(3);
end;

procedure TForm1.PN4Click(Sender: TObject);
begin
SetCM(4);
end;

procedure TForm1.PN5Click(Sender: TObject);
begin
SetCM(5);
end;

procedure TForm1.PN6Click(Sender: TObject);
begin
SetCM(6);
end;

procedure TForm1.PN7Click(Sender: TObject);
begin
SetCM(7);
end;

procedure TForm1.PN8Click(Sender: TObject);
begin
SetCM(8);
end;

procedure TForm1.PN9Click(Sender: TObject);
begin
SetCM(9);
end;

procedure TForm1.PN10Click(Sender: TObject);
begin
SetCM(10);
end;

procedure TForm1.Memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
statusbar1.Panels[1].text := 'Символ ' + inttostr(memo1.SelStart)
  + ' из ' + inttostr(length( form1.memo1.Text ));
if length( memo1.SelText ) = 0
  then SelectionTools( False )
  else SelectionTools( True );
end;

procedure TForm1.Memo2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
statusbar1.Panels[1].text := 'Символ ' + inttostr(memo2.SelStart)
  + ' из ' + inttostr(length( form1.memo2.Text ));
if length( memo2.SelText ) = 0
  then SelectionTools( False )
  else SelectionTools( True );
end;

procedure TForm1.Memo2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
statusbar1.Panels[1].text := 'Символ ' + inttostr(memo2.SelStart)
  + ' из ' + inttostr(length( form1.memo2.Text ));
if length( memo2.SelText ) = 0
  then SelectionTools( False )
  else SelectionTools( True );
end;

procedure TForm1.Memo1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
statusbar1.Panels[1].text := 'Символ ' + inttostr(memo1.SelStart)
  + ' из ' + inttostr(length( form1.memo1.Text ));
if length( memo1.SelText ) = 0
  then SelectionTools( False )
  else SelectionTools( True );
end;

procedure TForm1.mnuHelpClick(Sender: TObject);
begin
if FileExists(HelpDir+'\Crypto.chm') then
  ShellExecute(handle,'open',pchar(HelpDir+'\crypto.chm'),0,0,SW_SHOWNORMAL)
 else
  application.MessageBox(pchar('Файл справки "Crypto.chm" не найден!'), appname, mb_ok + mb_iconerror);
end;

end.
