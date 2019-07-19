// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnDlgProcuraPerfilUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnDlgProcuraPerfil, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  SimpleDS;

type
  TFrmDlgProcuraPerfilUser = class(TFrmDlgProcuraPerfil)
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FrmDlgProcuraPerfilUser: TFrmDlgProcuraPerfilUser;

implementation

uses UDMII;

procedure TFrmDlgProcuraPerfilUser.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Odd(DMII.sds_Pesq_PL.RecNo) then
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

procedure TFrmDlgProcuraPerfilUser.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with Dtscp.DataSet as TSimpleDataSet do
  Begin
    close;
    Params[0].AsString := '%' + EditPerfil.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
