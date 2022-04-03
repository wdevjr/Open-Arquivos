unit unDlgPesquisaArquivo;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBCtrls, Buttons, ExtCtrls, ComCtrls, StdCtrls,
  JvGridFilter, JvYearGrid, JvTFMonths, JvTFWeeks, JvTFManager, JvBaseEdits,
  JvDesignSurface, JvFormWallpaper, JvXPButtons, JvXPCore, JvBmpAnimator,
  JvFullColorCtrls, JvGradient, JvOwnerDrawViewer, JvTabBar, JvNavigationPane,
  JvAutoComplete, JvDBSearchEdit, JvDBControls, JvDBLookup, ubarcodes, LR_BarC;

type

  { TFrmDlgPesquisa }

  TFrmDlgPesquisa = class(TForm)
    BarcodeQR1: TBarcodeQR;
    BitBtn2: TBitBtn;
    BtnOk: TBitBtn;
    CheckBoxINC: TCheckBox;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DtsrcTodos: TDataSource;
    Dtsrc: TDataSource;
    EditProc1: TEdit;
    EditProc2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StsBr: TStatusBar;
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1SelectEditor(Sender: TObject; Column: TColumn;
      var Editor: TWinControl);
    procedure EditProc1KeyPress(Sender: TObject; var Key: char);
    procedure EditProc2KeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure StsBrDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
  private

  public

  end;

var
  FrmDlgPesquisa: TFrmDlgPesquisa;

implementation

{$R *.lfm}
uses UnDM, UnCadArquivos, unLogin, unDlgDescricao;

{ TFrmDlgPesquisa }

procedure TFrmDlgPesquisa.BtnOkClick(Sender: TObject);
begin
  BarcodeQR1.Visible := False;
  FormArquivo.MostrarIcon;
end;

procedure TFrmDlgPesquisa.BitBtn2Click(Sender: TObject);
begin
  BarcodeQR1.Visible := False;
end;

procedure TFrmDlgPesquisa.DBGrid1CellClick(Column: TColumn);
begin
  {  FrmDlgDescricao:=TFrmDlgDescricao.Create(self);
  try
    FrmDlgDescricao.ShowModal;
  finally
     FrmDlgDescricao.Free;
  end; }
  try
    if (FrmLogin.TODOS = 0) then
    begin
      BarcodeQR1.Visible := True;
      BarcodeQR1.Text := IntToStr(DM.sds_ArquID.AsInteger);
    end
    else
    if (FrmLogin.TODOS = 1) then
    begin
      BarcodeQR1.Visible := True;
      BarcodeQR1.Text := IntToStr(DM.sds_ArquTodosID.AsInteger);
    end;
  except
    on E: Exception do
    begin
      MessageDlg('Erro de Consulta de Arquivo!', E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrmDlgPesquisa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  R: TRect;
begin

  { if (FrmLogin.TODOS = 0) then
  begin
    if DM.sds_Arqu.IsEmpty = false then
    begin



      R := Rect;
      Dec(R.Bottom, 2);
      if Column.Field = DM.sds_Arqu.FieldByName('DESCRICAO') then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(AnsiUpperCase(DM.sds_Arqu.FieldByName('DESCRICAO').AsString)),
            Length(AnsiUpperCase(DM.sds_Arqu.FieldByName('DESCRICAO').AsString)), R,
            DT_WORDBREAK);
        end;
      end;
      if Column.Field = DM.sds_Arqu.FieldByName('TITULO') then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(DM.sds_Arqu.FieldByName('TITULO').AsString),
            Length(DM.sds_Arqu.FieldByName('TITULO').AsString), R,
            DT_WORDBREAK);
        end;
      end;
      if Column.Field = DM.sds_Arqu.FieldByName('NOME_ARQUIVO') then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(DM.sds_Arqu.FieldByName('NOME_ARQUIVO').AsString),
            Length(DM.sds_Arqu.FieldByName('NOME_ARQUIVO').AsString), R,
            DT_WORDBREAK);
        end;
      end;
    end;
  end
  else if (FrmLogin.TODOS = 1) then
  begin
    if DM.sds_ArquTodos.IsEmpty = false then
    begin

      R := Rect;
      Dec(R.Bottom, 2);
      if Column.Field = DM.sds_ArquTodosDESCRICAO then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(AnsiString(DM.sds_ArquTodosDESCRICAO.AsString)),
            Length(AnsiString(DM.sds_ArquTodosDESCRICAO.AsString)), R, DT_WORDBREAK);
        end;
      end;
      if Column.Field = DM.sds_ArquTodosTITULO then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(DM.sds_ArquTodosTITULO.AsString),
            Length(DM.sds_ArquTodosTITULO.AsString), R, DT_WORDBREAK);
        end;
      end;
      if Column.Field = DM.sds_ArquTodosNOME_ARQUIVO then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(DM.sds_ArquTodosNOME_ARQUIVO.AsString),
            Length(DM.sds_ArquTodosNOME_ARQUIVO.AsString), R, DT_WORDBREAK);
        end;
      end;
    end;



