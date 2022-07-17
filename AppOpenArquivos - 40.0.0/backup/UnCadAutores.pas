// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnCadAutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, StdCtrls, DBCtrls, Buttons,
  Grids, DBGrids, ZDataset;

type

  { TFrmCadAutor }

  TFrmCadAutor = class(TForm)
    cancelar: TBitBtn;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    editar: TBitBtn;
    excluir: TBitBtn;
    gravar: TBitBtn;
    inserir: TBitBtn;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Dtsc: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBText1: TDBText;
    Panel4: TPanel;
    Label7: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    Image2: TImage;
    Label8: TLabel;
    BitBtnLocalizar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    BitLocalizarCid: TBitBtn;
    Label9: TLabel;
    Timer1: TTimer;
    trazerj: TBitBtn;
    procedure BitLocalizarCidClick(Sender: TObject);
    procedure BitBtnLocalizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure DtscStateChange(Sender: TObject);
  private
    procedure ListarAutor;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  public
    NomePerfilTempCad: string;
    checadoPerfilTipoPUser: boolean;
    checadoPerfilTipo: boolean;
    checadoCidadeNome: boolean;
    checadoCidadeNomeP: boolean;
    checadoCidadeSigla: boolean;
    checadoCidadeSiglaP: boolean;
    NomeCidade: string;
    NomeCidadeSigla: string;
  end;

var
  NomeuserPerfil: string;
  NomeCidadeTemp: string;
  NomeCidadeSiglaTemp: string;
  FrmCadAutor: TFrmCadAutor;

implementation

uses UnDM, UDMII, UnDlgProcuraAutor, UnDlgProcuraDepartamento;

{$R *.lfm}

procedure TFrmCadAutor.ConfigInserir;
begin
  BitLocalizarCid.Enabled := True;
  BitBtnLocalizar.Enabled := True;
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmCadAutor.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  BitBtnLocalizar.Enabled := True;
  BitLocalizarCid.Enabled := True;
  // DM.cds_User.Close;
end;

procedure TFrmCadAutor.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  BitBtnLocalizar.Enabled := False;
  BitLocalizarCid.Enabled := False;
  DM.ZQueryOpenAutores.Close;
end;

procedure TFrmCadAutor.BitLocalizarCidClick(Sender: TObject);
begin
  FrmDlgProcuraDepartamento :=
    TFrmDlgProcuraDepartamento.Create(Self, DM.sds_Qry_Cidades);
  FrmDlgProcuraDepartamento.Label1.Caption := '';
  FrmDlgProcuraDepartamento.Label1.Caption := 'CIDADES:';
  begin
    try
      if FrmDlgProcuraDepartamento.ShowModal = mrOk then
      begin
       if (Dtsc.State = dsbrowse) or (Dtsc.State = dsInsert) then
          DM.cds_Autores.Edit;
        DM.cds_AutoresCOD_CIDADE.Value := DM.sds_Qry_CidadesCODIGO.AsInteger;
        DM.cds_AutoresNOME_CIDADE.Value := DM.sds_Qry_CidadesNOME_CIDADE.AsString;
        DM.cds_AutoresUF.Value:= DM.sds_Qry_CidadesUF.AsString;
      end;
    finally
      DM.sds_Qry_Cidades.Close;
      FrmDlgProcuraDepartamento.Free;
    end;
  end;
end;

procedure TFrmCadAutor.BitBtnLocalizarClick(Sender: TObject);
begin
  FrmDlgProcuraDepartamento :=
    TFrmDlgProcuraDepartamento.Create(Self, DM.sds_PesquiDep);
  FrmDlgProcuraDepartamento.Label1.Caption := '';
  FrmDlgProcuraDepartamento.Label1.Caption := 'DEPARTAMENTOS:';
  begin
    try
      if FrmDlgProcuraDepartamento.ShowModal = mrOk then
      begin
       if (Dtsc.State = dsbrowse) or (Dtsc.State = dsInsert) then
          DM.cds_Autores.Edit;
          DM.cds_AutoresCOD_DEPARTAMENTO.Value:= DM.sds_PesquiDepCODIGO.AsInteger;
          DM.cds_AutoresNOME_DEP.Value:= DM.sds_PesquiDepNOME_DEP.AsString;
      end;
    finally
      DM.sds_Autores.Close;
      FrmDlgProcuraDepartamento.Free;
    end;
  end;
