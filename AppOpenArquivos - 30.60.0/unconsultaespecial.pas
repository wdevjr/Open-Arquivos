// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnConsultaEspecial;

interface

uses
  Windows, Messages, Forms, Dialogs, SysUtils, Variants, DB, StdCtrls,
  ComCtrls,
  DBCtrls, ExtCtrls, Buttons, Graphics, Controls,
  Classes, Grids, DBGrids, MaskEdit, Calendar, DateTimePicker;

type

  { TFrmView }

  TFrmView = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBText4: TDBText;
    Dtsrc: TDataSource;
    Dtscru: TDataSource;
    Dtscra: TDataSource;
    DtsrcCod: TDataSource;
    EditPesqu: TMaskEdit;
    Image1: TImage;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Label4: TLabel;
    Image2: TImage;
    Panel16: TPanel;
    Image4: TImage;
    Panel1: TPanel;
    habilitar03: TSpeedButton;
    desabilitar03: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DtsrcAutor: TDataSource;
    SpeedButton15: TSpeedButton;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    RadioGroup1: TRadioGroup;
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
    Panel8: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    SpeedButton7: TSpeedButton;
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
    SpeedButton9: TSpeedButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure desabilitar02Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure habilitar02Click(Sender: TObject);
    procedure habilitar03Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure EditPesquKeyPress(Sender: TObject; var Key: char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure habilitar00Click(Sender: TObject);

    procedure desabilitar00Click(Sender: TObject);

    procedure CheckBoxConsultaClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure desabilitar03Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);

    procedure SpeedButton5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    buffer: array [0 .. 255] of char;
    Temp: string;
    selecAtualReport: integer;
  public
    codUserFill, codAssuntoFill: integer;

  end;

var
  FrmView: TFrmView;
  CodigoUser: string;
  CodigoUserPorNome: string;
  CodigoAssunto: string;
  CodigoAutor: string;

implementation

uses ShellAPI, UnDM, ULocalizarUser, UnLocalizarUserCod, UnPrinc, UnLogin,
  UnConsultEspMaximized,
  UnDlgProcuraAssunto, UnProcessIndefinido, UnCadArquivos;

{$R *.lfm}

function RemoverPorCento(str: string):string;
var
   x: integer;
   st: string;
begin
st:='';
for x:=1 to length(str) do
    begin
    if (str[x] = '%') then

    st:=st + str[x];
    end;
RemoverPorCento:=st;
end;

function Remover2(campo: string):string;
var temp:string;
      i:integer;

begin
temp:='';
for i:=1 to length(campo) do //campo e a variavel q vc quer remover os . e -
begin
//if ((campo[i]<>´.´) and (campo[i]<>´-´)) then
if ((campo[i] <> '%')) then
temp:=temp+campo[i];
end;
campo:=temp
end;

procedure TFrmView.BitBtn2Click(Sender: TObject);
begin
  Alert.Visible := False;
  Close;
end;

procedure TFrmView.CheckBoxConsultaClick(Sender: TObject);
begin
  //if (CheckBoxConsulta.Checked = False) then
  //begin
  //  CodigoUser := '';
  //  CodigoAssunto := '';
  //  CodigoUserPorNome := '';
  //  CodigoPorCriterio := '';
  //  DM.sds_view.Filtered := False;
  //end;

end;

procedure TFrmView.desabilitar00Click(Sender: TObject);
begin
  habilitar00.Enabled := True;
  desabilitar00.Enabled := False;
  desabilitar00.Color := clBlue;
  DtsrcCod.DataSet.Close;
end;



{ procedure TFrmView.desabilitar01Click(Sender: TObject);
  begin
  DtsrcAutor.DataSet.CLOSE;
  //SpeedButton9.Enabled := True;
  //SpeedButton10.Enabled := False;
  end;

  procedure TFrmView.desabilitar02Click(Sender: TObject);
  begin
  desabilitar02.Enabled := False;
  habilitar02.Enabled := True;
  Dtscra.DataSet.CLOSE;
  end; }