end;  }
end;

procedure TFrmDlgPesquisa.DBGrid1SelectEditor(Sender: TObject;
  Column: TColumn; var Editor: TWinControl);
begin
  try
    if (FrmLogin.TODOS = 0) then
    begin
      BarcodeQR1.Visible := True;
      BarcodeQR1.Text := IntToStr(DM.sds_ArquID.AsInteger);
    end
    else
    if (FrmLogin.TODOS = 1) then
    begin
      BarcodeQR1.Visible := True;
      BarcodeQR1.Text := IntToStr(DM.sds_ArquTodosID.AsInteger);
    end;
  except
    on E: Exception do
    begin
      MessageDlg('Erro de Consulta de Arquivo!', E.Message, mtError, [mbOK], 0);
    end;
  end;

end;

procedure TFrmDlgPesquisa.EditProc1KeyPress(Sender: TObject; var Key: char);
begin
 if (key <> #8) then
 begin
  EditProc1.Text:=DM.Remover(EditProc1.Text);
  EditProc2.Text:=DM.Remover(EditProc2.Text);
   if (FrmLogin.TODOS = 1) then
  begin
    if CheckBoxINC.Checked = True then
    begin
      with DM.sds_ArquTodos do
      begin
        Close;
        if tag = 0 then
        begin
          if (EditProc1.Text <> '') and (EditProc2.Text = '') then
          begin
            DM.sds_ArquTodos.Close;
            DM.sds_ArquTodos.SQL.Clear;
            // DM.sds_ArquTodos.Params.Clear;
            DM.sds_ArquTodos.SQL.Add(
              'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,AQ.TITULO,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,UR.NOME as NOMEUSER,SS.TITULOASSUN,TT.NOME as NOMEAUTOR,AQ.INFORMACOES,AQ.DATA' + ' from ARQUIVOLIST AQ' + ' left join USUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.TITULO like ' + QuotedStr('%' + EditProc1.Text + '%') + ' AND AQ.DESCRICAO like :Param order by AQ.DESCRICAO, AQ.TITULO desc');
            Params[0].AsString := '%' + EditProc1.Text + '%';
            DBGrid1.DataSource := DtsrcTodos;
            DBMemo1.DataSource := DtsrcTodos;
            try
              Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            if (EditProc1.Text <> '') then
            begin
              if IsEmpty then
              begin
                StsBr.Panels[0].Text :=
                  format('Nenhum registro foi encontrado com "%s"',
                  [EditProc1.Text]);
                StsBr.Canvas.Font.Color := clRed;

              end
              else
              begin
                StsBr.Panels[0].Text :=
                  format('%d registros encontrados com "%s"',
                  [RecordCount, EditProc1.Text]);
                StsBr.Canvas.Font.Color := clGreen;
              end;
            end;
          end
          else if (EditProc2.Text <> '') and (EditProc1.Text = '') then
          begin
            DM.sds_ArquTodos.Close;
            DM.sds_ArquTodos.SQL.Clear;
            // DM.sds_ArquTodos.Params.Clear;
            DM.sds_ArquTodos.SQL.Add(
              'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,' +
              ' AQ.TITULO,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,' +
              ' UR.NOME as NOMEUSER,SS.TITULOASSUN,TT.NOME as NOMEAUTOR,' +
              ' AQ.INFORMACOES,AQ.DATA' + ' from ARQUIVOLIST AQ' +
              ' left join USUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO' +
              ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' +
              ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' +
              ' where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc2.Text + '%') +
              ' AND AQ.DESCRICAO like :Param order by AQ.DESCRICAO, AQ.TITULO desc');
            Params[0].AsString := '%' + EditProc2.Text + '%';
            DBGrid1.DataSource := DtsrcTodos;
            DBMemo1.DataSource := DtsrcTodos;
            try
              Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            if (EditProc2.Text <> '') then
            begin
              if IsEmpty then
              begin
                StsBr.Panels[0].Text :=
                  format('Nenhum registro foi encontrado com "%s"',
                  [EditProc2.Text]);
                StsBr.Canvas.Font.Color := clRed;
              end
              else
              begin
                StsBr.Panels[0].Text :=
                  format('%d registros encontrados com "%s"',
                  [RecordCount, EditProc2.Text]);
                StsBr.Canvas.Font.Color := clGreen;

              end;
            end;
          end;


          BtnOk.Enabled := not IsEmpty;

        end;
      end;
    end;

  end;

  if (FrmLogin.TODOS = 0) then
  begin
    if CheckBoxINC.Checked = True then
    begin
      if (EditProc2.Text <> '') and (EditProc1.Text = '') then
      begin
        with DM.sds_Arqu do
        begin
          Close;
          if tag = 0 then
          begin
            DM.sds_Arqu.Close;
            DM.sds_Arqu.SQL.Clear;
            DM.sds_Arqu.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO,PO.NOME as NOMEUSER, AQ.DATA,N.IDUSUARIOS,SS.TITULOASSUN,TT.NOME as NOMEAUTOR from ARQUIVOS_USUARIOS N ' + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc2.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.DESCRICAO');

          end;
          DBGrid1.DataSource := Dtsrc;
          DBMemo1.DataSource := Dtsrc;
          try
            Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
          BtnOk.Enabled := not IsEmpty;

          if (EditProc2.Text <> '') then
          begin
            if IsEmpty then
            begin
              StsBr.Panels[0].Text :=
                format('Nenhum registro foi encontrado com "%s"',
                [EditProc2.Text]);
              StsBr.Canvas.Font.Color := clRed;
            end
            else
            begin
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [RecordCount, EditProc2.Text]);
              StsBr.Canvas.Font.Color := clGreen;
            end;
          end;
        end;
      end
      else if (EditProc1.Text <> '') and (EditProc2.Text = '') then
      begin
        with DM.sds_Arqu do
        begin
          if tag = 0 then
          begin

            DM.sds_Arqu.Close;
            DM.sds_Arqu.SQL.Clear;
            DM.sds_Arqu.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO, AQ.TITULO, AQ.NOME_ARQUIVO, PO.NOME as NOMEUSER, AQ.DATA, SS.TITULOASSUN,N.IDUSUARIOS,TT.NOME as NOMEAUTOR from ARQUIVOS_USUARIOS N ' + 'left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.TITULO like ' + QuotedStr('%' + EditProc1.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.TITULO');

          end;
          DBGrid1.DataSource := Dtsrc;
          DBMemo1.DataSource := Dtsrc;
          try
            Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
          BtnOk.Enabled := not IsEmpty;
          if (EditProc1.Text <> '') then
          begin
            if IsEmpty then
            begin
              StsBr.Panels[0].Text :=
                format('Nenhum registro foi encontrado com "%s"',
                [EditProc1.Text]);
              StsBr.Canvas.Font.Color := clRed;

            end
            else
            begin
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [RecordCount, EditProc1.Text]);
              StsBr.Canvas.Font.Color := clGreen;
            end;
          end;
        end;
      end;
    end;
  end;
 end else Abort;

