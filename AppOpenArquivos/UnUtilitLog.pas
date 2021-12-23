// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnUtilitLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids,
  CheckLst, Calendar, Menus, GifAnim, LR_Class, LR_DBSet,
  DateTimePicker, DB, ZDataset, lrPDFExport, lr_e_pdf;

type

  { TFrmLogAcesso }

  TFrmLogAcesso = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Dtsrc: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Image1: TImage;
    imprimir: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LabelNum: TLabel;
    Label4: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PanelData: TPanel;
    PanelMostrData: TPanel;
    PopupMenu1: TPopupMenu;
    SpeedButton1: TSpeedButton;
    SpeedButton11: TSpeedButton;
    btnLimpar: TSpeedButton;
    voltar: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    Dtscu: TDataSource;
    EditPesquNome: TEdit;
    EdtSenha: TEdit;
    EdtUsuario: TEdit;
    GifAnim1: TGifAnim;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Notebook1: TNotebook;
    Page1: TPage;
    Page2: TPage;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PanelAlert: TPanel;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure voltarClick(Sender: TObject);
  private
    // procedure DisplayLabel;
  public
    codigo: boolean;
    codigoAlert: boolean;
  end;

var
  Inicial, finall: string;
  CodigoUserPorNome: string;
  FrmLogAcesso: TFrmLogAcesso;
  ListReal, ListFinal: TListBox;

implementation

uses UnDM, UDMII, ULocalizarUser;

{$R *.lfm}

{ TFrmLogAcesso }

