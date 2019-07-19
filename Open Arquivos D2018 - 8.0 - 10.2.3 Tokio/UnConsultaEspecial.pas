// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnConsultaEspecial;

interface

uses
  Windows, Messages, Forms, Dialogs, SysUtils, Variants, Data.DB, Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Graphics, Vcl.Controls,
  System.Classes, Vcl.Grids, Vcl.DBGrids;

type
  TFrmView = class(TForm)
    Dtsrc: TDataSource;
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
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton4: TSpeedButton;
    DataSourceCriterio: TDataSource;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    EditPesqu: TMaskEdit;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    Alert: TPanel;
    Label3: TLabel;
    Label30: TLabel;
    PanelMaximizar: TPanel;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    GroupBox1: TGroupBox;
    CheckBoxConsulta: TCheckBox;
    PanelData: TPanel;
    SpeedButton11: TSpeedButton;
    Label8: TLabel;
    PanelMostrData: TPanel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel4: TPanel;
    Label2: TLabel;
    DBText4: TDBText;
    SpeedButton7: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    DBEdit4: TDBEdit;
    Panel8: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    DBEdit1: TDBEdit;
    Panel12: TPanel;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    DBText2: TDBText;
    habilitar02: TSpeedButton;
    desabilitar02: TSpeedButton;
    DBEdit2: TDBEdit;
    Panel17: TPanel;
    SpeedButton8: TSpeedButton;
    Label13: TLabel;
    DBText3: TDBText;
    habilitar00: TSpeedButton;
    desabilitar00: TSpeedButton;
    DBEdit3: TDBEdit;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure AlertBotaoClick(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure EditPesquKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure habilitar00Click(Sender: TObject);
    procedure habilitar02Click(Sender: TObject);
    procedure desabilitar00Click(Sender: TObject);

    procedure habilitar03Click(Sender: TObject);
    procedure CheckBoxConsultaClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure desabilitar02Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    buffer: array [0 .. 255] of Char;
    Temp: String;
    selecAtualReport: Integer;
  public
    codUserFill, codAssuntoFill: Integer;

  end;

var
  FrmView: TFrmView;
  CodigoUser: String;
  CodigoUserPorNome: String;
  CodigoAssunto: String;
  CodigoPorCriterio: string;

implementation

Uses ShellAPI, UDM, ULocalizarUser, UnLocalizarUserCod, UProjeto, UnLogin,
  UnConsultEspMaximized,
  UnDlgProcuraAssunto;

{$R *.dfm}

procedure TFrmView.BitBtn1Click(Sender: TObject);
begin
  Alert.Visible := False;
end;

procedure TFrmView.BitBtn2Click(Sender: TObject);
begin
  Alert.Visible := False;
  CLOSE;
end;

procedure TFrmView.CheckBoxConsultaClick(Sender: TObject);
begin
  if (CheckBoxConsulta.Checked = False) then
  begin
    CodigoUser := '';
    CodigoAssunto := '';
    CodigoUserPorNome := '';
    CodigoPorCriterio := '';
    DM.sds_view.Filtered := False;
  end

end;

procedure TFrmView.DBGrid1CellClick(Column: TColumn);
begin
  if DBGrid1.FieldCount <> 0 then
  begin
    FrPrincipal.codigoArqu := DBGrid1.DataSource.DataSet.Fields[0].asInteger;
    selecAtualReport := DBGrid1.DataSource.DataSet.Fields[0].asInteger;
  end
  else
    Abort;
end;

procedure TFrmView.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  r: TRect;
begin
  if (FrmLogin.TODOS = 1) then
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
          Length(DM.sds_view.FieldByName('DESCRICAO').asString), r,
          DT_WORDBREAK);
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
  end
  else if (FrmLogin.TODOS = 0) then
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
          Length(DM.sds_view.FieldByName('DESCRICAO').asString), r,
          DT_WORDBREAK);
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

end;

procedure TFrmView.desabilitar00Click(Sender: TObject);
begin
  habilitar00.Enabled := True;
  desabilitar00.Enabled := False;
  DtsrcCod.DataSet.CLOSE;
end;

