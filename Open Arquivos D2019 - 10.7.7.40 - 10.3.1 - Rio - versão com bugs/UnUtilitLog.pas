// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnUtilitLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, SimpleDS, Buttons, DBCtrls, Grids,
  DBGrids, Mask,
  CheckLst, DB, jpeg, Data.SqlExpr;

type
  TFrmLogAcesso = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Notebook1: TNotebook;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edtusuario: TEdit;
    EdtSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image3: TImage;
    Image4: TImage;
    Panel5: TPanel;
    Image5: TImage;
    Image6: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Image8: TImage;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    comRelatorio: TRadioButton;
    semRelatorio: TRadioButton;
    Panel2: TPanel;
    Label14: TLabel;
    Panel7: TPanel;
    Label21: TLabel;
    Panel9: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Panel10: TPanel;
    BtnPrint: TSpeedButton;
    PanelMaximizar: TPanel;
    AlertBotao: TSpeedButton;
    Label28: TLabel;
    Image9: TImage;
    Label29: TLabel;
    Label30: TLabel;
    usuario: TRadioButton;
    registro: TRadioButton;
    acao: TRadioButton;
    DBGrid2: TDBGrid;
    Panel11: TPanel;
    Panel12: TPanel;
    SpeedButton6: TSpeedButton;
    Label34: TLabel;
    Image10: TImage;
    Label35: TLabel;
    SpeedButton7: TSpeedButton;
    Panel13: TPanel;
    opcao01: TPanel;
    Label36: TLabel;
    Edit1: TEdit;
    opcao04: TPanel;
    DBEdit1: TDBEdit;
    Label31: TLabel;
    ok: TCheckBox;
    Label38: TLabel;
    Dtsc: TDataSource;
    PanelUser: TPanel;
    Label37: TLabel;
    Panel16: TPanel;
    SpeedButton8: TSpeedButton;
    DBText1: TDBText;
    DBGrid1: TDBGrid;
    opcao05: TPanel;
    DBEdit2: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBText2: TDBText;
    Label20: TLabel;
    Dtscu: TDataSource;
    Panel8: TPanel;
    Panel14: TPanel;
    Panel19: TPanel;
    sbAdd: TSpeedButton;
    sbAddTodos: TSpeedButton;
    sbRemover: TSpeedButton;
    sbRemoverTodos: TSpeedButton;
    Panel6: TPanel;
    Panel18: TPanel;
    Label32: TLabel;
    Panel20: TPanel;
    voltar: TBitBtn;
    avancar: TBitBtn;
    cancelar: TBitBtn;
    opcao06: TPanel;
    Edit2: TEdit;
    Label19: TLabel;
    RadioGroupAcao: TRadioGroup;
    Dtscuu: TDataSource;
    PanelAlert: TPanel;
    Label39: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    simPesqu: TRadioButton;
    naoPesqu: TRadioButton;
    diferPesqui: TRadioButton;
    Label17: TLabel;
    Label18: TLabel;
    MonthCalendar1: TMonthCalendar;
    MonthCalendar2: TMonthCalendar;
    MonthCalendar3: TMonthCalendar;
    BlocUserFinal: TPanel;
    Label15: TLabel;
    AlertUserFinal: TLabel;
    ImageUserFinal: TImage;
    BlocAlertInicial: TPanel;
    AlertUserInicial: TLabel;
    ImageAlertInicial: TImage;
    Label40: TLabel;
    SQLMonitor1: TSQLMonitor;
    Label23: TLabel;
    Label26: TLabel;
    ListBoxRecebe: TListBox;
    ListBoxAtributos: TListBox;
    ListBoxReal: TListBox;
    ListBoxFinal: TListBox;
    Panel15: TPanel;
    Panel17: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton8Click(Sender: TObject);
    procedure RadioGroupAcaoClick(Sender: TObject);
    procedure RbLOGARClick(Sender: TObject);
    procedure RbEDITARClick(Sender: TObject);
    procedure RbEXCLUIRClick(Sender: TObject);
    procedure RbGRAVARClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cancelarClick(Sender: TObject);
    procedure MonthCalendar3Click(Sender: TObject);
    procedure MonthCalendar2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbRemoverTodosClick(Sender: TObject);
    procedure sbRemoverClick(Sender: TObject);
    procedure sbAddTodosClick(Sender: TObject);
    procedure EdtSenhaClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure acaoClick(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure registroClick(Sender: TObject);
    procedure usuarioClick(Sender: TObject);
    procedure simDiferClick(Sender: TObject);
    procedure naoPesquClick(Sender: TObject);
    procedure simPesquClick(Sender: TObject);
    procedure voltarClick(Sender: TObject);
    procedure semRelatorioClick(Sender: TObject);
    procedure comRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure avancarClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure CamposSelecionadosDATAMontSQL;
    Procedure SetItem(List: TListBox; Index: Integer);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetButtons;
    Function GetFirstSelection(List: TCustomListBox): Integer;
    procedure ListBoxAtributosClick(Sender: TObject);
    procedure ListBoxRecebeClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBoxRealClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure addTodos;
    procedure addTodosInferior;
    procedure removerTodos;
    procedure LoopIdent;
    procedure AlerttInicial;
    procedure AlerttFinal;
    procedure LoopVerif;
    procedure VerifSelect;
    // procedure DisplayLabel;
  public
    codigo: Boolean;
    codigoAlert: Boolean;
  end;

var
  FrmLogAcesso: TFrmLogAcesso;
  ListReal, ListFinal: TListBox;

implementation

uses UDM, UDMII, DBClient, ULocalizarUser;

{$R *.dfm}

function TFrmLogAcesso.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then
      Exit;
  Result := LB_ERR;
end;

procedure LbMoveItemUp(AListBox: TListBox);
var
  CurrIndex: Integer;
begin
  with AListBox do
    if ItemIndex > 0 then
    begin
      CurrIndex := ItemIndex;
      Items.Move(ItemIndex, (CurrIndex - 1));
      ItemIndex := CurrIndex - 1;
    end;
end;

procedure LbMoveItemDown(AListBox: TListBox);
var
  CurrIndex, LastIndex: Integer;
begin
  with AListBox do
  begin
    CurrIndex := ItemIndex;
    LastIndex := Items.Count;
    if ItemIndex <> -1 then
    begin
      if CurrIndex + 1 < LastIndex then
      begin
        Items.Move(ItemIndex, (CurrIndex + 1));
        ItemIndex := CurrIndex + 1;
      end;
    end;
  end;
end;

procedure TFrmLogAcesso.ListBoxAtributosClick(Sender: TObject);
var
  i: Integer;
begin
  try
    ListBoxFinal.Selected[ListBoxAtributos.ItemIndex] := true;
  Except
    On E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;
  if (ListBoxAtributos.ItemIndex > 0) then
  begin
    avancar.Enabled := true;
  end;

end;

procedure TFrmLogAcesso.ListBoxRealClick(Sender: TObject);
begin
  // ListBoxReal.Selected[ListBoxRecebe.ItemIndex] := true;
end;

procedure TFrmLogAcesso.ListBoxRecebeClick(Sender: TObject);
var
  i: Integer;
begin
  try
    ListBoxReal.Selected[ListBoxRecebe.ItemIndex] := true;
  Except
    On E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;
end;

procedure TFrmLogAcesso.CamposSelecionadosDATAMontSQL;
var
  i: SmallInt;
  hor5, mim5, seg5, Mcs5: Word;
  hor6, mim6, seg6, Mcs6: Word;
begin
  with DMII.sds_sddata_all do
  begin
    Params.Clear;
    Close;
    DataSet.CommandText := ' '; // limpa
    DataSet.CommandText := 'SELECT   ';
    for i := 0 to Pred(ListBoxFinal.Count) do
    begin
      if i = Pred(ListBoxFinal.Items.Count) then
        DataSet.CommandText := DataSet.CommandText + ' ' +
          ListBoxFinal.Items.Strings[i] + ' FROM ' + 'LOG'
      else
        DataSet.CommandText := DataSet.CommandText + ' ' +
          ListBoxFinal.Items.Strings[i] + ', ';
    end;
    if (simPesqu.Checked = true) then // com data
    begin
      Params.Clear;
      DataSet.CommandText := DataSet.CommandText +
        ' where LOG.INSERDATA = :date ';
      DataSet.ParamByName('date').AsDate := MonthCalendar1.Date;
    end
    else if diferPesqui.Checked = true then // entre duas datas diferentes
    begin
      Params.Clear;
      DataSet.CommandText := DataSet.CommandText +
        ' where LOG.INSERDATA >= :date1 ';
      DataSet.CommandText := DataSet.CommandText +
        ' AND LOG.INSERDATA <= :date2 ';
      DataSet.ParamByName('date1').AsDate := MonthCalendar2.Date;
      DataSet.ParamByName('date2').AsDate := MonthCalendar3.Date;
    end;
    if DBEdit2.Text <> '' then
    begin
      DataSet.CommandText := DataSet.CommandText + ' where LOG.COD_USUARIO = ' +
        DBEdit2.Text;
    end;
    if Edit2.Text <> '' then
    begin
      DataSet.CommandText := DataSet.CommandText + ' where LOG.COD_REGISTRO = '
        + Edit2.Text;
    end;

    if RadioGroupAcao.ItemIndex <> -1 then
    begin
      case RadioGroupAcao.ItemIndex of
        0:
          DataSet.CommandText := DataSet.CommandText +
            ' where LOG.COD_ACAO = 1';
        1:
          DataSet.CommandText := DataSet.CommandText +
            ' where LOG.COD_ACAO = 2';
        2:
          DataSet.CommandText := DataSet.CommandText +
            ' where LOG.COD_ACAO = 3';
        3:
          DataSet.CommandText := DataSet.CommandText +
            ' where LOG.COD_ACAO = 4';
        4:
          DataSet.CommandText := DataSet.CommandText +
            ' where LOG.COD_ACAO = 5';
      end;
    end;

    try
      Open;
      // DisplayLabel;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao tentar montar a instrução SQL!' + #13 +
          'Mensagem Original: ' + E.Message, mtError, [mbOk], 0);
        Abort;
      end;
    end;
  end;
