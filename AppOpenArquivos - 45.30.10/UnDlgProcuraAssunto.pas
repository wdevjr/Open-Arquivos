// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnDlgProcuraAssunto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ZDataset;

// declara SimpleDS para TSimpleDataSet ahhahahahhhahah
type

  { TFrmLocalizaAssunto }

  TFrmLocalizaAssunto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    EditProc: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BtnOk: TBitBtn;
    Dtsc: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure EditProcKeyPress(Sender: TObject; var Key: char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TZQuery);
      reintroduce;
  end;

var
  FrmLocalizaAssunto: TFrmLocalizaAssunto;

implementation

uses UnDM;

{$R *.lfm}

procedure TFrmLocalizaAssunto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
 { if Odd(Dtsc.DataSet.RecNo) then
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
  end;  }
end;

constructor TFrmLocalizaAssunto.Create(AOWner: TComponent; DataSet: TZQuery);
begin
  inherited Create(AOWner);
  Dtsc.DataSet := DataSet;
end;

procedure TFrmLocalizaAssunto.DBGrid1TitleClick(Column: TColumn);
begin
  with Dtsc.DataSet as TZQuery do
    IndexFieldNames := Column.FieldName;
end;

procedure TFrmLocalizaAssunto.EditProcKeyPress(Sender: TObject; var Key: char);
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

procedure TFrmLocalizaAssunto.FormShow(Sender: TObject);
begin
  with Dtsc.DataSet as TZQuery do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmLocalizaAssunto.SpeedButton1Click(Sender: TObject);
begin
  with Dtsc.DataSet as TZQuery do
  begin
    Close;
    Params[0].AsString := '%' + EditProc.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
