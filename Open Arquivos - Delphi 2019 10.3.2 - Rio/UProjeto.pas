// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UProjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DB, Mask,
  DBCtrls, MidasLib, DBClient, SimpleDS, ExtDlgs, FMTBcd, Provider, SqlExpr,
  ImgList, ToolWin, ActnMan, ActnCtrls, ActnMenus, XPStyleActnCtrls, ActnList,
  Menus, DateUtils, System.Actions, System.ImageList, Vcl.Themes, Vcl.WinXCtrls;
// adiciona DBCLient para TClientDataSet

type
  TFrPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Panel5: TPanel;
    Dtsrc: TDataSource;
    ToolBar1: TToolBar;
    cbtconsulta: TToolButton;
    usuarios: TToolButton;
    relatorios: TToolButton;
    log: TToolButton;
    autores: TToolButton;
    ToolButton8: TToolButton;
    Ajudar: TToolButton;
    ImageList2: TImageList;
    inserir: TSpeedButton;
    excluir: TSpeedButton;
    cancelar: TSpeedButton;
    gravar: TSpeedButton;
    ExcluirTemp: TSpeedButton;
    Assuntos: TToolButton;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    Image6: TImage;
    editar: TSpeedButton;
    PopupMenu1: TPopupMenu;
    AssistenteDetetive1: TMenuItem;
    CadastroControle1: TMenuItem;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastro1: TMenuItem;
    ImageList3: TImageList;
    cbconsulta: TAction;
    cbassunto: TAction;
    cbautores: TAction;
    Assuntos1: TMenuItem;
    Autores1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    cbsair: TAction;
    Usurios1: TMenuItem;
    Cadastro2: TMenuItem;
    N2: TMenuItem;
    Perfil1: TMenuItem;
    Relatrios1: TMenuItem;
    Usurios2: TMenuItem;
    Arquivos1: TMenuItem;
    Assuntos2: TMenuItem;
    Autores2: TMenuItem;
    N4: TMenuItem;
    MaisAcessados1: TMenuItem;
    Geral1: TMenuItem;
    Manuteno1: TMenuItem;
    sql1: TMenuItem;
    EmailparaoAutor1: TMenuItem;
    N5: TMenuItem;
    ArquivosTemporrios1: TMenuItem;
    Log1: TMenuItem;
    CadastroControle2: TMenuItem;
    AssistenteDetetive2: TMenuItem;
    Sobre1: TMenuItem;
    AjudadoBiblioArqui1: TMenuItem;
    SitedoAutor1: TMenuItem;
    N6: TMenuItem;
    Atualizao1: TMenuItem;
    N7: TMenuItem;
    Sobre2: TMenuItem;
    cbcadastro: TAction;
    cbperfil: TAction;
    Panel10: TPanel;
    BtnLoc01: TSpeedButton;
    Image3: TImage;
    DBText5: TDBText;
    Label10: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    Label22: TLabel;
    Image2: TImage;
    Label17: TLabel;
    carregar: TSpeedButton;
    Label3: TLabel;
    excluiAssunto: TSpeedButton;
    DBMemo2: TDBMemo;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    PanelPergunta: TPanel;
    Image5: TImage;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    PanelAutor: TPanel;
    Label12: TLabel;
    DBText3: TDBText;
    BtnLoc02: TSpeedButton;
    Image4: TImage;
    excluiAutor: TSpeedButton;
    Panel12: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    DBMemo3: TDBMemo;
    DBEdit2: TDBEdit;
    cbRelUsuarios: TAction;
    cbRelArquivos: TAction;
    cbRelAssuntos: TAction;
    cbRelAutores: TAction;
    cbManutSQL: TAction;
    cbManutEMAIL: TAction;
    cbManutTEMP: TAction;
    cbCadLogAssistente: TAction;
    cbManutAssistente: TAction;
    DtscLog: TDataSource;
    Edit2: TEdit;
    DtscLogar: TDataSource;
    DtsrcExcUser: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
    DBText4: TDBText;
    N3: TMenuItem;
    Cidades1: TMenuItem;
    OpenDialog1: TOpenDialog;
    btntrazer: TToolButton;
    btnvisualizar: TToolButton;
    btnextrair: TToolButton;
    ListView1: TListView;
    DBText6: TDBText;
    DBText7: TDBText;
    Timer1: TTimer;
    lookUser: TSpeedButton;
    Label7: TLabel;
    relatorio: TSpeedButton;
    fundobtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label9: TLabel;
    Label14: TLabel;
    ToolButton1: TToolButton;
    procedure relatoriosClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cbCadLogAssistenteExecute(Sender: TObject);
    procedure AssistenteDetetive2Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure cbManutAssistenteExecute(Sender: TObject);
    procedure cbperfilExecute(Sender: TObject);
    procedure cbautoresExecute(Sender: TObject);
    procedure cbassuntoExecute(Sender: TObject);
    procedure cbcadastroExecute(Sender: TObject);
    procedure cbconsultaExecute(Sender: TObject);
    procedure cbsairExecute(Sender: TObject);
    procedure AssistenteDetetive1Click(Sender: TObject);
    procedure autoresExecute(Sender: TObject);
    procedure assuntosExecute(Sender: TObject);
    procedure consultasExecute(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluiAssuntoClick(Sender: TObject);
    procedure excluiAutorClick(Sender: TObject);
    procedure AssuntosClick(Sender: TObject);
    procedure lookUserClick(Sender: TObject);
    procedure BtnLoc02Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    // procedure Timer1Timer(Sender: TObject);
    procedure BtnLoc01Click(Sender: TObject);
    procedure DBMemo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cadastroUserExecute(Sender: TObject);
    procedure cbtconsultaClick(Sender: TObject);
    procedure autoresClick(Sender: TObject);
    procedure usuariosClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ExcluirTempClick(Sender: TObject);
    procedure extrairClick(Sender: TObject);
    procedure visualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure carregarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure DtsrcStateChange(Sander: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnvisualizarClick(Sender: TObject);
    procedure btnextrairClick(Sender: TObject);
    procedure btntrazerClick(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure relatorioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fundobtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    // para a chamada de status do componente
  private
    buffer: array [0 .. 255] of Char;
    Temp, tempNome: String;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
    procedure MostrarIcon;
    Function numLogados: Integer;
    procedure IniciaAdministracao;
  public
    ext, nomeUser: string;
    numCodigoII: Integer;
    codigo, codigoII, UserTemp, RegistroTemp, RegistroMoment: Integer;
    condNivelForm: Integer;
    figTipo, codigoArqu, codigoArquSolteiro: Integer;
    procedure MostrarEstatistica;
    procedure InicializarComponentes;
  end;

var
  FrPrincipal: TFrPrincipal;
  respArquivos, respUsuarios, respAssuntos, respAutores, respLog, spAutores,
    respLogar, respLogados: Integer;
  thema: TStyleManager;

implementation

uses UDMII, ShellAPI, UnAbertura, UnLogin, UnCadDepartamento, UnCadCidades,
  UnTeladeRelatorios, UnCadPerfil, UnCadLog, UnConfigArqu, UnUtilitLog,
  UnDlgProcuraAutor, UnCadAutores, UnCadAssuntos, UnDlgProcuraAssunto, UDM,
  UnDlgProcura, UnStatus, MMSystem, UAutoPreench, ABOUT, UnContrUser,
  UnManutencao, UnConsultaEspecial, UnMensProce, UnNovVersao, UThema,
  UnProcessIndefinido, UnatribuiUsuariosPorArquivos, UnFrontColor,
  UnViewTextoTelaInicial, remain;

{$R *.dfm}

procedure TFrPrincipal.InicializarComponentes;
begin
  StatusBar1.Panels[1].Text := 'Nome: ' + FrmLogin.NOME;
  StatusBar1.Panels[2].Text := 'Login: ' + FrmLogin.LOGIN;
  nomeUser := FrmLogin.NOME;
  UserTemp := FrmLogin.COD_USUARIO;
  codigo := FrmLogin.COD_USUARIO;
  codigoII := FrmLogin.COD_USUARIO;
  condNivelForm := FrmLogin.NIVEL;
  figTipo := FrmLogin.ADMIN;
  // Height:=590;
  ConfigInicial;
  MostrarEstatistica;
  with Dtsrc.DataSet do
  begin
    btnextrair.Enabled := not IsEmpty;
    btnvisualizar.Enabled := not IsEmpty;
    BtnLoc01.Enabled := not IsEmpty;
    BtnLoc02.Enabled := not IsEmpty;
  end;
  GetTempPath(SizeOf(buffer), buffer);
  Temp := StrPas(buffer) + '\OpenArquivos';
  if not DirectoryExists(Temp) then
  begin
    if not ForceDirectories(Temp) then
    begin
      MessageDlg('Não foi possivel criar o Diretorio Temporario !', mtError,
        [mbOK], 0);
      SysUtils.Abort;
    end;
  end;
end;

Function TFrPrincipal.numLogados: Integer;
var
  numCount: Integer;
  respQtd: Integer;
  respNumLogados: string;
begin
  Result := 0;
  respQtd := 0;
  try
    DM.sds_Cont_Logar.Close;
    DM.sds_Cont_Logar.Params.Clear;
    DM.sds_Cont_Logar.DataSet.CommandText := '';
    DM.sds_Cont_Logar.DataSet.CommandText :=
      'select COUNT(*)as NUM from NUM_LOGADOS ';
    DM.sds_Cont_Logar.Open;
    respQtd := DM.sds_Cont_Logar.FieldByName('NUM').AsInteger;
  except
    on E: Exception do
    begin
      MessageDlg('Algum Erro ou ao tentando montar a instrução SQL[LOGADOS]!' +
        #13 + 'Mensagem Original: ' + E.Message, mtError, [mbOK], 0);
      Abort;
    end;
  end;
  Result := respQtd;
end;

procedure TFrPrincipal.relatorioClick(Sender: TObject);
begin
  if (DBText2.Caption = '') then
  begin
    MessageDlg('Consulte um arquivo ou Cadastre um novo arquivo!', mtWarning,
      [mbOK], 0);
  end
  else
  begin
    DM.sds_report_detalhe.Close;
    DM.sds_report_detalhe.Params[0].AsInteger := StrToInt(DBText2.Caption);
    DM.sds_report_detalhe.Open;
    DM.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'ReportGeral\FastReport\RelatorioPorSelecao.fr3', True);
    DM.frxReport1.ShowReport;
  end;
end;

procedure TFrPrincipal.relatoriosClick(Sender: TObject);
begin
  FrmRelatoriosGerais := TFrmRelatoriosGerais.Create(Self);
  try
    FrmRelatoriosGerais.ShowModal;
  finally
    FrmRelatoriosGerais.Free;
  end;
end;

procedure TFrPrincipal.MostrarEstatistica;
begin
  ListView1.Clear;
  DM.sds_cont.Close;
  DM.sds_cont.DataSet.CommandText := '';
  DM.sds_cont.DataSet.CommandText := 'select COUNT(*)contArqu from ARQUIVOLIST';
  DM.sds_cont.Open;
  respArquivos := DM.sds_cont.FieldByName('contArqu').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.DataSet.CommandText := '';
  DM.sds_cont.DataSet.CommandText := 'select COUNT(*)contUser from USUARIO';
  DM.sds_cont.Open;
  respUsuarios := DM.sds_cont.FieldByName('contUser').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.DataSet.CommandText := '';
  DM.sds_cont.DataSet.CommandText := 'select COUNT(*)contAssunt from ASSUNTO';
  DM.sds_cont.Open;
  respAssuntos := DM.sds_cont.FieldByName('contAssunt').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.DataSet.CommandText := '';
  DM.sds_cont.DataSet.CommandText := 'select COUNT(*)contLog from LOG';
  DM.sds_cont.Open;
  respLog := DM.sds_cont.FieldByName('contLog').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.DataSet.CommandText := '';
  DM.sds_cont.DataSet.CommandText := 'select COUNT(*)contAut from AUTORES';
  DM.sds_cont.Open;
  respAutores := DM.sds_cont.FieldByName('contAut').AsInteger;
  respLogados := numLogados;
  ListView1.Items.Add.Caption := 'Arquivos:                      ' +
    IntToStr(respArquivos);
  ListView1.Items.Add.Caption := 'Usuários:                      ' +
    IntToStr(respUsuarios);
  ListView1.Items.Add.Caption := 'Assuntos:                     ' +
    IntToStr(respAssuntos);
  ListView1.Items.Add.Caption := 'Autores :                      ' +
    IntToStr(respAutores);
  ListView1.Items.Add.Caption := 'Logs    :                        ' +
    IntToStr(respLog);
  Label14.Caption := IntToStr(respLogados);
  Label14.Visible := True;
  // ListView1.Items.Add.Caption := 'Logados :                     ' +IntToStr(respLogados);
end;

procedure TFrPrincipal.MostrarIcon;
begin
  Edit1.Text := DBText1.Caption;
  if (DM.cds_arquivoEXTENCAO.AsString = '.pdf  ') or (Edit1.Text = '.pdf') then
  begin
    // Image2.Picture.LoadFromFile('C:/OpenArquivos/Icon/pdfarqu.bmp');
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/pdfarqu.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.ps   ') or (Edit1.Text = '.ps')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/ps.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.doc  ') or (Edit1.Text = '.doc')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/doc972003.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.docx ') or (Edit1.Text = '.docx')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/word2007.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.xls  ') or (Edit1.Text = '.xls')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/excel972003.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.xlsx ') or (Edit1.Text = '.xlsx')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/xls.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.accdb') or (Edit1.Text = '.accdb')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/access.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.mdb  ') or (Edit1.Text = '.mdb')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/access972003.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.pps  ') or (Edit1.Text = '.pps')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/pps972003.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.ppt  ') or (Edit1.Text = '.ppt')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/ppt.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.ppsx ') or (Edit1.Text = '.ppsx')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/pps.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.pptx  ') or (Edit1.Text = '.ppt')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/ppt.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.mpg  ') or (Edit1.Text = '.mpg')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/avimpeg.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.avi  ') or (Edit1.Text = '.avi')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/avimpeg.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.mp3  ') or (Edit1.Text = '.mp3')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.wma  ') or (Edit1.Text = '.wma')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.wav  ') or (Edit1.Text = '.wav')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.ogg  ') or (Edit1.Text = '.ogg')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.bmp  ') or (Edit1.Text = '.bmp')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/bmp.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.jpg  ') or (Edit1.Text = '.jpg')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/jpg.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.png  ') or (Edit1.Text = '.png')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/png.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.gif  ') or (Edit1.Text = '.gif')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/gif.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.tiff ') or (Edit1.Text = '.tiff')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/tiff.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.html ') or (Edit1.Text = '.html')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/html.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.htm  ') or (Edit1.Text = '.htm')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/html.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.mht  ') or (Edit1.Text = '.mht')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mht.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.exe  ') or (Edit1.Text = '.exe')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/exe.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.java ') or (Edit1.Text = '.java')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/java.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.txt  ') or (Edit1.Text = '.txt')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/notpad.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.rtf  ') or (Edit1.Text = '.rtf')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/doc972003.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.zip  ') or (Edit1.Text = '.zip')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/zip.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '.rar  ') or (Edit1.Text = '.rar')
  then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/rar.bmp');
  end
  else if (DM.cds_arquivoEXTENCAO.AsString = '      ') or (Edit1.Text = '') then
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/nada.bmp');
  end
  else
  begin
    Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/Default.bmp');
  end;

