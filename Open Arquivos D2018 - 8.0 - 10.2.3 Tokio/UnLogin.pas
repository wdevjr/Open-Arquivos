// Programa: Open Arquivos
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, DB, DBClient, Registry, DBCtrls,
  Vcl.Themes;

type
  TFrmLogin = class(TForm)
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    LblMes: TLabel;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    Dtsrc: TDataSource;
    DtsrcLogados: TDataSource;
    DtsrcExcRepetido: TDataSource;
    Edtusuario: TComboBox;
    Image2: TImage;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private

  public
    i: Longint;
    ID: TStrings;
    // ID:Integer;
    COD_USUARIO: Integer;
    COD_PERFIL: Integer;
    NOME: string;
    LOGIN: string;
    NIVEL: Integer;
    ADMIN: Integer;
    TODOS: Integer;
    THEMA_ATUAL: String;
    procedure IncrementaAdd;
    procedure CorrigeUserCod;
  end;

var
  FrmLogin: TFrmLogin;
  auxint: Integer;
  auxRota: String;
  auxRegistro: TRegIniFile;

implementation

uses UDM, UProjeto, UDMII, SqlExpr, SimpleDS, UnAbertura;

{$R *.dfm}

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
var
  respValue: Integer;
  mensagem: String;
  thema: TStyleManager;
begin
  mensagem := 'Usuário ou Senha Invalidos !' + #13 + #13 +
    'Se você esqueceu sua Senha ' + #13 +
    'Consulte o Administrador do Sistema !' + #13;
  try
    DM.dst_Login.close;
    DM.dst_Login.CommandText := '';
    DM.dst_Login.CommandText :=
      'select UR.COD_USUARIO,PL.CODIGO,UR.NOME,UR.LOGIN,UR.NIVEL,UR.SENHA,UR.ADMINISTRADOR,UR.TIPO_TODOS from USUARIO UR inner join PERFIL PL on PL.CODIGO = UR.COD_PERFIL  where LOGIN = '
      + QuotedStr(Edtusuario.Text) + ' and SENHA = ' + QuotedStr(EdtSenha.Text);
    DM.dst_Login.Open;
  Except
    on E: Exception do
    begin
      MessageDlg('Erro no procedimento de Login !' + #13 +
        'Mensagem nativa do erro : ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  if DM.dst_Login.RecordCount = 1 then
  begin
    with DM.dst_Login do
    begin
      COD_USUARIO := Fields[0].AsInteger;
      COD_PERFIL := Fields[1].AsInteger;
      NOME := Fields[2].AsString;
      LOGIN := Fields[3].AsString;
      NIVEL := Fields[4].AsInteger;
      ADMIN := Fields[6].AsInteger;
      TODOS := Fields[7].AsInteger;
      // THEMA_ATUAL := Fields[8].AsString;
      // ID.add(DM.dst_Login['ID']);
      DMII.CarregaPerfil;
    end;
    // Sessão Menu Arquivo
    // ENTIDADE: LOG ...
    Dtsrc.DataSet.Open;
    Dtsrc.DataSet.Append;
    Dtsrc.DataSet.Insert;
    DM.cds_LogCOD_USUARIO.Value := COD_USUARIO;
    DM.cds_LogINSERDATA.Value := Date;
    DM.cds_LogHORA.Value := Time;
    DM.cds_LogCOD_ACAO.Value := 4;
    DM.cds_LogACAO.Value := 'LOGOU';
    DM.cds_LogAPLICATIVO.Value := 'LOGIN DE USUÁRIO';
    DM.cds_LogCOD_REGISTRO.Value := 0;
    DM.cds_LogDISCRIMINACAO.Value := 'SEM DADOS POIS ESTA LOGANDO';
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TClientDataSet).ApplyUpdates(0);

    // VERIFICA ERROS ANTERIORES E REPETIÇÃO DE USUÁRIO
    if (DM.Verifica(COD_USUARIO) = true) then
    begin
      try
        CorrigeUserCod;
      Except
        on E: Exception do
        begin
          MessageDlg('Erro no procedimento CorrigeUserCod !' + #13 +
            'Mensagem nativa do erro : ' + E.Message, mtError, [mbOK], 0);
        end;
      end;
      try
        IncrementaAdd;
      Except
        on E: Exception do
        begin
          MessageDlg('Erro no procedimento IncrementaAdd !' + #13 +
            'Mensagem nativa do erro : ' + E.Message, mtError, [mbOK], 0);
        end;
      end;
    end
    else if DM.Verifica(COD_USUARIO) = False then
      try
        IncrementaAdd;
      Except
        on E: Exception do
        begin
          MessageDlg
            ('Algum procedimento falhou na procedure de incremento (IncrementaAdd) de Logandos !'
            + #13 + 'Mensagem nativa da procedure : ' + E.Message, mtError,
            [mbOK], 0);
          Abort;
        end;
      end;
    // //Application.CreateForm(TFrPrincipal, FrPrincipal);
    if not Assigned(FrPrincipal) then
      FrPrincipal := TFrPrincipal.Create(Application);
    FrPrincipal.Show;
    FrPrincipal.Visible := true;
   //  try
    // thema := TStyleManager.Create();
    // thema.TrySetStyle('Sapphire Kamri');
    // FrPrincipal := TFrPrincipal.Create(Application);
    // try
    // FrPrincipal.ShowModal;
    // //FrmLogin.close;
    // finally
    // FrPrincipal.Free;
    // end;
    {  Except
     on E: Exception do
     begin

     end;
     end; }

  end
  else if DM.dst_Login.RecordCount = 0 then
  begin
    Application.MessageBox(PChar(mensagem), 'Login de Usuário ',
      MB_OK + MB_ICONERROR);
    EdtSenha.Text := '';
    EdtSenha.SetFocus;
  end;

