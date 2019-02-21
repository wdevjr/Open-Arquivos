// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., CPF:842956
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnDlgProcura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, SimpleDS;

type
  TFrmDlgProcurar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Dtsc: TDataSource;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    btnBuscar: TSpeedButton;
    EditProc: TEdit;
    Panel4: TPanel;
    BtnOk: TBitBtn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure EditProcKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    // procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    codigoUsuario: Integer;
    UserLogin: String;
    // constructor Create(AOWner: TComponent; DataSet: TSimpleDataSet);
    // reintroduce;
  end;

var
  FrmDlgProcurar: TFrmDlgProcurar;

implementation

uses UDM, UnLogin;

{$R *.dfm}

procedure TFrmDlgProcurar.btnBuscarClick(Sender: TObject);
begin
  // if DM.sds_Arqu.IsEmpty = false then
  // begin
  with DM.sds_Arqu do
  Begin
    Close;
    If tag = 0 then
      Params[0].AsString := '%' + EditProc.Text + '%';
    Params[1].AsString := '%' + EditProc.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
  // end;
end;

// constructor TFrmDlgProcurar.Create(AOWner: TComponent; DataSet: TSimpleDataSet);
// begin
/// /  inherited Create(AOWner);
/// /  Dtsc.DataSet := DataSet;
// end;

procedure TFrmDlgProcurar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  r: TRect;
begin
  if DM.sds_Arqu.IsEmpty = false then
  begin
    if Odd(DM.sds_Arqu.RecNo) then
    begin
      DBGrid1.Canvas.Brush.Color := $00CBEAEB;
      // DBGrid1.Canvas.Font.Color:=clBlack;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      DBGrid1.Canvas.Brush.Color := $00FFF4F4;
      // DBGrid1.Canvas.Font.Color:=clBlack;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then
    begin
      DBGrid1.Canvas.Brush.Color := $00808040;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;

    // r := Rect;
    // Dec(r.Bottom, 2);
    // if Column.Field = DM.sds_arquDESCRICAO then
    // begin
    // if not (gdSelected in State) or (gdSelected in state) then
    // begin
    // DBGrid1.Canvas.FillRect(Rect);
    // DrawText(DBGrid1.Canvas.Handle, pchar(DM.sds_arquDESCRICAO.AsString),
    // Length(DM.sds_arquDESCRICAO.AsString), r,DT_WORDBREAK);
    // end;
    // end;
  end;
end;


// procedure TFrmDlgProcurar.DBGrid1TitleClick(Column: TColumn);
// begin
/// /  with Dtsc.DataSet as TSimpleDataSet do
/// /    IndexFieldNames := Column.FieldName;
// end;

procedure TFrmDlgProcurar.EditProcKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    with DM.sds_Arqu do
    Begin
      Close;
      If tag = 0 then
        Params[0].AsString := '%' + EditProc.Text + '%';
      Params[1].AsString := '%' + EditProc.Text + '%';
      Open;
      BtnOk.Enabled := not IsEmpty;
    end;
end;

procedure TFrmDlgProcurar.FormShow(Sender: TObject);
begin
  with Dtsc.DataSet as TSimpleDataSet do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
