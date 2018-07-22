unit UnCadCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, StdCtrls, Mask, DBCtrls, DB, DBClient,
  SimpleDS;

type
  TFrmCadCidades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    inserir: TSpeedButton;
    gravar: TSpeedButton;
    excluir: TSpeedButton;
    cancelar: TSpeedButton;
    trazerj: TSpeedButton;
    SpeedButton1: TSpeedButton;
    editar: TSpeedButton;
    ListView1: TListView;
    Label1: TLabel;
    Dtsrc: TDataSource;
    Label2: TLabel;
    EdtNomeCidades: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    Label5: TLabel;
    Image1: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DtsrcStateChange(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure EdtNomeCidadesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNomeCidadesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Fstr_nome, Fstr_auxiliar: String;
    Fint_posicao: Integer;
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

uses UDM, UAutoPreench, UndDlgProcuraCidades;

{$R *.dfm}

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
    close;
    DataSet.CommandText := Lstr_sql;
    open;
    result := fields[0].AsString;
  end;
end;

procedure TFrmCadCidades.EdtNomeCidadesKeyPress(Sender: TObject; var Key: Char);
var
  Lstr_nome, Lstr_auxiliar: string;
begin
  Fstr_nome := Fstr_nome + string(Key);
  Lstr_nome := retorna_string(' select NOME_CIDADE from CIDADES ' +
    ' where CIDADES.NOME_CIDADE like ''' + Fstr_nome + '%''');
  Lstr_auxiliar := copy(Lstr_nome, length(Fstr_nome) + 1, length(Lstr_nome));
  Fstr_auxiliar := Fstr_nome + Lstr_auxiliar;
end;

procedure TFrmCadCidades.EdtNomeCidadesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Lstr_auxiliar: string;
begin
  // testa se a tecla pessionad foi a seta para a esquerda
  if (Key = vk_left) then
  begin
    // Armazena a posição iniciar do cursor
    Fint_posicao := length(Fstr_nome) - 1;
    // Seta o cursor para a posição correta
    EdtNomeCidades.SelStart := Fint_posicao;
    // Armazena o texto digitado pelo usuário
    Fstr_nome := copy(EdtNomeCidades.Text, 1, Fint_posicao);
    // coloca o cursor na posição correta após a digitação da tecla
    EdtNomeCidades.SelStart := length(Fstr_nome);
    // marca o texto que foi auto-completado
    EdtNomeCidades.SelLength := length(EdtNomeCidades.Text) - length(Fstr_nome);
    exit;
  end
  else if (Key = vk_right) then
  begin
    Fint_posicao := length(Fstr_nome) + 1;
    EdtNomeCidades.SelStart := Fint_posicao;
    Fstr_nome := copy(EdtNomeCidades.Text, 1, Fint_posicao);
    EdtNomeCidades.SelStart := length(Fstr_nome);
    EdtNomeCidades.SelLength := length(EdtNomeCidades.Text) - length(Fstr_nome);
    exit;
  end
  else if (Key = vk_back) then
  begin
    Fint_posicao := length(Fstr_nome) - 1;
    EdtNomeCidades.SelStart := Fint_posicao;
    Fstr_nome := copy(EdtNomeCidades.Text, 1, Fint_posicao);
    EdtNomeCidades.Text := Fstr_nome;
    EdtNomeCidades.SelStart := length(Fstr_nome);
    exit;
  end;
  // limpar o edit para poder exibir apenas o texto desejado
  EdtNomeCidades.Clear;
  // Preenche o edit com o texto auto completo
  EdtNomeCidades.Text := Fstr_auxiliar;
  // Armazena o tamanho do texto digitado
  EdtNomeCidades.SelStart := length(Fstr_nome);
  // marca o texto que foi auto-completado
  EdtNomeCidades.SelLength := length(EdtNomeCidades.Text) - length(Fstr_nome);
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
  else if DBEdit4.Text = '  /  /   ' then
  begin
    MessageDlg('Informe a Data de Cadastro !', mtInformation, [mbOK], 0);
  end
  else
  begin
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);
    ConfigGravar;
    ListarCidades;
  end;
end;

procedure TFrmCadCidades.excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Realmente Excluir esse Registro', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
  begin
    Dtsrc.DataSet.Delete;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);
    ListarCidades;
  end;

end;

procedure TFrmCadCidades.FormShow(Sender: TObject);
begin
  ConfigInicial;
  DM.sds_OpenCidades.open;
  ListarCidades;
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
  else if (DBEdit4.Text = '  /  /   ') AND (DBEdit4.Text = '') then
  begin
    MessageDlg('Informe a Data de Cadastro !', mtInformation, [mbOK], 0);
  end
  else
  begin
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);
    ConfigGravar;
    ListarCidades;
  end;
end;

procedure TFrmCadCidades.inserirClick(Sender: TObject);
begin
  if not Dtsrc.DataSet.Active then
    Dtsrc.DataSet.open;
  Dtsrc.DataSet.Append;
  EdtNomeCidades.ReadOnly := False;
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
  DM.cds_CadCidades.close;
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
  ListView1.Clear;
  DM.sds_OpenCidades.Refresh;
  DM.sds_OpenCidades.First;
  while not DM.sds_OpenCidades.Eof do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := IntToStr(DM.sds_OpenCidadesCODIGO.value);
    ListItem.SubItems.Add(DM.sds_OpenCidadesNOME_CIDADE.value);
    ListItem.SubItems.Add(DM.sds_OpenCidadesUF.AsString);
    ListItem.SubItems.Add(DM.sds_OpenCidadesDATA.AsString);
    DM.sds_OpenCidades.Next;
    if DM.sds_OpenCidades.RecordCount > 0 then
      ListView1.ItemIndex := 0;
  end;
end;

procedure TFrmCadCidades.ListView1CustomDrawItem(Sender: TCustomListView;
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

procedure TFrmCadCidades.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmCadCidades.trazerjClick(Sender: TObject);
begin
  FrmDlgProcuraCidades := TFrmDlgProcuraCidades.Create(Self,
    DM.sds_BuscaCidades);
  try
    if FrmDlgProcuraCidades.ShowModal = mrOk then
    begin
      DM.cds_CadCidades.close;
      DM.cds_CadCidades.Params[0].AsInteger :=
        DM.sds_BuscaCidadesCODIGO.AsInteger;
      DM.cds_CadCidades.open;
    end;
  finally
    DM.sds_BuscaCidades.close;
    FrmDlgProcuraCidades.Free;
  end;
end;

end.