end;

procedure TFrPrincipal.N1Click(Sender: TObject);
begin
  FrmCadDepartamento := TFrmCadDepartamento.Create(Application);
  try
    FrmCadDepartamento.ShowModal;
  finally
    FrmCadDepartamento.Free;
  end;
end;

procedure TFrPrincipal.ConfigInserir;
begin
  carregar.Enabled := True;
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
  btntrazer.Enabled := False;
  btnvisualizar.Enabled := False;
  btnextrair.Enabled := False;
  ExcluirTemp.Enabled := False;
  Image6.Visible := False;
end;

procedure TFrPrincipal.ConfigGravar;
begin
  inserir.Enabled := True;
  btnvisualizar.Enabled := True;
  btnextrair.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
end;

procedure TFrPrincipal.ConfigExcluir;
begin
  carregar.Enabled := False;
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  btnvisualizar.Enabled := False;
  btntrazer.Enabled := True;
  // DM.cds_arqu.Close;
  ExcluirTemp.Enabled := False;
  Image6.Visible := False;
end;

procedure TFrPrincipal.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text > '0' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
  end;

end;

procedure TFrPrincipal.Cidades1Click(Sender: TObject);
begin
  FrmCadCidades := TFrmCadCidades.Create(Application);
  try
    FrmCadCidades.ShowModal;
  finally
    FrmCadCidades.Free;
  end;
