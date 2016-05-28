UNIT main_add;
INTERFACE
{$R+}
USES SysUtils, Dialogs, main, StdCtrls,  Graphics, Forms, Menus,
     ShellAPI, Unit3, Windows;

    procedure SetCM (a: integer);
    procedure SelectionTools (Allow: boolean);
    function EDDT : string; //Encrypt/Decrypt Dialog Title

IMPLEMENTATION

procedure SetCM (a: integer);
var i: integer;
begin
with form1 do
begin
for i := 1 to 10 do
 begin
  TMenuItem(FindComponent('nn' + IntToStr(i))).checked := false;
  TMenuItem(FindComponent('pn' + IntToStr(i))).checked := false;
 end;
TMenuItem(FindComponent('nn' + IntToStr(a))).checked := True;
TMenuItem(FindComponent('pn' + IntToStr(a))).checked := True;
intCM := a;
statusbar1.Panels[0].text := 'Метод: ' + CM[a];
end; //with form1 do
end;

procedure SelectionTools (Allow: boolean);
begin
if Allow then begin
   Form1.mnuCut.Enabled := True;
   Form1.mnuCopy.Enabled := True;
   Form1.mnuDelete.Enabled := True;
   Form1.ToolButton5.Enabled := True;
   Form1.ToolButton6.Enabled := True;
 end
 else begin
   Form1.mnuCut.Enabled := False;
   Form1.mnuCopy.Enabled := False;
   Form1.mnuDelete.Enabled := False;
   Form1.ToolButton5.Enabled := False;
   Form1.ToolButton6.Enabled := False;
 end;
end;

function EDDT : string; //Encrypt/Decrypt Dialog Title
begin
if IsEncrypting = true then EDDT := form1.mnuEncrypt.Caption
                       else EDDT := form1.mnuDecrypt.Caption;
end;

END.
