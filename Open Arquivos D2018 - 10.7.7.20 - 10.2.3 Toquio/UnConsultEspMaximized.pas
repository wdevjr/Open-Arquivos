// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnConsultEspMaximized;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DB;

type
  TFrmviewMax = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel3: TPanel;
    DBGrid1Max: TDBGrid;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Dtsrc: TDataSource;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel6: TPanel;
    Image2: TImage;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1MaxCellClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1MaxDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    selecAtualReport: Integer;
  public
    codigoArquMax: Integer;
  end;

var
  FrmviewMax: TFrmviewMax;

implementation

uses UDM, UProjeto, UnConsultaEspecial, UnLogin;

{$R *.dfm}

procedure TFrmviewMax.BitBtn1Click(Sender: TObject);
begin
  DM.sds_view.Close;
  FrmView.Close;
end;

procedure TFrmviewMax.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmviewMax.DBGrid1MaxCellClick(Column: TColumn);
begin
  if DBGrid1Max.FieldCount <> 0 then
  begin
    codigoArquMax := DBGrid1Max.DataSource.DataSet.Fields[0].asInteger;
    selecAtualReport := DBGrid1Max.DataSource.DataSet.Fields[0].asInteger;
  end
  else
    Abort;
end;

procedure TFrmviewMax.DBGrid1MaxDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  r: TRect;
begin
  if (FrmLogin.TODOS = 1) then
  begin
    if Odd(DM.sds_view.RecNo) then
    begin
      DBGrid1Max.Canvas.Brush.Color := $00CBEAEB;
      // DBGrid1.Canvas.Font.Color:=clBlack;
      DBGrid1Max.Canvas.FillRect(Rect);
      DBGrid1Max.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      DBGrid1Max.Canvas.Brush.Color := $00FFF4F4;
      DBGrid1Max.Canvas.Font.Color := clBlack;
      DBGrid1Max.Canvas.FillRect(Rect);
      DBGrid1Max.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then // $00808040
    begin // $00D6D6D6
      DBGrid1Max.Canvas.Brush.Color := $00D6D6D6;
      DBGrid1Max.Canvas.Font.Color := clBlue;
      DBGrid1Max.Canvas.FillRect(Rect);
      DBGrid1Max.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    r := Rect;
    Dec(r.Bottom, 2);
    if Column.Field = DM.sds_view.FieldByName('DESCRICAO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1Max.Canvas.FillRect(Rect);
        DrawText(DBGrid1Max.Canvas.Handle,
          pchar(DM.sds_view.FieldByName('DESCRICAO').asString),
          Length(DM.sds_view.FieldByName('DESCRICAO').asString), r,
          DT_WORDBREAK);
      end;
    end;
    if Column.Field = DM.sds_view.FieldByName('TITULO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1Max.Canvas.FillRect(Rect);
        DrawText(DBGrid1Max.Canvas.Handle,
          pchar(DM.sds_view.FieldByName('TITULO').asString),
          Length(DM.sds_view.FieldByName('TITULO').asString), r,
          DT_WORDBREAK);
      end;
    end;
    if Column.Field = DM.sds_view.FieldByName('NOME_ARQUIVO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1Max.Canvas.FillRect(Rect);
        DrawText(DBGrid1Max.Canvas.Handle,
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
      DBGrid1Max.Canvas.Brush.Color := $00CBEAEB;
      // DBGrid1.Canvas.Font.Color:=clBlack;
      DBGrid1Max.Canvas.FillRect(Rect);
      DBGrid1Max.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      DBGrid1Max.Canvas.Brush.Color := $00FFF4F4;
      DBGrid1Max.Canvas.Font.Color := clBlack;
      DBGrid1Max.Canvas.FillRect(Rect);
      DBGrid1Max.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then // $00808040
    begin // $00D6D6D6
      DBGrid1Max.Canvas.Brush.Color := $00D6D6D6;
      DBGrid1Max.Canvas.Font.Color := clBlue;
      DBGrid1Max.Canvas.FillRect(Rect);
      DBGrid1Max.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    r := Rect;
    Dec(r.Bottom, 2);
    if Column.Field = DM.sds_view.FieldByName('DESCRICAO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1Max.Canvas.FillRect(Rect);
        DrawText(DBGrid1Max.Canvas.Handle,
          pchar(DM.sds_view.FieldByName('DESCRICAO').asString),
          Length(DM.sds_view.FieldByName('DESCRICAO').asString), r,
          DT_WORDBREAK);
      end;
    end;
    if Column.Field = DM.sds_view.FieldByName('TITULO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1Max.Canvas.FillRect(Rect);
        DrawText(DBGrid1Max.Canvas.Handle,
          pchar(DM.sds_view.FieldByName('TITULO').asString),
          Length(DM.sds_view.FieldByName('TITULO').asString), r, DT_WORDBREAK);
      end;
    end;
    if Column.Field = DM.sds_view.FieldByName('NOME_ARQUIVO') then
    begin
      if not(gdSelected in State) or (gdSelected in State) then
      begin
        DBGrid1Max.Canvas.FillRect(Rect);
        DrawText(DBGrid1Max.Canvas.Handle,
          pchar(DM.sds_view.FieldByName('NOME_ARQUIVO').asString),
          Length(DM.sds_view.FieldByName('NOME_ARQUIVO').asString), r,
          DT_WORDBREAK);
      end;
    end;
  end;

end;

procedure TFrmviewMax.FormShow(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    Dtsrc.DataSet := DM.sds_view;
  end;
{  else
  begin
    Dtsrc.DataSet := DM.sds_view_todos;
  end; }
end;

procedure TFrmviewMax.SpeedButton1Click(Sender: TObject);
begin
  BitBtn1.Visible := True;
end;

procedure TFrmviewMax.SpeedButton2Click(Sender: TObject);
begin
  if selecAtualReport = 0 then
  begin
    MessageDlg('Selecione primeiro a Informação Desejada na Lista!', mtWarning,
      [mbOK], 0);
  end
  else
  begin
    DM.sds_report_detalhe.Close;
    DM.sds_report_detalhe.Params[0].asInteger := selecAtualReport;
    DM.sds_report_detalhe.Open;
    DM.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'ReportGeral\FastReport\RelatorioPorSelecao.fr3', True);
    DM.frxReport1.ShowReport;

  end;
end;

end.