end;

procedure TFrPrincipal.ConfigCancelar;
begin

  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  // DM.cds_arquivo.Close;
  ExcluirTemp.Enabled := False;
  excluiAssunto.Enabled := False;
  excluiAutor.Enabled := False;
end;

procedure TFrPrincipal.ConfigInicial;
begin
  inserir.Enabled := True;
  gravar.Enabled := False;
  editar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  btnvisualizar.Enabled := False;
  btnextrair.Enabled := False;
  carregar.Enabled := False;
  ExcluirTemp.Enabled := False;
  Image6.Visible := False;
  excluiAssunto.Enabled := False;
  excluiAutor.Enabled := False;

end;

procedure TFrPrincipal.ExcluirTempClick(Sender: TObject);
begin
  DeleteFile(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString);
  ExcluirTemp.Enabled := False;
  Image6.Visible := False;
end;

procedure TFrPrincipal.AssistenteDetetive1Click(Sender: TObject);
begin
  FrmLogAcesso := TFrmLogAcesso.Create(Application);
  try
    FrmLogAcesso.ShowModal;
  finally
    FrmLogAcesso.Free;
  end;
end;

procedure TFrPrincipal.assuntosExecute(Sender: TObject);
begin
  FrmCadAssuntos := TFrmCadAssuntos.Create(Application);
  try
    FrmCadAssuntos.ShowModal;
  finally
    FrmCadAssuntos.Free;
  end;
end;

procedure TFrPrincipal.autoresExecute(Sender: TObject);
begin
  FrmCadAutor := TFrmCadAutor.Create(Application);
  try
    FrmCadAutor.ShowModal;
  finally
    FrmCadAutor.Free;
  end;
end;

procedure TFrPrincipal.BitBtn1Click(Sender: TObject);
begin
  thema := TStyleManager.Create();
  thema.SetStyle('Carbon');
end;

procedure TFrPrincipal.btnextrairClick(Sender: TObject);
begin
  begin
    if DM.cds_arquivo.IsEmpty then
    begin
      MessageDlg('Não ha Arquivo no cadastro, consulte ou localize primeiro !',
        mtWarning, [mbOK], 0);
    end
    else
    begin
      with SaveDialog1 do
      begin
        FileName := DM.cds_arquivo['NOME_ARQUIVO'];
        if Execute then
        begin
          DM.cds_arquivoDADOS.SaveToFile(FileName);
        end;
      end;
    end;
  end;

end;

procedure TFrPrincipal.BtnLoc01Click(Sender: TObject);
begin
  FrmLocalizaAssunto := TFrmLocalizaAssunto.Create(Self, DM.sds_assunt);
  try
    if FrmLocalizaAssunto.ShowModal = mrOk then
    begin
      if Dtsrc.State = dsbrowse then
        DM.cds_arquivo.Edit;
      DM.cds_arquivoCOD_ASSUNTO.AsInteger := DM.sds_AssuntCODIGO.AsInteger;
      DM.cds_arquivoTITULOASSUN.AsString := DM.sds_AssuntTITULOASSUN.AsString;
    end;
  finally
    DM.sds_assunt.Close;
    FrmLocalizaAssunto.Free;
    if DBText5.Caption <> '' then
    begin
      PanelPergunta.Visible := True;
    end;
    if DBEdit4.Text <> '' then
    begin
      DBText5.Font.Color := clBlue;
    end
    else
    begin
      DBText5.Font.Color := $00E3F4F4;
    end;
  end;
end;

procedure TFrPrincipal.Sobre2Click(Sender: TObject);
begin
  AboutBox := TAboutBox.Create(Application);
  try
    AboutBox.ShowModal;
  finally
    AboutBox.Free;
  end;
end;

procedure TFrPrincipal.lookUserClick(Sender: TObject);
begin
  FrmAtribuiUser := TFrmAtribuiUser.Create(Self);
  try
    FrmAtribuiUser.ShowModal;
  finally
    FrmAtribuiUser.Free;
  end;

end;

procedure TFrPrincipal.fundobtnClick(Sender: TObject);
begin
  // thema := TStyleManager.Create();
  // thema.SetStyle('Carbon');
  FrmFrontColor := TFrmFrontColor.Create(Self);
  try
    FrmFrontColor.ShowModal;
  finally
    FrmFrontColor.Free;
  end;
end;

procedure TFrPrincipal.SpeedButton1Click(Sender: TObject);
begin
  MainForm := TMainForm.Create(nil);
  try
    MainForm.ShowModal;
  finally
    MainForm.Free;
  end;

end;

procedure TFrPrincipal.SpeedButton2Click(Sender: TObject);
begin
  FrmTelaTexto := TFrmTelaTexto.Create(nil);
  try
    FrmTelaTexto.ShowModal;
  finally
    FrmTelaTexto.Free;
  end;
end;

procedure TFrPrincipal.SpeedButton4Click(Sender: TObject);
begin
  MostrarEstatistica;
end;

procedure TFrPrincipal.SpeedButton5Click(Sender: TObject);
begin
  Dtsrc.DataSet.Cancel;
  ConfigCancelar;
  with Dtsrc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    btnextrair.Enabled := not IsEmpty;
    btnvisualizar.Enabled := not IsEmpty;
  end;
end;

procedure TFrPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.ID = 1 then
  begin
    StatusBar1.Canvas.Brush.Color := clWhite;
    StatusBar.Canvas.Font.Color := clBlue;
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    if FrmLogin.ADMIN = 0 then
    begin
      ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 4);
    end
    else
    begin
      ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 2);
    end;
  end
  else if Panel.ID = 2 then
  begin
    StatusBar1.Canvas.Brush.Color := clWhite;
    StatusBar.Canvas.Font.Color := clBlue;
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 1);
  end
  else
  begin
    StatusBar1.Canvas.Brush.Color := clWhite;
    StatusBar.Canvas.Font.Color := clBlue;
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 3);
  end;
end;

// procedure TFrPrincipal.Timer1Timer(Sender: TObject);
// begin
// Label16.Caption := TimeToStr(Time);
// end;

procedure TFrPrincipal.Timer1Timer(Sender: TObject);
begin
  MostrarEstatistica;
end;

procedure TFrPrincipal.btntrazerClick(Sender: TObject);
var
  DataInserimento: String;
