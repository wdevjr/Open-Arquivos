// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnCadPerfil;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, ComCtrls, DBCtrls,
  Grids, DBGrids, ZDataset;

type

  { TFrmCadPerfil }

  TFrmCadPerfil = class(TForm)
    BitBtn1: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBCheckBox38: TDBCheckBox;
    DBCheckBox39: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    trazerj: TBitBtn;
    cancelar: TBitBtn;
    DBEdit2: TDBEdit;
    editar: TBitBtn;
    excluir: TBitBtn;
    gravar: TBitBtn;
    inserir: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Dtsc: TDataSource;
    DBText2: TDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    //procedure PesquizarUserClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DtscStateChange(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
  private
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  public
    { Public declarations }
  end;

var
  FrmCadPerfil: TFrmCadPerfil;
  TempSize:Boolean;

implementation

uses UDMII, UnDM, uncadastrousuarios, UnDlgProcuraPerfil, UnLogin;

{$R *.lfm}

procedure TFrmCadPerfil.ConfigInserir;
begin
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmCadPerfil.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadPerfil.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadPerfil.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.close;
end;

procedure TFrmCadPerfil.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
  // PesquizarUser.Enabled:=False;
end;

procedure TFrmCadPerfil.cancelarClick(Sender: TObject);
begin
  Dtsc.DataSet.Cancel;
  //Dtsc.DataSet.Close;
  with DMII.cds_Perfil do
  begin
    excluir.Enabled := not IsEmpty;
  end;
end;

procedure TFrmCadPerfil.DtscStateChange(Sender: TObject);
begin
  with Dtsc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsc.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtsc.State in [dsInsert];
    editar.Enabled := Dtsc.State in [dsEdit];
    cancelar.Enabled := Dtsc.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtsc.State in [dsBrowse];
  end;
end;

procedure TFrmCadPerfil.trazerjClick(Sender: TObject);
begin
  FrmDlgProcuraPerfil := TFrmDlgProcuraPerfil.Create(Self, DMII.sds_Pesq_PL);
  try
    if FrmDlgProcuraPerfil.ShowModal = mrOk then
    begin
      DMII.cds_Perfil.Close;
      DMII.cds_Perfil.Params[0].AsInteger := DMII.sds_Pesq_PLCODIGO.AsInteger;
      DMII.cds_Perfil.Open;
    end;
  finally
    DMII.sds_Pesq_PL.Close;
    FrmDlgProcuraPerfil.Free;
    with DMII.cds_Perfil do
    begin
      excluir.Enabled := not IsEmpty;
    end;
  end;

end;

procedure TFrmCadPerfil.editarClick(Sender: TObject);
begin
  if (DBEdit2.Modified = True) Then
  begin
    DMII.ZQueryConsultaNome.Close;
    DMII.ZQueryConsultaNome.Params[0].Value:=DBEdit2.Text;
    DMII.ZQueryConsultaNome.Open;
    if (DMII.ZQueryConsultaNome.RecordCount >= 1) then
    begin
       MessageDlg('Este nome já existe no perfil!', mtWarning, [mbOK], 0);
       Abort;
    end;
    end else
  try
    Dtsc.DataSet.Edit;
    (Dtsc.DataSet as TZQuery).ApplyUpdates;
    (Dtsc.DataSet as TZQuery).CommitUpdates;
  except
    begin
     ShowMessage('Nome Duplicado!');
    end;
  end;

end;

procedure TFrmCadPerfil.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir este Perfil?', mtConfirmation, [mbYes, mbNo], 0) =
    mrYes) then
  begin
    try
      Dtsc.DataSet.Delete;
      (Dtsc.DataSet as TZQuery).ApplyUpdates;
      (Dtsc.DataSet as TZQuery).CommitUpdates;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao excluir!', 'Erro ao Deletar o Perfil!' +
          E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
  with DMII.cds_Perfil do
  begin
    excluir.Enabled := not IsEmpty;
  end;
end;



procedure TFrmCadPerfil.FormShow(Sender: TObject);
begin
  ConfigInicial;
  Color := DM.myColor;
  with DMII.cds_Perfil do
  begin
    excluir.Enabled := not IsEmpty;
  end;