procedure TFrmView.desabilitar02Click(Sender: TObject);
begin
  desabilitar02.Enabled := False;
  habilitar02.Enabled := True;
  Dtscra.DataSet.CLOSE;
end;

{ procedure TFrmView.desabilitar01Click(Sender: TObject);
  begin
  DataSourceCriterio.DataSet.CLOSE;
  //SpeedButton9.Enabled := True;
  //SpeedButton10.Enabled := False;
  end;

  procedure TFrmView.desabilitar02Click(Sender: TObject);
  begin
  desabilitar02.Enabled := False;
  habilitar02.Enabled := True;
  Dtscra.DataSet.CLOSE;
  end; }

procedure TFrmView.EditPesquKeyPress(Sender: TObject; var Key: Char);
begin
  if RadioGroup1.ItemIndex = 2 then
  begin
    if Not(Key in [#8, #48 .. #57]) then
      Key := #0;
  end;

end;

procedure TFrmView.FormActivate(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    Panel8.Visible := False;
    Panel4.Visible := True;

    // Panel2.Height := 320;
    // FrmView.Height := 716;
  end
  else if (FrmLogin.TODOS = 1) then
  begin
    Panel4.Visible := False;
    Panel8.Visible := True;
    // Panel2.Height := 354;
    // FrmView.Height := 716;
  end;

  CodigoUser := '';
  CodigoUserPorNome := '';
  CodigoAssunto := '';
  habilitar00.Enabled := True;
  habilitar02.Enabled := True;
  // habilitar01.Enabled := True;
  desabilitar00.Enabled := False;
  Dtscra.DataSet.CLOSE;
  Dtscru.DataSet.CLOSE;
  DataSourceCriterio.DataSet.CLOSE;
  PanelMostrData.Visible := False;

end;

procedure TFrmView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.sds_view.CLOSE;
  // DM.sds_view_todos.CLOSE;
  DM.cds_User.CLOSE;
  DM.cds_UserCod.CLOSE;
  DM.cds_Assunt.CLOSE;

  DM.sds_view.Filtered := False;
end;

procedure TFrmView.habilitar00Click(Sender: TObject);
begin
  CodigoUser := DBEdit3.Text;
  // CodigoUserPorNome := '';
  // CodigoAssunto := '';
  habilitar00.Enabled := False;
  desabilitar00.Enabled := True;
  // Dtscra.DataSet.CLOSE;
  // Dtscru.DataSet.CLOSE;
  // PanelMostrData.Visible := False;
end;

{ procedure TFrmView.SpeedButton12Click(Sender: TObject);
  begin
  CodigoUserPorNome := DBEdit1.Text;
  // DtsrcCod.DataSet.CLOSE;
  // Dtscra.DataSet.CLOSE;
  PanelMostrData.Visible := False;
  end; }

procedure TFrmView.habilitar02Click(Sender: TObject);
begin
  CodigoUser := '';
  CodigoUserPorNome := '';
  CodigoAssunto := DBEdit2.Text;
  desabilitar02.Enabled := True;
  habilitar02.Enabled := False;
  DtsrcCod.DataSet.CLOSE;
  // Dtscra.DataSet.Close;
  Dtscru.DataSet.CLOSE;
  PanelMostrData.Visible := False;
end;

procedure TFrmView.habilitar03Click(Sender: TObject);
begin
  DtsrcCod.DataSet.CLOSE;
  Dtscra.DataSet.CLOSE;
  Dtscru.DataSet.CLOSE;

  // PanelMostrData.Visible:=False;
end;

procedure TFrmView.RadioGroup1Click(Sender: TObject);
begin

  { EditPesqu.text := '';
    Alert.Visible := False;
    EditPesqu.SetFocus;
    if (RadioGroup1.ItemIndex = 4) then
    begin
    EditPesqu.EditMask := '!99/99/0000;1;_';
    end
    else if (RadioGroup1.ItemIndex <> 4) then

    begin
    EditPesqu.EditMask := '';
    EditPesqu.text := '';
    end;
    if (FrmLogin.TODOS = 1) then
    begin
    with DM.sds_view_todos do
    begin
    CLOSE;
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

    end
    else if (FrmLogin.TODOS = 0) then
    begin
    with DM.sds_view do
    begin
    CLOSE;
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

    end; }
end;

procedure TFrmView.SpeedButton7Click(Sender: TObject);
begin

  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DM.sds_UserPorCriterio);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DM.sds_UserPorCriterio.Open;
    end;
  finally
    FrmLocalizarUser.Free;
    // DM.sds_UserPorCriterio.Close;
  end;
end;

procedure TFrmView.SpeedButton10Click(Sender: TObject);
begin
  SpeedButton9.Enabled := True;
  SpeedButton10.Enabled := False;
  CodigoUserPorNome := '';
  DBText1.Caption := '';
  DBEdit1.Text := '';
  Dtscru.DataSet.CLOSE;
end;

procedure TFrmView.SpeedButton11Click(Sender: TObject);
begin
  if (PanelMostrData.Visible = True) then
  begin
    PanelMostrData.Visible := False;
  end
  else
  begin
    PanelMostrData.Visible := True;
  end;
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
end;

procedure TFrmView.SpeedButton12Click(Sender: TObject);
begin
  SpeedButton13.Enabled := True;
  SpeedButton12.Enabled := False;
  CodigoPorCriterio := DBEdit4.Text;
end;

procedure TFrmView.SpeedButton13Click(Sender: TObject);
begin
  SpeedButton13.Enabled := False;
  SpeedButton12.Enabled := True;
  CodigoPorCriterio := '';
  DBText4.Caption := '';
  DataSourceCriterio.DataSet.CLOSE;
end;

procedure TFrmView.SpeedButton14Click(Sender: TObject);
begin
  DM.sds_view.CLOSE;
  Dtscru.DataSet.CLOSE;
  Dtscra.DataSet.CLOSE;
  DM.cds_User.CLOSE;
  DM.cds_UserCod.CLOSE;
  DM.cds_Assunt.CLOSE;
  DtsrcCod.DataSet.CLOSE;
  DataSourceCriterio.DataSet.CLOSE;
  // PanelComplete.Visible := False;
  PanelMaximizar.Visible := False;
  DM.sds_view.Filtered := False;
end;

procedure TFrmView.SpeedButton15Click(Sender: TObject);
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
   DM.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) +
     'ReportGeral\FastReport\RelatorioPorSelecao.fr3', True);
    DM.frxReport1.ShowReport;
  end;