end;

procedure TFrmCadAutor.FormActivate(Sender: TObject);
begin
  Color := DM.myColor;
  Panel2.Color := DM.myColor;
end;

procedure TFrmCadAutor.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DM.sds_Autores.Close;
  DM.cds_Autores.Close;
  FrmCadAutor:=nil;
  //Action := caFree;
 // FrmCadAutor := nil;
  {Label10.Caption := '';
   NomeuserPerfil:='';
   NomePerfilTempCad:='';
   NomeCidade:='';
   NomeCidadeTemp:='';
    Label11.Caption:='';
    Label12.Caption := '';
    NomeCidadeSigla:='';
    NomeCidadeSiglaTemp:='';
      Label10.Caption := '';
  Label11.Caption := '';
  Label12.Caption := '';
  DBEdit1.Text:='';
  DBEdit2.Text:='';
  DBEdit3.Text:='';
  DBEdit4.Text:='';
  DBEdit5.Text:='';
  DBEdit6.Text:='';}
end;

procedure TFrmCadAutor.cancelarClick(Sender: TObject);
begin
  Dtsc.DataSet.Cancel;
end;

procedure TFrmCadAutor.ConfigCancelar;
begin
  BitLocalizarCid.Enabled := False;
  BitBtnLocalizar.Enabled := False;
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  DM.cds_Autores.Close;
end;

procedure TFrmCadAutor.ConfigInicial;
begin
  BitLocalizarCid.Enabled := False;
  BitBtnLocalizar.Enabled := False;
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmCadAutor.ListarAutor;
var
  ListItem: TListItem;
begin
  {ListView1.Clear;
  DM.sds_OpenAutorList.Refresh;
  DM.sds_OpenAutorList.First;
  while not DM.sds_OpenAutorList.Eof do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := (DM.sds_OpenAutorListNOME.Value);
    ListItem.SubItems.Add(DM.sds_OpenAutorListINSTITUICAO.Value);
    ListItem.SubItems.Add(DM.sds_OpenAutorListNOME_DEP.Value);
    ListItem.SubItems.Add(DM.sds_OpenAutorListDATA.AsString);
    DM.sds_OpenAutorList.Next;
    if DM.sds_OpenAutorList.RecordCount > 0 then
      ListView1.ItemIndex := 0;
  end;  }
end;

procedure TFrmCadAutor.SpeedButton1Click(Sender: TObject);
begin
  DM.cds_Autores.Close;
  Close;

end;

procedure TFrmCadAutor.trazerjClick(Sender: TObject);
begin
  FrmLocalizarAutor := TFrmLocalizarAutor.Create(Self, DM.sds_Autores);
  try
    if FrmLocalizarAutor.ShowModal = mrOk then
    begin
      DM.cds_Autores.Close;
      DM.cds_Autores.Params[0].AsInteger := DM.sds_AutoresCODIGO.AsInteger;
      DM.cds_Autores.Open;
    end;
  finally
    DM.sds_Autores.Close;
    FrmLocalizarAutor.Free;
    BitBtnLocalizar.Enabled := True;
    BitLocalizarCid.Enabled := True;
  end;
end;

procedure TFrmCadAutor.DtscStateChange(Sender: TObject);
begin
  with Dtsc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsc.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtsc.State in [dsInsert];
    editar.Enabled := Dtsc.State in [dsEdit];
    cancelar.Enabled := Dtsc.State in [dsInsert, dsEdit];
    BitBtnLocalizar.Enabled := Dtsc.State in [dsInsert, dsEdit, dsBrowse];
    BitLocalizarCid.Enabled := Dtsc.State in [dsInsert, dsEdit, dsBrowse];
    if (Dtsc.State = dsInsert) then
    begin
      excluir.Enabled := False;
    end;
    if (Dtsc.State = dsEdit) then
    begin
      excluir.Enabled := False;
    end;
    //excluir.Enabled := Dtsc.State in [dsBrowse];
  end;
end;

