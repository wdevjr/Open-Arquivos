unit UAutoPreench;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB;

type

  { TfrmGrid }

  TfrmGrid = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrid: TfrmGrid;

implementation

{$R *.lfm}

procedure TfrmGrid.FormShow(Sender: TObject);
var
  p1: TPoint;
begin
  p1.X := TForm(Owner).ActiveControl.Left;
  p1.Y := (TForm(Owner).ActiveControl.Top + TForm(Owner).ActiveControl.Height);
  p1 := TControl(TForm(Owner).ActiveControl.Parent).ClientToScreen(p1);
  if (p1.Y - 150) > Screen.Height then
    p1.Y := p1.Y - 150 - TForm(Owner).ActiveControl.Height;
  setBounds(p1.X, p1.Y, 350, 150);
end;

procedure TfrmGrid.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmGrid.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
    ModalResult := mrOk;
  end
  else if Key = #27 then
  begin
    ModalResult := mrCancel;
  end;
end;

end.
