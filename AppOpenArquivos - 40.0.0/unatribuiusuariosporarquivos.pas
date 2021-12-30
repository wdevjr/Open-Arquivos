unit UnatribuiUsuariosPorArquivos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  DBGrids;

type

  { TFrmAtribuiUser }

  TFrmAtribuiUser = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    excluir: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    ds_CadUserAdd: TDataSource;
    Dtsrc: TDataSource;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmAtribuiUser: TFrmAtribuiUser;

implementation

{$R *.lfm}

uses UnDM, UnIncluirUsuarios;

{ TFrmAtribuiUser }

procedure TFrmAtribuiUser.BitBtn1Click(Sender: TObject);
begin
  DM.sds_User_Usuarios.Close;
  DM.sds_User_Usuarios.Params[0].AsInteger := DM.ZQArquivoID.AsInteger;
  DM.sds_User_Usuarios.Params[1].AsString := '%' + Edit1.Text + '%';
  DM.sds_User_Usuarios.Open;
end;

procedure TFrmAtribuiUser.BitBtn2Click(Sender: TObject);
begin
  try
    frmIncluir := TfrmIncluir.Create(self);
    with frmIncluir do
      if ShowModal = mrOk then
      begin

        DM.cds_UserAdd.Close;
        if (not DM.cds_UserAdd.Active) then
        begin

          DM.cds_UserAdd.Open;
          DM.cds_UserAdd.Append;

          DM.cds_UserAddIDUSUARIOS.Value :=
            frmIncluir.sds_Pesq_UserCOD_USUARIO.AsInteger;
          DM.cds_UserAddIDARQUIVOS.Value := DM.ZQArquivoID.Value;

          try
            begin
              DM.cds_UserAdd.Post;
              DM.cds_UserAdd.ApplyUpdates;
              DM.cds_UserAdd.CommitUpdates;
              DM.sds_User_Usuarios.Refresh;
              excluir.Enabled := (not DM.cds_UserAdd.IsEmpty);
            end;
          except
            on E: Exception do
            begin
              ShowMessage('Esse Usuário já Existe no Arquivo! ');
              Abort;
            end;
          end;

        end;

      end;



  finally
    frmIncluir.Free;
    // DM.sds_listaAdd.Close;
  end;

end;

procedure TFrmAtribuiUser.excluirClick(Sender: TObject);
begin
  DM.cds_UserAdd.Close;
  // DM.cds_UserAdd.Params[0].Value:='';
  // DM.cds_UserAdd.Params[1].Value:='';
  DM.cds_UserAdd.Params[0].Value := DM.sds_User_UsuariosIDARQUIVOS.AsInteger;
  DM.cds_UserAdd.Params[1].Value := DM.sds_User_UsuariosCOD_USUARIO.AsInteger;
  DM.cds_UserAdd.Open;
  DM.cds_UserAdd.Delete;
  DM.cds_UserAdd.ApplyUpdates;
  DM.cds_UserAdd.CommitUpdates;
  DM.sds_User_Usuarios.Refresh;
  excluir.Enabled := (not DM.sds_User_Usuarios.IsEmpty);
end;

procedure TFrmAtribuiUser.FormCreate(Sender: TObject);
begin
  DM.sds_User_Usuarios.Close;
  DM.sds_User_Usuarios.Params[0].AsInteger := DM.ZQArquivoID.AsInteger;
  DM.sds_User_Usuarios.Params[1].AsString := '%' + Edit1.Text + '%';
  DM.sds_User_Usuarios.Open;
end;

procedure TFrmAtribuiUser.FormShow(Sender: TObject);
begin
  Color := DM.myColor;
  //DM.sds_lista_Usuarios.Close;
  //DM.sds_lista_Usuarios.Params[1].AsString := '%' + Edit1.Text + '%';
  //DM.sds_lista_Usuarios.Open;
end;

end.