end;

procedure TFrmLogAcesso.cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogAcesso.voltarClick(Sender: TObject);
var
  cont: Integer;
begin
  BlocAlertInicial.Visible := false;
  AlertUserFinal.Caption := '';
  ImageAlertInicial.Visible := false;
  BlocUserFinal.Visible := false;
  AlertUserFinal.Caption := '';
  ImageUserFinal.Visible := false;
  ListBoxAtributos.Clear;
  ListBoxFinal.Clear;
  DM.SQLConnection.GetFieldNames('LOG', ListBoxRecebe.Items);
  LoopIdent;
  DM.SQLConnection.GetFieldNames('LOG', ListBoxReal.Items);
  DM.cds_User.Close;
  DMII.sds_sddata_all.Close;
  DMII.sds_LocalizarLogUser.Close;
  DMII.sds_LocalUserSis.Close;
  DMII.sds_OpenUser.Close;
  DMII.sds_sddata_all.Filtered := false;
  ok.Checked := false;
  naoPesqu.Checked := false;
  simPesqu.Checked := false;
  diferPesqui.Checked := false;
  usuario.Checked := false;
  registro.Checked := false;
  acao.Checked := false;
  RadioGroupAcao.ItemIndex := -1;
  Edit2.Text := '';
  PanelAlert.Visible := false;
  Label18.Visible := false;
  MonthCalendar1.Visible := false;
  MonthCalendar1.Enabled := false;
  MonthCalendar2.Enabled := false;
  MonthCalendar3.Enabled := false;
  if (Notebook1.PageIndex = 6) then
  begin
    Notebook1.PageIndex := Notebook1.PageIndex - 4;
  end
  else if (Notebook1.PageIndex = 5) then
  begin
    Notebook1.PageIndex := Notebook1.PageIndex - 3;
  end;
  if Notebook1.PageIndex = 3 then
  begin
    Notebook1.PageIndex := Notebook1.PageIndex - 1;
  end;
  if Notebook1.PageIndex = 4 then
  begin
    Notebook1.PageIndex := Notebook1.PageIndex - 1;
  end;
  if Notebook1.PageIndex = 7 then
  begin
    Notebook1.PageIndex := Notebook1.PageIndex - 1;
  end;
  if Notebook1.PageIndex = 8 then
  begin
    Notebook1.PageIndex := Notebook1.PageIndex - 6;
  end;

  if Notebook1.PageIndex = 0 then
  begin
    avancar.Visible := false;
    voltar.Visible := false;
    cancelar.Visible := false;
  end;

