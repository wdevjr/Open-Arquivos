unit UnatribuiUsuariosPorArquivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Data.DBXFirebird, Datasnap.DBClient, SimpleDS,
  Vcl.DBCtrls, Datasnap.Provider, Vcl.Grids, Vcl.DBGrids;

type
  TFrmAtribuiUser = class(TForm)
    DBGrid1: TDBGrid;
    incluir: TBitBtn;
    excluir: TBitBtn;
    Dtsrc: TDataSource;
    Fechar: TBitBtn;
    ds_CadUserAdd: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FecharClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

  end;

var
  FrmAtribuiUser: TFrmAtribuiUser;

implementation

{$R *.dfm}

uses UDM, UnIncluirUsuarios, UProjeto;

procedure TFrmAtribuiUser.BitBtn1Click(Sender: TObject);
begin
  // if (Edit1.Text <> '') and (Edit1.Text <> '%') and (Edit1.Text <> '.') then
  // begin
  DM.sds_lista_Usuarios.Close;
  DM.sds_lista_Usuarios.Params[1].AsString := '%' + Edit1.Text + '%';
  DM.sds_lista_Usuarios.Open;
  // end;
end;

procedure TFrmAtribuiUser.DBGrid1CellClick(Column: TColumn);
begin
  { if DBGrid1.FieldCount <> 0 then
    begin
    DM.cds_UserAdd.Close;
    DM.cds_UserAdd.Params[0].value := DBGrid1.DataSource.DataSet.Fields[1].asInteger; //arquivo
    DM.cds_UserAdd.Params[1].Value := DBGrid1.DataSource.DataSet.Fields[0].asInteger; //usuario

    end
    else
    Abort; }
end;

procedure TFrmAtribuiUser.excluirClick(Sender: TObject);
begin
  DM.cds_UserAdd.Close;
  // DM.cds_UserAdd.Params[0].Value:='';
  // DM.cds_UserAdd.Params[1].Value:='';
  DM.cds_UserAdd.Params[0].Value := DM.sds_lista_UsuariosIDARQUIVOS.AsInteger;
  DM.cds_UserAdd.Params[1].Value := DM.sds_lista_UsuariosCOD_USUARIO.AsInteger;
  DM.cds_UserAdd.Open;
  DM.cds_UserAdd.Delete;
  DM.cds_UserAdd.ApplyUpdates(0);
  DM.sds_lista_Usuarios.Refresh;
  excluir.Enabled := (not DM.sds_lista_Usuarios.IsEmpty);

end;

procedure TFrmAtribuiUser.FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtribuiUser.FormCreate(Sender: TObject);
begin
  DM.sds_lista_Usuarios.Params[0].AsInteger := DM.cds_ArquivoID.AsInteger;
  // DM.sds_lista_Usuarios.Params[1].AsInteger := DM.cds_ArquivoCOD_USUARIO.AsInteger;
  DM.sds_lista_Usuarios.Open;

end;

procedure TFrmAtribuiUser.FormShow(Sender: TObject);
begin
  /// DM.sds_lista_Usuarios.Refresh;
end;

procedure TFrmAtribuiUser.incluirClick(Sender: TObject);
var
  i: integer;
begin
 // DM.sds_listaAdd.Close;
  //DM.sds_listaAdd.Params[0].AsInteger:=//DM.cds_ArquivoID.AsInteger;
 // DM.sds_listaAdd.Open;

  try
    frmIncluir := TfrmIncluir.Create(Application);
    with frmIncluir do
      if ShowModal = mrOk then
      begin

        DM.cds_UserAdd.Close;
        if (not DM.cds_UserAdd.Active) then
        begin

          DM.cds_UserAdd.Open;
          DM.cds_UserAdd.Append;

          DM.cds_UserAddIDUSUARIOS.Value := frmIncluir.sds_Pesq_UserCOD_USUARIO.AsInteger;
          DM.cds_UserAddIDARQUIVOS.Value := DM.cds_ArquivoID.Value;
          DM.cds_UserAddNOME.AsString := frmIncluir.sds_Pesq_UserNOME.AsString;

          DM.cds_UserAdd.Post;
          DM.cds_UserAdd.ApplyUpdates(0);
          DM.sds_lista_Usuarios.Refresh;
          excluir.Enabled := (not DM.cds_UserAdd.IsEmpty);

        end;

      end;

  finally
    frmIncluir.Free;
    // DM.sds_listaAdd.Close;
  end;

end;

end.
