// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit ULocalizarUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, SimpleDS, MidasLib;

type
  TFrmLocalizarUser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BtnOk: TBitBtn;
    Dtsc: TDataSource;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Panel7: TPanel;
    Label1: TLabel;
    EditUser: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

  public
    constructor Create(AOWner: TComponent; DataSet: TSimpleDataSet);
      reintroduce;
  end;

var
  FrmLocalizarUser: TFrmLocalizarUser;

implementation

{$R *.dfm}

uses UDM, UDMII, UnContrUser, UnUtilitLog;

procedure TFrmLocalizarUser.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not DM.sdss_User.Eof then
  begin
    if Odd(DM.sdss_User.RecNo) then
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
  ELSE if not DM.sdsss_User.Eof then
  begin
    if Odd(DM.sdss_User.RecNo) then
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
  ELSE if not DMII.sds_LocalUserSis.Eof then
  begin
    if Odd(DMII.sds_LocalUserSis.RecNo) then
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
  ELSE if not DM.sds_UserPorCriterio.Eof then
  begin
    if Odd(DM.sds_UserPorCriterio.RecNo) then
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
end;

procedure TFrmLocalizarUser.BitBtn1Click(Sender: TObject);
begin
  DM.sds_UserPorCriterio.Close;
end;

constructor TFrmLocalizarUser.Create(AOWner: TComponent;
  DataSet: TSimpleDataSet);
begin
  inherited Create(AOWner);
  Dtsc.DataSet := DataSet;
end;

procedure TFrmLocalizarUser.FormShow(Sender: TObject);
begin
  with Dtsc.DataSet do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmLocalizarUser.SpeedButton1Click(Sender: TObject);
begin
  with Dtsc.DataSet as TSimpleDataSet do
  Begin
    Close;
    Params[0].AsString := '%' + EditUser.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