end;

procedure TFrmLogAcesso.acaoClick(Sender: TObject);
begin
  if acao.Checked = true then
  begin
    avancar.Enabled := true;
    opcao04.Visible := true;
    opcao01.Visible := false;
    opcao05.Visible := false;
    opcao06.Visible := false;
  end;
end;

procedure TFrmLogAcesso.avancarClick(Sender: TObject);
var
  hor01, minu01, segun01, Msec01, hor02, minu02, segun02, Msec02: Word;
  dia, mes, ano: Word;
  i: Integer;
begin
  if (comRelatorio.Checked = true) or (semRelatorio.Checked = true) then
  begin
    avancar.Enabled := false;
    Notebook1.PageIndex := Notebook1.PageIndex + 1;
  end;
  if Notebook1.PageIndex = 2 then
  begin
    MonthCalendar2.Enabled := true;
  end;
  if naoPesqu.Checked = true then
  begin
    Notebook1.PageIndex := 6;
  end;
  if (usuario.Checked = true) then
  begin
    Notebook1.PageIndex := 7;
  end;
  if (registro.Checked = true) then
  begin
    Notebook1.PageIndex := 7;
  end;
  if (acao.Checked = true) then
  begin
    Notebook1.PageIndex := 7;
  end;

  if (RadioGroupAcao.ItemIndex <> -1) AND (ok.Checked = false) then
  begin
    CamposSelecionadosDATAMontSQL;
    Notebook1.PageIndex := 8;
    if DMII.sds_sddata_all.RecordCount > 20 then
    begin
      PanelMaximizar.Visible := true;
    end;
  end
  ELSE if (ok.Checked = true) then
  begin
    avancar.Enabled := true;
    CamposSelecionadosDATAMontSQL;
    Notebook1.PageIndex := 8;
  end;
  if Notebook1.PageIndex = 8 then
  begin
    avancar.Enabled := false;
  end;
  if simPesqu.Checked = true then
  begin
    Notebook1.PageIndex := 3;
  end;

  if (usuario.Checked = true) and (DBEdit2.Text <> '') then
  begin
    CamposSelecionadosDATAMontSQL;
    Notebook1.PageIndex := 8;
    if DMII.sds_sddata_all.RecordCount > 20 then
    begin
      PanelMaximizar.Visible := true;
    end;
  end;

  if (registro.Checked = true) and (Edit2.Text <> '') then
  begin
    CamposSelecionadosDATAMontSQL;
    Notebook1.PageIndex := 8;
    if DMII.sds_sddata_all.RecordCount > 20 then
    begin
      PanelMaximizar.Visible := true;
    end;
  end;

  if simPesqu.Checked = true then
  begin
    Notebook1.PageIndex := 3;
    // ListBoxRecebe.ClearSelection;
  end;

  if simPesqu.Checked = true then
  begin
    DecodeDate(MonthCalendar1.Date, ano, mes, dia);
    CamposSelecionadosDATAMontSQL;
    if DMII.sds_sddata_all.RecordCount > 20 then
    begin
      PanelMaximizar.Visible := true;
    end;
    Notebook1.PageIndex := 5;
  end;
  if diferPesqui.Checked = true then
  begin
    Notebook1.PageIndex := 4;
  end;
  if MonthCalendar3.Enabled = true then
  begin
    Notebook1.PageIndex := 5;
    CamposSelecionadosDATAMontSQL;
  end;
  if Notebook1.PageIndex = 5 then
  begin
    if DMII.sds_sddata_all.RecordCount > 20 then
    begin
      PanelMaximizar.Visible := true;
    end;
  end;