end;

procedure TFrmDlgPesquisa.EditProc2KeyPress(Sender: TObject; var Key: char);
begin
 if (key <> #8) then
 begin
  EditProc1.Text:=DM.Remover(EditProc1.Text);
  EditProc2.Text:=DM.Remover(EditProc2.Text);
  if (FrmLogin.TODOS = 1) then
  begin
    if CheckBoxINC.Checked = True then
    begin
      with DM.sds_ArquTodos do
      begin
        Close;
        if tag = 0 then
        begin
          if (EditProc1.Text <> '') and (EditProc2.Text = '') then
          begin
            DM.sds_ArquTodos.Close;
            DM.sds_ArquTodos.SQL.Clear;
            // DM.sds_ArquTodos.Params.Clear;
            DM.sds_ArquTodos.SQL.Add(
              'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,AQ.TITULO,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,UR.NOME as NOMEUSER,SS.TITULOASSUN,TT.NOME as NOMEAUTOR,AQ.INFORMACOES,AQ.DATA' + ' from ARQUIVOLIST AQ' + ' left join USUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.TITULO like ' + QuotedStr('%' + EditProc1.Text + '%') + ' AND AQ.DESCRICAO like :Param order by AQ.DESCRICAO, AQ.TITULO desc');
            Params[0].AsString := '%' + EditProc1.Text + '%';
            DBGrid1.DataSource := DtsrcTodos;
            DBMemo1.DataSource := DtsrcTodos;
            try
              Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            if (EditProc1.Text <> '') then
            begin
              if IsEmpty then
              begin
                StsBr.Panels[0].Text :=
                  format('Nenhum registro foi encontrado com "%s"',
                  [EditProc1.Text]);
                StsBr.Canvas.Font.Color := clRed;

              end
              else
              begin
                StsBr.Panels[0].Text :=
                  format('%d registros encontrados com "%s"',
                  [RecordCount, EditProc1.Text]);
                StsBr.Canvas.Font.Color := clGreen;
              end;
            end;
          end
          else if (EditProc2.Text <> '') and (EditProc1.Text = '') then
          begin
            DM.sds_ArquTodos.Close;
            DM.sds_ArquTodos.SQL.Clear;
            // DM.sds_ArquTodos.Params.Clear;
            DM.sds_ArquTodos.SQL.Add(
              'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,' +
              ' AQ.TITULO,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,' +
              ' UR.NOME as NOMEUSER,SS.TITULOASSUN,TT.NOME as NOMEAUTOR,' +
              ' AQ.INFORMACOES,AQ.DATA' + ' from ARQUIVOLIST AQ' +
              ' left join USUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO' +
              ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' +
              ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' +
              ' where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc2.Text + '%') +
              ' AND AQ.DESCRICAO like :Param order by AQ.DESCRICAO, AQ.TITULO desc');
            Params[0].AsString := '%' + EditProc2.Text + '%';
            DBGrid1.DataSource := DtsrcTodos;
            DBMemo1.DataSource := DtsrcTodos;
            try
              Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            if (EditProc2.Text <> '') then
            begin
              if IsEmpty then
              begin
                StsBr.Panels[0].Text :=
                  format('Nenhum registro foi encontrado com "%s"',
                  [EditProc2.Text]);
                StsBr.Canvas.Font.Color := clRed;
              end
              else
              begin
                StsBr.Panels[0].Text :=
                  format('%d registros encontrados com "%s"',
                  [RecordCount, EditProc2.Text]);
                StsBr.Canvas.Font.Color := clGreen;

              end;
            end;
          end;


          BtnOk.Enabled := not IsEmpty;

        end;
      end;
    end;

  end;

  if (FrmLogin.TODOS = 0) then
  begin
    if CheckBoxINC.Checked = True then
    begin
      if (EditProc2.Text <> '') and (EditProc1.Text = '') then
      begin
        with DM.sds_Arqu do
        begin
          Close;
          if tag = 0 then
          begin
            DM.sds_Arqu.Close;
            DM.sds_Arqu.SQL.Clear;
            DM.sds_Arqu.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO,PO.NOME as NOMEUSER, AQ.DATA,N.IDUSUARIOS,SS.TITULOASSUN,TT.NOME as NOMEAUTOR from ARQUIVOS_USUARIOS N ' + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc2.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.DESCRICAO');

          end;
          DBGrid1.DataSource := Dtsrc;
          DBMemo1.DataSource := Dtsrc;
          try
            Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
          BtnOk.Enabled := not IsEmpty;

          if (EditProc2.Text <> '') then
          begin
            if IsEmpty then
            begin
              StsBr.Panels[0].Text :=
                format('Nenhum registro foi encontrado com "%s"',
                [EditProc2.Text]);
              StsBr.Canvas.Font.Color := clRed;
            end
            else
            begin
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [RecordCount, EditProc2.Text]);
              StsBr.Canvas.Font.Color := clGreen;
            end;
          end;
        end;
      end
      else if (EditProc1.Text <> '') and (EditProc2.Text = '') then
      begin
        with DM.sds_Arqu do
        begin
          if tag = 0 then
          begin

            DM.sds_Arqu.Close;
            DM.sds_Arqu.SQL.Clear;
            DM.sds_Arqu.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO, AQ.TITULO, AQ.NOME_ARQUIVO, PO.NOME as NOMEUSER, AQ.DATA, SS.TITULOASSUN,N.IDUSUARIOS,TT.NOME as NOMEAUTOR from ARQUIVOS_USUARIOS N ' + 'left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.TITULO like ' + QuotedStr('%' + EditProc1.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.TITULO');

          end;
          DBGrid1.DataSource := Dtsrc;
          DBMemo1.DataSource := Dtsrc;
          try
            Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
          BtnOk.Enabled := not IsEmpty;
          if (EditProc1.Text <> '') then
          begin
            if IsEmpty then
            begin
              StsBr.Panels[0].Text :=
                format('Nenhum registro foi encontrado com "%s"',
                [EditProc1.Text]);
              StsBr.Canvas.Font.Color := clRed;

            end
            else
            begin
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [RecordCount, EditProc1.Text]);
              StsBr.Canvas.Font.Color := clGreen;
            end;
          end;
        end;
      end;
    end;
  end;
 end else Abort;



