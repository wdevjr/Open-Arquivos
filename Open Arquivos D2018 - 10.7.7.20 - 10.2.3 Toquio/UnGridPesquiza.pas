unit UnGridPesquiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Data.DB;

type
  TFrmGridAba = class(TForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
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

{$R *.dfm}

procedure TFrmGridAba.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmGridAba.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // if DMII.sds_BuscaGridAba.IsEmpty = False then
  // begin
  // if Odd(DMII.sds_BuscaGridAba.RecNo) then
  // begin
  // DBGrid1.Canvas.Brush.Color := $00CBEAEB;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end
  // else
  // begin
  // DBGrid1.Canvas.Brush.Color := $00FFF4F4;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end;
  // if gdfocused in State then
  // begin
  // DBGrid1.Canvas.Brush.Color := $00808040;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end
  // end
  // else if DMII.sds_BuscaGridAba_II.IsEmpty = False then
  // begin
  // if Odd(DMII.sds_BuscaGridAba_II.RecNo) then
  // begin
  // DBGrid1.Canvas.Brush.Color := $00CBEAEB;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end
  // else
  // begin
  // DBGrid1.Canvas.Brush.Color := $00FFF4F4;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end;
  // if gdfocused in State then
  // begin
  // DBGrid1.Canvas.Brush.Color := $00808040;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end;
  // end
  // else if DMII.sds_BuscaGridAba_III.IsEmpty = False then
  // begin
  // if Odd(DMII.sds_BuscaGridAba_III.RecNo) then
  // begin
  // DBGrid1.Canvas.Brush.Color := $00CBEAEB;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end
  // else
  // begin
  // DBGrid1.Canvas.Brush.Color := $00FFF4F4;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end;
  // if gdfocused in State then
  // begin
  // DBGrid1.Canvas.Brush.Color := $00808040;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  // end;
  // end;
end;

procedure TFrmGridAba.DBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmGridAba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
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