end;

// procedure TFrmLogAcesso.DisplayLabel;
/// /var i:integer;
// begin
// for i := 0 to Pred(ListBoxFinal.Count) do
// begin
// if DMII.sds_sddata_all.DataSet.Fields[i].ToString = 'CODIGO' then
// begin
// DMII.sds_sddata_all.FieldValues['CODIGO'].DisplayLabel := 'Código do Log de  Acesso';
// end;
// end;
// try
// if DMII.sds_sddata_all.DataSet.FieldList. = 'ACAO' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['ACAO'].DisplayLabel := 'Código'+
// ' da Ação';
// end;
// Except
// on E:Exception do
// begin
// Application.OnException := nil;
// Application.OnMessage := nil;
// end;
// end;
// if DMII.sds_sddata_all.DataSet.ToString = 'APLICATIVO' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['APLICATIVO'].DisplayLabel := 'Aplicativo/Parte do Open Arquivos';
// end;
// if DMII.sds_sddata_all.DataSet.ToString = 'COD_REGISTRO' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['COD_REGISTRO'].DisplayLabel := 'Código do Arquivo';
// end;
// if DMII.sds_sddata_all.DataSet.ToString = 'COD_USUARIO' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['COD_USUARIO'].DisplayLabel :=
// 'Código Usuário';
// end;
// if DMII.sds_sddata_all.DataSet.ToString = 'DISCRIMINACAO' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['DISCRIMINACAO'].DisplayLabel := 'Nome/Procedimento Arquivo';
// end;
// if DMII.sds_sddata_all.DataSet.ToString = 'HORA' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['HORA'].DisplayLabel := 'Hora do Procedimento';
// end;
// if DMII.sds_sddata_all.DataSet.ToString = 'INSERDATA' then
// begin
// DMII.sds_sddata_all.DataSet.FieldValues['INSERDATA'].DisplayLabel := 'Data do Procedimento';
// end;

// end;