end;

procedure TFrmView.SpeedButton1Click(Sender: TObject);
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
end;

procedure TFrmView.SpeedButton2Click(Sender: TObject);
var
  Inicial, Finall: string;
begin
  Inicial := '';
  Finall := '';

  // DM.sds_view.CLOSE;
  // DM.sds_view_todos.CLOSE;
  if (FrmLogin.TODOS = 1) then
  begin
    // Panel4.Visible := False;
    case RadioGroup1.ItemIndex of
      0:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,U.NOME from ARQUIVOLIST AQ'
          // + ' inner join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
            + ' inner join ARQUIVOS_USUARIOS N on (N.IDARQUIVOS = AQ.ID) and (N.IDUSUARIOS = AQ.COD_USUARIO)'
            + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
            ' where AQ.NOME_ARQUIVO like ' +
            QuotedStr('%' + EditPesqu.Text + '%') +
          // ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.NOME_ARQUIVO';
          if PanelMostrData.Visible = True then
          begin

            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);

            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME from ARQUIVOLIST AQ'
              + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
              ' where AQ.NOME_ARQUIVO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial'
              + ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO';
            DM.sds_view.DataSet.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.DataSet.ParamByName('finall').asDate :=
              StrToDate(Finall);
          end;

          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
            end;
            Dtsrc.DataSet.Filtered := True;
          end;

          Dtsrc.DataSet.Filtered := True;
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;
        end;
      1:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA, PO.NOME from ARQUIVOLIST AQ'
          // + ' inner join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
            + ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
            'where AQ.DESCRICAO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
          // ' and AQ.COD_USUARIO=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DESCRICAO';
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.CLOSE;

            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME from ARQUIVOLIST AQ'
              + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
              ' where AQ.NOME_ARQUIVO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial'
              + ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO';
            DM.sds_view.DataSet.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.DataSet.ParamByName('finall').asDate :=
              StrToDate(Finall);
          end;
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
            end;

            Dtsrc.DataSet.Filtered := True;
            // DBGrid1.DataSource := Dtsrc;
          end;
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 2) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) = 1) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;

        end;
      2:
        begin
          if EditPesqu.Text = '' then
          begin
            MessageDlg('Informe o Código desejado!', mtWarning, [mbOK], 0);
          end
          else
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME from ARQUIVOLIST AQ'
              + ' inner join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
              'inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
              ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
              ' where AQ.ID = ' + EditPesqu.Text + ' and N.IDUSUARIOS=' +
              IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.ID ';
            if PanelMostrData.Visible = True then
            begin
              DM.sds_view.CLOSE;
              DM.sds_view.Params.Clear;
              DM.sds_view.DataSet.Params.Clear;
              Inicial := DateToStr(DateTimePicker1.Date);
              // FormatDateTime('yyyy-MM-dd', );
              Finall := DateToStr(DateTimePicker2.Date);
              // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
              DM.sds_view.CLOSE;
              DM.sds_view.DataSet.CommandText := '';
              DM.sds_view.DataSet.CommandText :=
                'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME from ARQUIVOLIST AQ'
                + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
                ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
                ' where AQ.NOME_ARQUIVO like ' +
                QuotedStr('%' + EditPesqu.Text + '%') +
                ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' +
                ' order by AQ.NOME_ARQUIVO';
              DM.sds_view.DataSet.ParamByName('inicial').asDate :=
                StrToDate(Inicial);
              DM.sds_view.DataSet.ParamByName('finall').asDate :=
                StrToDate(Finall);
            end;
            if (CheckBoxConsulta.Checked = True) then
            begin
              if (CodigoUser <> '') and (CodigoAssunto = '') and
                (CodigoUserPorNome = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
              end;
              if (CodigoUser = '') and (CodigoAssunto <> '') and
                (CodigoUserPorNome = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
              end;
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
              end;

              Dtsrc.DataSet.Filtered := True;
              DBGrid1.DataSource := Dtsrc;
            end;
            // end;
            DM.sds_view.Open;
            DBGrid1.DataSource := Dtsrc;
            DM.sds_view.Filtered := False;
            Label3.Caption := IntToStr(DM.sds_view.RecordCount);
            Alert.Visible := True;
            if ((DM.sds_view.RecordCount) = 1) then
            begin
              PanelMaximizar.Visible := False;
            end;
          end;

        end;
      3:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME from ARQUIVOLIST AQ'
            + ' inner join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
            ' inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
            ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.TITULO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.TITULO';
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.CLOSE;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME from ARQUIVOLIST AQ'
              + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
              ' where AQ.NOME_ARQUIVO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial'
              + ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO';
            DM.sds_view.DataSet.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.DataSet.ParamByName('finall').asDate :=
              StrToDate(Finall);
          end;
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := 'COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := 'COD_USUARIO=' + CodigoUserPorNome;
            end;

            Dtsrc.DataSet.Filtered := True;

            // end;
          end;
          DBGrid1.DataSource := Dtsrc;
          DM.sds_view.Open;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;

        end;
      4:
        begin
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          EditPesqu.EditMask := '!99/99/0000;1;_';
          DM.sds_view.CLOSE;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            ' select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA, T.NOME from ARQUIVOLIST AQ'
            + ' inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
            ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.DATA = :atual';
          DM.sds_view.DataSet.ParamByName('atual').asString := EditPesqu.Text;
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
            end;
            Dtsrc.DataSet.Filtered := True;
            DBGrid1.DataSource := Dtsrc;
          end;

          DM.sds_view.Open;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;

        end;
    else

      if (FrmLogin.TODOS = 1) then
      begin
        with DM.sds_view do
        begin
          BitBtn1.Enabled := not IsEmpty;
          SpeedButton15.Enabled := not IsEmpty;

        end;
      end;
      with DM.sds_view do
      begin
        BitBtn1.Enabled := not IsEmpty;
        SpeedButton15.Enabled := not IsEmpty;
        // BitBtn2.Enabled := not IsEmpty;
      end;
      BitBtn1.Visible := False;

    end;
  end;
  // BitBtn1.Visible := False;

  if (FrmLogin.TODOS = 0) then
  begin

    case RadioGroup1.ItemIndex of
      0:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME,SU.TITULOASSUN from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
            ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
            ' where AQ.NOME_ARQUIVO like ' +
            QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.COD_USUARIO=' +
            IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.NOME_ARQUIVO';
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.CLOSE;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,PO.NOME from ARQUIVOLIST AQ'
              + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
              ' where AQ.NOME_ARQUIVO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial'
              + ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO';
            DM.sds_view.DataSet.ParamByName('inicial').asString := Inicial;
            DM.sds_view.DataSet.ParamByName('finall').asString := Finall;
          end;
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoPorCriterio <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoPorCriterio;
            end;
            Dtsrc.DataSet.Filtered := True;
          end;

          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;
        end;
      1:
        begin
          if PanelMostrData.Visible = False then
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME,SU.TITULOASSUN from ARQUIVOS_USUARIOS N '
              + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
              ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
              'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
              'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
              'where AQ.DESCRICAO like ' + QuotedStr('%' + EditPesqu.Text + '%')
              + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
              ' order by AQ.DESCRICAO';
          end;
          if (DBText4.Caption <> '') then
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME,SU.TITULOASSUN from ARQUIVOS_USUARIOS N '
              + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
              ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
              'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
              'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
              'where AQ.DESCRICAO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') +
            // ' and N.IDUSUARIOS=' + CodigoPorCriterio +
              ' order by AQ.DESCRICAO';
          end;

          if PanelMostrData.Visible = True then
          begin
            // try
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);

            Finall := DateToStr(DateTimePicker2.Date);

            DM.sds_view.CLOSE;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME,SU.TITULOASSUN from ARQUIVOS_USUARIOS N '
              + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
              ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
              'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
              'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
              'where AQ.DESCRICAO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') +
            // ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
              ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' +
              ' order by AQ.NOME_ARQUIVO';
            DM.sds_view.DataSet.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.DataSet.ParamByName('finall').asDate :=
              StrToDate(Finall);

            { except on E: Exception do
              begin
              MessageDlg('Verifique uma Data Valida de Cadastro!',mtWarning, [mbOK], 0);
              end;
              end; }
          end;
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoPorCriterio <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoPorCriterio;
            end;
            Dtsrc.DataSet.Filtered := True;
          end;

          DM.sds_view.Open;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 2) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) = 1) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;

        end;

      2:
        begin
          if EditPesqu.Text = '' then
          begin
            MessageDlg('Informe o Código desejado!', mtWarning, [mbOK], 0);
          end
          else
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N'
              + ' inner join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' +
              'inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
              ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
              ' where AQ.ID = ' + EditPesqu.Text + ' and N.IDUSUARIOS=' +
              IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.ID ';
            if PanelMostrData.Visible = True then
            begin
              DM.sds_view.CLOSE;
              DM.sds_view.Params.Clear;
              DM.sds_view.DataSet.Params.Clear;
              Inicial := DateToStr(DateTimePicker1.Date);
              // FormatDateTime('yyyy-MM-dd', );
              Finall := DateToStr(DateTimePicker2.Date);
              // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
              DM.sds_view.CLOSE;
              DM.sds_view.DataSet.CommandText := '';
              DM.sds_view.DataSet.CommandText :=
                'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME from ARQUIVOLIST AQ'
                + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
                ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
                ' where AQ.NOME_ARQUIVO like ' +
                QuotedStr('%' + EditPesqu.Text + '%') +
                ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO';
              DM.sds_view.DataSet.ParamByName('inicial').asDate :=
                StrToDate(Inicial);
              DM.sds_view.DataSet.ParamByName('finall').asDate :=
                StrToDate(Finall);
            end;
            if (CheckBoxConsulta.Checked = True) then
            begin
              if (CodigoUser <> '') and (CodigoAssunto = '') and
                (CodigoUserPorNome = '') and (CodigoPorCriterio = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
              end;
              if (CodigoUser = '') and (CodigoAssunto <> '') and
                (CodigoUserPorNome = '') and (CodigoPorCriterio = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
              end;
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome <> '') and (CodigoPorCriterio = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
              end;
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome = '') and (CodigoPorCriterio <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoPorCriterio;
              end;
              Dtsrc.DataSet.Filtered := True;

              Dtsrc.DataSet.Filtered := True;
              DBGrid1.DataSource := Dtsrc;
            end;
            // end;

          end;

        end;
      3:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N'
            + ' inner join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' +
            ' inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
            ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.TITULO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.TITULO';
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.DataSet.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);

            DM.sds_view.DataSet.CommandText := '';
            DM.sds_view.DataSet.CommandText :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME from ARQUIVOLIST AQ'
              + ' inner join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
              ' where AQ.NOME_ARQUIVO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial'
              + ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO';
            DM.sds_view.DataSet.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.DataSet.ParamByName('finall').asDate :=
              StrToDate(Finall);
          end;
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := 'COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := 'COD_USUARIO=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoPorCriterio <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoPorCriterio;
            end;
            Dtsrc.DataSet.Filtered := True;

            Dtsrc.DataSet.Filtered := True;

            // end;
          end;
          DBGrid1.DataSource := Dtsrc;
          DM.sds_view.Open;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;

        end;
      4:
        begin
          EditPesqu.EditMask := '!99/99/0000;1;_';
          DM.sds_view.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.DataSet.Params.Clear;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N'
            + ' inner join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' +
            'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            'where AQ.DATA = :date' + ' and N.IDUSUARIOS=' +
            IntToStr(FrmLogin.COD_USUARIO);
          DM.sds_view.DataSet.ParamByName('date').asDate :=
            StrToDate(EditPesqu.Text);
          if (CheckBoxConsulta.Checked = True) then
          begin
            if (CodigoUser <> '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
            end;
            Dtsrc.DataSet.Filtered := True;
            DBGrid1.DataSource := Dtsrc;
          end;

          DM.sds_view.Open;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            // PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            // PanelComplete.Visible := False;
          end;

        end;

      { if (FrmLogin.TODOS = 1) then
        begin
        with (not DM.sds_view.Eof) do
        begin
        BitBtn1.Enabled := True;
        SpeedButton3.Enabled := True;

        end;
        end;
        with not DM.sds_view.Eof do
        begin
        BitBtn1.Enabled := True;
        SpeedButton3.Enabled := True;
        // BitBtn2.Enabled := not IsEmpty;
        end;
        BitBtn1.Visible := False; }

    end;
  end;
end;

procedure TFrmView.SpeedButton4Click(Sender: TObject);
begin
  BitBtn1.Visible := True;
  if (FrmLogin.TODOS = 0) then
  begin
    with DM.sds_view do
    begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton15.Enabled := not IsEmpty;
    end;
  end
  else

    { if (FrmLogin.TODOS = 1) then
      begin
      with DM.sds_view do
      begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton3.Enabled := not IsEmpty;
      end;
      end; }
end;

procedure TFrmView.SpeedButton5Click(Sender: TObject);
begin
  FrmviewMax := TFrmViewMax.Create(Self);
  try
    if FrmviewMax.ShowModal = mrOk then
    begin
      DM.cds_arquivo.CLOSE;
      DM.cds_arquivo.Params[0].asInteger := FrmviewMax.codigoArquMax;
      DM.cds_arquivo.Open;
    end;
  finally
    FrmviewMax.CLOSE;
  end;
end;

procedure TFrmView.SpeedButton6Click(Sender: TObject);
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

end;

{ procedure TFrmView.SpeedButton22Click(Sender: TObject);
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

  end; }
procedure TFrmView.SpeedButton8Click(Sender: TObject);
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

end;

procedure TFrmView.SpeedButton9Click(Sender: TObject);
begin
  SpeedButton9.Enabled := False;
  SpeedButton10.Enabled := True;
  CodigoUserPorNome := DBEdit1.Text;

end;

procedure TFrmView.AlertBotaoClick(Sender: TObject);
begin
  FrmviewMax := TFrmViewMax.Create(Application);
  try
    if FrmviewMax.ShowModal = mrOk then
    begin
      DM.cds_arquivo.CLOSE;
      DM.cds_arquivo.Params[0].asInteger := FrmviewMax.codigoArquMax;
      DM.cds_arquivo.Open;
    end;
  finally
    FrmviewMax.CLOSE;
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

end.
