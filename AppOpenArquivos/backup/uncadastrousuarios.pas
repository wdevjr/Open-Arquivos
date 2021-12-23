unit uncadastrousuarios;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DB,
  DBCtrls, ZDataset, LResources, dbf, LR_DBSet, LR_Class, LR_BarC, ImgList, ToolWin,
  Menus, GifAnim, DateUtils, WinInet;

type

  { TFrmCadastrodeUsuarios }

  TFrmCadastrodeUsuarios = class(TForm)
    SpeedButton2: TSpeedButton;
    cancelar: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    Dtscu: TDataSource;
    editar: TBitBtn;
    excluir: TBitBtn;
    gravar: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    ImageList1: TImageList;
    inserir: TBitBtn;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    PanelPerfil: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    spPerfil: TSpeedButton;
    spPesqu: TSpeedButton;
    trazerj: TBitBtn;
    procedure cancelarClick(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure DtscuStateChange(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure spPerfilClick(Sender: TObject);
    procedure spPesquClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
  private
    procedure ListarUser;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  public
    NomePerfilTempCad: string;
    checadoPerfilTipoPUser: boolean;
    checadoPerfilTipo: boolean;
  end;

var
  NomeuserPerfil: string;
  checadoNivelUser: integer;
  checadoUser: integer;
  RecebeValor: integer;
  FrmCadastrodeUsuarios: TFrmCadastrodeUsuarios;

implementation

{$R *.lfm}

uses UnDM, unLogin, UDMII, undlgpesquisaUsuario, UnCadPerfil,
  UnDlgProcuraPerfil, UnDlgProcuraPerfilUser;

{ TFrmCadastrodeUsuarios }

procedure TFrmCadastrodeUsuarios.ConfigInserir;
begin
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmCadastrodeUsuarios.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadastrodeUsuarios.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadastrodeUsuarios.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.close;
end;

procedure TFrmCadastrodeUsuarios.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmCadastrodeUsuarios.ListarUser;
var
  ListItem: TListItem;
begin
  //ListView1.Clear;
  //DM.sds_Open.Refresh;
  //DM.sds_Open.First;
  //while not DM.sds_Open.EOF do
  //begin
  //  ListItem := ListView1.Items.Add;
  //  if DM.sds_OpenADMINISTRADOR.Value = 0 then
  //  begin
  //    ListItem.ImageIndex := 2;
  //  end
  //  else
  //  begin
  //    ListItem.ImageIndex := 1;
  //  end;
  //  ListItem.Caption := DM.sds_OpenLOGIN.Value;
  //  ListItem.SubItems.Add(DM.sds_OpenNOME.Value);
  //  if DM.sds_OpenADMINISTRADOR.Value = 0 then
  //  begin
  //    ListItem.SubItems.Add('Usuário');
  //  end
  //  else
  //  begin
  //    ListItem.SubItems.Add('Administrador');
  //  end;
  //  if DM.sds_OpenTIPO_TODOS.Value = 0 then
  //  begin
  //    ListItem.SubItems.Add('Não');
  //  end
  //  else
  //  begin
  //    ListItem.SubItems.Add('Sim');
  //  end;
  //  ListItem.SubItems.Add(DM.sds_OpenNOMEL.Value);
  //  ListItem.SubItems.Add(DM.sds_OpenDATA.AsString);
  //  DM.sds_Open.Next;
  //  if DM.sds_Open.RecordCount > 0 then
  //    ListView1.ItemIndex := 0;
  //end;
end;

procedure TFrmCadastrodeUsuarios.inserirClick(Sender: TObject);
begin
  if not Dtscu.DataSet.Active then
    Dtscu.DataSet.Open;
  Dtscu.DataSet.Append;
  ConfigInserir;
  DBEdit2.SetFocus;
  DBEdit6.EditMask := '__/__/____';
  //DBCheckBox1.State := cbUnchecked;
  //DBCheckBox2.State := cbUnchecked;
  //DBCheckBox3.State := cbUnchecked;
  with DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;
  if (FrmLogin.ADMIN = 0) then
  begin
    excluir.Enabled := False;
  end
  else
  begin
    excluir.Enabled := True;
  end;

end;

procedure TFrmCadastrodeUsuarios.SpeedButton1Click(Sender: TObject);
begin
  DM.cds_User.Close;
  DM.cds_User.Params[0].AsInteger := DM.receberUsuario;
  DM.cds_User.Open;
  if (FrmLogin.ADMIN = 0) then
  begin
    excluir.Enabled := False;
  end
  else
  begin
    excluir.Enabled := True;
  end;

  with DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;
end;

procedure TFrmCadastrodeUsuarios.SpeedButton3Click(Sender: TObject);
begin
  Dtscu.DataSet.Close;
end;

procedure TFrmCadastrodeUsuarios.spPerfilClick(Sender: TObject);
begin
  FrmCadPerfil := TFrmCadPerfil.Create(Application);
  try
    FrmCadPerfil.ShowModal;
  finally
    FrmCadPerfil.Free;
  end;
  with DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;
end;

procedure TFrmCadastrodeUsuarios.spPesquClick(Sender: TObject);
begin
  FrmDlgProcuraPerfilUser := TFrmDlgProcuraPerfilUser.Create(self, DMII.sds_Pesq_PL);
  try
    if FrmDlgProcuraPerfilUser.ShowModal = mrOk then
    begin
      if Dtscu.State = dsBrowse then
        DM.cds_User.Edit;
      DM.cds_UserCOD_PERFIL.AsInteger := DMII.sds_Pesq_PLCODIGO.AsInteger;
      DM.cds_UserNOMEL.AsString := DMII.sds_Pesq_PLNOMEL.AsString;
    end;
  finally
    DMII.sds_Pesq_PL.Close;
    FrmDlgProcuraPerfilUser.Free;
  end;
end;

procedure TFrmCadastrodeUsuarios.TabSheet1Show(Sender: TObject);
begin
  DBEdit6.EditMask := '__/__/____';
end;

procedure TFrmCadastrodeUsuarios.trazerjClick(Sender: TObject);
begin
  FrmPesquisaUsuario := TFrmPesquisaUsuario.Create(self);
  try
    if FrmPesquisaUsuario.ShowModal = mrOk then
    begin
      DM.cds_User.Close;
      DM.cds_User.Params[0].AsInteger := DM.SimpleDataSetUseNomeCOD_USUARIO.AsInteger;
      DM.cds_User.Open;
    end;
  finally
    DM.SimpleDataSetUseNome.Close;
    FrmPesquisaUsuario.Free;
  end;
  with DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;

  if (FrmLogin.ADMIN = 0) then
  begin
    excluir.Enabled := False;
  end
  else
  begin
    excluir.Enabled := True;
  end;
end;

procedure TFrmCadastrodeUsuarios.gravarClick(Sender: TObject);
var
  mensagem, campoEmBranco, TipoUser: string;
  num: integer;
begin
  checadoUser := FrmLogin.ADMIN;
  TipoUser := '';
  mensagem := '';
  if checadoUser = 1 then
  begin
    if (DBEdit2.Text = '') then
    begin
      MessageDlg('O Campo Nome esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit3.Text = '') then
    begin
      MessageDlg('O Campo Login esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit4.Text = '') then
    begin
      MessageDlg('O Campo Senha esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit6.Text = '') or (DBEdit6.EditMask = '__/__/____') then
    begin
      MessageDlg('O Campo Data esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBCheckBox1.State = cbGrayed) then
    begin
      MessageDlg('Verifique o Campo Administrador, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBCheckBox2.State = cbGrayed) then
    begin
      MessageDlg
      ('Verifique o Campo Extrair, Preencha-o ou Não!',
        mtWarning, [mbOK], 0);
    end
    else if (DBCheckBox3.State = cbGrayed) then
    begin
      MessageDlg
      ('Verifique o Campo Visualizar Todos os Arquivos, Preencha-o ou Não!',
        mtWarning, [mbOK], 0);
    end
    else if (DBEdit5.Text = '') then
    begin
      MessageDlg
      ('Verifique o Campo Configuração do Perfil esta em Branco, Preencha-o!',
        mtWarning, [mbOK], 0);
    end;
    num := DM.cds_UserADMINISTRADOR.Value;
    if num = 1 then
    begin
      TipoUser := 'Administrador:  ';
    end
    else
    begin
      TipoUser := 'Usuário:  ';
    end;
    if (DBCheckBox1.State <> cbGrayed) and (DBCheckBox2.State <> cbGrayed) and
      (DBCheckBox3.State <> cbGrayed) and (DBEdit5.Text <> '') then
    begin
      try

        Dtscu.DataSet.Post;
        (Dtscu.DataSet as TZQuery).ApplyUpdates;
        (Dtscu.DataSet as TZQuery).CommitUpdates;

      except
        on E: Exception do
        begin
          MessageDlg('Erro ao gravar!', 'Erro ao cadastrar Usuário' +
            E.Message, mtError, [mbOK], 0);
        end;
      end;
      ConfigGravar;
      ListarUser;
      mensagem := #13 + 'O ' + TipoUser + DBEdit2.Text + ' de' + #13 +
        'Login' + ' ' + DBEdit3.Text + #13 + #13 +
        'Devera Reiniciar o Open Arquivos para que as configurações ' +
        #13 + 'tenham efeito!' + #13;
      Application.MessageBox(PChar(mensagem), 'Aviso Importante!',
        MB_OK + MB_ICONINFORMATION);
    end;
  end
  else if checadoUser = 0 then
  begin
    if (DBEdit2.Text = '') then
    begin
      MessageDlg('O Campo Nome esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit3.Text = '') then
    begin
      MessageDlg('O Campo Login esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit4.Text = '') then
    begin
      MessageDlg('O Campo Senha esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else
    begin
      // DBEdit4.Text := StrToInt(100);
      Dtscu.DataSet.Post;
      (Dtscu.DataSet as TZQuery).ApplyUpdates;
      (Dtscu.DataSet as TZQuery).CommitUpdates;
      ConfigGravar;
      ListarUser;
      num := DM.cds_UserADMINISTRADOR.Value;
      if num = 1 then
      begin
        TipoUser := 'Administrador:  ';
      end
      else
      begin
        TipoUser := 'Usuário:  ';
      end;
      mensagem := #13 + 'O ' + TipoUser + DBEdit2.Text + ' de' + #13 +
        'Login' + ' ' + DBEdit3.Text + #13 + #13 +
        'Devera Reiniciar o Open Arquivos para que as configurações ' +
        #13 + 'tenham efeito!' + #13;

      Application.MessageBox(PChar(mensagem), 'Aviso Importante!',
        MB_OK + MB_ICONWARNING);
    end;
  end;
  if (FrmLogin.ADMIN = 0) then
  begin
    excluir.Enabled := False;
  end
  else
  begin
    excluir.Enabled := True;
  end;
end;

procedure TFrmCadastrodeUsuarios.editarClick(Sender: TObject);
var
  mensagem, campoEmBranco, TipoUser: string;
  num: integer;
begin
  checadoUser := FrmLogin.ADMIN;
  TipoUser := '';
  mensagem := '';
  if (DBEdit2.Text <> '') and (DBEdit3.Text <> '') and (DBEdit4.Text <> '') then
  begin
    if checadoUser = 1 then
    begin
      if (DBCheckBox1.State <> cbGrayed) and (DBCheckBox2.State <> cbGrayed) and
        (DBCheckBox3.State <> cbGrayed) and (DBEdit4.Text <> '') then
      begin
        try
        Dtscu.DataSet.Edit;
        (Dtscu.DataSet as TZQuery).ApplyUpdates;
        (Dtscu.DataSet as TZQuery).CommitUpdates;
        except
        on E: Exception do
        begin
          MessageDlg('Erro ao editar!', 'Erro ao Editar Usuário' +
            E.Message, mtError, [mbOK], 0);
        end;
      end;
        ConfigGravar;
        ListarUser;
        num := DM.cds_UserADMINISTRADOR.Value;
        if num = 1 then
        begin
          TipoUser := 'Administrador:  ';
        end
        else
        begin
          TipoUser := 'Usuário:  ';
        end;
        mensagem := #13 + 'O ' + TipoUser + DBEdit2.Text + ' de' +
          #13 + 'Login' + ' ' + DBEdit3.Text + #13 + #13 +
          'Devera Reiniciar o Open Arquivos para que as configurações ' +
          #13 + 'tenham efeito!' + #13;

        Application.MessageBox(PChar(mensagem), 'Aviso Importante!',
          MB_OK + MB_ICONINFORMATION);

      end
      else
      begin
        campoEmBranco := #13 + 'Os campos: ' + #13 + #13 +
          '"Administrador" ou ' + #13 + '"Verificar Todos os Arquivos" ou' +
          #13 + '"Configuração do Perfil"' + #13 + #13 + #13 +
          'Encontran-se em BRANCO !' + #13 + #13 +
          'Favor Verificá-los !!!' + #13;

        Application.MessageBox(PChar(campoEmBranco), 'Perigo: Campo em Branco!',
          MB_OK + MB_ICONWARNING);
      end;
    end
    else if checadoUser = 0 then
    begin
      Dtscu.DataSet.Post;
      (Dtscu.DataSet as TZQuery).ApplyUpdates;
      (Dtscu.DataSet as TZQuery).CommitUpdates;
      ConfigGravar;
      ListarUser;
      num := DM.cds_UserADMINISTRADOR.Value;
      if num = 1 then
      begin
        TipoUser := 'Administrador:  ';
      end
      else
      begin
        TipoUser := 'Usuário:  ';
      end;
      mensagem := #13 + 'O ' + TipoUser + DBEdit2.Text + ' de' + #13 +
        'Login' + ' ' + DBEdit3.Text + #13 + #13 +
        'Devera Reiniciar o Open Arquivos para que as configurações ' +
        #13 + 'tenham efeito!' + #13;

      Application.MessageBox(PChar(mensagem), 'Aviso Importante!',
        MB_OK + MB_ICONWARNING);
    end;

  end
  else
  begin
    MessageDlg('Algum campo esta em branco, Preencha-o!', mtWarning, [mbOK], 0);
    Abort;
  end;
  if (FrmLogin.ADMIN = 0) then
  begin
    excluir.Enabled := False;
  end
  else
  begin
    excluir.Enabled := True;
  end;
end;

procedure TFrmCadastrodeUsuarios.cancelarClick(Sender: TObject);
begin
  Dtscu.DataSet.Cancel;

  with Dtscu.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
  end;
  if (FrmLogin.ADMIN = 0) then
  begin
    excluir.Enabled := False;
  end
  else
  begin
    excluir.Enabled := True;
  end;
end;

procedure TFrmCadastrodeUsuarios.DBEdit6KeyDown(Sender: TObject;
  var Key: word; Shift: TShiftState);
begin
  if (key = VK_BACK) or (key = VK_DELETE) then
  begin
    DBEdit6.EditMask := '';
  end;
end;

procedure TFrmCadastrodeUsuarios.DtscuStateChange(Sender: TObject);
begin
  with Dtscu.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtscu.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtscu.State in [dsInsert];
    editar.Enabled := Dtscu.State in [dsEdit];
    cancelar.Enabled := Dtscu.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtscu.State in [dsBrowse];
    // trazerj.Enabled:=Dtscu.State in [dsBrowse,dsInactive];

    // trazerj.Enabled:=Dtscu.State in [dsBrowse,dsInactive];
  end;
end;

procedure TFrmCadastrodeUsuarios.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir este Usuário?', mtConfirmation, [mbYes, mbNo], 0) =
    mrYes) then
  begin
    try
    Dtscu.DataSet.Delete;
    (Dtscu.DataSet as TZQuery).ApplyUpdates;
    (Dtscu.DataSet as TZQuery).CommitUpdates;
    except
        on E: Exception do
        begin
          MessageDlg('Erro ao excluir!', 'Erro ao Deletar o Usuário' +
            E.Message, mtError, [mbOK], 0);
        end;
    end;
    DBCheckBox1.State := cbUnchecked;
    DBCheckBox2.State := cbUnchecked;
    DBCheckBox3.State := cbUnchecked;
    NomePerfilTempCad := '';
    NomeuserPerfil := '';
    ConfigExcluir;
    ListarUser;
  end;
  with DM.cds_User do
  begin
    excluir.Enabled := not IsEmpty;
  end;
end;

procedure TFrmCadastrodeUsuarios.FormActivate(Sender: TObject);
begin
  //Color := DM.myColor;
  Panel4.Color := DM.myColor;

end;

procedure TFrmCadastrodeUsuarios.FormShow(Sender: TObject);
begin
  DBEdit6.EditMask := '__/__/____';
  DM.sds_Open.Open;
  ListarUser;
  DMII.CarregaPerfil;
  with DM.cds_User do
  begin
    excluir.Enabled := not IsEmpty;
    spPesqu.Enabled := not IsEmpty;
  end;
  ConfigInicial;
  checadoUser := DM.receberValor;
  if (FrmLogin.ADMIN = 0) then
  begin
    DBCheckBox1.Visible := False;
    DBCheckBox2.Visible := False;
    DBCheckBox3.Visible := False;
    PanelPerfil.Visible := False;
    DBEdit4.PasswordChar := '*';
    excluir.Enabled := False;
  end
  else
  begin
    DBCheckBox1.Visible := True;
    DBCheckBox2.Visible := True;
    DBCheckBox3.Visible := True;
    PanelPerfil.Visible := True;
    DBEdit4.PasswordChar := #0;
    excluir.Enabled := True;
  end;
  with Dtscu.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    gravar.Enabled := not IsEmpty;
    cancelar.Enabled := not IsEmpty;
  end;

  if DMII.sdt_Verif_Perfil.FieldByName('USUARIO_INSERIR').AsString = 'S' then
  begin
    inserir.Visible := True;
  end;
  // else
  // begin
  // inserir.Visible := False;
  // end;
  if DMII.sdt_Verif_Perfil.FieldByName('USUARIO_EDITAR').AsString = 'S' then
  begin
    editar.Visible := True;
  end
  else
  begin
    editar.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('USUARIO_EXCLUIR').AsString = 'S' then
  begin
    excluir.Visible := True;
  end
  else
  begin
    excluir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('USUARIO_TRAZER').AsString = 'S' then
  begin
    trazerj.Visible := True;
  end
  else
  begin
    trazerj.Visible := False;
  end;
  if FrmLogin.ADMIN = 1 then
  begin
    DBCheckBox1.Visible := True;
    DBCheckBox2.Visible := True;
    DBCheckBox3.Visible := True;
    spPesqu.Visible := True;
    DBEdit4.Visible := True;
    spPerfil.Visible := True;
    DBEdit4.PasswordChar := #0;
  end
  else
  begin
    DBCheckBox1.Visible := False;
    DBCheckBox2.Visible := False;
    DBCheckBox3.Visible := False;
    spPesqu.Visible := False;
    DBEdit4.Visible := True;
    spPerfil.Visible := False;
    // Panel6.Visible := false;
    inserir.Visible := True;
    gravar.Visible := True;
    // editar.Visible := True;
    // trazerj.Visible := True;
    excluir.Visible := True;
    DBEdit4.PasswordChar := '*';
  end;

  with Dtscu.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    gravar.Enabled := not IsEmpty;
    cancelar.Enabled := not IsEmpty;
  end;

end;



{ TFrmCadastrodeUsuarios }

end.