end;

procedure TFrmDlgPesquisa.FormActivate(Sender: TObject);
begin
  Color := DM.myColor;
  Panel1.Color := DM.myColor;
end;

procedure TFrmDlgPesquisa.FormShow(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    DBGrid1.DataSource := Dtsrc;

    with DM.sds_Arqu do
    begin

      BtnOk.Enabled := not IsEmpty;
    end;
  end
  else if (FrmLogin.TODOS = 1) then
  begin

    with DM.sds_ArquTodos do
    begin
      DBGrid1.DataSource := DtsrcTodos;
      BtnOk.Enabled := not IsEmpty;
    end;
    DM.sds_ArquTodos.Close;
  end;
  DM.sds_ArquTodos.Close;
  DM.sds_Arqu.Close;


  with Dtsrc.DataSet do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
  // DBGrid1.AlternateColor := $00BFFFFF;
  //DBGrid1.Color := clBtnFace;
  BarcodeQR1.Visible := False;

end;

procedure TFrmDlgPesquisa.JvXPButton1Click(Sender: TObject);
begin
  BarcodeQR1.Visible := False;
end;

procedure TFrmDlgPesquisa.SpeedButton1Click(Sender: TObject);
begin
  FrmDlgDescricao := TFrmDlgDescricao.Create(self);
  try
    FrmDlgDescricao.ShowModal;
  finally
    FrmDlgDescricao.Free;
  end;
end;

procedure TFrmDlgPesquisa.SpeedButton2Click(Sender: TObject);
var
  sSQL, Texto: string;
begin
  EditProc1.Text:=DM.Remover(EditProc1.Text);
  EditProc2.Text:=DM.Remover(EditProc2.Text);
  if CheckBoxINC.Checked = False then
  begin
    if (FrmLogin.TODOS = 0) then
    begin
      if (EditProc2.Text <> '') and (EditProc1.Text = '') then
      begin
        with DM.sds_Arqu do
        begin
          Close;
          if tag = 0 then
          begin
            DM.sds_Arqu.Close;
            DM.sds_Arqu.SQL.Clear;
            DM.sds_Arqu.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO,PO.NOME as NOMEUSER, AQ.DATA,N.IDUSUARIOS,SS.TITULOASSUN,TT.NOME as NOMEAUTOR from ARQUIVOS_USUARIOS N ' + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc2.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.DESCRICAO');

          end;
          DBGrid1.DataSource := Dtsrc;
          DBMemo1.DataSource := Dtsrc;
          try
            Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
          BtnOk.Enabled := not IsEmpty;

          if (EditProc2.Text <> '') then
          begin
            if IsEmpty then
            begin
              StsBr.Panels[0].Text :=
                format('Nenhum registro foi encontrado com "%s"',
                [EditProc2.Text]);
              StsBr.Canvas.Font.Color := clRed;
            end
            else
            begin
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [RecordCount, EditProc2.Text]);
              StsBr.Canvas.Font.Color := clGreen;
            end;
          end;
        end;
      end
      else if (EditProc1.Text <> '') and (EditProc2.Text = '') then
      begin
        with DM.sds_Arqu do
        begin
          if tag = 0 then
          begin

            DM.sds_Arqu.Close;
            DM.sds_Arqu.SQL.Clear;
            DM.sds_Arqu.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO, AQ.TITULO, AQ.NOME_ARQUIVO, PO.NOME as NOMEUSER, AQ.DATA, SS.TITULOASSUN,N.IDUSUARIOS,TT.NOME as NOMEAUTOR from ARQUIVOS_USUARIOS N ' + 'left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.TITULO like ' + QuotedStr('%' + EditProc1.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.TITULO');

          end;
          DBGrid1.DataSource := Dtsrc;
          DBMemo1.DataSource := Dtsrc;
          try
            Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
          BtnOk.Enabled := not IsEmpty;
          if (EditProc1.Text <> '') then
          begin
            if IsEmpty then
            begin
              StsBr.Panels[0].Text :=
                format('Nenhum registro foi encontrado com "%s"',
                [EditProc1.Text]);
              StsBr.Canvas.Font.Color := clRed;

            end
            else
            begin
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [RecordCount, EditProc1.Text]);
              StsBr.Canvas.Font.Color := clGreen;
            end;
          end;
        end;

      end;

    end
    else if (FrmLogin.TODOS = 1) then
    begin
      with DM.sds_ArquTodos do
      begin
        Close;
        if tag = 0 then
        begin
          if (EditProc1.Text <> '') and (EditProc2.Text = '') then
          begin
            DM.sds_ArquTodos.Close;
            DM.sds_ArquTodos.SQL.Clear;
            // DM.sds_ArquTodos.Params.Clear;
            DM.sds_ArquTodos.SQL.Add(
              'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,AQ.TITULO,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,UR.NOME as NOMEUSER,SS.TITULOASSUN,TT.NOME as NOMEAUTOR,AQ.INFORMACOES,AQ.DATA' + ' from ARQUIVOLIST AQ' + ' left join USUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.TITULO like ' + QuotedStr('%' + EditProc1.Text + '%') + ' order by AQ.DESCRICAO, AQ.TITULO desc');
            //Params[0].AsString := '%' + EditProc1.Text + '%';
            DBGrid1.DataSource := DtsrcTodos;
            DBMemo1.DataSource := DtsrcTodos;
            try
              Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            if (EditProc1.Text <> '') then
            begin
              if IsEmpty then
              begin
                StsBr.Panels[0].Text :=
                  format('Nenhum registro foi encontrado com "%s"',
                  [EditProc1.Text]);
                StsBr.Canvas.Font.Color := clRed;

              end
              else
              begin
                StsBr.Panels[0].Text :=
                  format('%d registros encontrados com "%s"',
                  [RecordCount, EditProc1.Text]);
                StsBr.Canvas.Font.Color := clGreen;
              end;
            end;
          end
          else if (EditProc2.Text <> '') and (EditProc1.Text = '') then
          begin
            DM.sds_ArquTodos.Close;
            DM.sds_ArquTodos.SQL.Clear;
            // DM.sds_ArquTodos.Params.Clear;
            DM.sds_ArquTodos.SQL.Add(
              'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,AQ.TITULO,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,UR.NOME as NOMEUSER,SS.TITULOASSUN,TT.NOME as NOMEAUTOR,AQ.INFORMACOES,AQ.DATA' + ' from ARQUIVOLIST AQ' + ' left join USUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO = SS.CODIGO) ' + ' left join AUTORES TT on (TT.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc2.Text + '%') + ' order by AQ.DESCRICAO, AQ.TITULO desc');
            //Params[0].AsString := '%' + EditProc2.Text + '%';
            DBGrid1.DataSource := DtsrcTodos;
            DBMemo1.DataSource := DtsrcTodos;
            try
              Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            if (EditProc2.Text <> '') then
            begin
              if IsEmpty then
              begin
                StsBr.Panels[0].Text :=
                  format('Nenhum registro foi encontrado com "%s"',
                  [EditProc2.Text]);
                StsBr.Canvas.Font.Color := clRed;
              end
              else
              begin
                StsBr.Panels[0].Text :=
                  format('%d registros encontrados com "%s"',
                  [RecordCount, EditProc2.Text]);
                StsBr.Canvas.Font.Color := clGreen;
              end;
            end;
          end;


          BtnOk.Enabled := not IsEmpty;

        end;

      end;

    end;
    DBGrid1.SetFocus;

  end;

end;

procedure TFrmDlgPesquisa.SpeedButton3Click(Sender: TObject);
begin
  try
    try
      if (FrmLogin.TODOS = 0) then
      begin
        DM.ZQueryRelatorioArquivo.Close;
        DM.ZQueryRelatorioArquivo.Params[0].Value := DM.sds_ArquID.AsInteger;
        DM.ZQueryRelatorioArquivo.Open;
      end
      else
      if (FrmLogin.TODOS = 1) then
      begin
        DM.ZQueryRelatorioArquivo.Close;
        DM.ZQueryRelatorioArquivo.Params[0].Value := DM.sds_ArquTodosID.AsInteger;
        DM.ZQueryRelatorioArquivo.Open;
      end;
    except
      on E: Exception do
      begin
        MessageDlg('Erro de Consulta de Arquivo!', E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    DM.frReportArquivo.LoadFromFile('Reports/RelConsultaArquivos.lrf');
    DM.frReportArquivo.Title := 'Tela de Relatórios';
    DM.frReportArquivo.showReport;
  end;
end;

procedure TFrmDlgPesquisa.StsBrDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  begin
    if Panel.ID = 0 then
    begin
      StsBr.Canvas.Brush.Color := DM.myColor;
      //StsBr.Canvas.Font.Color := clGreen;
      StsBr.Canvas.FillRect(Rect);
      StsBr.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    end;
    if Panel.ID = 1 then
    begin
      StsBr.Canvas.Brush.Color := DM.myColor;
      // StsBr.Canvas.Font.Color := clGreen;
      StsBr.Canvas.FillRect(Rect);
      StsBr.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    end;
  end;
end;

end.
