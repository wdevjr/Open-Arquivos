unit UnNovVersao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrmArquProc = class(TForm)
    Dtsrc: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    EditProc1: TEdit;
    Panel3: TPanel;
    BtnOk: TBitBtn;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    StsBr: TStatusBar;
    Label1: TLabel;
    EditProc2: TEdit;
    Label2: TLabel;
    DtsrcTodos: TDataSource;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure StsBrDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure EditProc1KeyPress(Sender: TObject; var Key: Char);
    procedure EditProc1Change(Sender: TObject);
    procedure EditProc2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    function changeVazParam(valor: String): Integer;

  public
    { Public declarations }
  end;

var
  FrmArquProc: TFrmArquProc;
  caracter: array [1 .. 8] of string;

implementation

{$R *.dfm}

uses UDM, UnLogin, UProjeto;

Function TFrmArquProc.changeVazParam(valor: string): Integer;
var
  i, cont: Integer;
begin
  cont := 0;
  caracter[8] := '';
  if valor <> '' then
  begin
    for i := 0 to Length(valor) do
    begin
      if valor[i] <> '' then
        caracter[i] := valor;
      cont := cont + 1;
    end;
  end;
  Result := cont;

end;

procedure TFrmArquProc.BitBtn1Click(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    DM.sds_Arqu.Close;
  end
  else if (FrmLogin.TODOS = 1) then
  begin
    DM.sds_ArquTodos.Close;
  end;
end;

procedure TFrmArquProc.BitBtn3Click(Sender: TObject);
var
  sSQL, Texto: String;
begin
  if (FrmLogin.TODOS = 0) then
  begin
    if (EditProc1.Text <> '') then
    begin
      with DM.sds_Arqu do
      Begin
        Close;
        If tag = 0 then
        begin
          DM.sds_Arqu.DataSet.Close;
          DM.sds_Arqu.DataSet.CommandText := '';
          DM.sds_Arqu.DataSet.CommandText :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,T.NOME,SU.TITULOASSUN from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
            ' inner join ASSUNTO SU on AQ.COD_ASSUNTO = SU.CODIGO ' +
            'inner join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'inner join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
            'where AQ.DESCRICAO like ' + QuotedStr('%' + EditProc1.Text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DESCRICAO';

        end;
        DBGrid1.DataSource := Dtsrc;
        Open;
        Refresh;
        BtnOk.Enabled := not IsEmpty;

        if (EditProc1.Text <> '') then
        begin
          if IsEmpty then
            StsBr.Panels[0].Text :=
              format('Nenum registro foi encontrado com "%s"', [EditProc1.Text])
          else
            StsBr.Panels[0].Text := format('%d registros encontrados com "%s"',
              [recordcount, EditProc1.Text]);
        end;

      end;
    end
    else if (EditProc2.Text <> '') then
    begin
      with DM.sds_Arqu do
      Begin
        If tag = 0 then
        begin

          DM.sds_Arqu.DataSet.Close;
          DM.sds_Arqu.DataSet.CommandText := '';
          DM.sds_Arqu.DataSet.CommandText :=
            ' select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO, AQ.TITULO, AQ.NOME_ARQUIVO, PO.NOME, AQ.DATA, SU.TITULOASSUN,N.IDUSUARIOS,T.NOME from ARQUIVOS_USUARIOS N '
            + ' inner join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' +
            ' inner join ASSUNTO SU on (AQ.COD_ASSUNTO = SU.CODIGO) ' +
            ' inner join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' inner join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.TITULO like ' + QuotedStr('%' + EditProc2.Text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.TITULO';

        end;
        DBGrid1.DataSource := Dtsrc;
        Open;
        BtnOk.Enabled := not IsEmpty;
        if (EditProc2.Text <> '') then
        begin
          if IsEmpty then
            StsBr.Panels[0].Text :=
              format('Nenum registro foi encontrado com "%s"', [EditProc2.Text])
          else
            StsBr.Panels[0].Text := format('%d registros encontrados com "%s"',
              [recordcount, EditProc2.Text]);
        end;
      end;
    end;
  end
  else if (FrmLogin.TODOS = 1) then
  begin
    with DM.sds_ArquTodos do
    Begin
      Close;
      If tag = 0 then
      begin
        if (EditProc1.Text <> '') then
        begin
          Params[1].AsString := '%' + EditProc1.Text + '%';
          DBGrid1.DataSource := DtsrcTodos;
          Open;
          if (EditProc1.Text <> '') then
          begin
            if IsEmpty then
              StsBr.Panels[0].Text :=
                format('Nenum registro foi encontrado com "%s"',
                [EditProc1.Text])
            else
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [recordcount, EditProc2.Text]);
          end;
        end;
        if (EditProc2.Text <> '') then
        begin
          Params[0].AsString := '%' + EditProc2.Text + '%';
          DBGrid1.DataSource := DtsrcTodos;
          Open;
          if (EditProc2.Text <> '') then
          begin
            if IsEmpty then
              StsBr.Panels[0].Text :=
                format('Nenum registro foi encontrado com "%s"',
                [EditProc2.Text])
            else
              StsBr.Panels[0].Text :=
                format('%d registros encontrados com "%s"',
                [recordcount, EditProc2.Text]);
          end;
        end;
      end;

      BtnOk.Enabled := not IsEmpty;

    end;

  end;
end;

procedure TFrmArquProc.DBGrid1CellClick(Column: TColumn);
begin
  FrPrincipal.codigoArquSolteiro := DBGrid1.DataSource.DataSet.Fields[0]
    .asInteger;
end;

procedure TFrmArquProc.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R: TRect;
begin
  if (FrmLogin.TODOS = 0) then
  begin
    if DM.sds_Arqu.IsEmpty = false then
    begin
      if Odd(DM.sds_Arqu.RecNo) then
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
        DBGrid1.Canvas.Brush.Color := $00D6D6D6;
        DBGrid1.Canvas.Font.Color := clBlue;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
      end;

      R := Rect;
      Dec(R.Bottom, 2);
      if Column.Field = DM.sds_Arqu.FieldByName('DESCRICAO') then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(DM.sds_Arqu.FieldByName('DESCRICAO').AsString),
            Length(DM.sds_Arqu.FieldByName('DESCRICAO').AsString), R,
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
      if Odd(DM.sds_ArquTodos.RecNo) then
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
        DBGrid1.Canvas.Brush.Color := $00D6D6D6;
        DBGrid1.Canvas.Font.Color := clBlue;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
      end;

      R := Rect;
      Dec(R.Bottom, 2);
      if Column.Field = DM.sds_ArquTodosDESCRICAO then
      begin
        if not(gdSelected in State) or (gdSelected in State) then
        begin
          DBGrid1.Canvas.FillRect(Rect);
          DrawText(DBGrid1.Canvas.Handle,
            pchar(DM.sds_ArquTodosDESCRICAO.AsString),
            Length(DM.sds_ArquTodosDESCRICAO.AsString), R, DT_WORDBREAK);
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
  end;
end;

procedure TFrmArquProc.EditProc1Change(Sender: TObject);
begin
  if (EditProc1.Text <> '') and (EditProc2.Text <> '') then
  begin
    BitBtn3.Visible := True;
  end;
end;

procedure TFrmArquProc.EditProc1KeyPress(Sender: TObject; var Key: Char);
begin
  { if (FrmLogin.TODOS = 0) then
    begin
    if Key = #13 then
    begin
    with DM.sds_Arqu do
    Begin
    Close;
    If tag = 0 then
    begin
    if EditProc1.Text <> '' then
    Params[0].AsString := '%' + EditProc1.Text + '%';
    // else
    // Params[1].AsString := '';
    end;
    DBGrid1.DataSource := Dtsrc;
    Open;
    BtnOk.Enabled := not IsEmpty;
    // if EditProc1.Text <> '' then
    // begin
    // if IsEmpty then
    // StsBr.Panels[0].Text :=
    // format('Nenum registro foi encontrado com "%s"', [EditProc1.Text])
    // else
    // StsBr.Panels[0].Text := format('%d registros encontrados com "%s"',
    // [recordcount, EditProc1.Text]);
    // end;
    if EditProc1.Text <> '' then
    begin
    if IsEmpty then
    StsBr.Panels[0].Text :=
    format('Nenum registro foi encontrado com "%s"', [EditProc1.Text])
    else
    StsBr.Panels[0].Text := format('%d registros encontrados com "%s"',
    [recordcount, EditProc1.Text]);
    end;
    end;
    end;
    end
    else if (FrmLogin.TODOS = 1) then
    begin
    if Key = #13 then
    begin
    with DM.sds_ArquTodos do
    Begin
    Close;
    If tag = 0 then
    begin
    if EditProc1.Text <> '' then
    Params[0].AsString := '%' + EditProc1.Text + '%';
    // else
    // Params[1].AsString := '';
    end;
    DBGrid1.DataSource := DtsrcTodos;
    Open;
    BtnOk.Enabled := not IsEmpty;
    // if EditProc1.Text <> '' then
    // begin
    // if IsEmpty then
    // StsBr.Panels[0].Text :=
    // format('Nenum registro foi encontrado com "%s"', [EditProc1.Text])
    // else
    // StsBr.Panels[0].Text := format('%d registros encontrados com "%s"',
    // [recordcount, EditProc1.Text]);
    // end;
    if EditProc1.Text <> '' then
    begin
    if IsEmpty then
    StsBr.Panels[0].Text :=
    format('Nenum registro foi encontrado com "%s"', [EditProc1.Text])
    else
    StsBr.Panels[0].Text := format('%d registros encontrados com "%s"',
    [recordcount, EditProc1.Text]);
    end;
    end;
    end;
    end; }
end;

procedure TFrmArquProc.EditProc2Change(Sender: TObject);
begin
  if (EditProc1.Text <> '') and (EditProc2.Text <> '') then
  begin
    BitBtn3.Visible := True;
  end;
end;

procedure TFrmArquProc.FormClick(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    DM.sds_Arqu.Close;
  end
  else
  begin
    DM.sds_ArquTodos.Close;
  end;
end;

procedure TFrmArquProc.FormShow(Sender: TObject);
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
end;

procedure TFrmArquProc.StsBrDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  begin
    if Panel.ID = 0 then
    begin
      StsBr.Canvas.Brush.Color := clWhite;
      StsBr.Canvas.Font.Color := clBlue;
      StsBr.Canvas.FillRect(Rect);
      StsBr.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    end;
    if Panel.ID = 1 then
    begin
      StsBr.Canvas.Brush.Color := clWhite;
      StsBr.Canvas.Font.Color := clGreen;
      StsBr.Canvas.FillRect(Rect);
      StsBr.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    end;
  end;
end;

end.
