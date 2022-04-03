unit UnCadArquivos;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DB,
  DBCtrls, ZDataset, LResources, dbf, LR_DBSet, LR_Class, LR_BarC, ImgList, ToolWin,
  Menus, GifAnim, DateUtils, WinInet, ATGauge;

type

  { TFormArquivo }

  TFormArquivo = class(TForm)
    Autor1: TLabel;
    BtnLoc01: TSpeedButton;
    BtnLoc02: TSpeedButton;
    btntrazerForm: TSpeedButton;
    cancelar: TBitBtn;
    carregar: TSpeedButton;
    cbconsulta: TSpeedButton;
    CheckBox1: TCheckBox;
    DatadeCaD1: TDBText;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo1: TDBMemo;
    DBText5: TDBText;
    DBText2: TDBText;
    DBText6: TDBText;
    DBText1: TDBText;
    DBText8: TDBText;
    DBText4: TDBText;
    DtscLog: TDataSource;
    Dtsrc: TDataSource;
    Edit1: TEdit;
    editar: TBitBtn;
    excluiAssunto: TSpeedButton;
    excluiAutor: TSpeedButton;
    excluir: TBitBtn;
    ExcluirTemp: TSpeedButton;
    gravar: TBitBtn;
    GroupBox1: TGroupBox;
    Image5: TImage;
    Image3: TImage;
    Image7: TImage;
    Image8: TImage;
    inserir: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lookUser: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel4: TPanel;
    Panel5: TPanel;
    PanelAutor: TPanel;
    relatorio: TBitBtn;
    SaveDialog1: TSaveDialog;
    btnvisualizar: TSpeedButton;
    btnextrair: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnextrairClick(Sender: TObject);
    procedure BtnLoc01Click(Sender: TObject);
    procedure BtnLoc02Click(Sender: TObject);
    procedure btntrazerFormClick(Sender: TObject);
    procedure btnvisualizarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure carregarClick(Sender: TObject);
    procedure cbconsultaClick(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure DtsrcStateChange(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluiAssuntoClick(Sender: TObject);
    procedure excluiAutorClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure ExcluirTempClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure lookUserClick(Sender: TObject);
    procedure relatorioClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    buffer: array [0 .. 255] of char;
    Temp, tempNome: string;
    procedure ConfigInserir;
    procedure ConfigGravar;
    procedure ConfigExcluir;
    procedure ConfigCancelar;
    procedure ConfigInicial;
    function Verifica_Campos_Em_Branco: boolean;
    function numLogados: integer;
    procedure IniciaAdministracao;
  public
    CodigoAssuntoTemp, CodigoAutorTemp: integer;
    Label15Temp, Label16Temp: string;
    ext, nomeUser: string;
    numCodigoII: integer;
    codigo, codigoII, UserTemp, RegistroTemp, RegistroMoment: integer;
    condNivelForm: integer;
    figTipo, codigoArqu, codigoArquSolteiro: integer;
    CheckGravarEditarPesquisa: boolean;
    procedure MostrarIcon;

  end;

var
  FormArquivo: TFormArquivo;
  CheckIniciarExcluir: boolean;
  CheckGravarExcluir: boolean;
  CheckGravarEditar: boolean;
  respArquivos, respUsuarios, respAssuntos, respAutores, respLog,
  spAutores, respLogar: integer;
  respQtd: integer = 0;
  respLogados: integer = 0;
  NumLogados: integer = 0;

implementation

{$R *.lfm}

uses UnDM, UDMII, thema, unDlgPesquisaArquivo, UnLogin, UnDlgDialogAssunto,
  UnDlgpesquisautores, UnProcessindefinido, UnatribuiUsuariosPorArquivos,
  UnConsultaEspecial, uncadastrousuarios, UnCadAssuntos, UnCadAutores, UnCadCidades,
  UnCadLog,unDlgDescricao, UnUtilitLog, UnCadDepartamento, UnTeladeRelatorios;

{ TFormArquivo }

procedure TFormArquivo.IniciaAdministracao;
begin

  if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_CONSULTAR').AsString = 'S' then
  begin
    cbconsulta.Visible := True;
  end
  else
  begin
    cbconsulta.Visible := False;
  end;




  if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_LOCALIZAR').AsString = 'S' then
  begin
    btntrazerForm.Visible := True;
  end else
  begin
     btntrazerForm.Visible := False;
  end;

  if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_INSERIR').AsString = 'N' then
  begin
    inserir.Visible := False;
  end else
  begin
     inserir.Visible := True;
  end;

    if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_EDITAR').AsString = 'N' then
  begin
    editar.Visible := False;
  end else
  begin
     editar.Visible := True;
  end;

  if DMII.sdt_Verif_Perfil.FieldByName('ARQUI_EXCLUIR').AsString = 'N' then
  begin
    excluir.Visible := False;
  end else
  begin
     excluir.Visible := True;
  end;

end;

procedure TFormArquivo.MostrarIcon;
begin
  Edit1.Text := DBText4.Caption;
  if (DM.ZQArquivoEXTENCAO.AsString = '.pdf  ') or (Edit1.Text = '.pdf') then
  begin
    // Image2.Picture.LoadFromFile('C:/OpenArquivos/Icon/pdfarqu.bmp');
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/pdfarqu.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.ps   ') or (Edit1.Text = '.ps') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/ps.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.doc  ') or (Edit1.Text = '.doc') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/doc972003.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.docx ') or (Edit1.Text = '.docx') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/word2007.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.xls  ') or (Edit1.Text = '.xls') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/excel972003.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.xlsx ') or (Edit1.Text = '.xlsx') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/xls.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.accdb') or (Edit1.Text = '.accdb') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/access.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.mdb  ') or (Edit1.Text = '.mdb') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/access972003.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.pps  ') or (Edit1.Text = '.pps') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'Icon/pps972003.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.ppt  ') or (Edit1.Text = '.ppt') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/ppt.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.ppsx ') or (Edit1.Text = '.ppsx') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/pps.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.pptx  ') or (Edit1.Text = '.ppt') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/ppt.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.mpg  ') or (Edit1.Text = '.mpg') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/avimpeg.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.avi  ') or (Edit1.Text = '.avi') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/avimpeg.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.mp3  ') or (Edit1.Text = '.mp3') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.wma  ') or (Edit1.Text = '.wma') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.wav  ') or (Edit1.Text = '.wav') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.ogg  ') or (Edit1.Text = '.ogg') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mp3.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.bmp  ') or (Edit1.Text = '.bmp') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/bmp.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.jpg  ') or (Edit1.Text = '.jpg') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/jpg.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.png  ') or (Edit1.Text = '.png') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/png.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.gif  ') or (Edit1.Text = '.gif') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/gif.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.tiff ') or (Edit1.Text = '.tiff') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/tiff.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.html ') or (Edit1.Text = '.html') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/html.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.htm  ') or (Edit1.Text = '.htm') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/html.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.mht  ') or (Edit1.Text = '.mht') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/mht.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.exe  ') or (Edit1.Text = '.exe') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/exe.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.java ') or (Edit1.Text = '.java') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/java.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.txt  ') or (Edit1.Text = '.txt') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/notpad.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.rtf  ') or (Edit1.Text = '.rtf') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/doc972003.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.zip  ') or (Edit1.Text = '.zip') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/zip.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '.rar  ') or (Edit1.Text = '.rar') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/rar.bmp');
  end
  else if (DM.ZQArquivoEXTENCAO.AsString = '      ') or (Edit1.Text = '') then
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/nada.bmp');
  end
  else
  begin
    Image3.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Icon/Default.bmp');
  end;

