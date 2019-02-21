// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnConsultaEspecial_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons,
  DBCtrls, SimpleDS, DBClient, Mask;

type
  TFrmView_old = class(TForm)
    Dtscr: TDataSource;
    DBGrid1: TDBGrid;
    Dtscru: TDataSource;
    Dtscra: TDataSource;
    DtsrcCod: TDataSource;
    Panel6: TPanel;
    Label4: TLabel;
    Image2: TImage;
    Panel16: TPanel;
    Image4: TImage;
    Label10: TLabel;
    Panel7: TPanel;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Image5: TImage;
    CheckFiltro: TCheckBox;
    RadioGroup1: TRadioGroup;
    EditPesqu: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Panel8: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    Panel12: TPanel;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    DBText2: TDBText;
    DBEdit2: TDBEdit;
    Panel17: TPanel;
    SpeedButton8: TSpeedButton;
    Label13: TLabel;
    DBText3: TDBText;
    DBEdit3: TDBEdit;
    habilitar00: TSpeedButton;
    desabilitar00: TSpeedButton;
    habilitar02: TSpeedButton;
    desabilitar02: TSpeedButton;
    habilitar01: TSpeedButton;
    desabilitar01: TSpeedButton;
    PanelData: TPanel;
    SpeedButton11: TSpeedButton;
    Label8: TLabel;
    PanelMostrData: TPanel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    habilitar03: TSpeedButton;
    desabilitar03: TSpeedButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PanelComplete: TPanel;
    Alert: TPanel;
    Label3: TLabel;
    Label30: TLabel;
    PanelMaximizar: TPanel;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton8Click(Sender: TObject);
    procedure desabilitar00Click(Sender: TObject);
    procedure habilitar00Click(Sender: TObject);
    procedure desabilitar03Click(Sender: TObject);
    procedure habilitar03Click(Sender: TObject);
    procedure desabilitar02Click(Sender: TObject);
    procedure habilitar02Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure AlertBotaoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditPesquKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure desabilitar01Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure habilitar01Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    buffer: array [0 .. 255] of Char;
    Temp: String;
    selecAtualReport: Integer;
  public
    codUserFill, codAssuntoFill: Integer;

  end;

var
  FrmView_old: TFrmView_old;

implementation

Uses ShellAPI, UDM, ULocalizarUser, UnLocalizarUserCod, UProjeto,
  UnConsultEspMaximized,
  UnDlgProcuraAssunto;

{$R *.dfm}

procedure TFrmView_old.BitBtn1Click(Sender: TObject);
begin
  alert.Visible := False;
end;

procedure TFrmView_old.BitBtn2Click(Sender: TObject);
begin
  alert.Visible := False;
  CLOSE;
end;

procedure TFrmView_old.DBGrid1CellClick(Column: TColumn);
begin
  if DBGrid1.FieldCount <> 0 then
  begin
    FrPrincipal.codigoArqu := DBGrid1.DataSource.DataSet.Fields[0].asInteger;
    selecAtualReport := DBGrid1.DataSource.DataSet.Fields[0].asInteger;
  end
  else
    Abort;
end;

procedure TFrmView_old.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  r: TRect;
begin
  if Odd(DM.sds_view.RecNo) then
  begin
    DBGrid1.Canvas.Brush.Color := $00CBEAEB;
    // DBGrid1.Canvas.Font.Color:=clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else
  begin
    DBGrid1.Canvas.Brush.Color := $00FFF4F4;
    DBGrid1.Canvas.Font.Color := clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  if gdfocused in State then // $00808040
  begin // $00D6D6D6
    DBGrid1.Canvas.Brush.Color := $00D6D6D6;
    DBGrid1.Canvas.Font.Color := clBlue;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  r := Rect;
  Dec(r.Bottom, 2);
  if Column.Field = DM.sds_view.FieldByName('DESCRICAO') then
  begin
    if not(gdSelected in State) or (gdSelected in State) then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      DrawText(DBGrid1.Canvas.Handle,
        pchar(DM.sds_view.FieldByName('DESCRICAO').asString),
        Length(DM.sds_view.FieldByName('DESCRICAO').asString), r, DT_WORDBREAK);
    end;
  end;
  if Column.Field = DM.sds_view.FieldByName('TITULO') then
  begin
    if not(gdSelected in State) or (gdSelected in State) then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      DrawText(DBGrid1.Canvas.Handle,
        pchar(DM.sds_view.FieldByName('TITULO').asString),
        Length(DM.sds_view.FieldByName('TITULO').asString), r, DT_WORDBREAK);
    end;
  end;
  if Column.Field = DM.sds_view.FieldByName('NOME_ARQUIVO') then
  begin
    if not(gdSelected in State) or (gdSelected in State) then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      DrawText(DBGrid1.Canvas.Handle,
        pchar(DM.sds_view.FieldByName('NOME_ARQUIVO').asString),
        Length(DM.sds_view.FieldByName('NOME_ARQUIVO').asString), r,
        DT_WORDBREAK);
    end;
  end;