procedure TFrmLogAcesso.BitBtn1Click(Sender: TObject);
begin
  with DM.dst_Login do
  begin
    Close;
    CommandText := 'select CODIGO,NOME,LOGIN ' + ' from USUARIO_LOG ' +
      ' where LOGIN = ' + QuotedStr(Edtusuario.Text) + ' and SENHA = ' +
      QuotedStr(EdtSenha.Text);
    Open;
    if not IsEmpty then
    begin
      Notebook1.PageIndex := 1;
    end
    else
    begin
      MessageDlg('Usuário e ou Senha Inválido(s)!', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TFrmLogAcesso.BitBtn3Click(Sender: TObject);
var
  i, t: Integer;
begin
  for i := 0 to ListBoxAtributos.Items.Count - 1 do
    ListBoxRecebe.Items.AddObject(ListBoxAtributos.Items[i],
      ListBoxAtributos.Items.Objects[i]);
  ListBoxAtributos.Items.Clear;
  SetItem(ListBoxAtributos, 0);
  removerTodos;
  // avancar.Enabled := ListBoxAtributos.Items.Count <> 0;
  try
    for i := 0 to Pred(ListBoxRecebe.Count) do
    begin
      if ListBoxRecebe.Items.Strings[i] = 'CODIGO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Log de Acesso';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_USUARIO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Usuário';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'INSERDATA' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Data';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'HORA' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Hora';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_ACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Código da Ação';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'ACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Ação do Pocedimento'
      end;
      if ListBoxRecebe.Items.Strings[i] = 'APLICATIVO' then
      begin
        ListBoxRecebe.Items.Strings[i] :=
          'Aplicativo/Parte do Open Arquivos ...'
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_REGISTRO' then
      begin
        ListBoxRecebe.Items.Strings[i] :=
          'Código do Arquivo e ou Procedimento...';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'DISCRIMINACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Nome do Procedimento/Arquivo ...'
      end;
    end;
  Except
    On E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;
end;

procedure TFrmLogAcesso.okClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Pred(ListBoxFinal.Count) do
  begin
    if ListBoxFinal.Items.Strings[i] = 'COD_USUARIO' then
    begin
      codigo := true;
      Break;
    end
    else
      codigo := false;
  end;
  if (ok.Checked = true) then
  begin
    with DMII.sds_sddata_all do
      if codigo = true then
      begin
        Filtered := true;
      end
      else
        Filtered := false;
  end;

  if codigo = true then
  begin
    PanelAlert.Visible := false;
    PanelUser.Visible := true;
    avancar.Enabled := true;
  end
  else if codigo = false then
  begin
    PanelAlert.Visible := true;
    PanelUser.Visible := false;
    if (RadioGroupAcao.ItemIndex <> -1) then
    begin
      avancar.Enabled := true;
    end;
  end;
end;

procedure TFrmLogAcesso.RadioGroupAcaoClick(Sender: TObject);
begin
  avancar.Enabled := true;
end;

procedure TFrmLogAcesso.RbEDITARClick(Sender: TObject);
begin
  avancar.Enabled := true;
end;

procedure TFrmLogAcesso.RbEXCLUIRClick(Sender: TObject);
begin
  avancar.Enabled := true;
end;

procedure TFrmLogAcesso.RbGRAVARClick(Sender: TObject);
begin
  avancar.Enabled := true;
end;

procedure TFrmLogAcesso.RbLOGARClick(Sender: TObject);
begin
  avancar.Enabled := true;
end;

procedure TFrmLogAcesso.comRelatorioClick(Sender: TObject);
begin
  if (comRelatorio.Checked = true) then
  begin
    avancar.Enabled := true;
  end;
end;

procedure TFrmLogAcesso.MonthCalendar2Click(Sender: TObject);
var
  dia01, mes01, ano01: Word;
begin
  DecodeDate(MonthCalendar2.Date, ano01, mes01, dia01);
  if (dia01 > 0) then
  begin
    MonthCalendar3.Enabled := true;
  end;
end;

procedure TFrmLogAcesso.DateTimePicker3Change(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  DecodeDate(MonthCalendar3.Date, dia, mes, ano);
  if dia > 00 then
  begin
    avancar.Enabled := true;
  end;
end;

procedure TFrmLogAcesso.DBGrid1CellClick(Column: TColumn);
var
  i: Integer;
begin
  for i := 0 to Pred(ListBoxFinal.Count) do
  begin
    if ListBoxFinal.Items.Strings[i] = 'COD_USUARIO' then
    begin
      codigoAlert := true;
      AlerttInicial;
      Break;
    end
    else
      codigoAlert := false;
    AlerttInicial;
  end;

end;

procedure TFrmLogAcesso.LoopVerif;
var
  i: Integer;
begin
  for i := 0 to Pred(ListBoxFinal.Count) do
  begin
    if ListBoxFinal.Items.Strings[i] = 'COD_USUARIO' then
    begin
      codigoAlert := true;
      Break;
    end
    else
      codigoAlert := false;
  end;
end;

procedure TFrmLogAcesso.AlerttInicial;
var
  i: Integer;
begin
  if DBGrid1.FieldCount <> 0 then
  begin
    if codigoAlert = true then
    begin
      ImageAlertInicial.Visible := false;
      AlertUserInicial.Caption := '';
      BlocAlertInicial.Visible := false;
      DMII.sds_OpenPesqUser.Close;
      DMII.sds_OpenPesqUser.Params[0].Value :=
        DBGrid1.DataSource.DataSet.FieldByName('COD_USUARIO').AsInteger;
      DMII.sds_OpenPesqUser.Open;
      AlertUserInicial.Caption := DMII.sds_OpenPesqUser.FieldByName
        ('NOME').AsString;
      AlertUserInicial.Visible := true;
      BlocAlertInicial.Visible := true;
      // if (DMII.sds_OpenPesqUser.FieldByName('NOME').AsString = '') or (DMII.sds_OpenPesqUser.FieldByName(
      // 'NOME').AsString = null) then
      // begin
      // BlocAlertInicial.Visible:=false;
      // end;
    end
    else if codigoAlert = false then
    begin
      ImageAlertInicial.Visible := true;
      AlertUserInicial.Caption :=
        'Aviso: Selecione o Código de Usuário na seleção de pesquisa !';
      AlertUserInicial.Visible := true;
      BlocAlertInicial.Visible := true;
    end;
  end;
end;

procedure TFrmLogAcesso.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { if Odd(DMII.sds_sddata_all.RecNo) then
    begin
    DBGrid1.Canvas.Brush.Color := $00CBEAEB;
    // DBGrid1.Canvas.Font.Color:=clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
    DBGrid1.Canvas.Brush.Color := $00FFF4F4;
    // DBGrid1.Canvas.Font.Color:=clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then
    begin
    DBGrid1.Canvas.Brush.Color := $00808040;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end; }
end;

procedure TFrmLogAcesso.DBGrid2CellClick(Column: TColumn);
var
  i: Integer;
begin
  for i := 0 to Pred(ListBoxFinal.Count) do
  begin
    if ListBoxFinal.Items.Strings[i] = 'COD_USUARIO' then
    begin
      codigoAlert := true;
      AlerttFinal;
      Break;
    end
    else
      codigoAlert := false;
    AlerttFinal;
  end;

end;

procedure TFrmLogAcesso.AlerttFinal;
var
  i: Integer;
begin
  if DBGrid2.FieldCount <> 0 then
  begin
    if codigoAlert = true then
    begin
      ImageUserFinal.Visible := false;
      AlertUserFinal.Caption := '';
      BlocUserFinal.Visible := false;
      DMII.sds_OpenPesqUser.Close;
      DMII.sds_OpenPesqUser.Params[0].Value :=
        DBGrid1.DataSource.DataSet.FieldByName('COD_USUARIO').AsInteger;
      DMII.sds_OpenPesqUser.Open;
      AlertUserFinal.Caption := DMII.sds_OpenPesqUser.FieldByName
        ('NOME').AsString;
      AlertUserFinal.Visible := true;
      BlocUserFinal.Visible := true;
      // if (DMII.sds_OpenPesqUser.FieldByName('NOME').AsString = '') or (DMII.sds_OpenPesqUser.FieldByName(
      // 'NOME').AsString = null) then
      // begin
      // BlocAlertInicial.Visible:=false;
      // end;
    end
    else if codigoAlert = false then
    begin
      ImageUserFinal.Visible := true;
      AlertUserFinal.Caption :=
        'Aviso: Selecione o Código de Usuário na seleção de pesquisa !';
      AlertUserFinal.Visible := true;
      BlocUserFinal.Visible := true;
    end;
  end;
end;

procedure TFrmLogAcesso.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { if Odd(DMII.sds_sddata_all.RecNo) then
    begin
    DBGrid2.Canvas.Brush.Color := $00CBEAEB;
    // DBGrid1.Canvas.Font.Color:=clBlack;
    DBGrid2.Canvas.FillRect(Rect);
    DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
    DBGrid2.Canvas.Brush.Color := $00FFF4F4;
    // DBGrid1.Canvas.Font.Color:=clBlack;
    DBGrid2.Canvas.FillRect(Rect);
    DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then
    begin
    DBGrid2.Canvas.Brush.Color := $00808040;
    DBGrid2.Canvas.FillRect(Rect);
    DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
    end; }
end;

procedure TFrmLogAcesso.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    avancar.Enabled := true;
  end;
end;

procedure TFrmLogAcesso.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
  begin
    avancar.Enabled := true;
  end;

end;

procedure TFrmLogAcesso.EdtSenhaClick(Sender: TObject);
begin
  if EdtSenha.Text <> '' then
  begin
    BitBtn1.SetFocus;
  end;

end;

procedure TFrmLogAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.cds_User.Close;
  DMII.sds_sddata_all.Close;
end;

procedure TFrmLogAcesso.FormCreate(Sender: TObject);
var
  i, t: Integer;
begin
  MonthCalendar1.Date := Date;
  MonthCalendar2.Date := Date;
  MonthCalendar3.Date := Date;
  Notebook1.PageIndex := 0;
  DM.SQLConnection.Open;
  DM.SQLConnection.GetFieldNames('LOG', ListBoxRecebe.Items);
  DM.SQLConnection.GetFieldNames('LOG', ListBoxReal.Items);
end;

procedure TFrmLogAcesso.VerifSelect;
var
  i: Integer;
begin
  for i := 0 to Pred(ListBoxRecebe.Count) do
  begin
    ListBoxRecebe.Selected[i] := false;
  end;
end;

procedure TFrmLogAcesso.FormShow(Sender: TObject);
var
  i: Integer;
begin
  // ListBoxRecebe.ClearSelection;
  Notebook1.PageIndex := 0;
  ok.Checked := false;
  naoPesqu.Checked := false;
  simPesqu.Checked := false;
  diferPesqui.Checked := false;
  usuario.Checked := false;
  registro.Checked := false;
  acao.Checked := false;
  RadioGroupAcao.ItemIndex := -1;
  Edit2.Text := '';
  PanelAlert.Visible := false;
  Label18.Visible := false;
  MonthCalendar1.Visible := false;
  MonthCalendar1.Enabled := false;
  MonthCalendar2.Enabled := false;
  MonthCalendar3.Enabled := false;
  if Notebook1.PageIndex = 0 then
  begin
    voltar.Visible := false;
    avancar.Visible := false;
    cancelar.Visible := false;
    Label18.Visible := false;
    MonthCalendar1.Visible := false;
  end
  else
  begin
    if Notebook1.PageIndex > 0 then
      voltar.Visible := true;
    avancar.Visible := true;
    cancelar.Visible := true;

  end;
  try
    for i := 0 to Pred(ListBoxRecebe.Count) do
    begin
      if ListBoxRecebe.Items.Strings[i] = 'CODIGO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Log de Acesso';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_USUARIO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Usuário';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'INSERDATA' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Data';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'HORA' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Hora';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_ACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Ação';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'ACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Ação do Pocedimento'
      end;
      if ListBoxRecebe.Items.Strings[i] = 'APLICATIVO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Aplicativo do Open Arquivos ...'
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_REGISTRO' then
      begin
        ListBoxRecebe.Items.Strings[i] :=
          'Código do Arquivo e ou Procedimento...';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'DISCRIMINACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Nome do Procedimento ...'
      end;
    end;
  Except
    On E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;
  // ListBoxRecebe.ClearSelection;
  // VerifSelect;
  // DM.SQLConnection.Open;
  // LoopIdent;
  // DM.SQLConnection.GetFieldNames('LOG', ListBoxRecebe.Items);
end;

procedure TFrmLogAcesso.naoPesquClick(Sender: TObject);
begin
  if naoPesqu.Checked = true then
  begin
    avancar.Enabled := true;
    Label18.Visible := false;
    MonthCalendar1.Visible := false;
  end;
end;

procedure TFrmLogAcesso.Notebook1PageChanged(Sender: TObject);
begin
  if Notebook1.PageIndex > 0 then
  begin
    voltar.Visible := true;
    avancar.Visible := true;
    cancelar.Visible := true;
  end;
end;

procedure TFrmLogAcesso.registroClick(Sender: TObject);
begin
  if registro.Checked = true then
  begin
    avancar.Enabled := true;
    opcao01.Visible := false;
    opcao04.Visible := false;
    opcao05.Visible := false;
    opcao06.Visible := true;
  end;
end;

procedure TFrmLogAcesso.semRelatorioClick(Sender: TObject);
begin
  if (semRelatorio.Checked = true) then
  begin
    avancar.Enabled := true;
  end;
end;

procedure TFrmLogAcesso.simDiferClick(Sender: TObject);
begin
  if diferPesqui.Checked = true then
  begin
    avancar.Enabled := true;
    simPesqu.Checked := false;
    naoPesqu.Checked := false;
    Label18.Visible := false;
    MonthCalendar1.Visible := false;
    MonthCalendar1.Enabled := false;
    MonthCalendar2.Enabled := true;
  end;
end;

procedure TFrmLogAcesso.simPesquClick(Sender: TObject);
begin
  if simPesqu.Checked = true then
  begin
    Label18.Visible := true;
    MonthCalendar1.Visible := true;
    avancar.Enabled := true;
    MonthCalendar1.Enabled := true;
    MonthCalendar2.Enabled := false;
    MonthCalendar3.Enabled := false;
    diferPesqui.Checked := false;
    naoPesqu.Checked := false;
  end;

end;

procedure TFrmLogAcesso.SpeedButton1Click(Sender: TObject);
begin
  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DM.sdss_User);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DM.cds_User.Close;
      DM.cds_User.Params[0].AsInteger := DM.sdss_UserCOD_USUARIO.AsInteger;
      DM.cds_User.Open;
      avancar.Enabled := true;
    end;
  finally
    DM.sdss_User.Close;
    FrmLocalizarUser.Free;
  end;
end;

procedure TFrmLogAcesso.SpeedButton2Click(Sender: TObject);
var
  i: Integer;
begin
  LbMoveItemUp(ListBoxAtributos);
  LbMoveItemUp(ListBoxFinal);
end;

procedure TFrmLogAcesso.SpeedButton3Click(Sender: TObject);
begin
  LbMoveItemDown(ListBoxAtributos);
  LbMoveItemDown(ListBoxFinal);
end;

procedure TFrmLogAcesso.SpeedButton8Click(Sender: TObject);
begin
  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DMII.sds_LocalUserSis);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DMII.sds_OpenUser.Close;
      DMII.sds_OpenUser.Params[0].AsInteger :=
        DMII.sds_LocalUserSisCOD_USUARIO.AsInteger;
      DMII.sds_OpenUser.Open;
      avancar.Enabled := true;
    end;
  finally
    DMII.sds_LocalUserSis.Close;
    FrmLocalizarUser.Free;
  end;
