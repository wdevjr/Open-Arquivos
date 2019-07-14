// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnContrUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, jpeg, ImgList, Buttons, DB, DBCtrls,
  Mask, DBClient, MidasLib, SimpleDS, ExtDlgs, System.ImageList;

type
  TFrmContrUser = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Label8: TLabel;
    Image1: TImage;
    Dtscu: TDataSource;
    Panel4: TPanel;
    Panel6MenuPrinc: TPanel;
    inserir: TSpeedButton;
    gravar: TSpeedButton;
    excluir: TSpeedButton;
    cancelar: TSpeedButton;
    trazerj: TSpeedButton;
    SpeedButton1: TSpeedButton;
    editar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel10: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBCheckBox1: TDBCheckBox;
    PanelPerfil: TPanel;
    Label7: TLabel;
    spPesqu: TSpeedButton;
    DBText3: TDBText;
    DBEdit4: TDBEdit;
    spPerfil: TSpeedButton;
    Panel3: TPanel;
    Image2: TImage;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    ListView1: TListView;
    procedure spPesquClick(Sender: TObject);
    procedure spPerfilClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    // procedure BitBtn1Click(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DtscuStateChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure ListarUser;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  public

  end;

var
  FrmContrUser: TFrmContrUser;
  checadoNivelUser: integer;
  checadoUser: integer;
  RecebeValor: integer;

implementation

uses UDM, UDMII, UnLogin, UProjeto, UnCadPerfil,
  ULocalizarUser, UnDlgProcuraPerfilUser, UThema;

{$R *.dfm}

procedure TFrmContrUser.ConfigInserir;
begin
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmContrUser.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmContrUser.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmContrUser.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.close;
end;

procedure TFrmContrUser.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmContrUser.ListarUser;
var
  ListItem: TListItem;
begin
  ListView1.Clear;
  DM.sds_Open.Refresh;
  DM.sds_Open.First;
  while not DM.sds_Open.Eof do
  begin
    ListItem := ListView1.Items.Add;
    if DM.sds_OpenADMINISTRADOR.Value = 0 then
    begin
      ListItem.ImageIndex := 2;
    end
    else
    begin
      ListItem.ImageIndex := 1;
    end;
    ListItem.Caption := DM.sds_OpenLOGIN.Value;
    ListItem.SubItems.Add(DM.sds_OpenNOME.Value);
    if DM.sds_OpenADMINISTRADOR.Value = 0 then
    begin
      ListItem.SubItems.Add('Usuário');
    end
    else
    begin
      ListItem.SubItems.Add('Administrador');
    end;
    if DM.sds_OpenTIPO_TODOS.Value = 0 then
    begin
      ListItem.SubItems.Add('Não');
    end
    else
    begin
      ListItem.SubItems.Add('Sim');
    end;
    ListItem.SubItems.Add(DM.sds_OpenNOMEL.Value);
    DM.sds_Open.Next;
    if DM.sds_Open.RecordCount > 0 then
      ListView1.ItemIndex := 0;
  end;
end;

procedure TFrmContrUser.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  with ListView1.Canvas.Brush do
  begin
    if (Item.Index mod 2) = 0 then
      Color := $00CBEAEB
    else
      Color := $00FFF4F4;
  end;
end;

procedure TFrmContrUser.cancelarClick(Sender: TObject);
begin
  Dtscu.DataSet.Cancel;
  ConfigCancelar;
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

procedure TFrmContrUser.DtscuStateChange(Sender: TObject);
begin
  // if FrmLogin.ADMIN = 1 then
  // begin
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
  // end;
  { else
    begin
    with Dtscu.DataSet do
    begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtscu.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtscu.State in [dsInsert];
    editar.Enabled := False;
    cancelar.Enabled := Dtscu.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtscu.State in [dsBrowse];
    // trazerj.Enabled:=Dtscu.State in [dsBrowse,dsInactive];

    // trazerj.Enabled:=Dtscu.State in [dsBrowse,dsInactive];
    end;
    end; }
end;

