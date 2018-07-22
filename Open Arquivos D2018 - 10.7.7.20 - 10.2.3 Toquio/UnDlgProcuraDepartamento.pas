unit UnDlgProcuraDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, SimpleDS;

type
  TFrmDlgProcuraDepartamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    EditOK: TEdit;
    Dtsrc: TDataSource;
    Label1: TLabel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

  public
    constructor Create(AOWner: TComponent; DataSet: TSimpleDataSet);
      reintroduce;
  end;

var
  FrmDlgProcuraDepartamento: TFrmDlgProcuraDepartamento;

implementation

{$R *.dfm}

uses UDM, UDMII;

procedure TFrmDlgProcuraDepartamento.BitBtn2Click(Sender: TObject);
begin
  close;
end;

constructor TFrmDlgProcuraDepartamento.Create(AOWner: TComponent;
  DataSet: TSimpleDataSet);
begin
  inherited Create(AOWner);
  Dtsrc.DataSet := DataSet;
end;

procedure TFrmDlgProcuraDepartamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { if not DM.sds_Qry_Nome.Eof then
    begin
    if Odd(DM.sds_Qry_Nome.RecNo) then
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
    end
    else if not DM.sds_Qry_Cidades.Eof then
    begin
    if Odd(DM.sds_Qry_Cidades.RecNo) then
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
    end
    else if not DMII.sds_LocalizarLogUser.Eof then
    begin
    if Odd(DMII.sds_LocalizarLogUser.RecNo) then
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

procedure TFrmDlgProcuraDepartamento.SpeedButton1Click(Sender: TObject);
begin
  with Dtsrc.DataSet as TSimpleDataSet do
  begin
    close;
    Params[0].AsString := '%' + EditOK.Text + '%';
    Open;
    BitBtn1.Enabled := not IsEmpty;
  end;

end;

end.
