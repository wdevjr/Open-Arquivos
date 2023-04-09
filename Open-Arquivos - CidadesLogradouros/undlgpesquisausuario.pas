unit undlgpesquisaUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBExtCtrls, Buttons, StdCtrls, ZDataset;

type

  { TFrmPesquisaUsuario }

  TFrmPesquisaUsuario = class(TForm)
    BtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    Dtsc: TDataSource;
    DBGrid1: TDBGrid;
    EditUser: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public
    NomePerfilTempPesq: string;
  end;

var
  FrmPesquisaUsuario: TFrmPesquisaUsuario;


implementation

{$R *.lfm}

uses uncadastrousuarios, UnDM;

{ TFrmPesquisaUsuario }



procedure TFrmPesquisaUsuario.FormShow(Sender: TObject);
begin
  with DM.SimpleDataSetUseNome do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmPesquisaUsuario.SpeedButton1Click(Sender: TObject);
begin
  with DM.SimpleDataSetUseNome do
  begin
    Close;
    Params[0].AsString := '%' + EditUser.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