end;

procedure TFrmView_old.desabilitar00Click(Sender: TObject);
begin
  codUserFill := StrToInt(DBEdit3.text);
  DM.sds_view.Filtered := False;
  desabilitar00.Enabled := False;
  habilitar00.Enabled := True;
  DBText3.Caption := '';
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
    SpeedButton3.Enabled := not IsEmpty;
    CLOSE;
    if not IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
    end;
  end;
end;

procedure TFrmView_old.desabilitar01Click(Sender: TObject);
begin
  codUserFill := StrToInt(DBEdit1.text);
  DM.sds_view.Filtered := False;
  desabilitar01.Enabled := False;
  habilitar01.Enabled := True;
  DBText1.Caption := '';
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
    SpeedButton3.Enabled := not IsEmpty;
    CLOSE;
    if not IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
    end;
  end;
end;

procedure TFrmView_old.desabilitar02Click(Sender: TObject);
begin
  codAssuntoFill := StrToInt(DBEdit2.text);
  DM.sds_view.Filtered := False;
  desabilitar02.Enabled := False;
  habilitar02.Enabled := True;
  DBText2.Caption := '';
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
    SpeedButton3.Enabled := not IsEmpty;
    CLOSE;
    if not IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
    end;
  end;
end;

procedure TFrmView_old.desabilitar03Click(Sender: TObject);
begin
  DM.sds_view.Filtered := False;
  desabilitar03.Enabled := False;
  habilitar03.Enabled := True;
  PanelMostrData.Visible := False;
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
    SpeedButton3.Enabled := not IsEmpty;
    CLOSE;
    if not IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
    end;
  end;
end;

