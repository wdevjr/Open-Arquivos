// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercializa��o deste Software bem como do Font sem autoriza��o do Autor � Terminantemente PROIBIDA !

unit UnDlgProcuraAutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ZDataset;

type

  { TFrmLocalizarAutor }

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
    procedure BtnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditProcKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TZQuery);
      reintroduce;
  end;

var
  FrmLocalizarAutor: TFrmLocalizarAutor;

implementation

uses UnDM, UnCadAutores;

{$R *.lfm}

procedure TFrmLocalizarAutor.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  {if Odd(DM.sds_Autores.RecNo) then
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
  end; }
end;

constructor TFrmLocalizarAutor.Create(AOWner: TComponent; DataSet: TZQuery);
begin
  inherited Create(AOWner);
  Dtsc.DataSet := DataSet;
end;

procedure TFrmLocalizarAutor.DBGrid1TitleClick(Column: TColumn);
begin
  with Dtsc.DataSet as TZQuery do
    IndexFieldNames := Column.FieldName;
end;

procedure TFrmLocalizarAutor.EditProcKeyPress(Sender: TObject; var Key: char);
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
  with Dtsc.DataSet as TZQuery do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmLocalizarAutor.SpeedButton1Click(Sender: TObject);
begin
  with Dtsc.DataSet as TZQuery do
  begin
    Close;
    Params[0].AsString := '%' + EditProc.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmLocalizarAutor.BtnOkClick(Sender: TObject);
begin
  {FrmCadAutor.Label10.Caption := DM.sds_AutoresNOME_DEP.AsString;
  FrmCadAutor.Label11.Caption := DM.sds_AutoresNOME_CIDADE.AsString;
  FrmCadAutor.Label12.Caption := DM.sds_AutoresUF.AsString;
  FrmCadAutor.NomePerfilTempCad := DM.sds_AutoresNOME_DEP.AsString;
  FrmCadAutor.NomeCidade := DM.sds_AutoresNOME_CIDADE.AsString;
  FrmCadAutor.NomeCidadeSigla := DM.sds_AutoresUF.AsString;
  FrmCadAutor.checadoPerfilTipo := True;
  FrmCadAutor.checadoPerfilTipoPUser := False;
  FrmCadAutor.checadoCidadeNome := True;
  FrmCadAutor.checadoCidadeSigla := True; }
end;

end.
