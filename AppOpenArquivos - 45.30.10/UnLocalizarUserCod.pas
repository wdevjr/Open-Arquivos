// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnLocalizarUserCod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ZDataset;

type
  TFrmLocalizarUserCod = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    EditUser: TEdit;
    DBGrid1: TDBGrid;
    Dtsrc: TDataSource;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TZQuery);
      reintroduce;
  end;

var
  FrmLocalizarUserCod: TFrmLocalizarUserCod;

implementation

uses UnDM;

{$R *.lfm}

constructor TFrmLocalizarUserCod.Create(AOWner: TComponent; DataSet: TZQuery);
begin
  inherited Create(AOWner);
  Dtsrc.DataSet := DataSet;
end;

procedure TFrmLocalizarUserCod.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  {if Odd(DM.sds_userCod.RecNo) then
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

procedure TFrmLocalizarUserCod.FormShow(Sender: TObject);
begin
  with Dtsrc.DataSet do
  begin
    BtnOK.Enabled := not IsEmpty;
  end;
end;

procedure TFrmLocalizarUserCod.SpeedButton1Click(Sender: TObject);
begin
  if EditUser.Text <> '' then
  begin
    with Dtsrc.DataSet as TZQuery do
    begin
      Close;
      Params[0].AsInteger := StrToInt(EditUser.Text);
      Open;
      BtnOK.Enabled := not IsEmpty;
    end;
  end
  else
  begin
    MessageDlg('Preencha o campo !', mtWarning, [mbOK], 0);
  end;
end;

end.