end;

procedure TFrmLogAcesso.sbAddClick(Sender: TObject);
var
  Index1, Index2: Integer;
begin
  Index1 := 0;
  Index2 := 0;
  try
    if ListBoxRecebe.Items.Count > 0 then
    begin
      Index1 := GetFirstSelection(ListBoxRecebe);
      MoveSelected(ListBoxRecebe, ListBoxAtributos.Items);
      SetItem(ListBoxRecebe, Index1);
      // avancar.Enabled := ListBoxAtributos.Items.Count <> 0;

      Index2 := GetFirstSelection(ListBoxReal);
      MoveSelected(ListBoxReal, ListBoxFinal.Items);
      SetItem(ListBoxReal, Index2);
      // avancar.Enabled := ListBoxReal.Items.Count <> 0;
    end;
  Except
    on E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;
end;

procedure TFrmLogAcesso.addTodos;
var
  t: Integer;
begin
  for t := 0 to ListBoxRecebe.Items.Count - 1 do
    ListBoxAtributos.Items.AddObject(ListBoxRecebe.Items[t],
      ListBoxRecebe.Items.Objects[t]);
  ListBoxRecebe.Items.Clear;
  SetItem(ListBoxRecebe, 0);
  // avancar.Enabled := ListBoxFinal.Items.Count <> 0;
