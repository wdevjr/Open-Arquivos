unit UnCadLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DBCtrls, ComCtrls, Mask, DB, DBClient,
  ExtDlgs;

type
  TFrmCadLogDet = class(TForm)
    Panel4: TPanel;
    inserir: TSpeedButton;
    gravar: TSpeedButton;
    excluir: TSpeedButton;
    cancelar: TSpeedButton;
    trazerj: TSpeedButton;
    editar: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    StatusBar1: TStatusBar;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Panel5: TPanel;
    ok: TCheckBox;
    DBText2: TDBText;
    Label6: TLabel;
    DtsrcLog: TDataSource;
    DBImage1: TDBImage;
    SpeedButton2: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    BitBtn1: TBitBtn;
    procedure okClick(Sender: TObject);
    procedure DtsrcLogStateChange(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  public

  end;

var
  FrmCadLogDet: TFrmCadLogDet;

implementation

uses UDMII, UDM, UnDlgProcuraDepartamento;

{$R *.dfm}

procedure TFrmCadLogDet.ConfigInserir;
begin
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmCadLogDet.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if DBEdit1.Text <> '' then
  begin
    DBText2.Caption := DBEdit1.Text;
    Panel5.Visible := True;
  end;
end;

procedure TFrmCadLogDet.DtsrcLogStateChange(Sender: TObject);
begin
  with DtsrcLog.DataSet do
  begin
    inserir.Enabled := DtsrcLog.State in [dsBrowse, dsInactive];
    gravar.Enabled := DtsrcLog.State in [dsInsert];
    editar.Enabled := DtsrcLog.State in [dsEdit];
    cancelar.Enabled := DtsrcLog.State in [dsInsert, dsEdit];
    excluir.Enabled := DtsrcLog.State in [dsBrowse];
    trazerj.Enabled := DtsrcLog.State in [dsBrowse, dsInactive];

    // trazerj.Enabled:=Dtscu.State in [dsBrowse,dsInactive];
  end;
end;

procedure TFrmCadLogDet.editarClick(Sender: TObject);
var
  str: String;
  chave: String[10];
begin
  chave := '';
  str := 'abcdefgghijlmnopqrstuvwxyz' + 'ABCDEFGHIJLMNOPQRSTUVWXYZ' +
    '1234567890';
  Randomize;
  repeat
    chave := chave + str[random(Length(str)) + 1];
  until Length(chave) = 8;
  if ok.Checked = False then
  begin
    if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '')
    then
    begin
      DtsrcLog.DataSet.Post;
      (DtsrcLog.DataSet as TClientDataSet).ApplyUpdates(0);
      ConfigGravar;
    end
    else
      MessageDlg('Preencha os campos em branco !', mtWarning, [mbOK], 0);
  end
  else if (ok.Checked = True) then
  begin
    if MessageDlg('Tem certeza que deseja criar uma senha Aleatória !',
      mtWarning, [mbOK, mbCancel], 0) = mrOk then
    begin
      DBEdit3.Text := chave;
      DtsrcLog.DataSet.Post;
      (DtsrcLog.DataSet as TClientDataSet).ApplyUpdates(0);
      ConfigGravar;
    end
    else
      Abort;
  end;
end;

procedure TFrmCadLogDet.excluirClick(Sender: TObject);
begin
  if MessageDlg('Você deseja excluir este registro ?', mtConfirmation,
    [mbOK, mbCancel], 0) = mrOk then
  begin
    DtsrcLog.DataSet.Delete;
    (DtsrcLog.DataSet as TClientDataSet).ApplyUpdates(0);
    ConfigExcluir;
  end
  else
    Abort;
end;

procedure TFrmCadLogDet.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  DM.cds_User.Close;
end;

procedure TFrmCadLogDet.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  DMII.cds_CadAssistent.Close;
end;

procedure TFrmCadLogDet.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadLogDet.cancelarClick(Sender: TObject);
begin
  DtsrcLog.DataSet.Cancel;
  ConfigCancelar;
  Panel5.Visible := False;
end;

procedure TFrmCadLogDet.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  DtsrcLog.DataSet.Close;
end;

procedure TFrmCadLogDet.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmCadLogDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DtsrcLog.DataSet.State = dsBrowse then
  begin
    DtsrcLog.DataSet.Close;
  end;
end;

procedure TFrmCadLogDet.FormShow(Sender: TObject);
begin
  ConfigInicial;
end;

procedure TFrmCadLogDet.gravarClick(Sender: TObject);
var
  str: String;
  chave: String[10];
begin
  chave := '';
  str := 'abcdefgghijlmnopqrstuvwxyz' + 'ABCDEFGHIJLMNOPQRSTUVWXYZ' +
    '1234567890';
  Randomize;
  repeat
    chave := chave + str[random(Length(str)) + 1];
  until Length(chave) = 8;
  if ok.Checked = False then
  begin
    if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '')
    then
    begin
      DtsrcLog.DataSet.Post;
      (DtsrcLog.DataSet as TClientDataSet).ApplyUpdates(0);
      ConfigGravar;
    end
    else
      MessageDlg('Preencha os campos em branco !', mtWarning, [mbOK], 0);
  end
  else if (ok.Checked = True) then
  begin
    if MessageDlg('Tem certeza que deseja criar uma senha Aleatória !',
      mtWarning, [mbOK, mbCancel], 0) = mrOk then
    begin
      DBEdit3.Text := chave;
      DtsrcLog.DataSet.Post;
      (DtsrcLog.DataSet as TClientDataSet).ApplyUpdates(0);
      ConfigGravar;
    end
    else
      Abort;
  end;
end;

procedure TFrmCadLogDet.inserirClick(Sender: TObject);
begin

  DtsrcLog.DataSet.Open;
  DtsrcLog.DataSet.Append;

end;

procedure TFrmCadLogDet.okClick(Sender: TObject);
begin
  DtsrcLog.DataSet.Edit;
end;

procedure TFrmCadLogDet.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadLogDet.SpeedButton2Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if (DtsrcLog.DataSet.State = dsBrowse) OR (DtsrcLog.DataSet.Active) then
    begin
      DMII.cds_CadAssistent.Edit;
      DMII.cds_CadAssistentFOTO.LoadFromFile(OpenPictureDialog1.FileName);
    end;
  end;

end;

procedure TFrmCadLogDet.trazerjClick(Sender: TObject);
begin
  FrmDlgProcuraDepartamento := TFrmDlgProcuraDepartamento.Create(Self,
    DMII.sds_LocalizarLogUser);
  FrmDlgProcuraDepartamento.Label1.Caption := '';
  FrmDlgProcuraDepartamento.Label1.Caption := 'Usuário Log:';
  try
    if FrmDlgProcuraDepartamento.ShowModal = mrOk then
    begin
      if DtsrcLog.State = dsBrowse then
        DMII.cds_CadAssistent.Close;
      DMII.cds_CadAssistent.Params[0].AsInteger :=
        DMII.sds_LocalizarLogUserCODIGO.AsInteger;
      DMII.cds_CadAssistent.Open;
    end;
  finally
    DMII.sds_LocalizarLogUser.Close;
    FrmDlgProcuraDepartamento.Free;
  end;
end;

end.
