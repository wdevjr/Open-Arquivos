unit UndDlgProcuraCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, Buttons, StdCtrls, SimpleDS;

type
  TFrmDlgProcuraCidades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Dtsrc: TDataSource;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Image1: TImage;
    Panel3: TPanel;
    BtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TSimpleDataSet);
      reintroduce;
  end;

var
  FrmDlgProcuraCidades: TFrmDlgProcuraCidades;

implementation

uses UDM;

{$R *.dfm}

procedure TFrmDlgProcuraCidades.BitBtn2Click(Sender: TObject);
begin
  close;
end;

constructor TFrmDlgProcuraCidades.Create(AOWner: TComponent;
  DataSet: TSimpleDataSet);
begin
  inherited Create(AOWner);
  Dtsrc.DataSet := DataSet;
end;

procedure TFrmDlgProcuraCidades.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { if not DM.sds_BuscaCidades.Eof then
    begin
    if Odd(DM.sds_BuscaCidades.RecNo) then
    begin
    DBGrid1.Canvas.Brush.Color := $00CBEAEB;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
    DBGrid1.Canvas.Brush.Color := $00FFF4F4;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then
    begin
    DBGrid1.Canvas.Brush.Color := $00808040;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    end; }
end;

procedure TFrmDlgProcuraCidades.SpeedButton1Click(Sender: TObject);
begin
  with Dtsrc.DataSet as TSimpleDataSet do
  Begin
    close;
    Params[0].AsString := '%' + Edit1.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