begin
  FrmArquProc := TFrmArquProc.Create(Self);
  // FrmArquProc.ShowModal;
  if FrmArquProc.ShowModal = mrOk then
  begin
    DM.cds_arquivo.Close;
    FrmProcedimento := TFrmProcedimento.Create(Self, DM.cds_arquivo);
    FrmProcedimento.Show;
    FrmProcedimento.Refresh;
    if (FrmLogin.TODOS = 0) then
    begin
      try

        DM.cds_arquivo.Params[0].AsInteger := DM.sds_arqu.FieldByName('ID')
          .AsInteger;
        DM.cds_arquivo.Open;
        // DataInserimento := DM.cds_ArquivoDATA.AsString;
        // DBText6.Caption:= FormatDateTime('dd/MM/yyyy',StrToDate(DataInserimento));
        FrmProcedimento.Progress;
        FrmProcedimento.Close;

      finally
        DM.sds_ArquTodos.Close;
        FrmArquProc.Free;
      end;
    end
    else if FrmLogin.TODOS = 1 then
    begin
      try
        // lookUser.Visible:=true;
        DM.cds_arquivo.Params[0].AsInteger := DM.sds_ArquTodosID.AsInteger;
        DM.cds_arquivo.Open;
        // DataInserimento := DM.cds_ArquivoDATA.AsString;
        // DBText6.Caption:= FormatDateTime('dd/MM/yyyy',StrToDate(DataInserimento));
        FrmProcedimento.Progress;
        FrmProcedimento.Close;

      finally
        DM.sds_ArquTodos.Close;
        FrmArquProc.Free;
      end;

    end;
  end;

  if DBEdit4.Text <> '' then
  begin
    DBText5.Font.Color := clBlue;
  end
  else
  begin
    DBText5.Font.Color := $00E3F4F4;
  end;
  if (DM.cds_arquivo.FieldByName('COD_AUTOR').AsInteger > 99) then
  begin
    PanelAutor.Visible := True;
    DBText3.Font.Color := clBlue;
    DBText3.Visible := True;
    CheckBox1.Checked := True;
    // Height := 615;
  end
  else if (DM.cds_arquivo.FieldByName('COD_AUTOR').AsInteger = 0) then
  begin
    PanelAutor.Visible := False;
    CheckBox1.Checked := False;
    // Height := 615;
  end;

  // end;
  // finally
  // FrmProcedimento.Close;

  // FrmProcedimento.Free;
  // FrmDlgProcurar.Free;
  // end;
  MostrarIcon;
  IniciaAdministracao;
  if not DM.cds_arquivo.IsEmpty then
  begin
    Edit2.Text := DBText2.Caption;
    tempNome := DBMemo2.Lines.Text;
  end;
  if FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString) = True then
  begin
    ExcluirTemp.Enabled := True;
    Image6.Visible := True;
  end
  else if not(FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString)) then
  begin
    ExcluirTemp.Enabled := False;
    Image6.Visible := False;
    SysUtils.Abort;
  end;

  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text <> ' ' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
  end;
end;

procedure TFrPrincipal.btnvisualizarClick(Sender: TObject);
var
  x, y: PChar;
  Flag: Integer;
begin
  if DM.cds_arquivo.IsEmpty then
  begin
    MessageDlg('Não ha Arquivo no cadastro, consulte ou localize primeiro !',
      mtWarning, [mbOK], 0);
  end
  else
  begin
    DM.cds_arquivoDADOS.SaveToFile
      (Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString);
    x := nil;
    y := nil;
    Flag := ShellExecute(Application.Handle, 'OPEN',
      PChar(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString), x, y, SW_SHOW);
    if Flag <= 32 then
    begin
      ShowMessage('Erro ao Abrir ' + Temp + '\' +
        DM.cds_arquivoNOME_ARQUIVO.AsString);
    end;
    if FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString) then
    begin
      ExcluirTemp.Enabled := True;
      Image6.Visible := True;
    end
    else
    begin
      ExcluirTemp.Enabled := False;
      Image6.Visible := False;
      SysUtils.Abort;
    end;
  end;
end;

procedure TFrPrincipal.AssistenteDetetive2Click(Sender: TObject);
begin
  FrmCadLogDet := TFrmCadLogDet.Create(Application);
  try
    FrmCadLogDet.ShowModal;
  finally
    FrmCadLogDet.Free
  end;
end;

procedure TFrPrincipal.AssuntosClick(Sender: TObject);
begin

  if not Assigned(FrmCadAssuntos) then
    FrmCadAssuntos := TFrmCadAssuntos.Create(Self);
  FrmCadAssuntos.Show;
end;

procedure TFrPrincipal.cbtconsultaClick(Sender: TObject);
begin
  FrmView := TFrmView.Create(Self);
  try
    if FrmView.ShowModal = mrOk then
    begin
      DM.cds_arquivo.Close;
      DM.cds_arquivo.Params[0].AsInteger := codigoArqu;
      DM.cds_arquivo.Open;
      if DBEdit4.Text <> '' then
      begin
        DBText5.Font.Color := clBlue;
      end
      else
      begin
        DBText5.Font.Color := $00E3F4F4;
      end;
      if (DM.cds_arquivo.FieldByName('COD_AUTOR').AsInteger > 99) then
      begin
        PanelAutor.Visible := True;
        DBText3.Font.Color := clBlue;
        DBText3.Visible := True;
        CheckBox1.Checked := True;
        Height := 610;
      end
      else if (DM.cds_arquivo.FieldByName('COD_AUTOR').AsInteger = 0) then
      begin
        PanelAutor.Visible := False;
        CheckBox1.Checked := False;
        Height := 610;
      end;
    end;
  finally
    DM.sds_view.Close;
    // FrmView.release;
    FrmView.Free;
  end;
  if not DM.cds_arquivo.IsEmpty then
  begin
    Edit2.Text := DBText2.Caption;
    tempNome := DBMemo2.Lines.Text;
  end;
  if FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString) then
  begin
    ExcluirTemp.Enabled := True;
    Image6.Visible := True;
  end
  else
  begin
    ExcluirTemp.Enabled := False;
    Image6.Visible := False;
  end;
  MostrarIcon;
  IniciaAdministracao;
  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text > '0' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
  end;
end;

procedure TFrPrincipal.consultasExecute(Sender: TObject);
begin
  FrmView := TFrmView.Create(Application);
  try
    FrmView.ShowModal;
  finally
    FrmView.Free;
  end;
end;

procedure TFrPrincipal.usuariosClick(Sender: TObject);
begin
  FrmContrUser := TFrmContrUser.Create(Self);
  try
    FrmContrUser.ShowModal;
  finally
    FrmContrUser.Free;
  end;
end;

procedure TFrPrincipal.autoresClick(Sender: TObject);
begin
  if not Assigned(FrmCadAutor) then
    FrmCadAutor := TFrmCadAutor.Create(Self);
  FrmCadAutor.Show;
  { FrmCadAutor:=TFrmCadAutor.Create(Application);
    try
    FrmCadAutor.ShowModal;
    finally
    FrmCadAutor.Free;
    end; }
end;

