// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnCadAutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, StdCtrls, Mask, DBCtrls, Buttons, DBClient,
  Grids, DBGrids;

type
  TFrmCadAutor = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
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
    inserir: TSpeedButton;
    gravar: TSpeedButton;
    excluir: TSpeedButton;
    cancelar: TSpeedButton;
    trazerj: TSpeedButton;
    SpeedButton1: TSpeedButton;
    editar: TSpeedButton;
    Label7: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    Image2: TImage;
    Label8: TLabel;
    BitBtnLocalizar: TBitBtn;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    ListView1: TListView;
    DtsrcGrid: TDataSource;
    DBEdit4: TDBEdit;
    BitLocalizarCid: TBitBtn;
    DBText3: TDBText;
    Label9: TLabel;
    DBText4: TDBText;
    procedure BitLocalizarCidClick(Sender: TObject);
    procedure BitBtnLocalizarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    { Public declarations }
  end;

var
  FrmCadAutor: TFrmCadAutor;

implementation

uses UDM, UDMII, UnDlgProcuraAutor, UnDlgProcuraDepartamento;

{$R *.dfm}

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
  // DM.cds_Autores.Close;
end;

procedure TFrmCadAutor.BitLocalizarCidClick(Sender: TObject);
begin
  FrmDlgProcuraDepartamento := TFrmDlgProcuraDepartamento.Create(Self,
    DM.sds_Qry_Cidades);
  FrmDlgProcuraDepartamento.Label1.Caption := '';
  FrmDlgProcuraDepartamento.Label1.Caption := 'CIDADES:';
  begin
    try
      if FrmDlgProcuraDepartamento.ShowModal = mrOk then
      begin
        if Dtsc.State = dsBrowse then
          DM.cds_Autores.Edit;
        DM.cds_AutoresCOD_CIDADE.AsInteger :=
          DM.sds_Qry_CidadesCODIGO.AsInteger;
        DM.cds_AutoresNOME_CIDADE.AsString :=
          DM.sds_Qry_CidadesNOME_CIDADE.AsString;
        DM.cds_AutoresUF.AsString := DM.sds_Qry_CidadesUF.AsString;
      end;
    finally
      DM.sds_Qry_Cidades.Close;
      FrmDlgProcuraDepartamento.Free;
    end;
  end;
end;

procedure TFrmCadAutor.BitBtnLocalizarClick(Sender: TObject);
begin
  FrmDlgProcuraDepartamento := TFrmDlgProcuraDepartamento.Create(Self,
    DM.sds_Qry_Nome);
  FrmDlgProcuraDepartamento.Label1.Caption := '';
  FrmDlgProcuraDepartamento.Label1.Caption := 'DEPARTAMENTOS:';
  begin
    try
      if FrmDlgProcuraDepartamento.ShowModal = mrOk then
      begin
        if Dtsc.State = dsBrowse then
          DM.cds_Autores.Edit;
        DM.cds_AutoresCOD_DEPARTAMENTO.AsInteger :=
          DM.sds_Qry_NomeCODIGO.AsInteger;
        DM.cds_AutoresNOME_DEP.AsString := DM.sds_Qry_NomeNOME_DEP.AsString;
      end;
    finally
      DM.sds_Qry_Nome.Close;
      FrmDlgProcuraDepartamento.Free;
      BitLocalizarCid.SetFocus;
    end;
  end;
end;

procedure TFrmCadAutor.cancelarClick(Sender: TObject);
begin
  Dtsc.DataSet.Cancel;
  ConfigCancelar;
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
  ListView1.Clear;
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
  end;
end;

procedure TFrmCadAutor.ListView1CustomDrawItem(Sender: TCustomListView;
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

procedure TFrmCadAutor.SpeedButton1Click(Sender: TObject);
begin
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
    excluir.Enabled := Dtsc.State in [dsBrowse];
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
  else if DBEdit5.Text = '  /  /    ' then
  begin
    MessageDlg('Preencha o campo Data!', mtWarning, [mbOK], 0);
  end
  else
  begin
    Dtsc.DataSet.Post;
    (Dtsc.DataSet as TClientDataset).ApplyUpdates(0);
    ListarAutor;
  end;
end;

procedure TFrmCadAutor.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir este Registro?', mtConfirmation, [mbYes, mbNo],
    0) = mrYes) then
  begin
    Dtsc.DataSet.Delete;
    (Dtsc.DataSet as TClientDataset).ApplyUpdates(0);
    ConfigExcluir;
    ListarAutor;
  end;
end;

procedure TFrmCadAutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.sds_Autores.Close;
  DM.cds_Autores.Close;
  Action := caFree;
  FrmCadAutor := nil;
end;

procedure TFrmCadAutor.FormShow(Sender: TObject);
begin
  ConfigInicial;
  DM.sds_OpenAutorList.Open;
  ListarAutor;
  // if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_INSERIR').AsString = 'S' then
  // begin
  // inserir.Visible := True;
  // end
  // else
  // begin
  // inserir.Visible := False;
  // end;
  // if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_EDITAR').AsString = 'S' then
  // begin
  // editar.Visible := True;
  // end
  // else
  // begin
  // editar.Visible := False;
  // end;
  // if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_EXCLUIR').AsString = 'S' then
  // begin
  // excluir.Visible := True;
  // end
  // else
  // begin
  // excluir.Visible := False;
  // end;
  // if DMII.sdt_Verif_Perfil.FieldByName('AUTORES_TRAZER').AsString = 'S' then
  // begin
  // trazerj.Visible := True;
  // end
  // else
  // begin
  // trazerj.Visible := False;
  // end;
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
  else if DBEdit5.Text = '  /  /    ' then
  begin
    MessageDlg('Preencha o campo Data!', mtWarning, [mbOK], 0);
  end
  else
  begin
    Dtsc.DataSet.Post;
    (Dtsc.DataSet as TClientDataset).ApplyUpdates(0);
    ConfigGravar;
    ListarAutor;
  end;
end;

procedure TFrmCadAutor.inserirClick(Sender: TObject);
begin
  if not Dtsc.DataSet.Active then
    Dtsc.DataSet.Open;
  Dtsc.DataSet.Append;
  ConfigInserir;
end;

end.