procedure TFrmCadAutor.editarClick(Sender: TObject);
begin
  if (DBEdit2.Text = '') then
  begin
    MessageDlg('Preencha o campo Nome!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit3.Text = '') then
  begin
    MessageDlg('Preencha o campo Instituição!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit5.Text = '') or (DBEdit5.Text = '  /  /    ') then
  begin
    MessageDlg('Preencha o campo Data!', mtWarning, [mbOK], 0);
  end
  else
  begin
    try
    Dtsc.DataSet.Edit;
    (Dtsc.DataSet as TZQuery).ApplyUpdates;
    (Dtsc.DataSet as TZQuery).CommitUpdates;
    except
    on E: Exception do
    begin
      MessageDlg('Erro ao Editar!', 'Erro ao Editar Autores: mensagem nativa do Banco: ' +
        E.Message, mtError, [mbOK], 0);
    end;
      end;
    // ListarAutor;
  end;
end;

procedure TFrmCadAutor.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir este Registro?', mtConfirmation, [mbYes, mbNo], 0) =
    mrYes) then
  begin
   try
    Dtsc.DataSet.Delete;
    (Dtsc.DataSet as TZQuery).ApplyUpdates;
    (Dtsc.DataSet as TZQuery).CommitUpdates;
            except
        on E: Exception do
        begin
          MessageDlg('Erro ao Excluir!', 'Erro ao Deletar Assuntos: mensagem nativa do Banco: ' +
            E.Message, mtError, [mbOK], 0);
        end;
          end;
    ConfigExcluir;
    //ListarAutor;
  end;
end;



procedure TFrmCadAutor.FormShow(Sender: TObject);
begin
  ConfigInicial;
  //DM.sds_OpenAutorList.Open;
  //ListarAutor;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_INSERIR').AsString = 'S' then
  begin
    inserir.Visible := True;
  end
  else
  begin
    inserir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_EDITAR').AsString = 'S' then
  begin
    editar.Visible := True;
  end
  else
  begin
    editar.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_EXCLUIR').AsString = 'S' then
  begin
    excluir.Visible := True;
  end
  else
  begin
    excluir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_TRAZER').AsString = 'S' then
  begin
    trazerj.Visible := True;
  end
  else
  begin
    trazerj.Visible := False;
  end;

end;

procedure TFrmCadAutor.Timer1Timer(Sender: TObject);
begin
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_INSERIR').AsString = 'S' then
  begin
    inserir.Visible := True;
  end
  else
  begin
    inserir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_EDITAR').AsString = 'S' then
  begin
    editar.Visible := True;
  end
  else
  begin
    editar.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_EXCLUIR').AsString = 'S' then
  begin
    excluir.Visible := True;
  end
  else
  begin
    excluir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_TRAZER').AsString = 'S' then
  begin
    trazerj.Visible := True;
  end
  else
  begin
    trazerj.Visible := False;
  end;
end;

procedure TFrmCadAutor.gravarClick(Sender: TObject);
begin
  if DBEdit2.Text = '' then
  begin
    MessageDlg('Preencha o campo Nome!', mtWarning, [mbOK], 0);
  end
  else if DBEdit3.Text = '' then
  begin
    MessageDlg('Preencha o campo Instituição!', mtWarning, [mbOK], 0);
  end
  else if DBEdit1.Text = '' then
  begin
    MessageDlg('Preencha o campo Departamento!', mtWarning, [mbOK], 0);
  end
  else if DBEdit4.Text = '' then
  begin
    MessageDlg('Preencha o campo Cidade!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit5.Text = '') or (DBEdit5.EditMask = '__/__/____') then
  begin
    MessageDlg('Preencha o campo Data!', mtWarning, [mbOK], 0);
  end
  else
  begin
    try
    Dtsc.DataSet.Post;
    (Dtsc.DataSet as TZQuery).ApplyUpdates;
    (Dtsc.DataSet as TZQuery).CommitUpdates;
    except
    on E: Exception do
    begin
      MessageDlg('Erro ao Gravar!', 'Erro no Cadastro de Autores: mensagem nativa do Banco: ' +
        E.Message, mtError, [mbOK], 0);
    end;
      end;
  end;
end;

procedure TFrmCadAutor.inserirClick(Sender: TObject);
begin

  if not Dtsc.DataSet.Active then
    Dtsc.DataSet.Open;
  Dtsc.DataSet.Append;

end;

end.
