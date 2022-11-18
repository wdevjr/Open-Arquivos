unit UnGridPesquiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB;

type

  { TFrmGridAba }

  TFrmGridAba = class(TForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGridAba: TFrmGridAba;

implementation

uses UDMII;

{$R *.lfm}

procedure TFrmGridAba.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmGridAba.DBGrid1KeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    ModalResult := mrOk;
  end;
end;

procedure TFrmGridAba.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
    ModalResult := mrOk;
  end
  else if Key = #27 then
  begin
    ModalResult := mrOk;
    //  ModalResult := mrCancel;
  end;
end;

procedure TFrmGridAba.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  Proc: TCloseAction;
begin
  Release;
  FrmGridAba := nil;
  //Action := caFree;
end;

procedure TFrmGridAba.FormShow(Sender: TObject);
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

end.