procedure TFrmContrUser.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir este Usuário?', mtConfirmation, [mbYes, mbNo],
    0) = mrYes) then
  begin
    Dtscu.DataSet.Delete;
    (Dtscu.DataSet as TClientDataSet).ApplyUpdates(0);
    ConfigExcluir;
    ListarUser;
  end;
  with DM.cds_User do
  begin
    excluir.Enabled := not IsEmpty;
  end;

end;

procedure TFrmContrUser.FormShow(Sender: TObject);
begin
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
    DBEdit3.PasswordChar := '*';
    excluir.Enabled := False;
  end
  else
  begin
    DBCheckBox1.Visible := True;
    DBCheckBox2.Visible := True;
    DBCheckBox3.Visible := True;
    PanelPerfil.Visible := True;
    DBEdit3.PasswordChar := #0;
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
    DBEdit3.Visible := True;
    spPerfil.Visible := True;
    DBEdit3.PasswordChar := #0;
  end
  else
  begin
    DBCheckBox1.Visible := False;
    DBCheckBox2.Visible := False;
    DBCheckBox3.Visible := False;
    spPesqu.Visible := False;
    DBEdit3.Visible := True;
    spPerfil.Visible := False;
    // Panel6.Visible := false;
    inserir.Visible := True;
    gravar.Visible := True;
    // editar.Visible := True;
    // trazerj.Visible := True;
    excluir.Visible := True;
    DBEdit3.PasswordChar := '*';
  end;

  with Dtscu.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    gravar.Enabled := not IsEmpty;
    cancelar.Enabled := not IsEmpty;
  end;

end;

procedure TFrmContrUser.gravarClick(Sender: TObject);
var
  mensagem, campoEmBranco, TipoUser: String;
  num: integer;