end;

function TrocaCaracterEspecial(aTexto: string; aLimExt: boolean): string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of string =
    ('á', 'à', 'ã', 'â', 'ä', 'Á', 'À', 'Ã', 'Â', 'Ä',
    'é', 'è', 'É', 'È', 'í', 'ì', 'Í', 'Ì',
    'ó', 'ò', 'ö', 'õ', 'ô', 'Ó',
    'Ò', 'Ö', 'Õ', 'Ô',
    'ú', 'ù', 'ü', 'Ú', 'Ù',
    'Ü', 'ç', 'Ç', 'ñ', 'Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of string = ('a', 'a', 'a', 'a', 'a', 'A', 'A', 'A', 'A', 'A',
    'e', 'e', 'E', 'E', 'i', 'i', 'I', 'I',
    'o', 'o', 'o', 'o', 'o', 'O', 'O', 'O', 'O', 'O',
    'u', 'u', 'u', 'u', 'u', 'u', 'c', 'C', 'n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<', '>', '!', '@', '#', '$', '%', '¨', '&', '*',
    '(', ')', '_', '+', '=', '{', '}', '[', ']', '?',
    ';', ':', ',', '|', '*', '"', '~', '^', '´', '`',
    '¨', 'æ', 'Æ', 'ø', '£', 'Ø', 'ƒ', 'ª', 'º', '¿',
    '®', '½', '¼', 'ß', 'µ', 'þ', 'ý', 'Ý');
var
  xTexto: string;
  i: integer;
begin
  xTexto := aTexto;
  for i := 1 to 38 do
    xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
  //De acordo com o parâmetro aLimExt, elimina caracteres extras.
  if (aLimExt) then
    for i := 1 to 48 do
      xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);
  Result := xTexto;
end;

function RemoveCaracteresEspeciais(s: string): string;
var
  i, pos: integer;
const
  undesiredchars: string =
    '/ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÜÚÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùüúþÿ';
const
  replaces: string = 'AAAAAAACEEEEIIIIDNOOOOOxOUUUbBaaaaaaaceeeeiiiionooooo ouuuby';