procedure TFrPrincipal.ToolButton1Click(Sender: TObject);
begin
if (MessageDlg('Deseja Sair do Sistema ?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  BEGIN
    try
      try
        DM.cds_ExcRepetidos.Close;
        DM.cds_ExcRepetidos.Params[0].AsInteger := FrmLogin.COD_USUARIO;
        DM.cds_ExcRepetidos.Open;
      finally
        DM.DtsrcExcLogados.DataSet.Delete;
        (DM.DtsrcExcLogados.DataSet as TClientDataSet).ApplyUpdates(0);

      end;
    Except
      on E: Exception do
      begin
        MessageDlg('Houve um problema no termino do aplicativo !', mtWarning,
          [mbOK], 0);

      end;
    end;
    try
    Application.Terminate;

    Except
    on E:Exception do
    begin

    end;

    end;
  END;
end;

procedure TFrPrincipal.ToolButton6Click(Sender: TObject);
begin
  FrmDlgProcurar := TFrmDlgProcurar.Create(Application);
  try
    if FrmDlgProcurar.ShowModal = mrOk then
    begin
      DM.cds_arquivo.Close;
      DM.cds_arquivo.Params[0].AsInteger := DM.sds_arqu.DataSet.FieldByName
        ('ID').AsInteger;
      DM.cds_arquivo.Open;
      if DBEdit4.Text <> '0' then
      begin
        DBText5.Font.Color := clBlue;
      end
      else
      begin
        DBText5.Font.Color := $00E3F4F4;
      end;
      if DBEdit3.Text > '0' then
      begin
        PanelAutor.Visible := True;
        DBEdit3.Font.Color := clBlue;
        Height := 610;
        CheckBox1.Checked := True;
      end
      else if DBEdit3.Text = '0' then
      begin
        PanelAutor.Visible := False;
        DBText3.Font.Color := $00E3F4F4;
        Height := 610;
        CheckBox1.Checked := False;
      end;
    end;

  finally
    DM.sds_arqu.Close;
    FrmDlgProcurar.Free;
  end;
  MostrarIcon;
  if not DM.cds_arquivo.IsEmpty then
  begin
    Edit2.Text := DBText2.Caption;
    tempNome := DBMemo2.Lines.Text;
  end;
  if FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString) = True then
  begin
    ExcluirTemp.Enabled := True;
    Image6.Visible := True;
  end
  else if not(FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString)) then
  begin
    ExcluirTemp.Enabled := False;
    Image6.Visible := False;
    SysUtils.Abort;
  end;
end;

procedure TFrPrincipal.DBMemo3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { if ((GetKeyState(VK_CAPITAL) and 1) = 1) then
    begin
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end; }

end;

procedure TFrPrincipal.DtsrcStateChange(Sander: TObject);
begin
  with Dtsrc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsrc.State in [dsbrowse, dsInactive];
    btnvisualizar.Enabled := Dtsrc.State in [dsbrowse];
    btnextrair.Enabled := Dtsrc.State in [dsbrowse];
    gravar.Enabled := Dtsrc.State in [dsInsert];
    editar.Enabled := Dtsrc.State in [dsEdit];
    cancelar.Enabled := Dtsrc.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtsrc.State in [dsbrowse];
    btntrazer.Enabled := Dtsrc.State in [dsbrowse, dsInactive];
    carregar.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    BtnLoc01.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    BtnLoc02.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    excluiAssunto.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    excluiAutor.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    lookUser.Enabled := Dtsrc.State in [dsbrowse, dsEdit];
    relatorio.Enabled := Dtsrc.State in [dsbrowse, dsEdit];

  end;
  if Dtsrc.DataSet.State = dsbrowse then
  begin
    if DBEdit4.Text <> '0' then
    begin
      DBText5.Font.Color := clBlue;
    end
    else
    begin
      DBText5.Font.Color := $00CBEAEB; // $00E3F4F4
    end;
    if DBEdit3.Text > '0' then
    begin
      PanelAutor.Visible := True;
      DBEdit3.Font.Color := clBlue;
      Height := 610;
      CheckBox1.Checked := True;
    end
    else if DBEdit3.Text <> '0' then
    begin
      PanelAutor.Visible := False;
      DBText3.Font.Color := $00CBEAEB; // $00E3F4F4
      Height := 610;
      CheckBox1.Checked := False;
    end;
  end;
end;

procedure TFrPrincipal.extrairClick(Sender: TObject);
begin
  if DM.cds_arquivo.IsEmpty then
  begin
    MessageDlg('Não ha Arquivo no cadastro, consulte ou localize primeiro !',
      mtWarning, [mbOK], 0);
  end
  else
  begin
    with SaveDialog1 do
    begin
      FileName := DM.cds_arquivo['NOME_ARQUIVO'];
      if Execute then
      begin
        DM.cds_arquivoDADOS.SaveToFile(FileName);
      end;
    end;
  end;
end;

// Função minha  agora modificada :walter rhj
procedure TFrPrincipal.visualizarClick(Sender: TObject);
var
  x, y: PChar;
  Flag: Integer;
begin
  if DM.cds_arquivo.IsEmpty then
  begin
    MessageDlg('Não ha Arquivo no cadastro, consulte ou localize primeiro !',
      mtWarning, [mbOK], 0);
  end
  else
  begin
    DM.cds_arquivoDADOS.SaveToFile
      (Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString);
    x := nil;
    y := nil;
    Flag := ShellExecute(Application.Handle, 'OPEN',
      PChar(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString), x, y, SW_SHOW);
    if Flag <= 32 then
    begin
      ShowMessage('Erro ao Abrir ' + Temp + '\' +
        DM.cds_arquivoNOME_ARQUIVO.AsString);
    end;
    if FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString) then
    begin
      ExcluirTemp.Enabled := True;
      Image6.Visible := True;
    end
    else
    begin
      ExcluirTemp.Enabled := False;
      Image6.Visible := False;
      SysUtils.Abort;
    end;
  end;
end;

Function Saudacao: string;
begin
  Result := ' Boa-Noite!';
  if (Time >= 0.25) and (Time < 0.5) then
    Result := ' Bom-Dia!';
  if (Time >= 0.5) and (Time < 0.80) then
    Result := ' Boa-Tarde!';
end;

procedure TFrPrincipal.inserirClick(Sender: TObject);
begin
  if not Dtsrc.DataSet.Active then
    Dtsrc.DataSet.Open;
  Dtsrc.DataSet.Append;

  DM.cds_UserAdd.Open;
  DM.cds_UserAdd.Append;

  DtscLog.DataSet.Open;
  DtscLog.DataSet.Append;
  ConfigInserir;
  MostrarIcon;
  Edit2.Text := DBText2.Caption;
  with Dtsrc.DataSet do
  begin
    BtnLoc01.Enabled := not IsEmpty;
    BtnLoc02.Enabled := not IsEmpty;
  end;
  if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;
  CheckBox1.Checked := False;
  PanelPergunta.Visible := True;
  PanelAutor.Visible := False;

  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text <> ' ' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    // PanelAutor.Visible := false;
    DBEdit3.Font.Color := clBlue;
    Height := 568;
  end;
  // Height:=549;
end;

procedure TFrPrincipal.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  with ListView1 do
  begin
    if (Item.Index mod 2) = 0 then
    begin
      Canvas.Brush.Color := $00CBEAEB;
      Canvas.Font.Color := clGray;
    end
    else
    begin
      Canvas.Brush.Color := $00FFF4F4;
      Canvas.Font.Color := clGray;
    end;
  end;
end;

procedure TFrPrincipal.BtnLoc02Click(Sender: TObject);
begin
  FrmLocalizarAutor := TFrmLocalizarAutor.Create(Self, DM.sds_Autores);
  try
    if FrmLocalizarAutor.ShowModal = mrOk then
    begin
      if Dtsrc.State = dsbrowse then
        DM.cds_arquivo.Edit;
      DM.cds_arquivoCOD_AUTOR.AsInteger := DM.sds_AutoresCODIGO.AsInteger;
      DM.cds_arquivoNOME.AsString := DM.sds_AutoresNOME.AsString;
    end;
  finally
    DM.sds_Autores.Close;
    FrmLocalizarAutor.Free;

    { if DBText3.Caption <> '' then
      begin
      PanelPergunta.Visible:=True;
      end; }
    if (DM.cds_arquivo.FieldByName('COD_AUTOR').AsInteger > 99) then
    begin
      PanelAutor.Visible := True;
      DBText3.Font.Color := clBlue;
      DBText3.Visible := True;
      CheckBox1.Checked := True;
    end
    else
    begin
      DBText3.Font.Color := $00E3F4F4;
      Height := 610;
    end;
    { if DBEdit3.Text <> '' then
      begin
      DBText3.Font.Color:=clBlue;
      Height:=592;
      end else
      begin
      DBText3.Font.Color:=$00E3F4F4;
      Height:=592;
      end; }
  end;