procedure TFrmView_old.EditPesquKeyPress(Sender: TObject; var Key: Char);
begin
  if RadioGroup1.ItemIndex = 2 then
  begin
    if Not(Key in [#8, #48 .. #57]) then
      Key := #0;
  end;

end;

procedure TFrmView_old.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.sds_view.CLOSE;
  DM.cds_User.CLOSE;
  DM.cds_UserCod.CLOSE;
  DM.cds_Assunt.CLOSE;
  DM.sds_view.Filtered := False;
end;

procedure TFrmView_old.FormShow(Sender: TObject);
begin
  DBEdit1.text := IntToStr(0);
  DBEdit2.text := IntToStr(0);
  DBEdit3.text := IntToStr(0);
  DM.cds_Assunt.CLOSE;

  with DM.sds_view do
  begin
    SpeedButton3.Enabled := not IsEmpty;
  end;
  DateTimePicker1.Refresh;
  DateTimePicker2.Refresh;
end;

procedure TFrmView_old.RadioGroup1Click(Sender: TObject);
begin
  DM.sds_view.Params.Clear;
  DM.sds_view.CLOSE;
  EditPesqu.text := '';
  alert.Visible := False;
  EditPesqu.SetFocus;
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
    SpeedButton3.Enabled := not IsEmpty;
  end;
  if (RadioGroup1.ItemIndex = 4) then
  begin
    EditPesqu.EditMask := '!99/99/0000;1;_';
  end
  else if (RadioGroup1.ItemIndex <> 4) then

  begin
    EditPesqu.EditMask := '';
    EditPesqu.text := '';
  end;

end;

procedure TFrmView_old.SpeedButton11Click(Sender: TObject);
begin
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
  desabilitar03.Enabled := False;
  habilitar03.Enabled := True;
  if PanelMostrData.Visible = False then
    PanelMostrData.Visible := True
  else
    PanelMostrData.Visible := False;
end;

procedure TFrmView_old.SpeedButton1Click(Sender: TObject);
begin
  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DM.sdss_User);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DM.cds_User.CLOSE;
      DM.cds_User.Params[0].asInteger := DM.sdss_UserCOD_USUARIO.asInteger;
      DM.cds_User.Open;
    end;
  finally
    DM.sdss_User.CLOSE;
    FrmLocalizarUser.Free;
  end;
  habilitar01.Enabled := True;
  desabilitar01.Enabled := False;
end;

procedure TFrmView_old.SpeedButton2Click(Sender: TObject);
begin
  DM.sds_view.Params.Clear;
  case RadioGroup1.ItemIndex of
    0:
      begin
        DM.sds_view.CLOSE;
        DM.sds_view.DataSet.CommandText := '';
        DM.sds_view.DataSet.CommandText :=
          'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO,PO.NOME, AQ.DATA, SU.TITULOASSUN from ARQUIVOLIST AQ '
          + 'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
          'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
          'where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.text + '%')
          + ' order by AQ.NOME_ARQUIVO';
        DM.sds_view.Open;
        if CheckFiltro.Checked = True then
        begin
          DM.sds_view.Filtered := True;
        end
        else
        begin
          DM.sds_view.Filtered := False;
        end;
        Label3.Caption := IntToStr(DM.sds_view.RecordCount);
        alert.Visible := True;
        if ((DM.sds_view.RecordCount) >= 4) then
        begin
          PanelMaximizar.Visible := True;
          PanelComplete.Visible := true;
        end
        else if ((DM.sds_view.RecordCount) <= 3) then
        begin
          PanelMaximizar.Visible := False;
          PanelComplete.Visible := false;
        end;
      end;
    1:
      begin
        DM.sds_view.Params.Clear;
        DM.sds_view.CLOSE;
        DM.sds_view.DataSet.CommandText := '';
        DM.sds_view.DataSet.CommandText :=
          'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN from ARQUIVOLIST AQ '
          + 'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
          'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
          'where AQ.DESCRICAO like ' + QuotedStr('%' + EditPesqu.text + '%') +
          ' order by AQ.DESCRICAO';
        DM.sds_view.Open;
        if CheckFiltro.Checked = True then
        begin
          DM.sds_view.Filtered := True;
        end
        else
        begin
          DM.sds_view.Filtered := False;
        end;
        Label3.Caption := IntToStr(DM.sds_view.RecordCount);
        alert.Visible := True;
        if ((DM.sds_view.RecordCount) >= 4) then
        begin
          PanelMaximizar.Visible := True;
          PanelComplete.Visible := true;
        end
        else if ((DM.sds_view.RecordCount) <= 3) then
        begin
          PanelMaximizar.Visible := False;
          PanelComplete.Visible := False;
        end;

      end;
    2:
      begin
        if EditPesqu.text = '' then
        begin
          MessageDlg('Informe o Código desejado!', mtWarning, [mbOK], 0);
        end
        else
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN from ARQUIVOLIST AQ '
            + 'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'where AQ.ID = ' + EditPesqu.text + ' order by AQ.ID';
          DM.sds_view.Open;
          DM.sds_view.Filtered := False;
          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          alert.Visible := True;
          if ((DM.sds_view.RecordCount) = 1) then
          begin
            PanelMaximizar.Visible := False;
          end;
        end;

      end;
    3:
      begin
        DM.sds_view.CLOSE;
        DM.sds_view.DataSet.CommandText := '';
        DM.sds_view.DataSet.CommandText :=
          'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO, AQ.TITULO, AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN from ARQUIVOLIST AQ '
          + 'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
          'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
          'where AQ.TITULO like ' + QuotedStr('%' + EditPesqu.text + '%') +
          ' order by AQ.TITULO';
        DM.sds_view.Open;
        if CheckFiltro.Checked = True then
        begin
          DM.sds_view.Filtered := True;
        end
        else
        begin
          DM.sds_view.Filtered := False;
        end;
        Label3.Caption := IntToStr(DM.sds_view.RecordCount);
        alert.Visible := True;
        if ((DM.sds_view.RecordCount) >= 4) then
        begin
          PanelMaximizar.Visible := True;
          PanelComplete.Visible := true;
        end
        else if ((DM.sds_view.RecordCount) <= 3) then
        begin
          PanelMaximizar.Visible := False;
          PanelComplete.Visible := False;
        end;

      end;
    4:
      begin
        EditPesqu.EditMask := '!99/99/0000;1;_';
        DM.sds_view.CLOSE;
        DM.sds_view.DataSet.CommandText := '';
        DM.sds_view.DataSet.CommandText :=
          'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN from ARQUIVOLIST AQ '
          + 'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
          'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
          'where AQ.DATA = :date';

        DM.sds_view.DataSet.ParamByName('date').AsDate :=
          StrToDate(EditPesqu.text);
        DM.sds_view.Open;
        if CheckFiltro.Checked = True then
        begin
          DM.sds_view.Filtered := True;
        end
        else
        begin
          DM.sds_view.Filtered := False;
        end;
        Label3.Caption := IntToStr(DM.sds_view.RecordCount);
        alert.Visible := True;
        if ((DM.sds_view.RecordCount) >= 4) then
        begin
          PanelMaximizar.Visible := True;
          PanelComplete.Visible := true;
        end
        else if ((DM.sds_view.RecordCount) <= 3) then
        begin
          PanelMaximizar.Visible := False;
          PanelComplete.Visible := False;
        end;

      end;
  end;
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
    SpeedButton3.Enabled := not IsEmpty;
  end;
  BitBtn1.Visible := False;
end;

procedure TFrmView_old.SpeedButton3Click(Sender: TObject);
begin
  if selecAtualReport <= 0 then
  begin
    MessageDlg('Selecione primeiro a Informação Desejada na Lista!', mtWarning,
      [mbOK], 0);
  end
  else
  begin
    DM.sds_report_detalhe.CLOSE;
    DM.sds_report_detalhe.Params[0].asInteger := selecAtualReport;
    DM.sds_report_detalhe.Open;
    // DM.RvProjectConsulta.ProjectFile := 'ReportGeral/SelecionaPorGrid.rav';
    // DM.RvProjectConsulta.Execute;
    // DM.ppReport1.Print;
  end;
end;

procedure TFrmView_old.SpeedButton4Click(Sender: TObject);
begin
  BitBtn1.Visible := True;
  with DM.sds_view do
  begin
    BitBtn1.Enabled := not IsEmpty;
  end;
end;

procedure TFrmView_old.SpeedButton5Click(Sender: TObject);
begin
  FrmViewMax := TFrmViewMax.Create(Application);
  try
    if FrmViewMax.ShowModal = mrOk then
    begin
      DM.cds_arquivo.CLOSE;
      DM.cds_arquivo.Params[0].asInteger := FrmViewMax.codigoArquMax;
      DM.cds_arquivo.Open;
    end;
  finally
    FrmViewMax.CLOSE;
  end;
end;

procedure TFrmView_old.SpeedButton6Click(Sender: TObject);
begin
  FrmLocalizaAssunto := TFrmLocalizaAssunto.Create(Self, DM.sds_Assunt);
  try
    if FrmLocalizaAssunto.ShowModal = mrOk then
    begin
      DM.cds_Assunt.CLOSE;
      DM.cds_Assunt.Params[0].asInteger := DM.sds_AssuntCODIGO.asInteger;
      DM.cds_Assunt.Open;
    end;
  finally
    DM.sds_Assunt.CLOSE;
    FrmLocalizaAssunto.Free;
  end;
  habilitar02.Enabled := True;
  desabilitar02.Enabled := False;
end;

procedure TFrmView_old.SpeedButton7Click(Sender: TObject);
var
  x, y: pchar;
  Flag: Integer;
begin
  if selecAtualReport <= 0 then
  begin
    MessageDlg('Selecione primeiro a Informação Desejada na Lista!', mtWarning,
      [mbOK], 0);
  end
  else
  begin
    GetTempPath(SizeOf(buffer), buffer);
    Temp := StrPas(buffer) + '\OpenArquivos';
    TBlobField(DM.sds_view.Fields[4])
      .SaveToFile(Temp + '\' + DM.sds_view.Fields[3].asString);
    x := nil;
    y := nil;
    Flag := ShellExecute(Application.Handle, 'OPEN',
      pchar(Temp + '\' + DM.sds_view.Fields[3].asString), x, y, SW_SHOW);
    if Flag <= 32 then
    begin
      ShowMessage('Erro ao Abrir ' + Temp + '\' + DM.sds_view.Fields[3]
        .asString);
    end;
  end;

end;

procedure TFrmView_old.SpeedButton8Click(Sender: TObject);
begin
  FrmLocalizarUserCod := TFrmLocalizarUserCod.Create(Self, DM.sds_UserCod);
  try
    if FrmLocalizarUserCod.ShowModal = mrOk then
    begin
      DM.cds_UserCod.CLOSE;
      DM.cds_UserCod.Params[0].asInteger := DM.sds_UserCodCOD_USUARIO.asInteger;
      DM.cds_UserCod.Open;
    end;
  finally
    DM.sds_UserCod.CLOSE;
    FrmLocalizarUserCod.Free;
  end;
  habilitar00.Enabled := True;
  desabilitar00.Enabled := False;
end;

procedure TFrmView_old.AlertBotaoClick(Sender: TObject);
begin
  FrmViewMax := TFrmViewMax.Create(Application);
  try
    if FrmViewMax.ShowModal = mrOk then
    begin
      DM.cds_arquivo.CLOSE;
      DM.cds_arquivo.Params[0].asInteger := FrmViewMax.codigoArquMax;
      DM.cds_arquivo.Open;
    end;
  finally
    FrmViewMax.CLOSE;
  end;
end;

procedure TFrmView_old.habilitar00Click(Sender: TObject);
begin
  codUserFill := StrToInt(DBEdit3.text);
  DM.sds_view.Filtered := False;
  desabilitar00.Enabled := True;
  habilitar00.Enabled := False;
  with DM.sds_view do
  begin
    if NOT IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
      if ((DM.sds_view.RecordCount) >= 4) then
      begin
        PanelMaximizar.Visible := True;
      end
      else if ((DM.sds_view.RecordCount) <= 3) then
      begin
        PanelMaximizar.Visible := False;
      end;
    end
    else
    begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton3.Enabled := not IsEmpty;
    end;
  end;
end;

procedure TFrmView_old.habilitar01Click(Sender: TObject);
begin
  codUserFill := StrToInt(DBEdit1.text);
  DM.sds_view.Filtered := False;
  desabilitar01.Enabled := True;
  habilitar01.Enabled := False;
  with DM.sds_view do
  begin
    if NOT IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
      if ((DM.sds_view.RecordCount) >= 4) then
      begin
        PanelMaximizar.Visible := True;
      end
      else if ((DM.sds_view.RecordCount) <= 3) then
      begin
        PanelMaximizar.Visible := False;
      end;
    end
    else
    begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton3.Enabled := not IsEmpty;
    end;
  end;

end;

procedure TFrmView_old.habilitar02Click(Sender: TObject);
begin
  codAssuntoFill := StrToInt(DBEdit2.text);
  DM.sds_view.Filtered := False;
  desabilitar02.Enabled := True;
  habilitar02.Enabled := False;
  with DM.sds_view do
  begin
    if NOT IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
      if ((DM.sds_view.RecordCount) >= 4) then
      begin
        PanelMaximizar.Visible := True;
      end
      else if ((DM.sds_view.RecordCount) <= 3) then
      begin
        PanelMaximizar.Visible := False;
      end;
    end
    else
    begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton3.Enabled := not IsEmpty;
    end;
  end;
end;

procedure TFrmView_old.habilitar03Click(Sender: TObject);
begin
  DM.sds_view.Filtered := False;
  desabilitar03.Enabled := True;
  habilitar03.Enabled := False;
  with DM.sds_view do
  begin
    if NOT IsEmpty then
    begin
      Label3.Caption := IntToStr(DM.sds_view.RecordCount);
      if ((DM.sds_view.RecordCount) >= 4) then
      begin
        PanelMaximizar.Visible := True;
      end
      else if ((DM.sds_view.RecordCount) <= 3) then
      begin
        PanelMaximizar.Visible := False;
      end;
    end
    else
    begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton3.Enabled := not IsEmpty;
    end;
  end;
  // if (PanelMostrData.Visible = True) then
  // begin
  // if (DateToStr(DateTimePicker1.Date)) = (DateToStr(DateTimePicker2.Date)) then
  // begin
  // desabilitar03.Enabled := False;
  // habilitar03.Enabled := False;
  // CheckFiltro.Checked := False;
  // RadioGroup1.ItemIndex := 4;
  // EditPesqu.Text:=DateToStr(DateTimePicker1.Date);
  // end;
  // end;
end;

end.
