// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnDlgProcuraAutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, simpleDS;

type
  TFrmLocalizarAutor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BtnOk: TBitBtn;
    EditProc: TEdit;
    Dtsc: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditProcKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TSimpleDataSet);
      reintroduce;
  end;

var
  FrmLocalizarAutor: TFrmLocalizarAutor;

implementation

uses UDM;

{$R *.dfm}

procedure TFrmLocalizarAutor.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd(DM.sds_Autores.RecNo) then
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
end;

constructor TFrmLocalizarAutor.Create(AOWner: TComponent;
  DataSet: TSimpleDataSet);
begin
  inherited Create(AOWner);
  Dtsc.DataSet := DataSet;
end;

procedure TFrmLocalizarAutor.DBGrid1TitleClick(Column: TColumn);
begin
  with Dtsc.DataSet as TSimpleDataSet do
    IndexFieldNames := Column.FieldName;
end;

procedure TFrmLocalizarAutor.EditProcKeyPress(Sender: TObject; var Key: Char);
begin
  { if (key <> #13) and (key <> #46) then
    with Dtsc.DataSet as TSimpleDataSet do
    Begin
    close;
    Params[0].AsString:='%' + EditProc.Text + '%';
    Open;
    BtnOk.Enabled:=not IsEmpty;
    end; }
end;

procedure TFrmLocalizarAutor.FormShow(Sender: TObject);
begin
  with Dtsc.DataSet as TSimpleDataSet do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmLocalizarAutor.SpeedButton1Click(Sender: TObject);
begin
  with Dtsc.DataSet as TSimpleDataSet do
  Begin
    close;
    Params[0].AsString := '%' + EditProc.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