begin
  SetLength(Result, Length(s));
  for i := 1 to Length(s) do
  begin
    pos := Ord(s[i]);
    if (s[i] in [#32, #48..#57, #65..#90, #97..#122]) then
      Result[i] := s[i]
    else
    begin
      pos := AnsiPos(s[i], undesiredchars);
      Result[i] := replaces[pos + 1];
    end;
  end;

end;

function TFormArquivo.Verifica_Campos_Em_Branco: boolean;
var
  cont: integer;
begin
  Result := True;
  for cont := 0 to DtSrc.DataSet.FieldCount - 1 do
    if DtSrc.DataSet.Fields[cont].Required then
      if (DtSrc.DataSet.Fields[cont].IsNull) or
        (DtSrc.DataSet.Fields[cont].AsString = '') then
      begin
        MessageDlg('Preencha o campo "' + DtSrc.DataSet.Fields[cont].DisplayLabel + '"',
          mtWarning, [mbOK], 0, mbOK);
        Result := False;
        Break;
      end;

end;

function TFormArquivo.numLogados: integer;
var
  numCount: integer;
  respNumLogados: string;
begin
  //Result := 0;
  //respQtd := 0;
  try
    DM.sds_Cont_Logar.Close;
    //DM.sds_Cont_Logar.Params.Clear;
    // DM.sds_Cont_Logar.SQL.Clear;
    //DM.sds_Cont_Logar.SQL.Add('select * from NUM_LOGADOS');
    //DM.sds_Cont_Logar.SQL.Add('select ORDEM as NUM from NUM_LOGADOS where ORDEM = (select max(ORDEM) from NUM_LOGADOS)');
    DM.sds_Cont_Logar.Open;
    DM.sds_Cont_Logar.Refresh;
    //DM.ZUpdateSQL5.RefreshSQL;
    //DM.sds_Cont_Logar.Next;
    // respQtd := DM.sds_Cont_Logar.FieldByName('NUM').AsInteger;
    respQtd := DM.sds_Cont_Logar.RecordCount;
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


procedure TFormArquivo.ConfigInserir;
begin
  carregar.Enabled := True;
  gravar.Enabled := True;
  cancelar.Enabled := True;
  inserir.Enabled := False;
  excluir.Enabled := False;
  btntrazerForm.Enabled := False;
  btnvisualizar.Enabled := False;
  btnextrair.Enabled := False;
  ExcluirTemp.Enabled := False;
  lookUser.Enabled := False;
  // Image3.Visible := False;
end;

procedure TFormArquivo.ConfigGravar;
begin
  //inserir.Enabled := True;
  btnvisualizar.Enabled := True;
  btnextrair.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := True;
  cancelar.Enabled := False;
  lookUser.Enabled := True;
end;

procedure TFormArquivo.ConfigExcluir;
begin
  carregar.Enabled := False;
  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  btnvisualizar.Enabled := False;
  btntrazerForm.Enabled := True;
  // DM.cds_arqu.Close;
  //ExcluirTemp.Enabled := False;
  //Image3.Visible := False;
end;

procedure TFormArquivo.ConfigInicial;
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
  // Image3.Visible := False;
  excluiAssunto.Enabled := False;
  excluiAutor.Enabled := False;
  lookUser.Enabled := False;
  btntrazerForm.Enabled := True;

end;

procedure TFormArquivo.ConfigCancelar;
begin

  inserir.Enabled := True;
  gravar.Enabled := False;
  excluir.Enabled := False;
  cancelar.Enabled := False;
  btnvisualizar.Enabled := True;
  btnextrair.Enabled := True;
  btntrazerForm.Enabled := True;
  // DM.cds_arquivo.Close;
  ExcluirTemp.Enabled := False;
  excluiAssunto.Enabled := False;
  excluiAutor.Enabled := False;
end;




procedure TFormArquivo.cancelarClick(Sender: TObject);
begin
  Dtsrc.DataSet.Cancel;
end;

procedure TFormArquivo.BtnLoc01Click(Sender: TObject);
begin
  FrmPesquisaAssunto := TFrmPesquisaAssunto.Create(self);
  try
    if FrmPesquisaAssunto.ShowModal = mrOk then
    begin
      if (Dtsrc.State = dsbrowse) or (Dtsrc.State = dsInsert) then
        DM.ZQArquivo.Edit;
      DM.ZQArquivoCOD_ASSUNTO.AsInteger := DM.sds_AssuntCODIGO.AsInteger;
      DM.ZQArquivoTITULOASSUN.AsString := DM.sds_AssuntTITULOASSUN.AsString;
    end;
  finally
    // DM.sds_assunt.Close;
    FrmPesquisaAssunto.Free;
  end;

  //DM.ZQArquivoTITULOASSUN.AsString := DM.sds_AssuntTITULOASSUN.AsString;
end;

procedure TFormArquivo.BitBtn2Click(Sender: TObject);
begin
  FrmThema := TFrmThema.Create(Self);
  try
    FrmThema.ShowModal;
  finally
    FrmThema.Free;
  end;
end;

procedure TFormArquivo.BitBtn1Click(Sender: TObject);
begin
  Refresh;
end;

procedure TFormArquivo.btnextrairClick(Sender: TObject);
begin
  if DM.ZQArquivo.IsEmpty then
  begin
    MessageDlg('Não ha Arquivo no cadastro, consulte ou localize primeiro !',
      mtWarning, [mbOK], 0);
  end
  else
  begin
    with SaveDialog1 do
    begin
      FileName := DM.ZQArquivo['NOME_ARQUIVO'];
      if Execute then
      begin
        DM.ZQArquivoDADOS.SaveToFile(FileName);
      end;
    end;
  end;
end;

procedure TFormArquivo.BtnLoc02Click(Sender: TObject);
begin
  FrmPesquisaAutor := TFrmPesquisaAutor.Create(self);
  try
    if (FrmPesquisaAutor.ShowModal = mrOk) then
    begin
      if Dtsrc.State = dsbrowse then
        DM.ZQArquivo.Edit;
      DM.ZQArquivoCOD_AUTOR.AsInteger := DM.sds_AutoresCODIGO.AsInteger;
      DM.ZQArquivoNOME.AsString := DM.sds_AutoresNOME.AsString;
    end;
  finally
    //DM.sds_Autores.Close;
    FrmPesquisaAutor.Free;

  end;
end;

procedure TFormArquivo.btntrazerFormClick(Sender: TObject);
var
  DataInserimento: string;
begin
  FrmDlgPesquisa := TFrmDlgPesquisa.Create(Self);

  if FrmDlgPesquisa.ShowModal = mrOk then
    if (FrmLogin.TODOS = 0) then
    begin
      try
        DM.ZQArquivo.Close;
        DM.ZQArquivo.Params[0].Value := DM.sds_ArquID.AsInteger;
        DM.ZQArquivo.Open;
        MostrarIcon;
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
         MostrarIcon;
      finally
        DM.sds_Arqu.Close;
        FrmDlgPesquisa.Free;
      end;
    end
    else if FrmLogin.TODOS = 1 then
    begin
      try
        DM.ZQArquivo.Close;
        DM.ZQArquivo.Params[0].AsInteger := DM.sds_ArquTodosID.AsInteger;
        DM.ZQArquivo.Open;
        MostrarIcon;
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
          frmSplash.Free;

        end;
        MostrarIcon;
      finally
        DM.sds_ArquTodos.Close;
        FrmDlgPesquisa.Free;

      end;

     { if (FrmLogin.TODOS = 0) then
      begin
        lookUser.Visible := False;
      end
      else
      begin
        lookUser.Visible := True;
      end;
    end;}
 { if DM.sdt_Verif_Perfil.FieldByName('ARQUI_EXCLUIR').AsString = 'S' then
   begin
         excluir.Visible := True;
        // excluir.Enabled := not IsEmpty;
        excluir.Enabled := Dtsrc.State in [dsbrowse];
   end; }

      //lookUser.Visible:=true;
      if not DM.ZQArquivo.IsEmpty then
      begin
        //Edit1.Text := DBText1.Caption;
        tempNome := DBMemo2.Lines.Text;
      end;
      if FileExists(Temp + '\' + TrocaCaracterEspecial(
        DM.ZQArquivoNOME_ARQUIVO.AsString, True)) = True then
      begin
        ExcluirTemp.Enabled := True;
        Image3.Visible := True;
      end;
   { else if not(FileExists(Temp + '\' + DM.ZQArquivoNOME_ARQUIVO.AsString)) then
    begin
      ExcluirTemp.Enabled := False;
      Image3.Visible := False;
      SysUtils.Abort;
    end;  }
      // IniciaAdministracao;

    end;
  MostrarIcon;

  if DBText6.Caption <> '' then
  begin
    CheckBox1.Checked := True;
    PanelAutor.Visible := True;
    //FrPrincipal.Label16.Visible := True;
  end
  else
  begin
    CheckBox1.Checked := False;
    PanelAutor.Visible := False;
  end;

end;

procedure TFormArquivo.btnvisualizarClick(Sender: TObject);
var
  x, y: PChar;
  Flag: LONG;
begin
  if DM.ZQArquivo.IsEmpty then
  begin
    MessageDlg('Não ha Arquivo no cadastro, consulte ou localize primeiro !',
      mtWarning, [mbOK], 0);
  end
  else
  begin
    DM.ZQArquivoDADOS.SaveToFile
    (Temp + '\' + TrocaCaracterEspecial(DM.ZQArquivoNOME_ARQUIVO.AsString, True));
    x := nil;
    y := nil;
    Flag := ShellExecute(Application.Handle, 'OPEN',
      PChar(Temp + '\' + TrocaCaracterEspecial(DM.ZQArquivoNOME_ARQUIVO.AsString, True)),
      x, y, SW_SHOW);

    if Flag <= 32 then
    begin
      ShowMessage('Erro ao Abrir ' + Temp + '\' +
        TrocaCaracterEspecial(DM.ZQArquivoNOME_ARQUIVO.AsString, True));

    end;
    if FileExists(Temp + '\' + TrocaCaracterEspecial(
      DM.ZQArquivoNOME_ARQUIVO.AsString, True)) then
    begin
      ExcluirTemp.Enabled := True;
      Image3.Visible := True;

    end
    else
    begin
      ExcluirTemp.Enabled := False;
      Image3.Visible := False;
      SysUtils.Abort;

    end;

  end;

end;

procedure TFormArquivo.carregarClick(Sender: TObject);
var
  F: file of byte;
  Tamnh, TamnhBytes, TamnhMB, TamnhKB, Temp2: double;
  varifTempBytes, varifTempKB, varifTempMB: string;
begin
  Tamnh := 0.0;
  TamnhBytes := 0.0;
  TamnhMB := 0.0;
  TamnhKB := 0.0;
  OpenDialog1.FileName := '';
  OpenDialog1.Files.Clear;
  try
    AssignFile(F, OpenDialog1.FileName);
    if FileExists(Temp + '\' + TrocaCaracterEspecial(
      DM.ZQArquivoNOME_ARQUIVO.AsString, True)) then
    begin
      DeleteFile(Temp + '\' + TrocaCaracterEspecial(
        DM.ZQArquivoNOME_ARQUIVO.AsString, True));
      ExcluirTemp.Enabled := False;
      //Image3.Visible := False;
    end
    else if OpenDialog1.Execute then
    begin

      if Dtsrc.State = dsbrowse then
        //  try
        DM.ZQArquivo.Edit;
      DM.ZQArquivoDADOS.LoadFromFile(OpenDialog1.FileName);
      DM.ZQArquivoNOME_ARQUIVO.AsString :=
        TrocaCaracterEspecial(ExtractFileName(OpenDialog1.FileName), True);
      // DM.ZQArquivoNOME_ARQUIVO_ESPECIAL.AsString:= ExtractFileName(OpenDialog1.FileName);
      DM.ZQArquivoEXTENCAO.AsString :=
        LowerCase(ExtractFileExt(OpenDialog1.FileName));
      AssignFile(F, OpenDialog1.FileName);
      Reset(F);
      Tamnh := FileSize(F);
      MostrarIcon;
      if (Tamnh > 1024) then
      begin
        //if (Tamnh >= 167772160) then // 160MB
        if (Tamnh >= 188743680) then // 180MB
        begin
          MessageDlg('Memória Insuficiente no Banco!, Ultrapassou os 180 MB!',
            mtError, [mbOK], 0);
          Dtsrc.DataSet.Cancel;
          ConfigInicial;
          lookUser.Enabled := False;
           MostrarIcon;
        end
        else
        begin
          varifTempBytes := (FloatToStrF((Tamnh), ffNumber, 11, 0));
          TamnhKB := (Tamnh / 1024);
          Temp2 := (Tamnh / 1024);
          TamnhMB := (Temp2 / 1024);
          if (TamnhKB <= 1024) then
          begin
            varifTempKB := (FloatToStrF((TamnhKB), ffNumber, 11, 2));
            DM.ZQArquivoTAMANHO.AsString :=
              varifTempKB + ' (KB)-' + '(' + varifTempBytes + ' Bytes)';
            DM.ZQArquivoSIZE_ARQUIVO.AsFloat := TamnhKB;
          end
          else
          begin
            varifTempMB := (FloatToStrF((TamnhMB), ffNumber, 11, 1));
            varifTempKB := (FloatToStrF((TamnhKB), ffNumber, 11, 2));
            DM.ZQArquivoTAMANHO.AsString :=
              varifTempMB + ' (MB)-' + varifTempKB + ' (KB)-' + '(' +
              varifTempBytes + ' Bytes)';
            DM.ZQArquivoSIZE_ARQUIVO.AsFloat := TamnhKB;
          end;
        end;
      end;

      MostrarIcon;

    end;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao ler o arquivo!', E.Message, mtError, [mbOK], 0);
    end;

  end;

end;

procedure TFormArquivo.cbconsultaClick(Sender: TObject);
begin
  FrmView := TFrmView.Create(Self);
  try
    if FrmView.ShowModal = mrOk then
    begin
      DM.ZQArquivo.Close;
      DM.ZQArquivo.Params[0].AsInteger := codigoArqu;
      DM.ZQArquivo.Open;
      if DBEdit4.Text <> '' then
      begin
        DBText5.Font.Color := clBlue;
      end
      else
      begin
        DBText5.Font.Color := $00E3F4F4;
      end;
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
       MostrarIcon;
    end;
  finally
    DM.sds_view.Close;
    FrmView.Free;
  end;
  if not DM.ZQArquivo.IsEmpty then
  begin
    //  Edit2.Text := DBText2.Caption;
    tempNome := DBMemo2.Lines.Text;
  end;
  if FileExists(Temp + '\' + DM.ZQArquivoNOME_ARQUIVO.AsString) then
  begin
    ExcluirTemp.Enabled := True;
    // Image6.Visible := True;
  end
  else
  begin
    ExcluirTemp.Enabled := False;
    // Image6.Visible := False;
  end;
  MostrarIcon;
  //lookUser.Visible:=true;
  //IniciaAdministracao;
 { if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;}
  MostrarIcon;
  if DBText6.Caption <> '' then
  begin
    CheckBox1.Checked := True;
    PanelAutor.Visible := True;
    ///FrPrincipal.Label16.Visible := True;
  end
  else
  begin
    CheckBox1.Checked := False;
    PanelAutor.Visible := False;
  end;
end;

procedure TFormArquivo.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked = True then
  begin
    PanelAutor.Visible := True;
    //Height := 610;
  end
  else
  begin
    PanelAutor.Visible := False;
    //  Height := 568;
  end;
end;

procedure TFormArquivo.DtsrcStateChange(Sender: TObject);
begin
  with Dtsrc.DataSet do
  begin

    excluir.Enabled := not IsEmpty;
    if (Dtsrc.State = dsInsert) then
    begin
      excluir.Enabled := False;
    end;
    if (Dtsrc.State = dsEdit) then
    begin
      excluir.Enabled := False;
    end;
    inserir.Enabled := Dtsrc.State in [dsbrowse, dsInactive];
    btnvisualizar.Enabled := Dtsrc.State in [dsbrowse];
    btnextrair.Enabled := Dtsrc.State in [dsbrowse];
    gravar.Enabled := Dtsrc.State in [dsInsert];
    editar.Enabled := Dtsrc.State in [dsEdit];
    cancelar.Enabled := Dtsrc.State in [dsInsert, dsEdit];
    carregar.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    BtnLoc01.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    BtnLoc02.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse];
    excluiAssunto.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse, dsInactive];
    excluiAutor.Enabled := Dtsrc.State in [dsInsert, dsEdit, dsbrowse, dsInactive];
    lookUser.Enabled := not IsEmpty;
    relatorio.Enabled := Dtsrc.State in [dsbrowse, dsInactive];

  end;
end;

procedure TFormArquivo.editarClick(Sender: TObject);
var
  IntTempCodResgist: integer;
begin
  IntTempCodResgist := DM.ZQArquivoID.AsInteger;
  if (DBText2.Caption = '') then
  begin
    Beep;
    ShowMessage('Preencha o Assunto!');

    Abort;
  end
  else
  begin
    if (Verifica_Campos_Em_Branco) then
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

      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 34;
      // espera...
      Sleep(300);
      Screen.Cursor := crHourGlass;
      try
        begin
          Dtsrc.DataSet.Edit;
          (Dtsrc.DataSet as TZQuery).ApplyUpdates;
          (Dtsrc.DataSet as TZQuery).CommitUpdates;
        end;
      except
        on E: Exception do
        begin
          Beep;
          MessageDlg('Erro ao Editar o Arquivo!', E.Message, mtError, [mbOK], 0);
          Abort;

        end;
      end;
      try
        begin
          DtscLog.DataSet.Open;
          DtscLog.DataSet.Append;
          DM.cds_LogCOD_USUARIO.Value := FrmLogin.COD_USUARIO;
          DM.cds_LogINSERDATA.Value := Date;
          DM.cds_LogHORA.Value := Time;
          DM.cds_LogCOD_ACAO.Value := 3;
          DM.cds_LogACAO.Value := 'ALTEROU';
          DM.cds_LogAPLICATIVO.Value := 'CADASTRO DE ARQUIVOS';
          DM.cds_LogCOD_REGISTRO.Value := IntTempCodResgist;
          DM.cds_LogDISCRIMINACAO.Value := 'Alterou Arquivo!';
          DtscLog.DataSet.Post;
          (DtscLog.DataSet as TZQuery).ApplyUpdates;
          (DtscLog.DataSet as TZQuery).CommitUpdates;
        end;
      except
        on E: Exception do
        begin
          Beep;
          MessageDlg('Erro ao gravar Log!', e.Message, mtError, [mbOK], 0);

          Abort;
        end;
      end;
      //MostrarEstatistica;
      // DM.sds_cont.Close;
      //RegistroTemp := StrToInt(DatadeCaD.Caption);
      Screen.Cursor := crDefault;
      ConfigGravar;
      MostrarIcon;
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 51;
      // espera...
      Sleep(500);
      // altera a ProgressBar
      frmSplash.ProgressBar1.Position := 73;
      // espera...
      Sleep(500);
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
      Sleep(500);
      if frmSplash.ProgressBar1.Position = 100 then
      begin
        frmSplash.Hide;
        frmSplash.Free;
      end;
    end
    else
    Beep;
      Abort;

  end;
  {if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;  }

end;

procedure TFormArquivo.excluiAssuntoClick(Sender: TObject);
begin
  if (Dtsrc.State = dsbrowse) or (Dtsrc.State = dsEdit) then
  begin
    DM.ZQArquivo.Edit;
    DBEdit1.Caption := '';
    //DM.ZQArquivoCOD_AUTOR.Value:=0;
    DM.ZQArquivoTITULOASSUN.AsString := '';
    MostrarIcon;
  end;
end;

procedure TFormArquivo.excluiAutorClick(Sender: TObject);
begin
  if (Dtsrc.State = dsbrowse) or (Dtsrc.State = dsEdit) then
  begin
    DM.ZQArquivo.Edit;
    DBEdit2.Caption := '';
    //DM.ZQArquivoCOD_AUTOR.Value:=0;
    DM.ZQArquivoNOME.AsString := '';
    MostrarIcon;
  end;
end;

procedure TFormArquivo.excluirClick(Sender: TObject);
var
  IntTempCodResgist: integer;
begin
  IntTempCodResgist := DM.ZQArquivoID.AsInteger;
  if (MessageDlg('Deseja excluir este Arquivo e Informações?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    try
      begin
        Dtsrc.DataSet.Delete;
        (Dtsrc.DataSet as TZQuery).ApplyUpdates;
        (Dtsrc.DataSet as TZQuery).CommitUpdates;
      end;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao Excluir o Arquivo!', E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;

    try
      begin
        DtscLog.DataSet.Open;
        DtscLog.DataSet.Append;
        DM.cds_LogCOD_USUARIO.Value := FrmLogin.COD_USUARIO;
        DM.cds_LogINSERDATA.Value := Date;
        DM.cds_LogHORA.Value := Time;
        DM.cds_LogCOD_ACAO.Value := 2;
        DM.cds_LogACAO.Value := 'EXCLUIU';
        DM.cds_LogAPLICATIVO.Value := 'CADASTRO DE ARQUIVOS';
        DM.cds_LogCOD_REGISTRO.Value := IntTempCodResgist;
        DM.cds_LogDISCRIMINACAO.Value := 'Sem Discriminação, Excluindo Arquivo!';
        DtscLog.DataSet.Post;
        (DtscLog.DataSet as TZQuery).ApplyUpdates;
        (DtscLog.DataSet as TZQuery).CommitUpdates;
      end;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao gravar Log!', e.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;

    // DM.ZQArquivo.Refresh;
    ConfigExcluir;
    //MostrarEstatistica;
    MostrarIcon;
    CheckBox1.Checked := False;
    lookUser.Enabled := False;
    with Dtsrc.DataSet do
    begin
      excluir.Enabled := not IsEmpty;
      btnvisualizar.Enabled := not IsEmpty;
      btnextrair.Enabled := not IsEmpty;
      BtnLoc01.Enabled := not IsEmpty;
      BtnLoc02.Enabled := not IsEmpty;
    end;

  end
  else
    Abort;

end;

procedure TFormArquivo.ExcluirTempClick(Sender: TObject);
begin
  DeleteFile(Temp + '\' + TrocaCaracterEspecial(
    DM.ZQArquivoNOME_ARQUIVO.AsString, True));
  ExcluirTemp.Enabled := False;
  Refresh;
end;

procedure TFormArquivo.FormActivate(Sender: TObject);
begin
  Refresh;
  if FrmLogin.NIVEL = 1 then
  begin
    btnvisualizar.Visible := True;
    btnextrair.Visible := True;
  end;
  if FrmLogin.NIVEL = 0 then
  begin
    btnvisualizar.Visible := False;
    btnextrair.Visible := False;
  end;
  // if FrmLogin.NIVEL = 1 then
  // begin
  FrmLogin.Visible := False;
  //Color:=DM.myColor;
  GroupBox1.Color := DM.myColor;
  Refresh;
  if (not (FormArquivo.WindowState = wsMaximized)) or (WindowState = wsMinimized) then
  begin
    if (FormArquivo <> nil) then
     begin
        Left := 140; //275
        Top := 9;
        Position:=poDesktopCenter;
     end;
  end;

end;

procedure TFormArquivo.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Dtsrc.DataSet.Close;
  DtscLog.DataSet.Close;
  FormArquivo := nil;
end;



procedure TFormArquivo.FormShow(Sender: TObject);
begin

  //Dtsrc.DataSet.Open;
  ConfigInicial;
  DMII.CarregaPerfil;
  IniciaAdministracao;
  //Dtsrc.DataSet.Open;
  FrmLogin.Visible := False;
  //InicializarComponentes;

  nomeUser := FrmLogin.NOME;
  UserTemp := FrmLogin.COD_USUARIO;
  codigo := FrmLogin.COD_USUARIO;
  codigoII := FrmLogin.COD_USUARIO;
  condNivelForm := FrmLogin.NIVEL;
  figTipo := FrmLogin.ADMIN;
  // Height:=590;
  // ConfigInicial;
  // MostrarEstatistica;
  //IniciaAdministracao;
  with Dtsrc.DataSet do
  begin
    btnextrair.Enabled := not IsEmpty;
    btnvisualizar.Enabled := not IsEmpty;
    BtnLoc01.Enabled := not IsEmpty;
    BtnLoc02.Enabled := not IsEmpty;
    //btntrazerForm.Enabled := not IsEmpty;
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
  {if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;}
 { if (FrmLogin.TODOS = 1) then
  begin
    //cbtconsulta.Enabled:=true;
    cbconsulta.Enabled := True;
  end;
  if (FrmLogin.TODOS = 0) then
  begin
    cbconsulta.Enabled := False;
  end;  }

  // Sessão Menu Manutenção

  {if FrmLogin.ADMIN = 1 then
  begin
    MenuItem6.Visible := True;
  end
  else
  begin
    MenuItem6.Visible := False;
  end;
  if FrmLogin.ADMIN = 1 then
  begin
    MenuItem5.Visible := True;
  end
  else
  begin
    MenuItem5.Visible := False;
  end;}
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
    btnvisualizar.Visible := True;
    btnextrair.Visible := True;
    //btntrazerForm.Enabled := True;
  end;
  if FrmLogin.NIVEL = 0 then
  begin
    btnvisualizar.Visible := False;
    btnextrair.Visible := False;
    // btntrazerForm.Enabled := False;
  end;
  // if FrmLogin.NIVEL = 1 then
  // begin

    if (WindowState = wsMinimized) or (WindowState = wsMaximized) then
  begin
    if (FormArquivo <> nil) then
     begin
        Left := 140; //275
        Top := 9;
     end;
  end;
end;

procedure TFormArquivo.gravarClick(Sender: TObject);
var
  IntTempCodResgist: integer;
begin
  IntTempCodResgist := DM.ZQArquivoID.AsInteger;
  if (DBMemo1.Text = '') then
  begin
    Beep;
    ShowMessage('Carregue o Arquivo!');
    Abort;
  end
  else
  begin
    if (DBText2.Caption = '') then
    begin
      Beep;
      ShowMessage('Preencha o Campo Assunto!');

      Abort;
    end
    else
    begin
      if Verifica_Campos_Em_Branco then
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

        // altera a ProgressBar
        frmSplash.ProgressBar1.Position := 34;
        // espera...
        Sleep(300);
        Screen.Cursor := crHourGlass;
        try
          begin
            Dtsrc.DataSet.Post;
            (Dtsrc.DataSet as TZQuery).ApplyUpdates;
            (Dtsrc.DataSet as TZQuery).CommitUpdates;
          end;
        except
          on E: Exception do
          begin
          Beep;
            MessageDlg('Erro no de inserimento do Arquivo!', E.Message,
              mtError, [mbOK], 0);
            Abort;
          end;
        end;
        CheckGravarExcluir := True;
        CheckGravarEditar := True;
        try
          begin
            DM.cds_UserAdd.Open;
            DM.cds_UserAdd.Append;
            DM.cds_UserAddIDUSUARIOS.Value := FrmLogin.COD_USUARIO;
            DM.cds_UserAddIDARQUIVOS.Value := DM.ZQArquivoID.AsInteger;
            DM.cds_UserAdd.Post;
            DM.cds_UserAdd.ApplyUpdates;
            DM.cds_UserAdd.CommitUpdates;
          end;

        except
          on E: Exception do
          begin
            Beep;
            MessageDlg('Erro no de inserimento de Proprietário de Arquivo!',
              E.Message, mtError, [mbOK], 0);
            Abort;
          end;
        end;
        try
          begin
            DtscLog.DataSet.Open;
            DtscLog.DataSet.Append;
            DM.cds_LogCOD_USUARIO.Value := FrmLogin.COD_USUARIO;
            DM.cds_LogINSERDATA.Value := Date;
            DM.cds_LogHORA.Value := Time;
            DM.cds_LogCOD_ACAO.Value := 1;
            DM.cds_LogACAO.Value := 'GRAVOU';
            DM.cds_LogAPLICATIVO.Value := 'CADASTRO DE ARQUIVOS';
            DM.cds_LogCOD_REGISTRO.Value := IntTempCodResgist;
            DM.cds_LogDISCRIMINACAO.Value := 'Gravou Arquivo!';
            DtscLog.DataSet.Post;
            (DtscLog.DataSet as TZQuery).ApplyUpdates;
            (DtscLog.DataSet as TZQuery).CommitUpdates;
          end;
        except
          on E: Exception do
          begin
            Beep;
            MessageDlg('Erro ao gravar Log!', e.Message, mtError, [mbOK], 0);
            Abort;
          end;
        end;
        // DM.sds_cont.Close;
        //RegistroTemp := StrToInt(DatadeCaD.Caption);
        Screen.Cursor := crDefault;
        // ConfigGravar;

        //MostrarEstatistica;
        MostrarIcon;
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
      end
      else
      Beep;
        Abort;
    end;
  end;

end;

procedure TFormArquivo.inserirClick(Sender: TObject);
begin
  if not Dtsrc.DataSet.Active then
    Dtsrc.DataSet.Open;
  Dtsrc.DataSet.Append;

  lookUser.Enabled := False;

end;

procedure TFormArquivo.lookUserClick(Sender: TObject);
begin
  FrmAtribuiUser := TFrmAtribuiUser.Create(Self);
  try
    FrmAtribuiUser.ShowModal;
  finally
    FrmAtribuiUser.Free;
  end;
end;

procedure TFormArquivo.relatorioClick(Sender: TObject);
begin
  try
    try
      DM.ZQueryRelatorioArquivo.Close;
      DM.ZQueryRelatorioArquivo.Params[0].Value := DM.ZQArquivoID.AsInteger;
      DM.ZQueryRelatorioArquivo.Open;
    except
      on E: Exception do
      begin
        MessageDlg('Erro na Consulta de Arquivo!' + ' #13 ' +
          ' Pode ser o banco também ' + E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  finally
    DM.frReportArquivo.LoadFromFile('Reports/RelConsultaArquivosDefault.lrf');
    DM.frReportArquivo.showReport;
  end;
end;

procedure TFormArquivo.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormArquivo.SpeedButton2Click(Sender: TObject);
begin
  Refresh;
  FrmDlgDescricao := TFrmDlgDescricao.Create(Self);
  try
    FrmDlgDescricao.ShowModal;
  finally
    FrmDlgDescricao.Free;
  end;
end;

procedure TFormArquivo.Timer1Timer(Sender: TObject);
begin

  DMII.CarregaPerfil;
  GroupBox1.Color := DM.myColor;
  Refresh;
end;

end.