end;

procedure TFrPrincipal.cadastroUserExecute(Sender: TObject);
begin
  FrmContrUser := TFrmContrUser.Create(Application);
  try
    FrmContrUser.ShowModal;
  finally
    FrmContrUser.Free;
  end;
end;

procedure TFrPrincipal.cancelarClick(Sender: TObject);
begin
  Dtsrc.DataSet.Cancel;
  ConfigCancelar;
  // CheckBox1.Checked := True;
  PanelPergunta.Visible := True;
  PanelAutor.Visible := True;
  MostrarIcon;
  with Dtsrc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    btnextrair.Enabled := not IsEmpty;
    btnvisualizar.Enabled := not IsEmpty;
    BtnLoc01.Enabled := not IsEmpty;
    BtnLoc02.Enabled := not IsEmpty;
    excluiAssunto.Enabled := not IsEmpty;
    excluiAutor.Enabled := not IsEmpty;
    lookUser.Enabled := not IsEmpty;
    // relatorios.Enabled := not IsEmpty;

    // exclusão de campos recebendo 0
  end;

  // if Dtsrc.DataSet.State = dsbrowse then
  // begin
  if DBEdit4.Text <> ' ' then
  begin
    DBText3.Font.Color := clBlue;
    DBText5.Font.Color := clBlue;
  end;
  if DBEdit3.Text <> '' then
  begin
    PanelAutor.Visible := True;
    // DBEdit3.Font.Color := clBlue;
    Height := 610;
    CheckBox1.Checked := True;
  end
  else if DBEdit3.Text = '' then
  begin
    PanelAutor.Visible := False;
    // DBText3.Font.Color := clBlue; // $00E3F4F4
    // DBText5.Font.Color := clBlue;
    Height := 568;
    CheckBox1.Checked := False;
  end;
  // end;

  // end;
  // DBText3.Font.Color := clBlue;
end;

function FileExtencaowrhj(const FileName: string): string;
var
  delim: Integer;
begin
  delim := LastDelimiter('.', FileName);
  if (delim > 0) and (FileName[delim] = '.') then
    Result := Copy(FileName, delim, MaxInt)
  else
    Result := '';
end;

procedure TFrPrincipal.carregarClick(Sender: TObject);
var
  F: File of Byte;
  Tamnh, TamnhBytes, TamnhMB, TamnhKB, Temp2: Double;
  ext, varifTempBytes, varifTempKB, varifTempMB: string;