procedure TFrmView.EditPesquKeyPress(Sender: TObject; var Key: char);
begin
  if RadioGroup1.ItemIndex = 2 then
  begin
    if not (Key in [#8, #48 .. #57]) then
      Key := #0;
  end;

end;

procedure TFrmView.FormActivate(Sender: TObject);
begin
  if (FrmLogin.TODOS = 0) then
  begin
    Panel8.Visible := True;
    // Panel4.Visible := False;
    // SpeedButton7.visible:=True;
    //Label2.Visible := True;
    // DBText4.Visible := True;

    // Panel2.Height := 320;
    // FrmView.Height := 716;
  end
  else if (FrmLogin.TODOS = 1) then
  begin
    //Panel4.Visible := True;
    Panel8.Visible := True;
    // Panel2.Height := 354;
    // FrmView.Height := 716;
  end;

  //CodigoUser := '';
  //CodigoUserPorNome := '';
  //CodigoAssunto := '';
  //habilitar00.Enabled := True;
  //habilitar02.Enabled := True;
  //// habilitar01.Enabled := True;
  //desabilitar00.Enabled := False;
  ////Dtscra.DataSet.Close;
  //Dtscru.DataSet.Close;
  //DtsrcAutor.DataSet.Close;
  Color := DM.myColor;
end;

procedure TFrmView.SpeedButton9Click(Sender: TObject);
begin
  SpeedButton9.Enabled := False;
  SpeedButton10.Enabled := True;
  SpeedButton10.Color := clYellow;
  ;
  CodigoUserPorNome := DBEdit1.Text;
end;

procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DM.sds_view.Close;
  // DM.sds_view_todos.CLOSE;
  DM.cds_User.Close;
  DM.cds_UserCod.Close;
  DM.cds_Assunt.Close;

  DM.sds_view.Filtered := False;
end;

procedure TFrmView.habilitar00Click(Sender: TObject);
begin
  CodigoUser := DBEdit3.Text;
  // CodigoUserPorNome := '';
  // CodigoAssunto := '';
  habilitar00.Enabled := False;
  desabilitar00.Enabled := True;
  desabilitar00.Color := clYellow;
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

//procedure TFrmView.habilitar03Click(Sender: TObject);
//begin
//  DtsrcCod.DataSet.Close;
//  Dtscra.DataSet.Close;
//  Dtscru.DataSet.Close;

//  // PanelMostrData.Visible:=False;
//end;

procedure TFrmView.RadioGroup1Click(Sender: TObject);
begin

  EditPesqu.Text := '';
  Alert.Visible := False;
  EditPesqu.SetFocus;
  if (RadioGroup1.ItemIndex = 4) then
  begin
    EditPesqu.EditMask := '!99/99/0000;1;_';
  end
  else if (RadioGroup1.ItemIndex <> 4) then
  begin
    EditPesqu.EditMask := '';
    EditPesqu.Text := '';
  end;
  if (FrmLogin.TODOS = 1) then
  begin
    if (RadioGroup1.ItemIndex = 4) then
    begin
      EditPesqu.EditMask := '!99/99/0000;1;_';
    end
    else if (RadioGroup1.ItemIndex <> 4) then

    begin
      EditPesqu.EditMask := '';
      EditPesqu.Text := '';
    end;

  end
  else if (FrmLogin.TODOS = 0) then
  begin
    if (RadioGroup1.ItemIndex = 4) then
    begin
      EditPesqu.EditMask := '!99/99/0000;1;_';
    end
    else if (RadioGroup1.ItemIndex <> 4) then
    begin
      EditPesqu.EditMask := '';
      EditPesqu.Text := '';
    end;

  end;
end;

procedure TFrmView.SpeedButton7Click(Sender: TObject);
begin

  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DM.ZQryCosultaAutores);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DM.ZQryConsultaSetAutores.Close;
      DM.ZQryConsultaSetAutores.Params[0].Value := DM.ZQryCosultaAutoresCODIGO.AsInteger;
      DM.ZQryConsultaSetAutores.Open;
    end;
  finally
    FrmLocalizarUser.Free;
    DM.ZQryCosultaAutores.Close;
  end;
end;

procedure TFrmView.SpeedButton10Click(Sender: TObject);
begin

  SpeedButton10.Enabled := False;
  SpeedButton10.Color := clBlue;
  SpeedButton9.Enabled := True;
  CodigoUserPorNome := '';
  DBText1.Caption := '';
  DBEdit1.Text := '';
  Dtscru.DataSet.Close;
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
  Alert.Visible := False;
  Close;
end;

procedure TFrmView.desabilitar03Click(Sender: TObject);
begin
  desabilitar03.Enabled := False;
  habilitar03.Enabled := True;
  desabilitar03.Color := clBlue;
  DBText4.Caption := '';
  DBEdit4.Caption := '';
  DtsrcAutor.DataSet.Close;
end;

procedure TFrmView.SpeedButton15Click(Sender: TObject);
begin
  if (DBGrid1.DataSource.DataSet.FieldCount = 0) and (DM.sds_view.IsEmpty) then
  begin
    MessageDlg('Faça uma Pesquisa primero depois selecione na Tabela!',
      mtInformation, [mbOK], 0);
  end
  else
  begin
    try
      try
        DM.ZQueryRelatorioArquivo.Close;
        DM.ZQueryRelatorioArquivo.Params[0].Value := selecAtualReport;
        //DM.sds_view.FieldByName('ID').AsInteger;
        DM.ZQueryRelatorioArquivo.Open;
      except
        on E: Exception do
        begin
          MessageDlg('Erro de Consulta de Arquivo!', E.Message, mtError, [mbOK], 0);
        end;
      end;
    finally
      DM.frReportArquivo.LoadFromFile('Reports/RelConsultaArquivosDefault.lrf');
      DM.frReportArquivo.Title := 'Tela de Relatórios';
      DM.frReportArquivo.showReport;
    end;

  end;

end;

procedure TFrmView.SpeedButton1Click(Sender: TObject);
begin
  FrmLocalizarUser := TFrmLocalizarUser.Create(Self, DM.sdss_User);
  try
    if FrmLocalizarUser.ShowModal = mrOk then
    begin
      DM.ZQryConsultaSetUser.Close;
      DM.ZQryConsultaSetUser.Params[0].AsInteger := DM.sdss_UserCOD_USUARIO.AsInteger;
      DM.ZQryConsultaSetUser.Open;
    end;
  finally
    DM.sdss_User.Close;
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
  //if (EditPesqu.Text = '%' ) or (EditPesqu.Text = '%%' ) Then
  //begin
  //  EditPesqu.Text:='';
  //end;
  EditPesqu.Text:=Remover2(EditPesqu.Text);
  if (EditPesqu.Text <> '' ) or (PanelMostrData.Visible = True) then
  begin
    if (FrmLogin.TODOS = 1) then
    begin
      // Panel4.Visible := False;
      case RadioGroup1.ItemIndex of
        0:
        begin
          //DM.sds_ArquTodos.CLOSE;
          DM.sds_view.Params.Clear;
          DM.sds_view.SQL.Clear;
          DM.sds_view.SQL.Add(
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,SS.TITULOASSUN,SS.CODIGO,U.NOME as  NOMEUSER,T.NOME as NOMEAUT,AQ.COD_AUTOR from ARQUIVOLIST AQ'
            // + ' inner join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
            + ' left join ARQUIVOS_USUARIOS N on (N.IDARQUIVOS = AQ.ID) and (N.IDUSUARIOS = AQ.COD_USUARIO)'
            + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' +
            ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
            ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' +
            ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' +
            EditPesqu.Text + '%') +
            // ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DATA asc');
          if PanelMostrData.Visible = True then
          begin

            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);

            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            DM.sds_view.SQL.Clear;
            DM.sds_View.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,SS.TITULOASSUN,U.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ' + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' + ' order by AQ.DATA asc');
            DM.sds_view.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.ParamByName('finall').asDate :=
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
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
            end;



            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
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
          DM.sds_view.Close;
          DM.sds_view.Params.Clear;
          DM.sds_view.SQL.Clear;
          DM.sds_view.SQL.Text :=
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME,SS.TITULOASSUN,SS.CODIGO,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,AQ.COD_AUTOR from ARQUIVOLIST AQ'
            // +' left join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) '
            + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
            'left join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
            'left join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
            'where AQ.DESCRICAO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
            // ' and AQ.COD_USUARIO=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DATA desc';
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.Close;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Text :=
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR,U.NOME as  NOMEUSER,T.NOME as NOMEAUT from ARQUIVOLIST AQ' + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' + ' order by AQ.DATA desc';
            DM.sds_view.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.ParamByName('finall').asDate :=
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
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_ASSUNTO=' + CodigoAssunto + ' and COD_AUTOR=' + CodigoAutor;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome <> '') and (CodigoAutor = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_ASSUNTO=' + CodigoAssunto + ' and COD_USUARIO=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            {if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoPorCriterio <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoPorCriterio;
            end; }
            Dtsrc.DataSet.Filtered := True;
            // DBGrid1.DataSource := Dtsrc;
          end;
          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
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
            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ'
              //  + ' left join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
              + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
              ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
              ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
              ' where AQ.ID = ' + EditPesqu.Text + ' order by AQ.DATA asc ');
            if PanelMostrData.Visible = True then
            begin
              DM.sds_view.Close;
              DM.sds_view.Params.Clear;
              Inicial := DateToStr(DateTimePicker1.Date);
              // FormatDateTime('yyyy-MM-dd', );
              Finall := DateToStr(DateTimePicker2.Date);
              // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
              DM.sds_view.Close;
              DM.sds_view.Params.Clear;
              DM.sds_view.SQL.Clear;
              DM.sds_view.SQL.Add(
                'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,U.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ' + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' + ' order by AQ.DATA asc');
              DM.sds_view.ParamByName('inicial').asDate :=
                StrToDate(Inicial);
              DM.sds_view.ParamByName('finall').asDate :=
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
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome = '') and (CodigoAutor <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
              end;
              if (CodigoUser = '') and (CodigoAssunto <> '') and
                (CodigoUserPorNome = '') and (CodigoAutor <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter :=
                  ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
              end;
              if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
                (CodigoAutor <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter :=
                  ' COD_USUARIO=' + CodigoUserPorNome + ' and' +
                  ' COD_ASSUNTO=' + CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
                // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
              end;
              Dtsrc.DataSet.Filtered := True;
              DBGrid1.DataSource := Dtsrc;
            end;
            // end;
            try
              DM.sds_view.Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
            DBGrid1.DataSource := Dtsrc;
            //DM.sds_view.Filtered := False;
            Label3.Caption := IntToStr(DM.sds_view.RecordCount);
            Alert.Visible := True;
            if ((DM.sds_view.RecordCount) = 1) then
            begin
              PanelMaximizar.Visible := False;
            end;
          end;
          DM.sds_view.Open;
          DBGrid1.DataSource := Dtsrc;
        end;
        3:
        begin
          DM.sds_view.Close;
          DM.sds_view.Params.Clear;
          DM.sds_view.SQL.Clear;
          DM.sds_view.SQL.Add(
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ'
            // + ' left join ARQUIVOS_USUARIOS N  on (AQ.ID = N.IDARQUIVOS) ' +
            + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
            ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.TITULO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
            // ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DATA asc');
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            DM.sds_view.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.Close;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,U.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ' + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' + ' order by AQ.DATA asc');
            DM.sds_view.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.ParamByName('finall').asDate :=
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
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            Dtsrc.DataSet.Filtered := True;

            // end;
          end;
          DBGrid1.DataSource := Dtsrc;

          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;

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
          //EditPesqu.EditMask := '!99/99/0000;1;_';
          DM.sds_view.Close;
          DM.sds_view.SQL.Clear;
          DM.sds_view.SQL.Add(
            ' select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.DATA = :atual');
          DM.sds_view.ParamByName('atual').AsDate := StrToDate(EditPesqu.Text);
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
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            Dtsrc.DataSet.Filtered := True;
          end;
          if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
            (CodigoAutor <> '') then
          begin
            Dtsrc.DataSet.Filtered := False;
            Dtsrc.DataSet.Filter :=
              ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
              CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
            // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
          end;

          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 1, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
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
          DM.sds_view.Close;
          DM.sds_view.SQL.Clear;
          DM.sds_view.Params.Clear;
          DM.sds_view.SQL.Add(
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N ' + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS)' + ' left join ASSUNTO SS on AQ.COD_ASSUNTO = SS.CODIGO' + ' left join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' + ' left join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.COD_USUARIO=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.DATA asc');

          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.Close;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOLIST AQ' + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' + ' order by AQ.DATA asc');
            DM.sds_view.ParamByName('inicial').AsString := Inicial;
            DM.sds_view.ParamByName('finall').AsString := Finall;
          end;
          DBMemo1.DataField := 'DESCRICAO';
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
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := 'COD_AUTOR=' + CodigoAutor;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome = '') and (CodigoAutor = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            Dtsrc.DataSet.Filtered := True;
          end;
          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
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
          DBMemo1.DataField := 'DESCRICAO';
        end;
        1:
        begin
          if PanelMostrData.Visible = False then
          begin
            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N ' + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + 'left join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' + 'left join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' + 'where AQ.DESCRICAO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.DATA asc');
          end;
          {if (DBText4.Caption <> '') then
          begin
            DM.sds_view.CLOSE;
            DM.sds_view.Params.Clear;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add('select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME,SS.TITULOASSUN,SS.CODIGO from ARQUIVOS_USUARIOS N '
              + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' +
              ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
              'left join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' +
              'left join AUTORES T on T.CODIGO = AQ.COD_AUTOR ' +
              'where AQ.DESCRICAO like ' +
              QuotedStr('%' + EditPesqu.Text + '%') +
            // ' and N.IDUSUARIOS=' + CodigoPorCriterio +
              ' order by AQ.DESCRICAO');
          end; }

          if PanelMostrData.Visible = True then
          begin
            // try
            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);

            Finall := DateToStr(DateTimePicker2.Date);

            DM.sds_view.Close;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N ' + ' left join ARQUIVOLIST AQ on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + 'left join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' + 'left join AUTORES T on T.CODIGO = AQ.COD_AUTOR '
              // ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
              + ' where N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
              ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' +
              ' order by AQ.DATA asc');
            DM.sds_view.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.ParamByName('finall').asDate :=
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
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
            end;
            if (CodigoUser = '') and (CodigoAssunto = '') and
              (CodigoUserPorNome <> '') and (CodigoAutor = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            Dtsrc.DataSet.Filtered := True;
          end;
          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;
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
            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add(
              'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N' + ' left join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' + ' where AQ.ID = ' + EditPesqu.Text + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) + ' order by AQ.ID ');
            if PanelMostrData.Visible = True then
            begin
              DM.sds_view.Close;
              DM.sds_view.Params.Clear;
              Inicial := DateToStr(DateTimePicker1.Date);
              // FormatDateTime('yyyy-MM-dd', );
              Finall := DateToStr(DateTimePicker2.Date);
              // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
              DM.sds_view.Close;
              DM.sds_view.SQL.Clear;
              DM.sds_view.SQL.Add(
                'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,T.NOME,SS.TITULOASSUN,SS.CODIGO from ARQUIVOLIST AQ' + ' left join USUARIO U on (AQ.COD_USUARIO = U.COD_USUARIO)' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR)' + ' where AQ.NOME_ARQUIVO like ' + QuotedStr('%' + EditPesqu.Text + '%') + ' and AQ.DATA <= :finall' + ' order by AQ.NOME_ARQUIVO');
              DM.sds_view.ParamByName('inicial').asDate :=
                StrToDate(Inicial);
              DM.sds_view.ParamByName('finall').asDate :=
                StrToDate(Finall);
            end;
            if (CheckBoxConsulta.Checked = True) then
            begin
              if (CodigoUser <> '') and (CodigoAssunto = '') and
                (CodigoUserPorNome = '') and (CodigoAutor = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUser;
              end;
              if (CodigoUser = '') and (CodigoAssunto <> '') and
                (CodigoUserPorNome = '') and (CodigoAutor = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
              end;
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome <> '') and (CodigoAutor = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_USUARIO=' + CodigoUserPorNome;
              end;
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome = '') and (CodigoAutor <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' COD_AUTOR=' + CodigoAutor;
              end;
              if (CodigoUser = '') and (CodigoAssunto = '') and
                (CodigoUserPorNome <> '') and (CodigoAutor = '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoUserPorNome;
              end;
              if (CodigoUser = '') and (CodigoAssunto <> '') and
                (CodigoUserPorNome = '') and (CodigoAutor <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter :=
                  ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
              end;
              if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
                (CodigoAutor <> '') then
              begin
                Dtsrc.DataSet.Filtered := False;
                Dtsrc.DataSet.Filter :=
                  ' COD_USUARIO=' + CodigoUserPorNome + ' and' +
                  ' COD_ASSUNTO=' + CodigoAssunto + ' and COD_AUTOR=' +
                  CodigoAutor;
                // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
              end;
              Dtsrc.DataSet.Filtered := True;
              DBGrid1.DataSource := Dtsrc;
            end;
            // end;
            try
              DM.sds_view.Open;
            except
              on E: Exception do
              begin
                MessageDlg('Erro ao Consultar!',
                  'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                  + E.Message, mtError, [mbOK], 0);
              end;
            end;
          end;

        end;
        3:
        begin
          DM.sds_view.Close;
          DM.sds_view.Params.Clear;
          DM.sds_view.SQL.Clear;
          DM.sds_view.SQL.Add('select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, ' +
            'AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT, '
            + 'SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N' +
            ' left join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' +
            ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
            ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
            ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
            ' where AQ.TITULO like ' + QuotedStr('%' + EditPesqu.Text + '%') +
            ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
            ' order by AQ.DATA asc');
          if PanelMostrData.Visible = True then
          begin
            DM.sds_view.Close;
            DM.sds_view.Params.Clear;
            DM.sds_view.SQL.Clear;
            Inicial := DateToStr(DateTimePicker1.Date);
            // FormatDateTime('yyyy-MM-dd', );
            Finall := DateToStr(DateTimePicker2.Date);
            // FormatDateTime('yyyy-MM-dd', DateTimePicker2.Date);
            DM.sds_view.SQL.Clear;
            DM.sds_view.SQL.Add('select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, ' +
              'AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT, '
              + 'SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N'
              + ' left join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' +
              ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' +
              ' left join USUARIO PO on (AQ.COD_USUARIO = PO.COD_USUARIO) ' +
              ' left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' +
              ' Where N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO) +
              ' and AQ.DATA >= :inicial' + ' and AQ.DATA <= :finall' +
              ' order by AQ.DATA asc');
            DM.sds_view.ParamByName('inicial').asDate :=
              StrToDate(Inicial);
            DM.sds_view.ParamByName('finall').asDate :=
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
              (CodigoUserPorNome <> '') and (CodigoAutor = '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter := ' IDUSUARIOS=' + CodigoUserPorNome;
            end;
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            Dtsrc.DataSet.Filtered := True;


            // end;
          end;
          DBGrid1.DataSource := Dtsrc;
          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;

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
          DM.sds_view.Close;
          DM.sds_view.Params.Clear;
          DM.sds_view.SQL.Clear;
          DM.sds_view.SQL.Add(
            'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO, AQ.DESCRICAO, AQ.TITULO,AQ.NOME_ARQUIVO, AQ.DATA,N.IDUSUARIOS,PO.NOME as  NOMEUSER,T.NOME as NOMEAUT,SS.TITULOASSUN,SS.CODIGO,AQ.COD_AUTOR from ARQUIVOS_USUARIOS N' + ' left join ARQUIVOLIST AQ  on (AQ.ID = N.IDARQUIVOS) ' + ' left join ASSUNTO SS on (AQ.COD_ASSUNTO =SS.CODIGO) ' + 'left join USUARIO PO on AQ.COD_USUARIO = PO.COD_USUARIO ' + 'left join AUTORES T on (T.CODIGO = AQ.COD_AUTOR) ' + 'where AQ.DATA = :date' + ' and N.IDUSUARIOS=' + IntToStr(FrmLogin.COD_USUARIO));
          DM.sds_view.ParamByName('date').asDate := StrToDate(EditPesqu.Text);
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
            if (CodigoUser = '') and (CodigoAssunto <> '') and
              (CodigoUserPorNome = '') and (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_AUTOR=' + CodigoAutor + ' and COD_ASSUNTO=' + CodigoAssunto;
            end;
            if (CodigoAssunto <> '') and (CodigoUserPorNome <> '') and
              (CodigoAutor <> '') then
            begin
              Dtsrc.DataSet.Filtered := False;
              Dtsrc.DataSet.Filter :=
                ' COD_USUARIO=' + CodigoUserPorNome + ' and' + ' COD_ASSUNTO=' +
                CodigoAssunto + 'and COD_AUTOR= ' + CodigoAutor;
              // Dtsrc.DataSet.Filter := ' COD_ASSUNTO=' + CodigoAssunto;
            end;
            Dtsrc.DataSet.Filtered := True;
            DBGrid1.DataSource := Dtsrc;
          end;

          try
            DM.sds_view.Open;
          except
            on E: Exception do
            begin
              MessageDlg('Erro ao Consultar!',
                'Erro na Consulta do Arquivo: TODOS 0, primeiro Comando SQL!, mensagem nativa do Banco: '
                + E.Message, mtError, [mbOK], 0);
            end;
          end;

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
  end;
end;

procedure TFrmView.SpeedButton5Click(Sender: TObject);
begin
  FrmviewMax := TFrmViewMax.Create(Self);
  try
    if FrmviewMax.ShowModal = mrOk then
    begin
      DM.ZQArquivo.Close;
      DM.ZQArquivo.Params[0].AsInteger := FrmviewMax.codigoArquMax;
      DM.ZQArquivo.Open;
      frmSplash := TfrmSplash.Create(Self);
      frmSplash.Show;
      frmSplash.Refresh;
      frmSplash.ProgressBar1.Position := 1;
      // espera...
      Sleep(100);
      Sleep(100);
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 8;
      // espera...
      Sleep(700);

      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 34;
      // espera...
      Sleep(300);


      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 51;
      // espera...
      Sleep(500);
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 73;
      // espera...
      Sleep(2000);
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 85;
      // espera ...
      Sleep(500);
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 99;
      // espera ...
      Sleep(500);
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 100;
      // espera...
      Sleep(2000);
      if frmSplash.ProgressBar1.Position = 100 then
      begin
        frmSplash.Hide;
        //frmSplash.Free;

      end;
      // MostrarIcon;
    end;
  finally
    FrmviewMax.Close;
  end;
end;

procedure TFrmView.SpeedButton6Click(Sender: TObject);
begin
  FrmLocalizaAssunto := TFrmLocalizaAssunto.Create(Self, DM.sds_Assunt);
  try
    if FrmLocalizaAssunto.ShowModal = mrOk then
    begin
      DM.cds_Assunt.Close;
      DM.cds_Assunt.Params[0].AsInteger := DM.sds_AssuntCODIGO.AsInteger;
      DM.cds_Assunt.Open;
    end;
  finally
    // DM.sds_Assunt.CLOSE;
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
      DM.cds_UserCod.Close;
      DM.cds_UserCod.Params[0].AsInteger := DM.sds_UserCodCOD_USUARIO.AsInteger;
      DM.cds_UserCod.Open;
    end;
  finally
    DM.sds_UserCod.Close;
    FrmLocalizarUserCod.Free;
  end;

end;

procedure TFrmView.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DM.sds_view.Close;
  // DM.sds_view_todos.CLOSE;
  DM.cds_User.Close;
  DM.cds_UserCod.Close;
  DM.cds_Assunt.Close;

  DM.sds_view.Filtered := False;
end;

procedure TFrmView.DBGrid1CellClick(Column: TColumn);
begin
  if (DBGrid1.DataSource.DataSet.FieldCount <> 0) then
  begin
    FormArquivo.codigoArqu := DM.sds_view.FieldByName('ID').AsInteger;
    selecAtualReport := DBGrid1.DataSource.DataSet.Fields[0].AsInteger;
  end;
end;

procedure TFrmView.desabilitar02Click(Sender: TObject);
begin
  desabilitar02.Enabled := False;
  habilitar02.Enabled := True;
  desabilitar02.Color := clBlue;
  DBText2.Caption := '';
  Dtscra.DataSet.Close;
end;

procedure TFrmView.FormShow(Sender: TObject);
begin
  //DBMemo1.DataField := 'DESCRICAO';
  PanelMostrData.Visible := False;
end;

procedure TFrmView.habilitar02Click(Sender: TObject);
begin

  // CodigoUserPorNome := '';
  CodigoAssunto := DBEdit2.Text;
  habilitar02.Enabled := False;
  desabilitar02.Enabled := True;
  desabilitar02.Color := clYellow;

end;

procedure TFrmView.habilitar03Click(Sender: TObject);
begin
  habilitar03.Enabled := False;
  desabilitar03.Enabled := True;
  desabilitar03.Color := clYellow;
  ;
  CodigoAutor := DBEdit4.Text;
end;

procedure TFrmView.SpeedButton3Click(Sender: TObject);
begin
  Dtscra.DataSet.Close;
  Dtscru.DataSet.Close;
  DtsrcAutor.DataSet.Close;
  DtsrcCod.DataSet.Close;
  Dtsrc.DataSet.Close;
  CheckBoxConsulta.Checked := False;
  PanelMostrData.Visible := False;
  EditPesqu.Text := '';
  Label3.Caption := '';
  Alert.Visible := False;
end;

end.
