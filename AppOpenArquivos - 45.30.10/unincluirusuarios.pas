unit UnIncluirUsuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, DBGrids, ZDataset;

type

  { TfrmIncluir }

  TfrmIncluir = class(TForm)
    BitBtn1: TBitBtn;
    BitBtnIncluir: TBitBtn;
    BitBtn3: TBitBtn;
    DtsrcAdionar: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    sds_Pesq_User: TZQuery;
    sds_Pesq_UserCOD_USUARIO: TLongintField;
    sds_Pesq_UserLOGIN: TStringField;
    sds_Pesq_UserNOME: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmIncluir: TfrmIncluir;

implementation

{$R *.lfm}

{ TfrmIncluir }

uses UnDM;

procedure TfrmIncluir.BitBtn1Click(Sender: TObject);
begin
  sds_Pesq_User.Close;
  sds_Pesq_User.Params[0].AsString := '%' + Edit1.Text + '%';
  sds_Pesq_User.Open;
end;

procedure TfrmIncluir.DBGrid1CellClick(Column: TColumn);
begin
  with sds_Pesq_User do
  begin
    BitBtnIncluir.Enabled := not IsEmpty;
  end;
end;

procedure TfrmIncluir.FormShow(Sender: TObject);
begin
  Panel1.Color := DM.myColor;
  Panel2.Color := DM.myColor;
  DM.sds_User_Usuarios.Open;
end;

end.
