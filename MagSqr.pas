unit MagSqr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids;

type
  TfrmMagSqr = class(TForm)
    SG1: TStringGrid;
    SG2: TStringGrid;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMagSqr: TfrmMagSqr;

implementation

{$R *.DFM}

procedure TfrmMagSqr.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin hide; exit; end;
end;

end.
