// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnConsultaEspecial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons,
  DBCtrls, SimpleDS, DBClient, Mask;

type
  TFrmView = class(TForm)
    Dtsrc: TDataSource;
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
    DtsrcTodos: TDataSource;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    SpeedButton2: TSpeedButton;
    EditPesqu: TMaskEdit;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure AlertBotaoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditPesquKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    buffer: array [0 .. 255] of Char;
    Temp: String;
    selecAtualReport: Integer;
  public
    codUserFill, codAssuntoFill: Integer;

  end;

var
  FrmView: TFrmView;

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
    if Odd(DM.sds_view_todos.RecNo) then
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
    if Column.Field = DM.sds_view_todos.FieldByName('DESCRICAO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1.Canvas.FillRect(Rect);
        DrawText(DBGrid1.Canvas.Handle,
          pchar(DM.sds_view_todos.FieldByName('DESCRICAO').asString),
          Length(DM.sds_view_todos.FieldByName('DESCRICAO').asString), r,
          DT_WORDBREAK);
      end;
    end;
    if Column.Field = DM.sds_view_todos.FieldByName('TITULO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1.Canvas.FillRect(Rect);
        DrawText(DBGrid1.Canvas.Handle,
          pchar(DM.sds_view_todos.FieldByName('TITULO').asString),
          Length(DM.sds_view_todos.FieldByName('TITULO').asString), r,
          DT_WORDBREAK);
      end;
    end;
    if Column.Field = DM.sds_view_todos.FieldByName('NOME_ARQUIVO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1.Canvas.FillRect(Rect);
        DrawText(DBGrid1.Canvas.Handle,
          pchar(DM.sds_view_todos.FieldByName('NOME_ARQUIVO').asString),
          Length(DM.sds_view_todos.FieldByName('NOME_ARQUIVO').asString), r,
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

procedure TFrmView.EditPesquKeyPress(Sender: TObject; var Key: Char);
begin
  if RadioGroup1.ItemIndex = 2 then
  begin
    if Not(Key in [#8, #48 .. #57]) then
      Key := #0;
  end;

end;

procedure TFrmView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.sds_view.CLOSE;
  DM.sds_view_todos.CLOSE;
  DM.cds_User.CLOSE;
  DM.cds_UserCod.CLOSE;
  DM.cds_Assunt.CLOSE;
  // DM.sds_view.Filtered := False;
end;

procedure TFrmView.FormShow(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    DBGrid1.DataSource := Dtsrc;

    with DM.sds_view do
    begin
      BitBtn2.Enabled := not IsEmpty;
    end;

    with DM.sds_view do
    begin
      DBGrid1.DataSource := DtsrcTodos;
      BitBtn2.Enabled := not IsEmpty;
    end;
    DM.sds_view.CLOSE;
  end
  else if (FrmLogin.TODOS = 1) then
  begin

    with DM.sds_view_todos do
    begin
      DBGrid1.DataSource := DtsrcTodos;
      BitBtn2.Enabled := not IsEmpty;
    end;
    DM.sds_view_todos.CLOSE;
  end;

end;

procedure TFrmView.RadioGroup1Click(Sender: TObject);
begin

  EditPesqu.text := '';
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
begin
  if (FrmLogin.TODOS = 1) then
  begin
    case RadioGroup1.ItemIndex of
      0:
        begin

          DM.sds_view_todos.CLOSE;
          DM.sds_view_todos.Params[0].Value := '%' + EditPesqu.text + '%';

          // DM.sds_view_todos.Params[6].asInteger := FrmLogin.COD_USUARIO;

          DBGrid1.DataSource := DtsrcTodos;
          DM.sds_view_todos.Open;

          Label3.Caption := IntToStr(DM.sds_view_todos.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view_todos.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
          end
          else if ((DM.sds_view_todos.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            PanelComplete.Visible := False;
          end;
        end;
      1:
        begin
          with DM.sds_view_todos do
          Begin
            CLOSE;

            Params[1].asString := '%' + EditPesqu.text + '%';

            // Params[6].asInteger := FrmLogin.COD_USUARIO;

            DBGrid1.DataSource := DtsrcTodos;
            Open;
          end;

          Label3.Caption := IntToStr(DM.sds_view_todos.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view_todos.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
          end
          else if ((DM.sds_view_todos.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            PanelComplete.Visible := False;
          end;
        end;
      2:
        begin
          with DM.sds_view_todos do
          Begin
            CLOSE;
            if (EditPesqu.text = '') then
            begin
              MessageDlg('Informe o Código desejado!', mtWarning, [mbOK], 0);
            end
            else
            begin
              Params[2].Value := StrToInt(EditPesqu.text);

              // DM.sds_view_todos.Params[6].asInteger := FrmLogin.COD_USUARIO;

              DBGrid1.DataSource := DtsrcTodos;
              Open;
              // DM.sds_view_todos.Filtered := False;
              Label3.Caption := IntToStr(DM.sds_view_todos.RecordCount);
              Alert.Visible := True;
            end;
            { if ((DM.sds_view_todos.RecordCount) = 1) then
              begin
              PanelMaximizar.Visible := False;
              end; }
          end;
        end;
      3:
        begin
          with DM.sds_view_todos do
          Begin
            CLOSE;
            if (EditPesqu.text <> '') then
            begin
              Params[3].asString := '%' + EditPesqu.text + '%';

              // DM.sds_view_todos.Params[6].asInteger := FrmLogin.COD_USUARIO;
            end;
            DBGrid1.DataSource := DtsrcTodos;
            Open;
          end;

          Label3.Caption := IntToStr(DM.sds_view_todos.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view_todos.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
          end
          else if ((DM.sds_view_todos.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            PanelComplete.Visible := False;
          end;
        end;

      4:
        begin
          EditPesqu.EditMask := '!99/99/0000;1;_';
          with DM.sds_view_todos do
          Begin
            CLOSE;
            if (EditPesqu.text <> '') then
            begin
              // DM.sds_view_todos.DataSet.ParamByName('dt').AsDate := StrToDate(EditPesqu.text);
              Params[4].AsDate := StrToDate(EditPesqu.text);

              // DM.sds_view_todos.Params[6].asInteger := FrmLogin.COD_USUARIO;

              DBGrid1.DataSource := DtsrcTodos;
              Open;
            end;
          end;

          Label3.Caption := IntToStr(DM.sds_view_todos.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view_todos.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
          end
          else if ((DM.sds_view_todos.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            PanelComplete.Visible := False;
          end;

        end;

    end;

    // BitBtn1.Visible := False;
  end
  else if (FrmLogin.TODOS = 0) then
  begin

    case RadioGroup1.ItemIndex of
      0:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
            ' inner join ARQUIVOS_USUARIOS N on (N.IDARQUIVOS = AQ.ID) and (N.IDUSUARIOS = AQ.COD_USUARIO)'
            + ' inner join USUARIO U on (N.IDUSUARIOS = U.COD_USUARIO)' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
            ' where AQ.NOME_ARQUIVO like ' +
            QuotedStr('%' + EditPesqu.text + '%') + ' and N.IDUSUARIOS=' +
            IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.NOME_ARQUIVO';
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            PanelComplete.Visible := False;
          end;
        end;
      1:
        begin
          DM.sds_view.CLOSE;
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME,SU.TITULOASSUN from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
            ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
            'where AQ.DESCRICAO like ' + QuotedStr('%' + EditPesqu.text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DESCRICAO';
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
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
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N '
              + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' +
              'inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
              ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
              ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
              ' where AQ.ID = ' + EditPesqu.text + ' and N.IDUSUARIOS=' +
              IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.ID ';
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
          DM.sds_view.DataSet.CommandText := '';
          DM.sds_view.DataSet.CommandText :=
            ' select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO, AQ.TITULO, AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' +
            ' inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
            ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.TITULO like ' + QuotedStr('%' + EditPesqu.text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.TITULO';
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
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
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on on (AQ.ID = N.IDARQUIVOS)' +
            'inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            'where AQ.DATA = :date' + ' and N.IDUSUARIOS=' +
            IntToStr(FrmLogin.COD_USUARIO);

          DM.sds_view.DataSet.ParamByName('date').AsDate :=
            StrToDate(EditPesqu.text);
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;

          Label3.Caption := IntToStr(DM.sds_view.RecordCount);
          Alert.Visible := True;
          if ((DM.sds_view.RecordCount) >= 4) then
          begin
            PanelMaximizar.Visible := True;
            PanelComplete.Visible := True;
          end
          else if ((DM.sds_view.RecordCount) <= 3) then
          begin
            PanelMaximizar.Visible := False;
            PanelComplete.Visible := False;
          end;

        end;
    else

      if (FrmLogin.TODOS = 1) then
      begin
        with DM.sds_view_todos do
        begin
          BitBtn1.Enabled := not IsEmpty;
          SpeedButton3.Enabled := not IsEmpty;
        end;
      end;
      with DM.sds_view do
      begin
        BitBtn1.Enabled := not IsEmpty;
        SpeedButton3.Enabled := not IsEmpty;
      end;
      BitBtn1.Visible := False;
    end;
  end;
end;

procedure TFrmView.SpeedButton3Click(Sender: TObject);
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
    //DM.RvProjectConsulta.ProjectFile := 'ReportGeral/SelecionaPorGrid.rav';
    // DM.RvProjectConsulta.Execute;
    // DM.ppReport1.Print;
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
      SpeedButton3.Enabled := not IsEmpty;
    end;
  end
  else

    if (FrmLogin.TODOS = 1) then
  begin
    with DM.sds_view_todos do
    begin
      BitBtn1.Enabled := not IsEmpty;
      SpeedButton3.Enabled := not IsEmpty;
    end;
  end;
end;

procedure TFrmView.SpeedButton5Click(Sender: TObject);
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

procedure TFrmView.SpeedButton7Click(Sender: TObject);
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
