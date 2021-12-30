// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnCadAssuntos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, DBCtrls, ComCtrls, Buttons, ZDataset;

type

  { TFrmCadAssuntos }

  TFrmCadAssuntos = class(TForm)
    cancelar: TBitBtn;
    editar: TBitBtn;
    excluir: TBitBtn;
    gravar: TBitBtn;
    inserir: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Dtsc: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Panel4: TPanel;
    DBText1: TDBText;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Image2: TImage;
    Timer1: TTimer;
    trazerj: TBitBtn;
    procedure editarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
    procedure FormShow(Sender: TObject);
    procedure DtscStateChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ListarAssunto;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  end;

var
  FrmCadAssuntos: TFrmCadAssuntos;

implementation

uses UnDlgProcuraAssunto, UnDM, UDMII;

{$R *.lfm}

procedure TFrmCadAssuntos.ConfigInserir;
begin
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmCadAssuntos.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadAssuntos.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadAssuntos.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
  DM.cds_Assunt.Close;
end;

procedure TFrmCadAssuntos.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmCadAssuntos.ListarAssunto;
var
  ListItem: TListItem;
begin
  {ListView1.Clear;
  DM.sds_OpenAssunt.Refresh;
  DM.sds_OpenAssunt.First;
  while not DM.sds_OpenAssunt.Eof do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := DM.sds_OpenAssuntTITULOASSUN.Value;
    ListItem.SubItems.Add(DM.sds_OpenAssuntCURSO.Value);
    ListItem.SubItems.Add(DM.sds_OpenAssuntDATA.AsString);
    DM.sds_OpenAssunt.Next;
    if DM.sds_OpenAssunt.RecordCount > 0 then
      ListView1.ItemIndex := 0;
  end;  }
end;

procedure TFrmCadAssuntos.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
begin
{  with ListView1.Canvas.Brush do
  begin
    if (Item.Index mod 2) = 0 then
      Color := $00CBEAEB
    else
      Color := $00FFF4F4;
  end;  }
end;

procedure TFrmCadAssuntos.cancelarClick(Sender: TObject);
begin
  Dtsc.DataSet.Cancel;
 end;

procedure TFrmCadAssuntos.DtscStateChange(Sender: TObject);
begin
  with Dtsc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsc.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtsc.State in [dsInsert];
    editar.Enabled := Dtsc.State in [dsEdit];
    cancelar.Enabled := Dtsc.State in [dsInsert, dsEdit];
    if (Dtsc.State = dsInsert) then
    begin
      excluir.Enabled := False;
    end;
    if (Dtsc.State = dsEdit) then
    begin
      excluir.Enabled := False;
    end;
    //excluir.Enabled := Dtsc.State in [dsBrowse];
    trazerj.Enabled := Dtsc.State in [dsbrowse, dsInactive];
  end;
end;

procedure TFrmCadAssuntos.editarClick(Sender: TObject);
begin
  if (DBEdit2.Text = '') then
  begin
    MessageDlg('Preencha o campo Título!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit4.Text = '') then
  begin
    MessageDlg('Preencha o campo Curso/Especialização/Relação!', mtWarning,
      [mbOK], 0);
  end
  else if DBEdit3.Text = '  /  /    ' then
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
        MessageDlg('Erro ao Ediar!',
          'Erro na Edição de Assuntos: mensagem nativa do Banco: ' +
          E.Message, mtError, [mbOK], 0);
      end;
    end;
    //ListarAssunto;
  end;
end;

procedure TFrmCadAssuntos.FormActivate(Sender: TObject);
begin
  Color := DM.myColor;
  Panel3.Color := DM.myColor;
end;

procedure TFrmCadAssuntos.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // Action := caFree;
  // important: set pointer to nil!
  FrmCadAssuntos := nil;
  // DM.cds_Assunt.close;
  Dtsc.DataSet.Cancel;
end;

procedure TFrmCadAssuntos.excluirClick(Sender: TObject);
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
        MessageDlg('Erro ao Excluir!',
          'Erro ao Deletar Assuntos: mensagem nativa do Banco: ' + E.Message,
          mtError, [mbOK], 0);
      end;
    end;
    ConfigExcluir;
  end;
end;



procedure TFrmCadAssuntos.FormShow(Sender: TObject);
begin
  ConfigInicial;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_INSERIR').AsString = 'S' then
  begin
    inserir.Visible := True;
  end
  else
  begin
    inserir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_EDITAR').AsString = 'S' then
  begin
    editar.Visible := True;
  end
  else
  begin
    editar.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_EXCLUIR').AsString = 'S' then
  begin
    excluir.Visible := True;
  end
  else
  begin
    excluir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_TRAZER').AsString = 'S' then
  begin
    trazerj.Visible := True;
  end
  else
  begin
    trazerj.Visible := False;
  end;
end;

procedure TFrmCadAssuntos.gravarClick(Sender: TObject);
begin
  if (DBEdit2.Text = '') then
  begin
    MessageDlg('Preencha o campo Título!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit4.Text = '') then
  begin
    MessageDlg('Preencha o campo Curso/Especialização/Relação!', mtWarning,
      [mbOK], 0);
  end
  else if (DBEdit3.Text = '') or (DBEdit3.EditMask = '__/__/____') then
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
        MessageDlg('Erro ao Gravar!',
          'Erro no Cadastro de Assuntos: mensagem nativa do Banco: ' +
          E.Message, mtError, [mbOK], 0);
      end;
    end;
    ConfigGravar;
    // ListarAssunto;
  end;

end;

procedure TFrmCadAssuntos.inserirClick(Sender: TObject);
begin
  if not Dtsc.DataSet.Active then
    Dtsc.DataSet.Open;
  Dtsc.DataSet.Append;
  ConfigInserir;
end;

procedure TFrmCadAssuntos.SpeedButton1Click(Sender: TObject);
begin
  Dtsc.DataSet.Cancel;
  Close;
end;

procedure TFrmCadAssuntos.Timer1Timer(Sender: TObject);
begin
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_INSERIR').AsString = 'S' then
  begin
    inserir.Visible := True;
  end
  else
  begin
    inserir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_EDITAR').AsString = 'S' then
  begin
    editar.Visible := True;
  end
  else
  begin
    editar.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_EXCLUIR').AsString = 'S' then
  begin
    excluir.Visible := True;
  end
  else
  begin
    excluir.Visible := False;
  end;
  if DMII.sdt_Verif_Perfil.FieldByName('ASSUNTOS_TRAZER').AsString = 'S' then
  begin
    trazerj.Visible := True;
  end
  else
  begin
    trazerj.Visible := False;
  end;
end;

procedure TFrmCadAssuntos.trazerjClick(Sender: TObject);
begin
  FrmLocalizaAssunto := TFrmLocalizaAssunto.Create(Self, DM.sds_Assunt_Cad);
  try
    if FrmLocalizaAssunto.ShowModal = mrOk then
    begin
      DM.cds_Assunt.Close;
      DM.cds_Assunt.Params[0].AsInteger := DM.sds_Assunt_CadCODIGO.AsInteger;
      DM.cds_Assunt.Open;
    end;
  finally
    DM.sds_Assunt_Cad.Close;
    FrmLocalizaAssunto.Free;
  end;
end;

end.