end;

procedure TFrmLogAcesso.addTodosInferior;
var
  t: Integer;
begin
  for t := 0 to ListBoxReal.Items.Count - 1 do
    ListBoxFinal.Items.AddObject(ListBoxReal.Items[t],
      ListBoxReal.Items.Objects[t]);
  ListBoxReal.Items.Clear;
  SetItem(ListBoxReal, 0);
  // avancar.Enabled := ListBoxFinal.Items.Count <> 0;
end;

procedure TFrmLogAcesso.sbAddTodosClick(Sender: TObject);
var
  i, t: Integer;
begin
  try
    for i := 0 to ListBoxRecebe.Items.Count - 1 do
      ListBoxAtributos.Items.AddObject(ListBoxRecebe.Items[i],
        ListBoxRecebe.Items.Objects[i]);
    ListBoxRecebe.Items.Clear;
    SetItem(ListBoxRecebe, 0);
    addTodos;
    for t := 0 to ListBoxReal.Items.Count - 1 do
      ListBoxFinal.Items.AddObject(ListBoxReal.Items[t],
        ListBoxReal.Items.Objects[t]);
    ListBoxReal.Items.Clear;
    SetItem(ListBoxReal, 0);
    addTodosInferior;
  except
    on E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;

end;

procedure TFrmLogAcesso.sbRemoverClick(Sender: TObject);
var
  Index1, Index2: Integer;