end;

procedure TFrmLogin.IncrementaAdd;
var
  Qryorder: TSQLQuery;
begin
  DM.Qury.close;
  DM.Qury.SQL.Clear;
  DM.Qury.SQL.Add('select CODIGO from NUM_LOGADOS');
  DM.Qury.Open;
  if (DM.Qury.RecordCount = 0) then
  begin
    DtsrcLogados.DataSet.Open;
    DtsrcLogados.DataSet.Append;
    DM.cds_LogadosORDEM.Value := 1;
    DM.cds_LogadosCOD_USUARIO.Value := COD_USUARIO;
    DM.cds_LogadosDATAATUAL.Value := Date;
    DtsrcLogados.DataSet.Post;
    (DtsrcLogados.DataSet as TClientDataSet).ApplyUpdates(0);
  end
  else
  begin // termina a execução caso não esteja em modo de inserção
    Qryorder := TSQLQuery.Create(nil); // cria uma instância do objeto
    try
      Qryorder.SQLConnection := DM.SQLConnection; // componente de conexão
      Qryorder.SQL.Add('SELECT MAX(ORDEM) FROM NUM_LOGADOS');
      Qryorder.Open;
      if Qryorder.Fields[0].IsNull then
        // se a tabela está vazia retornará nulo    //então este será o primeiro registro
      else
        DtsrcLogados.DataSet.Open;
      DtsrcLogados.DataSet.Append;
      DM.cds_LogadosORDEM.AsInteger := Qryorder.Fields[0].AsInteger + 1;
      DM.cds_LogadosCOD_USUARIO.Value := COD_USUARIO;
      // DM.cds_LogadosDATAATUAL.Value := Date;
      DtsrcLogados.DataSet.Post;
      (DtsrcLogados.DataSet as TClientDataSet).ApplyUpdates(0);
    finally
      FreeAndNil(Qryorder); // tira o objeto da memória
    end;
  end;

end;

procedure TFrmLogin.CorrigeUserCod;
begin
  try
    DM.cds_ExcRepetidos.close;
    DM.cds_ExcRepetidos.Params[0].AsInteger := COD_USUARIO;
    DM.cds_ExcRepetidos.Open;
  finally
    DtsrcExcRepetido.DataSet.Delete;
    (DtsrcExcRepetido.DataSet as TClientDataSet).ApplyUpdates(0);
  end
end;

procedure TFrmLogin.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  // Resize := False;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if RegisterHotkey(Handle, 1, MOD_ALT, VK_F4) then
  begin
    MessageDlg('Você Digitou Alt+F4, Por isso a Aplicação Será FECHADA !',
      mtWarning, [mbOK], 0);
  end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var
  i, cont, ForGlobal: Longint;
begin
  //Abertura := TAbertura.Create(Application);
  //Abertura.Show;
  //Abertura.Refresh;
  Edtusuario.Items := DM.PreencheCombo;
  DM.Gauge;
  // auxRegistro := TRegIniFile.Create('\');
  // auxRegistro.rootKey := HKEY_LOCAL_MACHINE;
  // auxRota := '\Software\Classes\Config';
  //
  // if auxRegistro.OpenKey(auxRota, False) then
  // begin
  // auxint := auxRegistro.ReadInteger('cnt', 'ctd1', 0);
  // auxRegistro.WriteInteger('cnt', 'ctd1', auxint - 1);
  // cont := auxRegistro.ReadInteger('cnt', 'ctd1', 5000);
  // end
  // else
  // begin
  // auxRegistro.CreateKey(auxRota);
  // auxRegistro.OpenKey(auxRota, False);
  // auxRegistro.WriteInteger('cnt', 'ctd1', 5000);
  // auxRegistro.WriteInteger('cnt', 'ctd2', 90);
  // auxRegistro.WriteString('Identificador', 'ldt1', 'Utilit');
  // auxRegistro.WriteString('Identificador', 'ldt2', 'n90');
  // auxRegistro.WriteString('Identificador', 'ldt3', 'v6.7.0.0');
  // end;
  // auxRegistro.CloseKey;
  // if (cont <= 0) then
  // begin
  // MessageDlg('Procure o Desenvolvedor do Sistema para uma Nova Licença!',
  // mtWarning, [mbOK], 0);
  // Application.Terminate;
  // end;
    Abertura.Free;
  //Abertura.Close;
end;

end.