begin
  checadoUser := FrmLogin.ADMIN;
  TipoUser := '';
  mensagem := '';
  if checadoUser = 1 then
  begin
    if (DBEdit1.Text = '') then
    begin
      MessageDlg('O Campo Nome esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit2.Text = '') then
    begin
      MessageDlg('O Campo Login esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit3.Text = '') then
    begin
      MessageDlg('O Campo Senha esta em branco, Preencha-o!', mtWarning,
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
        ('Verifique o Campo Visualizar Todos os Arquivos, Preencha-o ou Não!',
        mtWarning, [mbOK], 0);
    end
    else if (DBEdit4.Text = '') then
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
      (DBCheckBox3.State <> cbGrayed) and (DBEdit4.Text <> '') then
    begin
      Dtscu.DataSet.Post;
      (Dtscu.DataSet as TClientDataSet).ApplyUpdates(0);
      ConfigGravar;
      ListarUser;
      mensagem := #13 + 'O ' + TipoUser + DBEdit1.Text + ' de' + #13 +
        Label3.Caption + ' ' + DBEdit2.Text + #13 + #13 +
        'Devera Reiniciar o Sistema para que as configurações ' + #13 +
        'tenham efeito!' + #13;
      Application.MessageBox(PChar(mensagem), 'Aviso Importante!',
        MB_OK + MB_ICONINFORMATION);
    end;
  end
  else if checadoUser = 0 then
  begin
    if (DBEdit1.Text = '') then
    begin
      MessageDlg('O Campo Nome esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit2.Text = '') then
    begin
      MessageDlg('O Campo Login esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else if (DBEdit3.Text = '') then
    begin
      MessageDlg('O Campo Senha esta em branco, Preencha-o!', mtWarning,
        [mbOK], 0);
    end
    else
    begin
      // DBEdit4.Text := StrToInt(100);
      Dtscu.DataSet.Post;
      (Dtscu.DataSet as TClientDataSet).ApplyUpdates(0);
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
      mensagem := #13 + 'O ' + TipoUser + DBEdit1.Text + ' de' + #13 +
        Label3.Caption + ' ' + DBEdit2.Text + #13 + #13 +
        'Devera Reiniciar o Sistema para que as configurações ' + #13 +
        'tenham efeito!' + #13;

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

procedure TFrmContrUser.inserirClick(Sender: TObject);
begin
  if not Dtscu.DataSet.Active then
    Dtscu.DataSet.Open;
  Dtscu.DataSet.Append;
  ConfigInserir;
  DBEdit1.SetFocus;
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

procedure TFrmContrUser.SpeedButton1Click(Sender: TObject);
begin
  close;
  DM.cds_User.close;
end;

procedure TFrmContrUser.SpeedButton2Click(Sender: TObject);
begin
  DM.cds_User.close;
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

  With DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;
end;

procedure TFrmContrUser.SpeedButton3Click(Sender: TObject);
begin
  FrmThemas := TFrmThemas.Create(self);
  try
    FrmThemas.ShowModal;
  finally
    FrmThemas.Free;
  end;
end;

procedure TFrmContrUser.spPerfilClick(Sender: TObject);
begin
  FrmCadPerfil := TFrmCadPerfil.Create(Application);
  try
    FrmCadPerfil.ShowModal;
  finally
    FrmCadPerfil.Free;
  end;
  With DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;
end;

procedure TFrmContrUser.spPesquClick(Sender: TObject);
begin
  FrmDlgProcuraPerfilUser := TFrmDlgProcuraPerfilUser.Create(self,
    DMII.sds_Pesq_PL);
  try
    if FrmDlgProcuraPerfilUser.ShowModal = mrOk then
    begin
      if Dtscu.State = dsBrowse then
        DM.cds_User.Edit;
      DM.cds_UserCOD_PERFIL.AsInteger := DMII.sds_Pesq_PLCODIGO.AsInteger;
      DM.cds_UserNOMEL.AsString := DMII.sds_Pesq_PLNOMEL.AsString;
    end;
  finally
    DMII.sds_Pesq_PL.close;
    FrmDlgProcuraPerfilUser.Free;
  end;

end;

procedure TFrmContrUser.editarClick(Sender: TObject);
var
  mensagem, campoEmBranco, TipoUser: String;
  num: integer;
begin
  checadoUser := FrmLogin.ADMIN;
  TipoUser := '';
  mensagem := '';
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
  begin
    if checadoUser = 1 then
    begin
      if (DBCheckBox1.State <> cbGrayed) and (DBCheckBox2.State <> cbGrayed) and
        (DBCheckBox3.State <> cbGrayed) and (DBEdit4.Text <> '') then
      begin
        Dtscu.DataSet.Post;
        (Dtscu.DataSet as TClientDataSet).ApplyUpdates(0);
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
        mensagem := #13 + 'O ' + TipoUser + DBEdit1.Text + ' de' + #13 +
          Label3.Caption + ' ' + DBEdit2.Text + #13 + #13 +
          'Devera Reiniciar o Sistema para que as configurações ' + #13 +
          'tenham efeito!' + #13;

        Application.MessageBox(PChar(mensagem), 'Aviso Importante!',
          MB_OK + MB_ICONINFORMATION);

      end
      else
      begin
        campoEmBranco := #13 + 'Os campos: ' + #13 + #13 + '"Administrador" ou '
          + #13 + '"Verificar Todos os Arquivos" ou' + #13 +
          '"Configuração do Perfil"' + #13 + #13 + #13 +
          'Encontran-se em BRANCO !' + #13 + #13 +
          'Favor Verificá-los !!!' + #13;

        Application.MessageBox(PChar(campoEmBranco), 'Perigo: Campo em Branco!',
          MB_OK + MB_ICONWARNING);
      end;
    end
    else if checadoUser = 0 then
    begin
      Dtscu.DataSet.Post;
      (Dtscu.DataSet as TClientDataSet).ApplyUpdates(0);
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
      mensagem := #13 + 'O ' + TipoUser + DBEdit1.Text + ' de' + #13 +
        Label3.Caption + ' ' + DBEdit2.Text + #13 + #13 +
        'Devera Reiniciar o Sistema para que as configurações ' + #13 +
        'tenham efeito!' + #13;

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

procedure TFrmContrUser.trazerjClick(Sender: TObject);
begin
  FrmLocalizarUser := TFrmLocalizarUser.Create(self, DM.sdss_User);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DM.cds_User.close;
      DM.cds_User.Params[0].AsInteger := DM.sdss_UserCOD_USUARIO.AsInteger;
      DM.cds_User.Open;
    end;
  finally
    DM.sdss_User.close;
    FrmLocalizarUser.Free;
  end;
  With DM.cds_User do
  begin
    spPesqu.Enabled := not IsEmpty;
  end;

  With DM.cds_User do
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

end.
