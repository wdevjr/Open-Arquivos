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
  ZDataset;

type

  { TFrmDlgProcuraPerfilUser }

  TFrmDlgProcuraPerfilUser = class(TFrmDlgProcuraPerfil)
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FrmDlgProcuraPerfilUser: TFrmDlgProcuraPerfilUser;

implementation

uses UDMII;

procedure TFrmDlgProcuraPerfilUser.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with Dtscp.DataSet as TZQuery do
  begin
    Close;
    Params[0].AsString := '%' + EditPerfil.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
