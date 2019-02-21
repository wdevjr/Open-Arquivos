unit UnDlgProcuraCidDep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, SimpleDS;

type
  TFrmDlgProcurarCidDep = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    StsBr: TStatusBar;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnOk: TBitBtn;
    BitBtn3: TBitBtn;
    EditProc: TEdit;
    Panel5: TPanel;
    BtPesquizar: TBitBtn;
    Label1: TLabel;
    Dtsrc: TDataSource;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtPesquizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TSimpleDataSet);
      reintroduce;
  end;

var
  FrmDlgProcurarCidDep: TFrmDlgProcurarCidDep;

implementation

uses UDM;

{$R *.dfm}

procedure TFrmDlgProcurarCidDep.BtPesquizarClick(Sender: TObject);
begin
  with Dtsrc.DataSet as TSimpleDataSet do
  Begin
    close;
    Params[0].AsString := '%' + EditProc.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
    if IsEmpty then
      StsBr.SimpleText := format('Nenum registro foi encontrado com "%s"',
        [EditProc.Text])
    else
      StsBr.SimpleText := format('%d registros encontrados com "%s"',
        [recordcount, EditProc.Text]);
  end;
end;

constructor TFrmDlgProcurarCidDep.Create(AOWner: TComponent;
  DataSet: TSimpleDataSet);
begin
  inherited Create(AOWner);
  Dtsrc.DataSet := DataSet;
end;

procedure TFrmDlgProcurarCidDep.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { if not DM.sds_PesquiDep.Eof then
    begin
    if Odd(DM.sds_PesquiDep.RecNo) then
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

procedure TFrmDlgProcurarCidDep.DBGrid1TitleClick(Column: TColumn);
begin
  with Dtsrc.DataSet as TSimpleDataSet do
    IndexFieldNames := Column.FieldName;
end;

procedure TFrmDlgProcurarCidDep.FormShow(Sender: TObject);
begin
  with Dtsrc.DataSet do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
