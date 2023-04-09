unit UnPrinc;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DB, DBCtrls,
  ZDataset, LResources, dbf, LR_DBSet, LR_Class, LR_BarC, ImgList, ToolWin,
  Menus, PairSplitter, JvXPButtons, GifAnim, TplGifAnimatorUnit, DateUtils,
  WinInet, ATGauge;

type

  { TFrPrincipal }

  TFrPrincipal = class(TForm)
    codigo13: TLabel;
    GifAnim1: TGifAnim;
    Image1: TImage;
    Label13: TLabel;
    ListView1: TListView;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    PopupMenu1: TPopupMenu;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Panel1: TPanel;
    cbtconsulta: TSpeedButton;
    autores: TSpeedButton;
    log: TSpeedButton;
    consultas: TSpeedButton;
    sair: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    UpDown1: TUpDown;
    usuarios: TSpeedButton;
    relatorios: TSpeedButton;
    Assuntos: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure consultasClick(Sender: TObject);
    procedure AssuntosClick(Sender: TObject);
    procedure autoresClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure IdleTimer1Timer(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
    procedure logClick(Sender: TObject);
    procedure lookUserClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure relatorioClick(Sender: TObject);
    procedure relatoriosClick(Sender: TObject);
    procedure sairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure Timer1Timer(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: boolean);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure usuariosClick(Sender: TObject);
  private
    buffer: array [0 .. 255] of char;
    Temp, tempNome: string;
    function numLogados: integer;
    procedure IniciaAdministracao;
    //procedure InicializarComponentes;

  public
    CodigoAssuntoTemp, CodigoAutorTemp: integer;
    Label15Temp, Label16Temp: string;
    ext, nomeUser: string;
    numCodigoII: integer;
    codigo, codigoII, UserTemp, RegistroTemp, RegistroMoment: integer;
    condNivelForm: integer;
    figTipo, codigoArqu, codigoArquSolteiro: integer;
    CheckGravarEditarPesquisa: boolean;
    procedure MostrarEstatistica;
    procedure InicializarComponentes;
    //procedure MostrarIcon;

  end;

var
  FrPrincipal: TFrPrincipal;
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
  UnCadLog, UnUtilitLog, UnCadDepartamento, UnTeladeRelatorios, UnCadArquivos;

{ TFrPrincipal }




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
  //ConfigInicial;
  MostrarEstatistica;
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

procedure TFrPrincipal.BitBtn2Click(Sender: TObject);
begin

  if not Assigned(FrmThema) then
    FrmThema := TFrmThema.Create(FrPrincipal);
  Windows.SetParent(FrmThema.Handle, Panel2.Handle);
  SendMessage(FrmThema.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmThema.Show;



  //FrmThema := TFrmThema.Create(Self);
  //try
  //  FrmThema.ShowModal;
  //finally
  //  FrmThema.Free;
  //end;
end;

procedure TFrPrincipal.AssuntosClick(Sender: TObject);
begin

  if not Assigned(FrmCadAssuntos) then
    FrmCadAssuntos := TFrmCadAssuntos.Create(FrPrincipal);
  Windows.SetParent(FrmCadAssuntos.Handle, Panel2.Handle);
  SendMessage(FrmCadAssuntos.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmCadAssuntos.Show;

  if (FrmCadAssuntos <> nil) then
    begin
    FrmCadAssuntos.Left := 220;
    FrmCadAssuntos.Top := 9;
    end;
  FrmCadAssuntos.SetFocus;


  //  if not Assigned(FrmCadAssuntos) then
  //    FrmCadAssuntos := TFrmCadAssuntos.Create(Self);
  //  FrmCadAssuntos.Show;
end;

procedure TFrPrincipal.consultasClick(Sender: TObject);
begin
  if not Assigned(FormArquivo) then
    FormArquivo := TFormArquivo.Create(FrPrincipal);
  Windows.SetParent(FormArquivo.Handle, Panel2.Handle);
  SendMessage(FormArquivo.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FormArquivo.Show;

  //if (FormArquivo <> nil) then
  //begin
  //  FormArquivo.Left := 70; //275
  //  FormArquivo.Top := 10;
  //end;
  //FormArquivo.SetFocus;




  //  if not Assigned(FormArquivo) then
  //    FormArquivo := TFormArquivo.Create(Self);
  //    FormArquivo.Show;
end;

procedure TFrPrincipal.autoresClick(Sender: TObject);
begin
  if not Assigned(FrmCadAutor) then
    FrmCadAutor := TFrmCadAutor.Create(FrPrincipal);
  //Windows.SetParent(FrmCadAutor.Handle, Panel2.Handle);
  //SendMessage(FrmCadAutor.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmCadAutor.ShowModal;

  //if (FrmCadAutor <> nil) then
  //  begin
  //  FrmCadAutor.Left := 140;
  //  FrmCadAutor.Top := 90;
  //  end;
  // FrmCadAutor.SetFocus;

  //if not Assigned(FrmCadAutor) then
  //  FrmCadAutor := TFrmCadAutor.Create(Self);
  //FrmCadAutor.Show;
end;



procedure TFrPrincipal.Button2Click(Sender: TObject);
begin
  // Timer1.Enabled:= false;
  MostrarEstatistica;
end;

function Saudacao: string;
begin
  Result := ' Boa-Noite!';
  if (Time >= 0.25) and (Time < 0.5) then
    Result := ' Bom-Dia!';
  if (Time >= 0.5) and (Time < 0.80) then
    Result := ' Boa-Tarde!';
end;


procedure TFrPrincipal.FormActivate(Sender: TObject);
var
  i: dword;
begin
  StatusBar1.Panels[0].Text :=
    Saudacao + ' Hoje é ' + formatdatetime('dddddd', Date);
  Caption := 'Open Arquivos v45.38.80 - Tela Principal - IP:' + DM.GetIP;
  InicializarComponentes;


  //if (FormArquivo <> nil) then
  //begin
  //  FormArquivo.Left := 140; //275
  //  FormArquivo.Top := 2;
  //  //Position:=poDesktopCenter;
  //end;

  //Color:=DM.myColor;
  // GroupBox1.Color := DM.myColor;
end;

procedure TFrPrincipal.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if (MessageDlg('Deseja Sair do Sistema ?', mtConfirmation, [mbYes, mbNo], 0) =
    mrYes) then
    begin
      try
        try
        DM.cds_ExcRepetidos.Close;
        DM.cds_ExcRepetidos.Params[0].AsInteger := FrmLogin.COD_USUARIO;
        DM.cds_ExcRepetidos.Open;
        finally
        DM.DtsrcExcLogados.DataSet.Delete;
        (DM.DtsrcExcLogados.DataSet as TZQuery).ApplyUpdates;
        (DM.DtsrcExcLogados.DataSet as TZQuery).CommitUpdates;

        end;
      except
      on E: Exception do
        begin
        MessageDlg('Houve um problema no termino do aplicativo !', mtWarning,
          [mbOK], 0);

        end;
      end;
    end;
end;

procedure TFrPrincipal.FormShow(Sender: TObject);
begin
  FrmLogin.Visible := False;
  IniciaAdministracao;
end;

procedure TFrPrincipal.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: boolean);
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

procedure TFrPrincipal.logClick(Sender: TObject);
var
  pt, pt2: TPoint;

begin
  pt.x := log.Left;
  pt.y := log.Top + log.Height;

  pt2 := ClientToScreen(pt);

  PopupMenu1.PopUp(pt2.x, pt2.y);

end;

procedure TFrPrincipal.IdleTimer1Timer(Sender: TObject);
begin
  //MostrarEstatistica;
  //IniciaAdministracao;
  //if (StrToInt(codigo13.Caption)) = 1 then
  //begin
  //  GifAnim1.Visible := False;
  //  GifAnim1.Animate:= False;
  //end
  //else
  //begin
  //  GifAnim1.Visible := True;
  //  GifAnim1.Animate:= True;
  //end;

end;

procedure TFrPrincipal.JvXPButton1Click(Sender: TObject);
begin
  if (UpDown1.Increment > 0) then
    begin
    UpDown1.Position := 50;
    end
  else
    begin
    UpDown1.Position := 100;
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

procedure TFrPrincipal.MenuItem2Click(Sender: TObject);
begin
  //FrmCadCidades := TFrmCadCidades.Create(Application);
  //  try
  //  FrmCadCidades.ShowModal;
  //  finally
  //  FrmCadCidades.Free;
  //  end;
end;

procedure TFrPrincipal.MenuItem3Click(Sender: TObject);
begin
    try
      try
      DM.cds_ExcRepetidos.Close;
      DM.cds_ExcRepetidos.Params[0].AsInteger := FrmLogin.COD_USUARIO;
      DM.cds_ExcRepetidos.Open;
      finally
      DM.DtsrcExcLogados.DataSet.Delete;
      (DM.DtsrcExcLogados.DataSet as TZQuery).ApplyUpdates;
      (DM.DtsrcExcLogados.DataSet as TZQuery).CommitUpdates;

      end;
    except
    on E: Exception do
      begin
      MessageDlg('Houve um problema no termino do aplicativo !', mtWarning,
        [mbOK], 0);
      end;
    end;
  Application.Terminate;
end;

procedure TFrPrincipal.MenuItem5Click(Sender: TObject);
begin

  if not Assigned(FrmLogAcesso) then
    FrmLogAcesso := TFrmLogAcesso.Create(FrPrincipal);
  Windows.SetParent(FrmLogAcesso.Handle, Panel2.Handle);
  SendMessage(FrmLogAcesso.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmLogAcesso.ShowModal;

  if (FrmLogAcesso <> nil) then
    begin
    FrmLogAcesso.Left := 275;
    FrmLogAcesso.Top := 40;
    end;
  // FrmLogAcesso.SetFocus;

  ////if not Assigned(FrmLogAcesso) then
  //FrmLogAcesso := TFrmLogAcesso.Create(Self);
  //try
  //  FrmLogAcesso.ShowModal;
  //  // FrmLogAcesso.Visible := True;
  //  //FrmLogAcesso := TFrmLogAcesso.Create(Self);
  //  //try
  //  //  FrmLogAcesso.ShowModal;
  //finally
  //  FrmLogAcesso.Free;
  //end;
end;

procedure TFrPrincipal.MenuItem6Click(Sender: TObject);
begin

  if not Assigned(FrmCadLogDet) then
    FrmCadLogDet := TFrmCadLogDet.Create(FrPrincipal);
  Windows.SetParent(FrmCadLogDet.Handle, Panel2.Handle);
  SendMessage(FrmCadLogDet.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmCadLogDet.ShowModal;

  if (FrmCadLogDet <> nil) then
    begin
    FrmCadLogDet.Left := 275;
    FrmCadLogDet.Top := 40;
    end;
  //FrmCadLogDet.SetFocus;

  //FrmCadLogDet := TFrmCadLogDet.Create(Self);
  //try
  //  FrmCadLogDet.ShowModal;
  //finally
  //  FrmCadLogDet.Free;
  //end;

end;

procedure TFrPrincipal.MenuItem7Click(Sender: TObject);
begin
  FrmCadDepartamento := TFrmCadDepartamento.Create(Self);
    try
    FrmCadDepartamento.ShowModal;
    finally
    FrmCadDepartamento.Free;
    end;
end;

procedure TFrPrincipal.relatorioClick(Sender: TObject);
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

procedure TFrPrincipal.relatoriosClick(Sender: TObject);
begin
  if not Assigned(FrmRelatoriosGerais) then
    FrmRelatoriosGerais := TFrmRelatoriosGerais.Create(FrPrincipal);
  Windows.SetParent(FrmRelatoriosGerais.Handle, Panel2.Handle);
  SendMessage(FrmRelatoriosGerais.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmRelatoriosGerais.Show;

  if (FrmRelatoriosGerais <> nil) then
    begin
    FrmRelatoriosGerais.Left := 275;
    FrmRelatoriosGerais.Top := 40;
    end;
  FrmRelatoriosGerais.SetFocus;


  //FrmRelatoriosGerais := TFrmRelatoriosGerais.Create(Self);
  //try
  //  FrmRelatoriosGerais.ShowModal;
  //finally
  //  FrmRelatoriosGerais.Free;
  //end;
end;

procedure TFrPrincipal.sairClick(Sender: TObject);
begin
  if (MessageDlg('Deseja Sair do Sistema ?', mtConfirmation, [mbYes, mbNo], 0) =
    mrYes) then
    begin
      try
        try
        DM.cds_ExcRepetidos.Close;
        DM.cds_ExcRepetidos.Params[0].AsInteger := FrmLogin.COD_USUARIO;
        DM.cds_ExcRepetidos.Open;
        finally
        DM.DtsrcExcLogados.DataSet.Delete;
        (DM.DtsrcExcLogados.DataSet as TZQuery).ApplyUpdates;
        (DM.DtsrcExcLogados.DataSet as TZQuery).CommitUpdates;

        end;
      except
      on E: Exception do
        begin
        MessageDlg('Houve um problema no termino do aplicativo !', mtWarning,
          [mbOK], 0);
        end;
      end;
    Application.Terminate;
    end;
end;

procedure TFrPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if not Assigned(FrmThema) then
    FrmThema := TFrmThema.Create(FrPrincipal);
  Windows.SetParent(FrmThema.Handle, Panel2.Handle);
  SendMessage(FrmThema.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmThema.Show;

  if (FrmThema <> nil) then
    begin
    FrmThema.Left := 370; //275
    FrmThema.Top := 90;
    end;
  FrmThema.SetFocus;

end;

procedure TFrPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.ID = 1 then
    begin
    StatusBar1.Canvas.Brush.Color := DM.myColor;
    StatusBar.Canvas.Font.Color := clBlue;
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    if FrmLogin.ADMIN = 0 then
      begin
      ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 1);
      end
    else
      begin
      ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 0);
      end;
    end
  else if Panel.ID = 2 then
    begin
    StatusBar1.Canvas.Brush.Color := DM.myColor;
    StatusBar.Canvas.Font.Color := clBlue;
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 2);
    end
  else
    begin
    StatusBar1.Canvas.Brush.Color := DM.myColor;
    StatusBar.Canvas.Font.Color := clBlue;
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.TextOut(Rect.left + 18, Rect.Top, Panel.Text);
    ImageList1.Draw(StatusBar.Canvas, Rect.left, Rect.Top, 3);
    end;

end;

procedure TFrPrincipal.Timer1Timer(Sender: TObject);
begin
  DMII.CarregaPerfil;
  IniciaAdministracao;
  MostrarEstatistica;
  if ((StrToInt(codigo13.Caption)) > 1) then
    begin
    GifAnim1.Visible := True;
    GifAnim1.Animate := True;
    end
  else
    begin
    GifAnim1.Visible := False;
    GifAnim1.Animate := False;
    end;
  StatusBar1.Canvas.Brush.Color := DM.myColor;
  StatusBar1.Color := DM.myColor;
end;

procedure TFrPrincipal.UpDown1Changing(Sender: TObject; var AllowChange: boolean);
begin
  if (UpDown1.Position = 50) then
    begin
    UpDown1.Position := 100;
    end
  else
  if (UpDown1.Position = 100) then
    begin
    UpDown1.Position := 50;
    end;
end;

procedure TFrPrincipal.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if (UpDown1.Position = 100) then
    begin
    Panel4.Visible := False;
    end
  else
  if (UpDown1.Position = 50) then
    begin
    Panel4.Visible := True;
    end;
end;

procedure TFrPrincipal.MostrarEstatistica;
begin
  ListView1.Clear;
  DM.sds_cont.Close;
  DM.sds_cont.SQL.Clear;
  DM.sds_cont.SQL.Add('select COUNT(*)contArqu from ARQUIVOLIST');
  DM.sds_cont.Open;
  respArquivos := DM.sds_cont.FieldByName('contArqu').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.SQL.Clear;
  DM.sds_cont.SQL.Add('select COUNT(*)contUser from USUARIO');
  DM.sds_cont.Open;
  respUsuarios := DM.sds_cont.FieldByName('contUser').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.SQL.Clear;
  DM.sds_cont.SQL.Add('select COUNT(*)contAssunt from ASSUNTO');
  DM.sds_cont.Open;
  respAssuntos := DM.sds_cont.FieldByName('contAssunt').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.SQL.Clear;
  DM.sds_cont.SQL.Add('select COUNT(*)contLog from LOG');
  DM.sds_cont.Open;
  respLog := DM.sds_cont.FieldByName('contLog').AsInteger;
  DM.sds_cont.Close;
  DM.sds_cont.SQL.Clear;
  DM.sds_cont.SQL.Add('select COUNT(*)contAut from AUTORES');
  DM.sds_cont.Open;
  respAutores := DM.sds_cont.FieldByName('contAut').AsInteger;
  respLogados := numLogados;
  ListView1.Items.Add.Caption :=
    'Arquivos:                      ' + IntToStr(respArquivos);
  ListView1.Items.Add.Caption :=
    'Usuários:                      ' + IntToStr(respUsuarios);
  ListView1.Items.Add.Caption :=
    'Assuntos:                     ' + IntToStr(respAssuntos);
  ListView1.Items.Add.Caption :=
    'Autores :                      ' + IntToStr(respAutores);
  ListView1.Items.Add.Caption :=
    'Logs    :                        ' + IntToStr(respLog);
  codigo13.Caption := IntToStr(numLogados);
  codigo13.Visible := True;
  // ListView1.Items.Add.Caption := 'Logados :                     ' +IntToStr(respLogados);
end;


procedure TFrPrincipal.usuariosClick(Sender: TObject);
begin

  if not Assigned(FrmCadastrodeUsuarios) then
    FrmCadastrodeUsuarios := TFrmCadastrodeUsuarios.Create(FrPrincipal);
  Windows.SetParent(FrmCadastrodeUsuarios.Handle, Panel2.Handle);
  SendMessage(FrmCadastrodeUsuarios.Handle, WM_NCACTIVATE, WPARAM(True), 0);
  FrmCadastrodeUsuarios.ShowModal;

  //if (FrmCadastrodeUsuarios <> nil) then
  //begin
  //  FrmCadastrodeUsuarios.Left := 275;
  //  FrmCadastrodeUsuarios.Top := 40;
  //end;
  // FrmCadastrodeUsuarios.SetFocus;




  //  FrmCadastrodeUsuarios := TFrmCadastrodeUsuarios.Create(Self);
  //  try
  //    FrmCadastrodeUsuarios.ShowModal;
  //  finally
  //    FrmCadastrodeUsuarios.Free;
  //  end;

end;


function TFrPrincipal.numLogados: integer;
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

procedure TFrPrincipal.IniciaAdministracao;
begin

  //if FrmLogin.BitBtn2.ModalResult = mrOk then
  //begin
    {with DM.dst_Login do
      if not IsEmpty then
      begin }

        {if (FrmLogin.TODOS = 1) then
          begin
          //cbtconsulta.Enabled:=true;
          cbconsulta.Enabled := True;
          end;
          if (FrmLogin.TODOS = 0) then
          begin
          cbconsulta.Enabled :=false;
          end; }

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
  {if (FrmLogin.TODOS = 0) then
  begin
    lookUser.Visible := False;
  end
  else
  begin
    lookUser.Visible := True;
  end;  }


  if FrmLogin.ADMIN = 1 then
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
    end;

  if DMII.sdt_Verif_Perfil.FieldByName('MENU_ARQUI_CONSULTAS').AsString = 'S' then
    begin
    consultas.Visible := True;
    end
  else
    begin
    consultas.Visible := False;
    end;




  if DMII.sdt_Verif_Perfil.FieldByName('MENU_USUARIO_CADASTRO').AsString = 'S' then
    begin
    usuarios.Visible := True;
    end;
  if DMII.sdt_Verif_Perfil.FieldByName('MENU_USUARIO_CADASTRO').AsString = 'N' then
    begin
    usuarios.Visible := False;
    end;
  if DMII.sdt_Verif_PerfilMENU_ARQUI_ASSUNTOS.AsString = 'N' then
    begin
    Assuntos.Visible := False;
    end;
  if DMII.sdt_Verif_PerfilMENU_ARQUI_ASSUNTOS.AsString = 'S' then
    begin
    Assuntos.Visible := True;
    end;
  if DMII.sdt_Verif_Perfil.FieldByName('MENU_ARQUI_AUTORES').AsString = 'N' then
    begin
    autores.Visible := False;
    end;
  if DMII.sdt_Verif_Perfil.FieldByName('MENU_ARQUI_AUTORES').AsString = 'S' then
    begin
    autores.Visible := True;
    end;
  if FrmLogin.ADMIN = 1 then
    begin
    log.Visible := True;
    end
  else
    begin
    log.Visible := False;
    end;

end;


end.
