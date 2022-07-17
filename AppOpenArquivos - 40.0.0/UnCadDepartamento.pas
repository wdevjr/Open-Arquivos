unit UnCadDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DBCtrls, DB, ZDataset;

type

  { TFrmCadDepartamento }

  TFrmCadDepartamento = class(TForm)
    cancelar: TBitBtn;
    editar: TBitBtn;
    excluir: TBitBtn;
    gravar: TBitBtn;
    inserir: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    ListView1: TListView;
    Panel3: TPanel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Dtsrcd: TDataSource;
    trazerj: TBitBtn;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure DtsrcdStateChange(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure ListarDepartamentos;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
  public
    { Public declarations }
  end;

var
  FrmCadDepartamento: TFrmCadDepartamento;

implementation

{$R *.lfm}

uses UnDM, UnDlgProcuraDepartamento;

procedure TFrmCadDepartamento.ConfigInserir;
begin

  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
end;

procedure TFrmCadDepartamento.DtsrcdStateChange(Sender: TObject);
begin
  with Dtsrcd.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsrcd.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtsrcd.State in [dsInsert];
    editar.Enabled := Dtsrcd.State in [dsEdit];
    cancelar.Enabled := Dtsrcd.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtsrcd.State in [dsBrowse];
    trazerj.Enabled := Dtsrcd.State in [dsBrowse];
  end;
end;

procedure TFrmCadDepartamento.editarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') then
  begin
    MessageDlg('Preencha o campo Nome do Departamento!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit2.Text = '  /  /    ') then
  begin
    MessageDlg('Preencha o campo Data!', mtWarning, [mbOK], 0);
  end
  else
    Dtsrcd.DataSet.Post;
  (Dtsrcd.DataSet as TZQuery).ApplyUpdates;
  (Dtsrcd.DataSet as TZQuery).CommitUpdates;
  ListarDepartamentos;
end;

procedure TFrmCadDepartamento.excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Realmente Excluir esse Registro', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
  begin
    Dtsrcd.DataSet.Delete;
    (Dtsrcd.DataSet as TZQuery).ApplyUpdates;
    (Dtsrcd.DataSet as TZQuery).CommitUpdates;
  end;

end;


procedure TFrmCadDepartamento.FormShow(Sender: TObject);
begin
  ConfigInicial;
  DM.sds_OpenDep.Open;
  ListarDepartamentos;
end;

procedure TFrmCadDepartamento.gravarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') then
  begin
    MessageDlg('Preencha o campo Nome do Departamento!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit2.Text = '') or (DBEdit2.Text = '  /  /    ') then
  begin
    MessageDlg('Preencha o campo Data!', mtWarning, [mbOK], 0);
  end
  else
  begin
    Dtsrcd.DataSet.Post;
    (Dtsrcd.DataSet as TZQuery).ApplyUpdates;
    (Dtsrcd.DataSet as TZQuery).CommitUpdates;
    ConfigGravar;
    ListarDepartamentos;
  end;

end;

procedure TFrmCadDepartamento.inserirClick(Sender: TObject);
begin
  if not Dtsrcd.DataSet.Active then
    Dtsrcd.DataSet.Open;
  Dtsrcd.DataSet.Append;
  ConfigInserir;
end;

procedure TFrmCadDepartamento.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadDepartamento.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
end;

procedure TFrmCadDepartamento.cancelarClick(Sender: TObject);
begin
  Dtsrcd.DataSet.Cancel;
  ConfigCancelar;
end;

procedure TFrmCadDepartamento.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_User.close;
end;

procedure TFrmCadDepartamento.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmCadDepartamento.ListarDepartamentos;
var
  ListItem: TListItem;
begin
  ListView1.Clear;
  DM.sds_OpenDep.Refresh;
  DM.sds_OpenDep.First;
  while not DM.sds_OpenDep.EOF do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := IntToStr(DM.sds_OpenDepCODIGO.Value);
    ListItem.SubItems.Add(DM.sds_OpenDepNOME_DEP.Value);
    ListItem.SubItems.Add(DM.sds_OpenDepDATA.AsString);
    DM.sds_OpenDep.Next;
    if DM.sds_OpenDep.RecordCount > 0 then
      ListView1.ItemIndex := 0;
  end;
end;

procedure TFrmCadDepartamento.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
begin
  with ListView1.Canvas.Brush do
  begin
    if (Item.Index mod 2) = 0 then
      Color := $00CBEAEB
    else
      Color := $00FFF4F4;
  end;
end;

procedure TFrmCadDepartamento.trazerjClick(Sender: TObject);
begin
  FrmDlgProcuraDepartamento := TFrmDlgProcuraDepartamento.Create(Self, DM.sds_PesquiDep);
  try
    if FrmDlgProcuraDepartamento.ShowModal = mrOk then
    begin
      DM.cds_CadDep.Close;
      DM.cds_CadDep.Params[0].AsInteger := DM.sds_PesquiDepCODIGO.AsInteger;
      DM.cds_CadDep.Open;
    end;
  finally
    DM.sds_PesquiDep.Close;
    FrmDlgProcuraDepartamento.Free;
  end;
end;

procedure TFrmCadDepartamento.SpeedButton1Click(Sender: TObject);
begin
  Close;
  DM.cds_CadDep.Close;
end;

procedure TFrmCadDepartamento.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DM.cds_CadDep.Close;
  Close;

end;

end.