procedure TFrmLogAcesso.BitBtn1Click(Sender: TObject);
begin
  with DM.dst_Login do
  begin
    SQL.Clear;
    Close;
    SQL.Add('select CODIGO,NOME,LOGIN ' + ' from USUARIO_LOG ' +
      ' where LOGIN = ' + QuotedStr(Edtusuario.Text) + ' and SENHA = ' +
      QuotedStr(EdtSenha.Text));
    Open;
    if not IsEmpty then
    begin
      Notebook1.PageIndex := 1;
      imprimir.Visible := True;
      btnLimpar.Visible := True;
      voltar.Visible := True;
    end
    else
    begin
      MessageDlg('Usuário e ou Senha Inválido(s)!', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TFrmLogAcesso.BitBtn3Click(Sender: TObject);
begin
  DM.dst_Login.Close;
  DM.ZQueryAssistente.Close;
  Close;
end;

procedure TFrmLogAcesso.BitBtn5Click(Sender: TObject);
begin
  Inicial := '';
  finall := '';

  if (EditPesquNome.Text <> '') and (DBEdit1.Text = '') and
    (PanelMostrData.Visible = False) then
  begin
    DM.ZQueryAssistente.Close;
    DM.ZQueryAssistente.Params.Clear;
    DM.ZQueryAssistente.SQL.Clear;
    DM.ZQueryAssistente.SQL.Text :=
      'SELECT r.CODIGO,r.INSERDATA, r.HORA,r.COD_USUARIO, r.COD_ACAO, r.ACAO, PO.NOME,r.APLICATIVO, r.COD_REGISTRO, r.DISCRIMINACAO FROM LOG r'
      + ' left join USUARIO PO on r.COD_USUARIO = PO.COD_USUARIO ' +
      ' where PO.NOME like ' + QuotedStr('%' + EditPesquNome.Text + '%')
      // + ' or (r.INSERDATA >= :inicial)'
      // + ' and (r.INSERDATA <= :finall)'
      + ' order by r.INSERDATA, r.HORA desc';

    DM.ZQueryAssistente.Open;
    DM.ZQueryAssistente.Refresh;
    LabelNum.Caption := IntToStr(DM.ZQueryAssistente.RecordCount);
    PanelAlert.Visible := True;
  end;
  if (DBEdit1.Text <> '') and (PanelMostrData.Visible = False) and
    (EditPesquNome.Text = '') then
  begin
    DM.ZQueryAssistente.Close;
    DM.ZQueryAssistente.Params.Clear;
    DM.ZQueryAssistente.SQL.Clear;
    //Inicial := DateToStr(DateTimePicker1.Date);
    //Finall := DateToStr(DateTimePicker2.Date);
    DM.ZQueryAssistente.SQL.Add(
      'SELECT r.CODIGO,r.INSERDATA, r.HORA,r.COD_USUARIO, r.COD_ACAO, r.ACAO, PO.NOME,r.APLICATIVO, r.COD_REGISTRO, r.DISCRIMINACAO FROM LOG r' + ' left join USUARIO PO on r.COD_USUARIO = PO.COD_USUARIO '
      //+ ' where PO.NOME like ' + QuotedStr(EditPesquNome.Text + '%')
      + ' where r.COD_USUARIO=' + DBEdit1.Text
      //  + ' where r.INSERDATA >= :inicial'
      //+ ' and r.INSERDATA <= :finall'
      + ' order by r.INSERDATA, r.HORA desc');
    //DM.ZQueryAssistente.ParamByName('inicial').asDate := StrToDate(Inicial);
    // DM.ZQueryAssistente.ParamByName('finall').asDate := StrToDate(Finall);
    //DM.ZQueryAssistente.Filter:='COD_USUARIO=' + DBEdit1.Text;
    //DM.ZQueryAssistente.Filtered:=True;
    DM.ZQueryAssistente.Open;
    LabelNum.Caption := IntToStr(DM.ZQueryAssistente.RecordCount);
    PanelAlert.Visible := True;
  end;
  //if (EditPesquNome.Caption <> '') and (DBEdit1.Text = '') then
  //begin
  if (PanelMostrData.Visible = True) and (EditPesquNome.Text <> '') and
    (DBText1.Caption = '') then
  begin
    DM.ZQueryAssistente.Close;
    DM.ZQueryAssistente.Params.Clear;
    DM.ZQueryAssistente.SQL.Clear;
    Inicial := DateToStr(DateTimePicker1.Date);
    Finall := DateToStr(DateTimePicker2.Date);
    DM.ZQueryAssistente.SQL.Add(
      'SELECT r.CODIGO,r.INSERDATA, r.HORA,r.COD_USUARIO, r.COD_ACAO, r.ACAO, PO.NOME,r.APLICATIVO, r.COD_REGISTRO, r.DISCRIMINACAO FROM LOG r' + ' left join USUARIO PO on r.COD_USUARIO = PO.COD_USUARIO ' + ' where PO.NOME like ' + QuotedStr(EditPesquNome.Text + '%') + ' and r.INSERDATA >= :inicial' + ' and r.INSERDATA <= :finall' + ' order by r.INSERDATA, r.HORA desc');
    DM.ZQueryAssistente.ParamByName('inicial').asDate := StrToDate(Inicial);
    DM.ZQueryAssistente.ParamByName('finall').asDate := StrToDate(Finall);
    DM.ZQueryAssistente.Open;
    DM.ZQueryAssistente.Refresh;
    LabelNum.Caption := IntToStr(DM.ZQueryAssistente.RecordCount);
    PanelAlert.Visible := True;
  end;

  if (DBEdit1.Text = '') and (EditPesquNome.Text = '') and
    (PanelMostrData.Visible = True) then
  begin
    DM.ZQueryAssistente.Close;
    DM.ZQueryAssistente.Params.Clear;
    DM.ZQueryAssistente.SQL.Clear;
    Inicial := DateToStr(DateTimePicker1.Date);
    Finall := DateToStr(DateTimePicker2.Date);
    DM.ZQueryAssistente.SQL.Add(
      'SELECT r.CODIGO,r.INSERDATA, r.HORA,r.COD_USUARIO, r.COD_ACAO, r.ACAO, PO.NOME,r.APLICATIVO, r.COD_REGISTRO, r.DISCRIMINACAO FROM LOG r' + ' left join USUARIO PO on r.COD_USUARIO = PO.COD_USUARIO ' + ' where r.INSERDATA >= :inicial' + ' and r.INSERDATA <= :finall' + ' order by r.INSERDATA, r.HORA desc');
    DM.ZQueryAssistente.ParamByName('inicial').asDate := StrToDate(Inicial);
    DM.ZQueryAssistente.ParamByName('finall').asDate := StrToDate(Finall);
    DM.ZQueryAssistente.Open;
    DM.ZQueryAssistente.Refresh;
    LabelNum.Caption := IntToStr(DM.ZQueryAssistente.RecordCount);
    PanelAlert.Visible := True;
  end;
  if (DBEdit1.Text <> '') and (EditPesquNome.Text <> '') and
    (PanelMostrData.Visible = True) then
  begin
    DM.ZQueryAssistente.Close;
    DM.ZQueryAssistente.Params.Clear;
    DM.ZQueryAssistente.SQL.Clear;
    Inicial := DateToStr(DateTimePicker1.Date);
    Finall := DateToStr(DateTimePicker2.Date);
    DM.ZQueryAssistente.SQL.Add(
      'SELECT r.CODIGO,r.INSERDATA, r.HORA,r.COD_USUARIO, r.COD_ACAO, r.ACAO, PO.NOME,r.APLICATIVO, r.COD_REGISTRO, r.DISCRIMINACAO FROM LOG r' + ' left join USUARIO PO on r.COD_USUARIO = PO.COD_USUARIO ' + ' where PO.NOME like ' + QuotedStr(EditPesquNome.Text + '%') + ' or r.COD_USUARIO=' + DBEdit1.Text + ' or r.INSERDATA >= :inicial' + ' and r.INSERDATA <= :finall' + ' order by r.INSERDATA, r.HORA desc');
    DM.ZQueryAssistente.ParamByName('inicial').asDate := StrToDate(Inicial);
    DM.ZQueryAssistente.ParamByName('finall').asDate := StrToDate(Finall);
    DM.ZQueryAssistente.Open;
    LabelNum.Caption := IntToStr(DM.ZQueryAssistente.RecordCount);
    PanelAlert.Visible := True;
  end;
  if (DBEdit1.Text <> '') and (PanelMostrData.Visible = True) then
  begin
    DM.ZQueryAssistente.Close;
    DM.ZQueryAssistente.Params.Clear;
    DM.ZQueryAssistente.SQL.Clear;
    Inicial := DateToStr(DateTimePicker1.Date);
    Finall := DateToStr(DateTimePicker2.Date);
    DM.ZQueryAssistente.SQL.Add(
      'SELECT r.CODIGO,r.INSERDATA, r.HORA,r.COD_USUARIO, r.COD_ACAO, r.ACAO, PO.NOME,r.APLICATIVO, r.COD_REGISTRO, r.DISCRIMINACAO FROM LOG r' + ' left join USUARIO PO on r.COD_USUARIO = PO.COD_USUARIO '
      //+ ' where PO.NOME like ' + QuotedStr(EditPesquNome.Text + '%')
      //+ ' where r.COD_USUARIO=' + DBEdit1.Text
      + ' where r.INSERDATA >= :inicial' + ' and r.INSERDATA <= :finall' +
      ' order by r.INSERDATA, r.HORA desc');
    DM.ZQueryAssistente.ParamByName('inicial').asDate := StrToDate(Inicial);
    DM.ZQueryAssistente.ParamByName('finall').asDate := StrToDate(Finall);
    DM.ZQueryAssistente.Filter := 'COD_USUARIO=' + DBEdit1.Text;
    DM.ZQueryAssistente.Filtered := True;
    DM.ZQueryAssistente.Open;
    LabelNum.Caption := IntToStr(DM.ZQueryAssistente.RecordCount);
    PanelAlert.Visible := True;
  end;
end;

procedure TFrmLogAcesso.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DM.dst_Login.Close;
  //DM.ZQueryAssistente.Close;
end;

procedure TFrmLogAcesso.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
end;

procedure TFrmLogAcesso.imprimirClick(Sender: TObject);
var
  pt, pt2: TPoint;

begin
  pt.x := imprimir.Left;
  pt.y := imprimir.Left + imprimir.Height;

  pt2 := ClientToScreen(pt);

  PopupMenu1.PopUp(pt2.x, pt2.y);

end;

procedure TFrmLogAcesso.MenuItem1Click(Sender: TObject);
begin
  if not DM.ZQueryAssistente.IsEmpty then
  begin
    if DM.ZQueryAssistente.RecordCount > 0 then;
    begin
      try
        try
          DM.ZQueryLogParam.Close;
          DM.ZQueryLogParam.Params[0].Value := DM.ZQueryAssistenteCODIGO.AsInteger;
          DM.ZQueryLogParam.Open;
        except
          on E: Exception do
          begin
            MessageDlg('Erro na Consulta do LOG de Procedimentos!' +
              ' #13 ' + ' Pode ser o banco também ' + E.Message, mtError, [mbOK], 0);
            Abort;
          end;
        end;
      finally
        DM.frReportLogParam.LoadFromFile('Reports/RelConsultaLogSelecaoGrid.lrf');
        DM.frReportLogParam.Title := 'Tela de Relatórios';
        DM.frReportLogParam.showReport;
      end;
    end;
  end;
end;

procedure TFrmLogAcesso.MenuItem2Click(Sender: TObject);
begin

  DM.frReportLogTodos.LoadFromFile('Reports/RelConsultaLogTodos.lrf');
  DM.frReportLogTodos.Title := 'Tela de Relatórios';
  DM.frReportLogTodos.showReport;

end;

procedure TFrmLogAcesso.SpeedButton11Click(Sender: TObject);
begin
  if (PanelMostrData.Visible = True) then
  begin
    PanelMostrData.Visible := False;
  end
  else
    PanelMostrData.Visible := True;
end;




procedure TFrmLogAcesso.btnLimparClick(Sender: TObject);
begin
  Inicial := '';
  finall := '';
  LabelNum.Caption := '';
  DBEdit1.Text := '';
  EditPesquNome.Text := '';
  PanelMostrData.Visible := False;
  PanelAlert.Visible := False;
  DM.ZQueryAssistente.Cancel;
  DM.ZQueryAssistente.Close;
  DM.ZQueryAssistente.Params.Clear;
  DM.cds_User.Close;
  DM.sdss_User.Close;
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
    end;
  finally
    DM.sdss_User.Close;
    FrmLocalizarUser.Free;
  end;
end;

procedure TFrmLogAcesso.voltarClick(Sender: TObject);
begin
  imprimir.Visible := False;
  voltar.Visible := False;
  btnLimpar.Visible := False;
  Notebook1.PageIndex := 0;
  EdtUsuario.Text := '';
  EdtSenha.Text := '';
  DM.ZQueryAssistente.Close;
end;

end.
