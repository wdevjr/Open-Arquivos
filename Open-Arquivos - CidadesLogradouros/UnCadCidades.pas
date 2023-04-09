unit UnCadCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, StdCtrls, DBCtrls, DB, ZDataset;

type

  { TFrmCadCidades }

  TFrmCadCidades = class(TForm)
    cancelar: TBitBtn;
    EditCod: TEdit;
    EdtNomeCidades: TDBEdit;
    editar: TBitBtn;
    excluir: TBitBtn;
    gravar: TBitBtn;
    inserir: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Dtsrc: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    Label5: TLabel;
    Image1: TImage;
    StaticText1: TStaticText;
    trazerj: TBitBtn;
    procedure EdtNomeCidadesKeyPress(Sender: TObject; var Key: char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
    procedure FormShow(Sender: TObject);
    procedure DtsrcStateChange(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
  private
    Fstr_nome, Fstr_auxiliar: string;
    Fint_posicao: integer;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
    procedure ListarCidades;
  public
    { Public declarations }
  end;

var
  FrmCadCidades: TFrmCadCidades;

implementation

uses UnDM, UAutoPreench, UndDlgProcuraCidades, UDMII, UnGridPesquiza;

{$R *.lfm}

procedure TFrmCadCidades.ConfigGravar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

procedure TFrmCadCidades.ConfigInserir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  // DM.cds_User.Close;
end;

function retorna_string(Lstr_sql: string): string;
begin
  with DM.sds_IncCidades do
    begin
    Close;
    SQL.Text := Lstr_sql;
    Open;
    Result := fields[0].AsString;
    end;
end;

procedure TFrmCadCidades.DtsrcStateChange(Sender: TObject);
begin
  with Dtsrc.DataSet do
    begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsrc.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtsrc.State in [dsInsert];
    editar.Enabled := Dtsrc.State in [dsEdit];
    cancelar.Enabled := Dtsrc.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtsrc.State in [dsBrowse];
    trazerj.Enabled := Dtsrc.State in [dsBrowse];
    end;
end;

procedure TFrmCadCidades.editarClick(Sender: TObject);
begin
  if (EdtNomeCidades.Text = '') then
    begin
    MessageDlg('Informe a Cidade !', mtInformation, [mbOK], 0);
    end
  else if DBComboBox1.ItemIndex = 0 then
    begin
    MessageDlg('Informe a Sigla da Cidade !', mtInformation, [mbOK], 0);
    end
  //else if DBEdit4.Text = '  /  /   ' then
  //  begin
  //  MessageDlg('Informe a Data de Cadastro !', mtInformation, [mbOK], 0);
  //  end
  else
    begin
      try
      Dtsrc.DataSet.Post;
      (Dtsrc.DataSet as TZQuery).ApplyUpdates;
      (Dtsrc.DataSet as TZQuery).CommitUpdates;
      ConfigGravar;
      ListarCidades;
      except
      on e: Exception do
        begin
        ShowMessage('Atenção! Essa Cidade já Existe!');
        Dtsrc.DataSet.Cancel;
        Dtsrc.DataSet.Close;
        // Abort;
        EdtNomeCidades.Text := '';
        DBComboBox1.Text := '';
        DBEdit4.Text := '';
        EditCod.Text := '';
        end;
      end;
    end;
end;

procedure TFrmCadCidades.excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Realmente Excluir esse Registro', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
    begin
    Dtsrc.DataSet.Delete;
    (Dtsrc.DataSet as TZQuery).ApplyUpdates;
    (Dtsrc.DataSet as TZQuery).CommitUpdates;
    ListarCidades;
    end;

end;

procedure TFrmCadCidades.FormShow(Sender: TObject);
begin
  //ConfigInicial;
  //DM.sds_OpenCidades.Open;
 // ListarCidades;
end;

procedure TFrmCadCidades.gravarClick(Sender: TObject);
begin
  if (EdtNomeCidades.Text = '') then
    begin
    MessageDlg('Informe a Cidade !', mtInformation, [mbOK], 0);
    end
  else if DBComboBox1.Text = '' then
    begin
    MessageDlg('Informe a Sigla da Cidade !', mtInformation, [mbOK], 0);
    end
  //else if (DBEdit4.Text = '  /  /   ') or (DBEdit4.Text = '') then
  //  begin
  //  MessageDlg('Informe a Data de Cadastro !', mtInformation, [mbOK], 0);
  //  end
  else
    begin
      try
      Dtsrc.DataSet.Post;
      (Dtsrc.DataSet as TZQuery).ApplyUpdates;
      (Dtsrc.DataSet as TZQuery).CommitUpdates;
      ConfigGravar;
      ListarCidades;
      except
      on e: Exception do
        begin
        ShowMessage('Atenção! Essa Cidade já Existe!');
        Dtsrc.DataSet.Cancel;
        Dtsrc.DataSet.Close;
        // Abort;
        EdtNomeCidades.Text := '';
        DBComboBox1.Text := '';
        DBEdit4.Text := '';
        EditCod.Text := '';
        end;
      end;
    end;
end;

procedure TFrmCadCidades.inserirClick(Sender: TObject);
begin
  if not Dtsrc.DataSet.Active then
    Dtsrc.DataSet.Open;
  Dtsrc.DataSet.Append;
  //EdtNomeCidades.ReadOnly := False;
end;

procedure TFrmCadCidades.ConfigExcluir;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
end;

procedure TFrmCadCidades.cancelarClick(Sender: TObject);
begin
  EditCod.Clear;
  Dtsrc.DataSet.Cancel;
  EdtNomeCidades.ReadOnly := False;
  ConfigCancelar;
end;

procedure TFrmCadCidades.ConfigCancelar;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  //DM.cds_CadCidades.Close;
end;

procedure TFrmCadCidades.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  trazerj.Enabled := True;
end;

procedure TFrmCadCidades.ListarCidades;
var
  ListItem: TListItem;
begin
  //ListView1.Clear;
  //DM.sds_OpenCidades.Refresh;
  //DM.sds_OpenCidades.First;
  //while not DM.sds_OpenCidades.EOF do
  //  begin
  //  ListItem := ListView1.Items.Add;
  //  ListItem.Caption := IntToStr(DM.sds_OpenCidadesID_CIDADE.Value);
  //  ListItem.SubItems.Add(DM.sds_OpenCidadesDESCRICAO.Value);
  //  ListItem.SubItems.Add(DM.sds_OpenCidadesUF.AsString);
  ////  ListItem.SubItems.Add(DM.sds_OpenCidadesDATA.AsString);
  //  DM.sds_OpenCidades.Next;
  //  if DM.sds_OpenCidades.RecordCount > 0 then
  //    ListView1.ItemIndex := 0;
  //  end;
end;

procedure TFrmCadCidades.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
begin
  //with ListView1.Canvas.Brush do
  //  begin
  //  if (Item.Index mod 2) = 0 then
  //    Color := $00CBEAEB
  //  else
  //    Color := $00FFF4F4;
  //  end;
end;

procedure TFrmCadCidades.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCidades.EdtNomeCidadesKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) then
    begin
    DMII.DSCidade.DataSet.Close;
    if EdtNomeCidades.Text <> '' then
      begin
      with DMII.ZQuery1 do
        begin
        Close;
        Params[0].AsString := EdtNomeCidades.Text + '%';
        Open;
        end;
        try
          try
          FrmGridAba := TFrmGridAba.Create(self);
          FrmGridAba.DBGrid1.DataSource := DMII.DSCidade;
          if (FrmGridAba.showModal = mrOk) and (not DMII.DSCidade.DataSet.IsEmpty) then
            begin
            EditCod.Text :=
              DMII.DSCidade.DataSet.FieldByName('ID_CIDADE').AsString;
            TDBEdit(Sender).Text := DMII.DSCidade.DataSet['DESCRICAO'];
            DBComboBox1.Text := DMII.DSCidade.DataSet.FieldByName('UF').AsString;
            //DBEdit4.Text := DMII.DSCidade.DataSet.FieldByName('DATA').AsString;
            end;
          except
          on e: Exception do
            begin
            ShowMessage('Erro: ' + e.Message);
            Beep;
            end;

          end;
        finally
        FrmGridAba.Free;
        end;
      end;
    end;
end;

procedure TFrmCadCidades.trazerjClick(Sender: TObject);
begin
  FrmDlgProcuraCidades := TFrmDlgProcuraCidades.Create(Self, DM.sds_BuscaCidades);
    try
    if FrmDlgProcuraCidades.ShowModal = mrOk then
      begin
      DM.cds_CadCidades.Close;
      DM.cds_CadCidades.Params[0].AsInteger :=
        DM.sds_BuscaCidadesID_CIDADE.AsInteger;
      DM.cds_CadCidades.Open;
      end;
    finally
    DM.sds_BuscaCidades.Close;
    FrmDlgProcuraCidades.Free;
    end;
end;

end.