begin
  Tamnh := 0.0;
  TamnhBytes := 0.0;
  TamnhMB := 0.0;
  TamnhKB := 0.0;
  OpenDialog1.FileName := '';
  OpenDialog1.Files.Clear;
  AssignFile(F, OpenDialog1.FileName);
  if FileExists(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString) then
  begin
    DeleteFile(Temp + '\' + DM.cds_arquivoNOME_ARQUIVO.AsString);
    ExcluirTemp.Enabled := False;
    Image6.Visible := False;
  end
  else if OpenDialog1.Execute then
  begin

    if Dtsrc.State = dsbrowse then
      DM.cds_arquivo.Edit;
    DM.cds_arquivoDADOS.LoadFromFile(OpenDialog1.FileName);
    DM.cds_arquivoNOME_ARQUIVO.AsString :=
      ExtractFileName(OpenDialog1.FileName);
    DM.cds_arquivoEXTENCAO.AsString :=
      LowerCase(ExtractFileExt(OpenDialog1.FileName));
    AssignFile(F, OpenDialog1.FileName);
    Reset(F);
    Tamnh := FileSize(F);
    if Tamnh <= 1024 then
    begin
      varifTempBytes := (FloatToStrF((Tamnh), ffNumber, 11, 0));
      DM.cds_arquivoTAMANHO.AsString := varifTempBytes + ' Bytes';
      DM.cds_ArquivoSIZE_ARQUIVO.AsFloat := StrToFloat(varifTempBytes);
    end
    else if (Tamnh > 1024) then
    begin
      varifTempBytes := (FloatToStrF((Tamnh), ffNumber, 11, 0));
      TamnhKB := (Tamnh / 1024);
      Temp2 := (Tamnh / 1024);
      TamnhMB := (Temp2 / 1024);
      if (TamnhKB <= 1024) then
      begin
        varifTempKB := (FloatToStrF((TamnhKB), ffNumber, 11, 2));
        DM.cds_arquivoTAMANHO.AsString := varifTempKB + ' (KB)-' + '(' +
          varifTempBytes + ' Bytes)';
        DM.cds_ArquivoSIZE_ARQUIVO.AsFloat := TamnhKB;
      end
      else
      begin
        varifTempMB := (FloatToStrF((TamnhMB), ffNumber, 11, 1));
        varifTempKB := (FloatToStrF((TamnhKB), ffNumber, 11, 2));
        DM.cds_arquivoTAMANHO.AsString := varifTempMB + ' (MB)-' + varifTempKB +
          ' (KB)-' + '(' + varifTempBytes + ' Bytes)';
        DM.cds_ArquivoSIZE_ARQUIVO.AsFloat := TamnhKB;
      end;
      MostrarIcon;
      if (Tamnh >= 125829120) then // 120MB
      begin
        Dtsrc.DataSet.Cancel;
        MessageDlg('Memória insuficiente no Banco!, Ultrapassou os 120 MB!',
          mtError, [mbOK], 0);
        MostrarIcon;
      end;
    end;
  end;
end;

procedure TFrPrincipal.cbassuntoExecute(Sender: TObject);
begin
  FrmCadAssuntos := TFrmCadAssuntos.Create(Application);
  try
    FrmCadAssuntos.ShowModal;
  finally
    FrmCadAssuntos.Free;
  end;
end;

procedure TFrPrincipal.cbautoresExecute(Sender: TObject);
begin
  FrmCadAutor := TFrmCadAutor.Create(Application);
  try
    FrmCadAutor.ShowModal;
  finally
    FrmCadAutor.Free;
  end;
end;

procedure TFrPrincipal.cbcadastroExecute(Sender: TObject);
begin
  FrmContrUser := TFrmContrUser.Create(Application);
  try
    FrmContrUser.ShowModal;
  finally
    FrmContrUser.Free;
  end;
end;

procedure TFrPrincipal.cbconsultaExecute(Sender: TObject);
begin
  FrmView := TFrmView.Create(Application);
  try
    FrmView.ShowModal;
  finally
    FrmView.Free;
  end;
end;

procedure TFrPrincipal.cbManutAssistenteExecute(Sender: TObject);
begin
  FrmLogAcesso := TFrmLogAcesso.Create(Application);
  try
    FrmLogAcesso.ShowModal;
  finally
    FrmLogAcesso.Free;
  end;
end;

procedure TFrPrincipal.cbCadLogAssistenteExecute(Sender: TObject);
begin
  FrmCadLogDet := TFrmCadLogDet.Create(Application);
  try
    FrmCadLogDet.ShowModal;
  finally
    FrmCadLogDet.Free;
  end;
end;

procedure TFrPrincipal.cbperfilExecute(Sender: TObject);
begin
  FrmCadPerfil := TFrmCadPerfil.Create(Application);
  try
    FrmCadPerfil.ShowModal;
  finally
    FrmCadPerfil.Free;
  end;
end;

procedure TFrPrincipal.cbsairExecute(Sender: TObject);
begin
  if (MessageDlg('Deseja Sair do Sistema ?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  BEGIN
    try
      try
        DM.cds_ExcRepetidos.Close;
        DM.cds_ExcRepetidos.Params[0].AsInteger := FrmLogin.COD_USUARIO;
        DM.cds_ExcRepetidos.Open;
      finally
        DM.DtsrcExcLogados.DataSet.Delete;
        (DM.DtsrcExcLogados.DataSet as TClientDataSet).ApplyUpdates(0);
        Application.Terminate;
      end;
    Except
      on E: Exception do
      begin
        Application.Terminate;
      end;
    end;
  END;
end;

procedure TFrPrincipal.editarClick(Sender: TObject);
begin
  { if (DBEdit5.Text='  /  /    ') then
    begin
    MessageDlg('Preencha o campo Data!',mtWarning,[mbOK],0);
    end
    else
    if (DBEdit6.Text='  :  :  ') then
    begin
    MessageDlg('Preencha o campo Hora!',mtWarning,[mbOK],0);
    end }
  // else
  if (DBMemo2.Lines.Text = '') then
  begin
    MessageDlg('Carregue o Arquivo!', mtWarning, [mbOK], 0);
  end
  else if (DBText5.Caption = '') then
  begin
    MessageDlg('Preencha o campo Assunto!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit2.Text = '') then
  begin
    MessageDlg('Preencha o campo Titulo!', mtWarning, [mbOK], 0);
  end
  else if (DBMemo3.Lines.Text = '') then
  begin
    MessageDlg('Preencha o campo descrição!', mtWarning, [mbOK], 0);
  end
  else
  begin
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);
    // Log
    DtscLog.DataSet.Open;
    DtscLog.DataSet.Append;
    DM.cds_LogCOD_USUARIO.Value := FrmLogin.COD_USUARIO;
    DM.cds_LogINSERDATA.Value := Date;
    DM.cds_LogHORA.Value := Time;
    DM.cds_LogCOD_ACAO.Value := 3;
    DM.cds_LogACAO.Value := 'ALTEROU';
    DM.cds_LogAPLICATIVO.Value := 'CADASTRO DE ARQUIVOS';
    DM.cds_LogCOD_REGISTRO.Value := DM.cds_arquivoID.AsInteger;
    DM.cds_LogDISCRIMINACAO.Value := DM.cds_arquivo.FieldByName
      ('NOME_ARQUIVO').AsString;
    DtscLog.DataSet.Post;
    (DtscLog.DataSet as TClientDataSet).ApplyUpdates(0);
    if CheckBox1.Checked = True then
    begin

      DBText5.Font.Color := clBlue;
      DBText3.Font.Color := clBlue;

      PanelAutor.Visible := True;
      Height := 610;
    end
    else
    begin
      PanelAutor.Visible := False;
      DBText5.Font.Color := clBlue;
      DBText3.Font.Color := clBlue;
      Height := 568;
    end;
  end;

  if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;
end;

procedure TFrPrincipal.excluiAssuntoClick(Sender: TObject);
begin
  if Dtsrc.State = dsbrowse then
    DM.cds_arquivo.Edit;
  with DM.cds_arquivo do
  begin
    DM.cds_arquivoCOD_ASSUNTO.Value := 0;
    DM.cds_arquivoTITULOASSUN.Value := 'Sem Assunto!';
  end;
  if CheckBox1.Checked = True then
  begin

    DBText5.Font.Color := clBlue;

    DBText3.Font.Color := clBlue;

    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
    DBText5.Font.Color := clBlue;

    DBText3.Font.Color := clBlue;
  end;
end;

procedure TFrPrincipal.excluiAutorClick(Sender: TObject);
begin
  if Dtsrc.State = dsbrowse then
    DM.cds_arquivo.Edit;
  with DM.cds_arquivo do
  begin
    DM.cds_arquivoCOD_AUTOR.Value := 0;
    DM.cds_arquivoNOME.Value := 'Sem Autor!';
    PanelAutor.Visible := False;
    CheckBox1.Checked := False;
  end;
  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text <> ' ' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
  end;
end;

procedure TFrPrincipal.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir este Arquivo e Informações?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    Dtsrc.DataSet.Delete;
    Screen.Cursor := crHourGlass;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);
    Screen.Cursor := crHourGlass;
    Screen.Cursor := crDefault;
    ConfigExcluir;
    MostrarEstatistica;
    MostrarIcon;
    CheckBox1.Checked := False;
    // Log
    DtscLog.DataSet.Open;
    DtscLog.DataSet.Append;
    DM.cds_LogCOD_USUARIO.Value := FrmLogin.COD_USUARIO;
    DM.cds_LogINSERDATA.Value := Date;
    DM.cds_LogHORA.Value := Time;
    DM.cds_LogCOD_ACAO.Value := 2;
    DM.cds_LogACAO.Value := 'EXCLUIU';
    DM.cds_LogAPLICATIVO.Value := 'CADASTRO DE ARQUIVOS';
    DM.cds_LogCOD_REGISTRO.Value := StrToInt(Edit2.Text);
    if DM.cds_arquivo.IsEmpty then
    begin
      DM.cds_LogDISCRIMINACAO.Value := tempNome;
    end;
    DtscLog.DataSet.Post;
    (DtscLog.DataSet as TClientDataSet).ApplyUpdates(0);
  end;
  with Dtsrc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    btnvisualizar.Enabled := not IsEmpty;
    btnextrair.Enabled := not IsEmpty;
    BtnLoc01.Enabled := not IsEmpty;
    BtnLoc02.Enabled := not IsEmpty;
    excluiAssunto.Enabled := not IsEmpty;
    excluiAutor.Enabled := not IsEmpty;
  end;
  if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;
end;

procedure TFrPrincipal.FormActivate(Sender: TObject);
begin

  StatusBar1.Panels[0].Text := Saudacao + ' Hoje é ' +
    formatdatetime('dddddd', Date);
  if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;

end;

procedure TFrPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { if (MessageDlg('Deseja Sair do Sistema ?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  BEGIN
    try
      try
        DM.cds_ExcRepetidos.Close;
        DM.cds_ExcRepetidos.Params[0].AsInteger := FrmLogin.COD_USUARIO;
        DM.cds_ExcRepetidos.Open;
      finally
        DM.DtsrcExcLogados.DataSet.Delete;
        (DM.DtsrcExcLogados.DataSet as TClientDataSet).ApplyUpdates(0);
        Application.Terminate;
      end;
    Except
      on E: Exception do
      begin
        MessageDlg('Houve um problema no termino do aplicativo !', mtWarning,
          [mbOK], 0);
        // Application.Terminate;
      end;
    end;
  END; }
end;

procedure TFrPrincipal.FormShow(Sender: TObject);
begin
  // Height := 549;
  // Height:=590;
  InicializarComponentes;
  IniciaAdministracao;
  FrmLogin.Visible := False;
  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text <> ' ' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
  end;
end;

procedure TFrPrincipal.IniciaAdministracao;
begin
  if FrmLogin.BitBtn2.ModalResult = mrOk then
  begin
    with DM.dst_Login do
      if not IsEmpty then
      begin

        { if (FrmLogin.TODOS = 1) then
          begin
          FrPrincipal.cbtconsulta.Enabled:=true;
          cbconsulta.Enabled := True;
          end else
          begin
          if (FrmLogin.TODOS = 0) then
          begin
          FrPrincipal.cbtconsulta.Enabled :=false;
          end; }

        if DMII.sdt_Verif_Perfil.FieldByName('MENU_ARQUI_CONSULTAS').AsString = 'S'
        then
        begin
          cbconsulta.Enabled := True;
        end
        else
        begin
          cbconsulta.Enabled := False;
        end;

        if DMII.sdt_Verif_Perfil.FieldByName('MENU_ARQUI_ASSUNTOS').AsString = 'S'
        then
        begin
          FrPrincipal.cbassunto.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbassunto.Enabled := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('MENU_ARQUI_AUTORES').AsString = 'S'
        then
        begin
          FrPrincipal.cbautores.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbautores.Enabled := False;
        end;
        // Sessão Menu Usuário
        if DMII.sdt_Verif_Perfil.FieldByName('MENU_USUARIO_CADASTRO').AsString = 'S'
        then
        begin
          FrPrincipal.cbcadastro.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbcadastro.Enabled := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('MENU_USUARIO_PERFIL').AsString = 'S'
        then
        begin
          FrPrincipal.cbperfil.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbperfil.Enabled := False;
        end;

        // Sessão Menu Manutenção
        if FrmLogin.ADMIN = 1 then
        begin
          FrPrincipal.cbManutSQL.Visible := True;
        end
        else
        begin
          FrPrincipal.cbManutSQL.Visible := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('MENU_MANUTENCAO_TEMP').AsString = 'S'
        then
        begin
          FrPrincipal.cbManutTEMP.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbManutTEMP.Enabled := False;
        end;
        if FrmLogin.ADMIN = 1 then
        begin
          FrPrincipal.cbCadLogAssistente.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbCadLogAssistente.Enabled := False;
        end;
        if FrmLogin.ADMIN = 1 then
        begin
          FrPrincipal.cbManutAssistente.Enabled := True;
        end
        else
        begin
          FrPrincipal.cbManutAssistente.Enabled := False;
        end;
        // Sessão MenuBar
        { if FrmLogin.NIVEL = 1 then
          begin
          if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_CONSULTA').AsString = 'S' then
          begin
          FrPrincipal.cbtconsulta.Visible:=True;
          end
          else
          begin
          FrPrincipal.cbtconsulta.Visible:=false;
          end;
          end else
          begin
          FrPrincipal.cbtconsulta.Visible:=False;
          end; }
        if FrmLogin.NIVEL = 1 then
        begin
          FrPrincipal.btnvisualizar.Visible := True;
          FrPrincipal.btnextrair.Visible := True;
        end
        else if FrmLogin.NIVEL = 0 then
        begin
          FrPrincipal.btnvisualizar.Visible := False;
          FrPrincipal.btnextrair.Visible := False;
        end;
        // if FrmLogin.NIVEL = 1 then
        // begin
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_CONSULTAR').AsString = 'S'
        then
        begin
          FrPrincipal.cbtconsulta.Visible := True;
        end
        else
        begin
          FrPrincipal.cbtconsulta.Visible := False;
        end;
        // end
        // else
        // begin
        // FrPrincipal.cbconsulta.visible := False;
        // end;
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_USUARIO').AsString = 'S'
        then
        begin
          FrPrincipal.usuarios.Visible := True;
        end
        else
        begin
          FrPrincipal.usuarios.Visible := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_ASSUNTOS').AsString = 'S'
        then
        begin
          FrPrincipal.Assuntos.Visible := True;
        end
        else
        begin
          FrPrincipal.Assuntos.Visible := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_AUTORES').AsString = 'S'
        then
        begin
          FrPrincipal.autores.Visible := True;
        end
        else
        begin
          FrPrincipal.autores.Visible := False;
        end;
        if FrmLogin.ADMIN = 1 then
        begin
          FrPrincipal.log.Visible := True;
        end
        else
        begin
          FrPrincipal.log.Visible := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_LOCALIZAR').AsString = 'S'
        then
        begin
          FrPrincipal.btntrazer.Visible := True;
        end
        else
        begin
          FrPrincipal.btntrazer.Visible := False;
        end;
        // Sessão Botões de Cadastro
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_INSERIR').AsString = 'S'
        then
        begin
          FrPrincipal.inserir.Visible := True;
        end
        else
        begin
          FrPrincipal.inserir.Visible := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_EDITAR').AsString = 'S' then
        begin
          FrPrincipal.editar.Visible := True;
        end
        else
        begin
          FrPrincipal.editar.Visible := False;
        end;
        if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_EXCLUIR').AsString = 'S'
        then
        begin
          FrPrincipal.excluir.Visible := True;
        end
        else
        begin
          FrPrincipal.excluir.Visible := False;
        end;
      end;

  end;

end;

procedure TFrPrincipal.gravarClick(Sender: TObject);
begin
  if CheckBox1.Checked = True then
  begin
    if DBEdit3.Text <> ' ' then
    begin
      DBEdit3.Font.Color := clBlue;
    end;
    PanelAutor.Visible := True;
    Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    Height := 568;
  end;
  DBEdit1.Text := IntToStr(FrmLogin.COD_USUARIO);
  { if (DBEdit5.Text='  /  /    ') then
    begin
    MessageDlg('Preencha o campo Data!',mtWarning,[mbOK],0);
    end
    else
    if (DBEdit6.Text='  :  :  ') then
    begin
    MessageDlg('Preencha o campo Hora!',mtWarning,[mbOK],0);
    end }
  // else
  if (DBMemo2.Lines.Text = '') then
  begin
    MessageDlg('Carregue o Arquivo!', mtWarning, [mbOK], 0);
  end
  else if (DBText5.Caption = '') then
  begin
    MessageDlg('Preencha o campo Assunto!', mtWarning, [mbOK], 0);
  end
  else if (DBEdit2.Text = '') then
  begin
    MessageDlg('Preencha o campo Titulo!', mtWarning, [mbOK], 0);
  end
  else if (DBMemo3.Lines.Text = '') then
  begin
    MessageDlg('Preencha o campo descrição!', mtWarning, [mbOK], 0);
  end
  else if (DBMemo2.Text = '') then
  begin
    MessageDlg('Carregue também o arquivo!', mtWarning, [mbOK], 0);
  end
  else
  begin
    frmSplash := TfrmSplash.Create(Self);
    frmSplash.Show;
    frmSplash.Refresh;
    frmSplash.ProgressBar1.Position := 1;
    // espera...
    Sleep(100);
    // altera a ProgressBar
    frmSplash.ProgressBar1.Position := 8;
    // espera...
    Sleep(700);
    //
    // altera a ProgressBar
    frmSplash.ProgressBar1.Position := 34;
    // espera...
    Sleep(300);
    Screen.Cursor := crHourGlass;
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);
    MostrarEstatistica;
    // DM.sds_cont.Close;
    RegistroTemp := StrToInt(DBText2.Caption);
    Screen.Cursor := crDefault;
    ConfigGravar;
    MostrarIcon;

    // Log
    DM.cds_LogCOD_USUARIO.Value := FrmLogin.COD_USUARIO;
    DM.cds_LogINSERDATA.Value := Date;
    DM.cds_LogHORA.Value := Time;
    DM.cds_LogCOD_ACAO.Value := 1;
    DM.cds_LogACAO.Value := 'GRAVOU';
    DM.cds_LogAPLICATIVO.Value := 'CADASTRO DE ARQUIVOS';
    DM.cds_LogCOD_REGISTRO.Value := StrToInt(DBText2.Caption);
    DM.cds_LogDISCRIMINACAO.Value := ExtractFileName(OpenDialog1.FileName);
    tempNome := ExtractFileName(OpenDialog1.FileName);
    DtscLog.DataSet.Post;
    (DtscLog.DataSet as TClientDataSet).ApplyUpdates(0);

    DM.cds_UserAddIDUSUARIOS.Value := FrmLogin.COD_USUARIO;
    DM.cds_UserAddIDARQUIVOS.Value := DM.cds_arquivoID.Value;
    DM.cds_UserAdd.Post;
    DM.cds_UserAdd.ApplyUpdates(0);

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
      frmSplash.Free;

    end;
  end;
  if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;
end;

end.