begin
  try
    Index1 := GetFirstSelection(ListBoxAtributos);
    MoveSelected(ListBoxAtributos, ListBoxRecebe.Items);
    SetItem(ListBoxAtributos, Index1);

    Index2 := GetFirstSelection(ListBoxFinal);
    MoveSelected(ListBoxFinal, ListBoxReal.Items);
    SetItem(ListBoxFinal, Index2);
    // end; // else
    // if ListBoxAtributos.Items.Count = 0 then
    // begin
    // ListBoxAtributos.Clear;
    // ListBoxFinal.Clear;
    // LoopIdent;
    // sbRemover.Enabled := false;
    // end;
  except
    on E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;

end;

procedure TFrmLogAcesso.removerTodos;
var
  t, i: Integer;
begin
  for i := 0 to ListBoxAtributos.Items.Count - 1 do
    ListBoxRecebe.Items.AddObject(ListBoxAtributos.Items[t],
      ListBoxAtributos.Items.Objects[t]);
  ListBoxAtributos.Items.Clear;
  SetItem(ListBoxAtributos, 0);
  for t := 0 to ListBoxFinal.Items.Count - 1 do
    ListBoxReal.Items.AddObject(ListBoxFinal.Items[t],
      ListBoxFinal.Items.Objects[t]);
  ListBoxFinal.Items.Clear;
  SetItem(ListBoxFinal, 0);
  // DM.SQLConnection.GetFieldNames('LOG', ListBoxRecebe.Items);
  // DM.SQLConnection.GetFieldNames('LOG', ListBoxReal.Items);
end;

procedure TFrmLogAcesso.sbRemoverTodosClick(Sender: TObject);
var
  i, t: Integer;
begin
  for i := 0 to ListBoxAtributos.Items.Count - 1 do
    ListBoxRecebe.Items.AddObject(ListBoxAtributos.Items[i],
      ListBoxAtributos.Items.Objects[i]);
  ListBoxAtributos.Items.Clear;
  SetItem(ListBoxAtributos, 0);
  removerTodos;
  LoopIdent;
  for t := 0 to ListBoxFinal.Items.Count - 1 do
    ListBoxReal.Items.AddObject(ListBoxFinal.Items[i],
      ListBoxFinal.Items.Objects[i]);
  ListBoxFinal.Items.Clear;
  SetItem(ListBoxFinal, 0);
  removerTodos;
end;

procedure TFrmLogAcesso.LoopIdent;
var
  i: Integer;
begin
  try
    for i := 0 to Pred(ListBoxRecebe.Count) do
    begin
      if ListBoxRecebe.Items.Strings[i] = 'CODIGO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Log de Acesso';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_USUARIO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Usuário';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'INSERDATA' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Data';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'HORA' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Hora';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_ACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Código da Ação';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'ACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Ação do Pocedimento'
      end;
      if ListBoxRecebe.Items.Strings[i] = 'APLICATIVO' then
      begin
        ListBoxRecebe.Items.Strings[i] :=
          'Aplicativo/Parte do Open Arquivos ...'
      end;
      if ListBoxRecebe.Items.Strings[i] = 'COD_REGISTRO' then
      begin
        ListBoxRecebe.Items.Strings[i] :=
          'Código do Arquivo e ou Procedimento...';
      end;
      if ListBoxRecebe.Items.Strings[i] = 'DISCRIMINACAO' then
      begin
        ListBoxRecebe.Items.Strings[i] := 'Nome do Procedimento/Arquivo ...'
      end;
    end;
  Except
    On E: Exception do
    begin
      Application.OnException := nil;
      Application.OnMessage := nil;
    end;
  end;
end;

procedure TFrmLogAcesso.usuarioClick(Sender: TObject);
begin
  if usuario.Checked = true then
  begin
    avancar.Enabled := true;
    opcao05.Visible := true;
    opcao06.Visible := false;
    opcao04.Visible := false;
  end;
end;

procedure TFrmLogAcesso.MonthCalendar3Click(Sender: TObject);
var
  dia01, mes01, ano01: Word;
begin
  DecodeDate(MonthCalendar2.Date, ano01, mes01, dia01);
  if (dia01 > 0) then
  begin
    avancar.Enabled := true;
  end;

end;

procedure TFrmLogAcesso.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  i: Integer;
begin
  for i := List.Items.Count - 1 downto 0 do
    if List.Selected[i] then
    begin
      Items.AddObject(List.Items[i], List.Items.Objects[i]);
      List.Items.Delete(i);
    end;
end;

procedure TFrmLogAcesso.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := ListBoxRecebe.Items.Count = 0;
  DstEmpty := ListBoxAtributos.Items.Count = 0;
  if ListBoxAtributos.Items.Count = 0 then
  begin
    sbAdd.Enabled := not SrcEmpty;
    sbAddTodos.Enabled := not SrcEmpty;
  end;
  sbRemover.Enabled := not DstEmpty;
  sbRemoverTodos.Enabled := not DstEmpty;
end;

procedure TFrmLogAcesso.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;
    Selected[Index] := true;
  end;
  SetButtons;
end;

end.
