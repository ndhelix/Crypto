program Project1;

{%ToDo 'Project1.todo'}

uses
  Forms,
  main in 'main.pas' {Form1},
  unit2 in 'unit2.pas',
  UnitDES in 'UnitDES.pas',
  Unit3 in 'Unit3.pas' {frmTable},
  Unit32 in 'Unit32.pas' {frmTable2},
  Unit33 in 'Unit33.pas' {frmTable3},
  Unit5 in 'Unit5.pas' {AboutBox},
  main_add in 'main_add.pas',
  MagSqr in 'MagSqr.pas' {frmMagSqr},
  Stat in 'Stat.pas' {frmStat},
  Sim_Rep in 'Sim_Rep.pas' {frmSimRep},
  Vizh in 'Vizh.pas' {frmVizh},
  Tris in 'Tris.pas' {frmTris};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Crypto';
  Application.HelpFile := '';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmTable, frmTable);
  Application.CreateForm(TfrmTable2, frmTable2);
  Application.CreateForm(TfrmTable3, frmTable3);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmMagSqr, frmMagSqr);
  Application.CreateForm(TfrmSimRep, frmSimRep);
  Application.CreateForm(TfrmTris, frmTris);
  Application.CreateForm(TfrmVizh, frmVizh);
  Application.CreateForm(TfrmStat, frmStat);
  Application.Run;
end.