end;

procedure TFrmCadPerfil.gravarClick(Sender: TObject);
begin
  if (DBEdit2.Text = '') then
  begin
    MessageDlg('Informe um Nome para o perfil!', mtWarning, [mbOK], 0);
  end
  else
  begin
    DMII.ZQueryConsultaNome.Close;
    DMII.ZQueryConsultaNome.Params[0].Value:=DBEdit2.Text;
    DMII.ZQueryConsultaNome.Open;
    if (DMII.ZQueryConsultaNome.RecordCount >= 1) then
    begin
       MessageDlg('Este nome já existe no perfil!', mtWarning, [mbOK], 0);
       Abort;
    end
    else
    try
      Dtsc.DataSet.Post;
      (Dtsc.DataSet as TZQuery).ApplyUpdates;
      (Dtsc.DataSet as TZQuery).CommitUpdates;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao gravar!', 'Erro ao Gravar o Perfil!' +
          E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TFrmCadPerfil.inserirClick(Sender: TObject);
begin
  if not Dtsc.DataSet.Active then
    Dtsc.DataSet.Open;
  Dtsc.DataSet.Append;

  //DBCheckBox1.State := cbUnchecked;
  //DBCheckBox2.State := cbUnchecked;
  //DBCheckBox3.State := cbUnchecked;
  //DBCheckBox5.State := cbUnchecked;
  DBCheckBox7.State := cbUnchecked;
  DBCheckBox8.State := cbUnchecked;
  DBCheckBox11.State := cbUnchecked;
  DBCheckBox13.State := cbUnchecked;
  DBCheckBox14.State := cbUnchecked;
  //DBCheckBox18.State := cbUnchecked;
  DBCheckBox19.State := cbUnchecked;
  DBCheckBox21.State := cbUnchecked;
  DBCheckBox22.State := cbUnchecked;
  DBCheckBox23.State := cbUnchecked;
  DBCheckBox25.State := cbUnchecked;
  DBCheckBox27.State := cbUnchecked;
  DBCheckBox29.State := cbUnchecked;
  DBCheckBox30.State := cbUnchecked;
  DBCheckBox32.State := cbUnchecked;
  DBCheckBox33.State := cbUnchecked;
  DBCheckBox34.State := cbUnchecked;
  DBCheckBox37.State := cbUnchecked;
  DBCheckBox38.State := cbUnchecked;
  DBCheckBox39.State := cbUnchecked;
  DBCheckBox40.State := cbUnchecked;
end;

{procedure TFrmCadPerfil.PesquizarUserClick(Sender: TObject);
begin
  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DMII.sds_Perfil);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      if Dtsc.State = dsBrowse then
        DMII.cds_Perfil.Edit;
      DMII.cds_PerfilCODIGO.AsInteger := DMII.sds_Pesq_PLCODIGO.AsInteger;
      DMII.cds_PerfilNOMEL.AsString := DMII.sds_Pesq_PLNOMEL.AsString;
    end;
  finally
    DMII.sds_Perfil.Close;
    FrmLocalizarUser.Free;
  end;
end; }

procedure TFrmCadPerfil.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPerfil.SpeedButton3Click(Sender: TObject);
begin
  DMII.cds_Perfil.Close;
  DMII.cds_Perfil.Params[0].AsInteger := DMII.codigoPerfil;
  DMII.cds_Perfil.Open;
end;

procedure TFrmCadPerfil.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPerfil.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    Dtsc.DataSet.Close;
end;

procedure TFrmCadPerfil.BitBtn1Click(Sender: TObject);
begin
  Dtsc.DataSet.Close;
end;

procedure TFrmCadPerfil.SpeedButton1Click(Sender: TObject);
begin
  if (FrmLogin.COD_PERFIL <> 0) then
  begin
  DMII.cds_Perfil.Close;
  DMII.cds_Perfil.Params[0].Value := FrmLogin.COD_PERFIL;
  DMII.cds_Perfil.Open;
  end;
end;



end.
