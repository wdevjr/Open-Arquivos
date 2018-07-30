// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercializa??o deste Software bem como do Font sem autoriza??o do Autor ? Terminantemente PROIBIDA !

unit UDMII;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, SimpleDS,
  StdCtrls,
  Graphics, jpeg;

type
  TDMII = class(TDataModule)
    sdt_Perfil: TSQLDataSet;
    dstp_Perfil: TDataSetProvider;
    cds_Perfil: TClientDataSet;
    sds_Pesq_PL: TSimpleDataSet;
    sds_Pesq_PLCODIGO: TIntegerField;
    sds_Pesq_PLNOMEL: TStringField;
    sds_Perfil: TSimpleDataSet;
    sds_PerfilCOD_USUARIO: TIntegerField;
    sds_PerfilNOME: TStringField;
    sds_TempTable: TSimpleDataSet;
    sds_sddata_all: TSimpleDataSet;
    cds_CadAssistent: TClientDataSet;
    dsp_CadAssistent: TDataSetProvider;
    sdt_CadAssistent: TSQLDataSet;
    sdt_CadAssistentCODIGO: TIntegerField;
    sdt_CadAssistentLOGIN: TStringField;
    sdt_CadAssistentNOME: TStringField;
    sdt_CadAssistentSENHA: TStringField;
    cds_CadAssistentCODIGO: TIntegerField;
    cds_CadAssistentLOGIN: TStringField;
    cds_CadAssistentNOME: TStringField;
    cds_CadAssistentSENHA: TStringField;
    sdt_CadAssistentFOTO: TBlobField;
    cds_CadAssistentFOTO: TBlobField;
    sds_LocalizarLogUser: TSimpleDataSet;
    sds_LocalizarLogUserCODIGO: TIntegerField;
    sds_LocalizarLogUserNOME: TStringField;
    sds_LocalizarLogUserLOGIN: TStringField;
    sds_OpenUser: TSimpleDataSet;
    sds_OpenUserCOD_USUARIO: TIntegerField;
    sds_OpenUserNOME: TStringField;
    sds_LocalUserSis: TSimpleDataSet;
    sds_LocalUserSisCOD_USUARIO: TIntegerField;
    sds_LocalUserSisNOME: TStringField;
    sds_Multconsulta: TSimpleDataSet;
    DSCliente: TDataSource;
    sds_BuscaGridAba: TSimpleDataSet;
    sds_Recebe_CodUser: TSimpleDataSet;
    DSAssunto: TDataSource;
    sds_BuscaGridAba_II: TSimpleDataSet;
    sds_BuscaGridAba_IICODIGO: TIntegerField;
    sds_BuscaGridAba_IITITULOASSUN: TStringField;
    sds_BuscaGridAbaCOD_USUARIO: TIntegerField;
    sds_BuscaGridAbaNOME: TStringField;
    sds_RecebeCodAssunto: TSimpleDataSet;
    DSAutor: TDataSource;
    sds_BuscaGridAba_III: TSimpleDataSet;
    sds_RecebeCodAutor: TSimpleDataSet;
    sds_BuscaGridAba_IIICODIGO: TIntegerField;
    sds_BuscaGridAba_IIINOME: TStringField;
    sds_RecebeCodAutorCODIGO: TIntegerField;
    sds_RecebeCodAutorNOME: TStringField;
    sds_RecebeCodAutorINSTITUICAO: TStringField;
    sds_RecebeCodAutorCOD_DEPARTAMENTO: TIntegerField;
    sds_RecebeCodAutorCOD_CIDADE: TIntegerField;
    sds_RecebeCodAutorDATA: TDateField;
    sds_RecebeCodAutorOUTROS: TStringField;
    sds_RecebeCodAutorNOME_CIDADE: TStringField;
    sds_RecebeCodAutorNOME_DEP: TStringField;
    sds_BuscaNomeArquivo: TSimpleDataSet;
    sdt_PerfilCODIGO: TIntegerField;
    sdt_PerfilNOMEL: TStringField;
    sdt_PerfilARQUI_INSERIR: TStringField;
    sdt_PerfilARQUI_EDITAR: TStringField;
    sdt_PerfilARQUI_EXCLUIR: TStringField;
    sdt_PerfilARQUI_CONSULTAR: TStringField;
    sdt_PerfilARQUI_USUARIO: TStringField;
    sdt_PerfilARQUI_ASSUNTOS: TStringField;
    sdt_PerfilARQUI_AUTORES: TStringField;
    sdt_PerfilARQUI_LOCALIZAR: TStringField;
    sdt_PerfilUSUARIO_INSERIR: TStringField;
    sdt_PerfilUSUARIO_EDITAR: TStringField;
    sdt_PerfilUSUARIO_EXCLUIR: TStringField;
    sdt_PerfilUSUARIO_TRAZER: TStringField;
    sdt_PerfilCONFIG_CONVERTER: TStringField;
    sdt_PerfilCONFIG_BOTOES: TStringField;
    sdt_PerfilASSUNTOS_INSERIR: TStringField;
    sdt_PerfilASSUNTOS_EDITAR: TStringField;
    sdt_PerfilASSUNTOS_TRAZER: TStringField;
    sdt_PerfilASSUNTOS_EXCLUIR: TStringField;
    sdt_PerfilAUTORES_INSERIR: TStringField;
    sdt_PerfilAUTORES_EDITAR: TStringField;
    sdt_PerfilAUTORES_EXCLUIR: TStringField;
    sdt_PerfilAUTORES_TRAZER: TStringField;
    sdt_PerfilMENU_ARQUI_CONSULTAS: TStringField;
    sdt_PerfilMENU_ARQUI_ASSUNTOS: TStringField;
    sdt_PerfilMENU_ARQUI_AUTORES: TStringField;
    sdt_PerfilMENU_USUARIO_CADASTRO: TStringField;
    sdt_PerfilMENU_USUARIO_PERFIL: TStringField;
    sdt_PerfilMENU_MANUTENCAO_SQL: TStringField;
    sdt_PerfilMENU_MANUTENCAO_TEMP: TStringField;
    cds_PerfilCODIGO: TIntegerField;
    cds_PerfilNOMEL: TStringField;
    cds_PerfilARQUI_INSERIR: TStringField;
    cds_PerfilARQUI_EDITAR: TStringField;
    cds_PerfilARQUI_EXCLUIR: TStringField;
    cds_PerfilARQUI_CONSULTAR: TStringField;
    cds_PerfilARQUI_USUARIO: TStringField;
    cds_PerfilARQUI_ASSUNTOS: TStringField;
    cds_PerfilARQUI_AUTORES: TStringField;
    cds_PerfilARQUI_LOCALIZAR: TStringField;
    cds_PerfilUSUARIO_INSERIR: TStringField;
    cds_PerfilUSUARIO_EDITAR: TStringField;
    cds_PerfilUSUARIO_EXCLUIR: TStringField;
    cds_PerfilUSUARIO_TRAZER: TStringField;
    cds_PerfilCONFIG_CONVERTER: TStringField;
    cds_PerfilCONFIG_BOTOES: TStringField;
    cds_PerfilASSUNTOS_INSERIR: TStringField;
    cds_PerfilASSUNTOS_EDITAR: TStringField;
    cds_PerfilASSUNTOS_TRAZER: TStringField;
    cds_PerfilASSUNTOS_EXCLUIR: TStringField;
    cds_PerfilAUTORES_INSERIR: TStringField;
    cds_PerfilAUTORES_EDITAR: TStringField;
    cds_PerfilAUTORES_EXCLUIR: TStringField;
    cds_PerfilAUTORES_TRAZER: TStringField;
    cds_PerfilMENU_ARQUI_CONSULTAS: TStringField;
    cds_PerfilMENU_ARQUI_ASSUNTOS: TStringField;
    cds_PerfilMENU_ARQUI_AUTORES: TStringField;
    cds_PerfilMENU_USUARIO_CADASTRO: TStringField;
    cds_PerfilMENU_USUARIO_PERFIL: TStringField;
    cds_PerfilMENU_MANUTENCAO_SQL: TStringField;
    cds_PerfilMENU_MANUTENCAO_TEMP: TStringField;
    sdt_Verif_Perfil: TSimpleDataSet;
    sdt_Verif_PerfilCODIGO: TIntegerField;
    sdt_Verif_PerfilNOMEL: TStringField;
    sdt_Verif_PerfilARQUI_INSERIR: TStringField;
    sdt_Verif_PerfilARQUI_EDITAR: TStringField;
    sdt_Verif_PerfilARQUI_EXCLUIR: TStringField;
    sdt_Verif_PerfilARQUI_CONSULTAR: TStringField;
    sdt_Verif_PerfilARQUI_USUARIO: TStringField;
    sdt_Verif_PerfilARQUI_ASSUNTOS: TStringField;
    sdt_Verif_PerfilARQUI_AUTORES: TStringField;
    sdt_Verif_PerfilARQUI_LOCALIZAR: TStringField;
    sdt_Verif_PerfilUSUARIO_INSERIR: TStringField;
    sdt_Verif_PerfilUSUARIO_EDITAR: TStringField;
    sdt_Verif_PerfilUSUARIO_EXCLUIR: TStringField;
    sdt_Verif_PerfilUSUARIO_TRAZER: TStringField;
    sdt_Verif_PerfilCONFIG_CONVERTER: TStringField;
    sdt_Verif_PerfilCONFIG_BOTOES: TStringField;
    sdt_Verif_PerfilASSUNTOS_INSERIR: TStringField;
    sdt_Verif_PerfilASSUNTOS_EDITAR: TStringField;
    sdt_Verif_PerfilASSUNTOS_TRAZER: TStringField;
    sdt_Verif_PerfilASSUNTOS_EXCLUIR: TStringField;
    sdt_Verif_PerfilAUTORES_INSERIR: TStringField;
    sdt_Verif_PerfilAUTORES_EDITAR: TStringField;
    sdt_Verif_PerfilAUTORES_EXCLUIR: TStringField;
    sdt_Verif_PerfilAUTORES_TRAZER: TStringField;
    sdt_Verif_PerfilMENU_ARQUI_CONSULTAS: TStringField;
    sdt_Verif_PerfilMENU_ARQUI_ASSUNTOS: TStringField;
    sdt_Verif_PerfilMENU_ARQUI_AUTORES: TStringField;
    sdt_Verif_PerfilMENU_USUARIO_CADASTRO: TStringField;
    sdt_Verif_PerfilMENU_USUARIO_PERFIL: TStringField;
    sdt_Verif_PerfilMENU_MANUTENCAO_SQL: TStringField;
    sdt_Verif_PerfilMENU_MANUTENCAO_TEMP: TStringField;
    sds_RecebeCodAssuntoCODIGO: TIntegerField;
    sds_RecebeCodAssuntoCURSO: TStringField;
    sds_RecebeCodAssuntoDATA: TDateField;
    sds_RecebeCodAssuntoTITULOASSUN: TStringField;
    sds_Recebe_CodUserCOD_USUARIO: TIntegerField;
    sds_Recebe_CodUserNOME: TStringField;
    sds_Recebe_CodUserNIVEL: TIntegerField;
    sds_Recebe_CodUserLOGIN: TStringField;
    sds_Recebe_CodUserDATA: TDateField;
    sds_Recebe_CodUserADMINISTRADOR: TIntegerField;
    sds_Recebe_CodUserNOMEL: TStringField;
    sds_RecebeCodAutorUF: TStringField;
    sds_BuscaNomeArquivoID: TIntegerField;
    sds_BuscaNomeArquivoTITULO: TStringField;
    sds_BuscaNomeArquivoNOME_ARQUIVO: TStringField;
    sds_BuscaNomeArquivoEXTENCAO: TStringField;
    sds_BuscaNomeArquivoDATA: TDateField;
    sds_BuscaNomeArquivoDESCRICAO: TStringField;
    sds_BuscaNomeArquivoHORA: TTimeField;
    sds_BuscaNomeArquivoTAMANHO: TStringField;
    sds_BuscaNomeArquivoINFORMACOES: TMemoField;
    sds_BuscaNomeArquivoNOME: TStringField;
    sds_BuscaNomeArquivoNOME_1: TStringField;
    sds_BuscaNomeArquivoTITULOASSUN: TStringField;
    DSBuscaUsuario: TDataSource;
    sds_BuscaUsuario: TSimpleDataSet;
    sds_BuscaUsuarioCOD_USUARIO: TIntegerField;
    sds_BuscaUsuarioNOME: TStringField;
    dsp_Visual: TDataSetProvider;
    sdt_Visual: TSQLDataSet;
    cds_Visual: TClientDataSet;
    sdt_VisualID: TIntegerField;
    sdt_VisualCOD_USUARIO: TIntegerField;
    sdt_VisualVISUAL: TIntegerField;
    cds_VisualID: TIntegerField;
    cds_VisualCOD_USUARIO: TIntegerField;
    cds_VisualVISUAL: TIntegerField;
    sds_OpenPesqUser: TSimpleDataSet;
    sds_OpenPesqUserCOD_USUARIO: TIntegerField;
    sds_OpenPesqUserNOME: TStringField;
    procedure sds_sddata_allReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_sddata_allFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cds_CadAssistentNewRecord(DataSet: TDataSet);
    procedure cds_CadAssistentReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_Pesq_PLFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure cds_PerfilBeforePost(DataSet: TDataSet);
    procedure cds_PerfilReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_PerfilNewRecord(DataSet: TDataSet);
    procedure sds_BuscaGridAbaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sds_BuscaGridAba_IIFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sds_BuscaGridAba_IIIFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sds_Recebe_CodUserNIVELGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sds_Recebe_CodUserADMINISTRADORGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cds_VisualReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_VisualNewRecord(DataSet: TDataSet);
    procedure sds_OpenPesqUserReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    codigoPerfil: Integer;
    procedure CarregaPerfil;
    procedure IncrementaPersonalizado(Nome_Tabela: String;
      Chave_Primaria: TField);
  end;

var
  DMII: TDMII;

implementation

uses UDM, Dialogs, UnCadPerfil, UnUtilitLog, UnLogin;

{$R *.dfm}

procedure TDMII.cds_CadAssistentNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('USUARIO_LOG', cds_CadAssistentCODIGO);
  // SQLComand :=
  // 'select gen_id(USUARIO_LOG_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_CadAssistentCODIGO.Value := ResultSet.FieldByName('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;

end;

procedure TDMII.cds_CadAssistentReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco ? : ' + E.Message,
    MtInformation, [mbok], 0);
end;

procedure TDMII.cds_PerfilBeforePost(DataSet: TDataSet);
begin
  if cds_Perfil.State = dsInsert then
  begin
    if (FrmCadPerfil.DBCheckBox3.State = cbChecked) then
    begin
      cds_PerfilARQUI_INSERIR.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_INSERIR.Value := 'N';
    end;

    if (FrmCadPerfil.DBCheckBox18.State = cbChecked) then
    begin
      cds_PerfilARQUI_EDITAR.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_EDITAR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox5.State = cbChecked) then
    begin
      cds_PerfilARQUI_EXCLUIR.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_EXCLUIR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox7.State = cbChecked) then
    begin
      cds_PerfilARQUI_CONSULTAR.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_CONSULTAR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox8.State = cbChecked) then
    begin
      cds_PerfilARQUI_USUARIO.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_USUARIO.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox33.State = cbChecked) then
    begin
      cds_PerfilARQUI_ASSUNTOS.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_ASSUNTOS.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox34.State = cbChecked) then
    begin
      cds_PerfilARQUI_AUTORES.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_AUTORES.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox9.State=cbChecked) then
      begin
      cds_PerfilARQUI_LOG.Value:='S';
      end
      else
      begin
      cds_PerfilARQUI_LOG.Value:='N';
      end; }
    if (FrmCadPerfil.DBCheckBox1.State = cbChecked) then
    begin
      cds_PerfilARQUI_LOCALIZAR.Value := 'S';
    end
    else
    begin
      cds_PerfilARQUI_LOCALIZAR.Value := 'N';
    end;

    // Sess?o Usu?rio

    if (FrmCadPerfil.DBCheckBox11.State = cbChecked) then
    begin
      cds_PerfilUSUARIO_INSERIR.Value := 'S';
    end
    else
    begin
      cds_PerfilUSUARIO_INSERIR.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox12.State=cbChecked) then
      begin
      cds_PerfilUSUARIO_GRAVAR.Value:='S';
      end
      else
      begin
      cds_PerfilUSUARIO_GRAVAR.Value:='N';
      end; }
    if (FrmCadPerfil.DBCheckBox19.State = cbChecked) then
    begin
      cds_PerfilUSUARIO_EDITAR.Value := 'S';
    end
    else
    begin
      cds_PerfilUSUARIO_EDITAR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox13.State = cbChecked) then
    begin
      cds_PerfilUSUARIO_EXCLUIR.Value := 'S';
    end
    else
    begin
      cds_PerfilUSUARIO_EXCLUIR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox14.State = cbChecked) then
    begin
      cds_PerfilUSUARIO_TRAZER.Value := 'S';
    end
    else
    begin
      cds_PerfilUSUARIO_TRAZER.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox4.State=cbChecked) then
      begin
      cds_PerfilUSUARIO_ADMINISTRADOR.Value:='S';
      end
      else
      begin
      cds_PerfilUSUARIO_ADMINISTRADOR.Value:='N';
      end; }
    { if (FrmCadPerfil.DBCheckBox16.State=cbChecked) then
      begin
      cds_PerfilUSUARIO_VISUALIZAR_TODOS.Value:='S';
      end
      else
      begin
      cds_PerfilUSUARIO_VISUALIZAR_TODOS.Value:='N';
      end;
      { if (FrmCadPerfil.DBCheckBox20.State=cbChecked) then
      begin
      cds_PerfilUSUARIO_PERFIL.Value:='S';
      end
      else
      begin
      cds_PerfilUSUARIO_PERFIL.Value:='N';
      end; }

    // Sess?o Configura??o de Arquivos

    if (FrmCadPerfil.DBCheckBox35.State = cbChecked) then
    begin
      cds_PerfilCONFIG_CONVERTER.Value := 'S';
    end
    else
    begin
      cds_PerfilCONFIG_CONVERTER.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox36.State = cbChecked) then
    begin
      cds_PerfilCONFIG_BOTOES.Value := 'S';
    end
    else
    begin
      cds_PerfilCONFIG_BOTOES.Value := 'N';
    end;

    // Sess?o Assuntos

    if (FrmCadPerfil.DBCheckBox21.State = cbChecked) then
    begin
      cds_PerfilASSUNTOS_INSERIR.Value := 'S';
    end
    else
    begin
      cds_PerfilASSUNTOS_INSERIR.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox28.State=cbChecked) then
      begin
      cds_PerfilASSUNTOS_GRAVAR.Value:='S';
      end
      else
      begin
      cds_PerfilASSUNTOS_GRAVAR.Value:='N';
      end; }
    if (FrmCadPerfil.DBCheckBox29.State = cbChecked) then
    begin
      cds_PerfilASSUNTOS_EDITAR.Value := 'S';
    end
    else
    begin
      cds_PerfilASSUNTOS_EDITAR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox30.State = cbChecked) then
    begin
      cds_PerfilASSUNTOS_EXCLUIR.Value := 'S';
    end
    else
    begin
      cds_PerfilASSUNTOS_EXCLUIR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox32.State = cbChecked) then
    begin
      cds_PerfilASSUNTOS_TRAZER.Value := 'S';
    end
    else
    begin
      cds_PerfilASSUNTOS_TRAZER.Value := 'N';
    end;

    // Sess?o Autores

    if (FrmCadPerfil.DBCheckBox25.State = cbChecked) then
    begin
      cds_PerfilAUTORES_INSERIR.Value := 'S';
    end
    else
    begin
      cds_PerfilAUTORES_INSERIR.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox24.State=cbChecked) then
      begin
      cds_PerfilAUTORES_GRAVAR.Value:='S';
      end
      else
      begin
      cds_PerfilAUTORES_GRAVAR.Value:='N';
      end; }
    if (FrmCadPerfil.DBCheckBox22.State = cbChecked) then
    begin
      cds_PerfilAUTORES_EDITAR.Value := 'S';
    end
    else
    begin
      cds_PerfilAUTORES_EDITAR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox23.State = cbChecked) then
    begin
      cds_PerfilAUTORES_EXCLUIR.Value := 'S';
    end
    else
    begin
      cds_PerfilAUTORES_EXCLUIR.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox27.State = cbChecked) then
    begin
      cds_PerfilAUTORES_TRAZER.Value := 'S';
    end
    else
    begin
      cds_PerfilAUTORES_TRAZER.Value := 'N';
    end;

    // Sess?o do Menu Arquivo
    { if FrmLogin.NIVEL = 1 then
      begin
      cds_PerfilARQUI_CONSULTA.Value:='S';
      end
      else
      begin
      cds_PerfilARQUI_CONSULTA.Value:='N';
      end; }
    if (FrmCadPerfil.DBCheckBox37.State = cbChecked) then
    begin
      cds_PerfilMENU_ARQUI_CONSULTAS.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_ARQUI_CONSULTAS.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox2.State = cbChecked) then
    begin
      cds_PerfilMENU_ARQUI_ASSUNTOS.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_ARQUI_ASSUNTOS.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox38.State = cbChecked) then
    begin
      cds_PerfilMENU_ARQUI_AUTORES.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_ARQUI_AUTORES.Value := 'N';
    end;

    // Sess?o do Menu Usu?rio

    if (FrmCadPerfil.DBCheckBox39.State = cbChecked) then
    begin
      cds_PerfilMENU_USUARIO_CADASTRO.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_USUARIO_CADASTRO.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox40.State = cbChecked) then
    begin
      cds_PerfilMENU_USUARIO_PERFIL.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_USUARIO_PERFIL.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox41.State=cbChecked) then
      begin
      cds_PerfilMENU_USUARIO_CONSULTA.Value:='S';
      end
      else
      begin
      cds_PerfilMENU_USUARIO_CONSULTA.Value:='N';
      end; }

    // Sess?o do Menu Manuten??o

    if (FrmCadPerfil.DBCheckBox42.State = cbChecked) then
    begin
      cds_PerfilMENU_MANUTENCAO_SQL.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_MANUTENCAO_SQL.Value := 'N';
    end;
    if (FrmCadPerfil.DBCheckBox43.State = cbChecked) then
    begin
      cds_PerfilMENU_MANUTENCAO_TEMP.Value := 'S';
    end
    else
    begin
      cds_PerfilMENU_MANUTENCAO_TEMP.Value := 'N';
    end;
    { if (FrmCadPerfil.DBCheckBox44.State=cbChecked) then
      begin
      cds_PerfilMENU_MANUTENCAO_LOG.Value:='S';
      end
      else
      begin
      cds_PerfilMENU_MANUTENCAO_LOG.Value:='N';
      end;
      if (FrmCadPerfil.DBCheckBox26.State=cbChecked) then
      begin
      cds_PerfilMENU_MANUNTECAO_LOG_CADASTRO.Value:='S';
      end
      else
      begin
      cds_PerfilMENU_MANUNTECAO_LOG_CADASTRO.Value:='N';
      end; }
  end;
end;

procedure TDMII.IncrementaPersonalizado(Nome_Tabela: String;
  Chave_Primaria: TField);
var
  Qry: TSQLQuery;
begin
  // if Chave_Primaria.DataSet.State <> dsInsert then
  // exit; // termina a execução caso não esteja em modo de inserção
  Qry := TSQLQuery.Create(nil); // cria uma instância do objeto
  try
    Qry.SQLConnection := DM.SQLConnection; // componente de conexão
    Qry.SQL.Add('SELECT MAX(' + Chave_Primaria.FieldName + ') FROM ' +
      Nome_Tabela);
    Qry.Open;
    if (Qry.Fields[0].IsNull) OR (Qry.Fields[0].AsInteger = 0) then
      // se a tabela está vazia retornará nulo
      Chave_Primaria.AsInteger := 402585
      // então este será o primeiro registro
    else
      Chave_Primaria.AsInteger := Qry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(Qry); // tira o objeto da memória
  end;
end;

procedure TDMII.cds_PerfilNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('PERFIL', cds_PerfilCODIGO);
  // SQLComand := 'select gen_id(PERFIL_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_PerfilCODIGO.AsInteger := ResultSet.FieldByName('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;
end;

procedure TDMII.cds_PerfilReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco ? : ' + E.Message,
    MtInformation, [mbok], 0);
end;

procedure TDMII.cds_VisualNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  // IncrementaPersonalizado('');
  // SQLComand := 'select gen_id(VISUALIZADOR_ID_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_VisualID.Value := ResultSet.FieldByName('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;

end;

procedure TDMII.cds_VisualReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco ? : ' + E.Message,
    MtInformation, [mbok], 0);
end;

procedure TDMII.DataModuleCreate(Sender: TObject);
begin
  sds_Perfil.Connection := DM.SQLConnection;
  sds_Pesq_PL.Connection := DM.SQLConnection;
  sds_sddata_all.Connection := DM.SQLConnection;
  sdt_CadAssistent.SQLConnection := DM.SQLConnection;
  sds_LocalizarLogUser.Connection := DM.SQLConnection;
  sds_LocalUserSis.Connection := DM.SQLConnection;
  sds_OpenUser.Connection := DM.SQLConnection;
  sdt_Verif_Perfil.Connection := DM.SQLConnection;
  sds_Multconsulta.Connection := DM.SQLConnection;
  sds_BuscaGridAba.Connection := DM.SQLConnection;
  sds_Recebe_CodUser.Connection := DM.SQLConnection;
  sds_BuscaGridAba_II.Connection := DM.SQLConnection;
  sds_RecebeCodAssunto.Connection := DM.SQLConnection;
  sds_BuscaGridAba_III.Connection := DM.SQLConnection;
  sds_RecebeCodAutor.Connection := DM.SQLConnection;
  sds_BuscaNomeArquivo.Connection := DM.SQLConnection;
  sds_OpenPesqUser.Connection := DM.SQLConnection;
end;

procedure TDMII.sds_BuscaGridAbaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_BuscaGridAba['COD_USUARIO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDMII.sds_BuscaGridAba_IIFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_BuscaGridAba_II['CODIGO'] > 99 then
  begin
    Accept := True;
  end;
end;

procedure TDMII.sds_BuscaGridAba_IIIFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_BuscaGridAba_III['CODIGO'] > 99 then
  begin
    Accept := True;
  end;
end;

procedure TDMII.sds_OpenPesqUserReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco e ou Query ? : ' + E.Message,
    MtInformation, [mbok], 0);
end;

procedure TDMII.sds_Pesq_PLFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sds_Pesq_PL['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDMII.sds_Recebe_CodUserADMINISTRADORGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if Sender.Value = (1) then
      Text := 'Administrador'
    else if Sender.Value = (0) then
      Text := 'Usuário';
  end;

end;

procedure TDMII.sds_Recebe_CodUserNIVELGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if Sender.Value = (1) then
      Text := 'Visualizar / Extrair Arquivos'
    else if Sender.Value = (0) then
      Text := 'Não Visualizar / Extrair';
  end;
end;

procedure TDMII.sds_sddata_allFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if FrmLogAcesso.ok.Checked = True then
  begin
    if sds_sddata_all['COD_USUARIO'] = FrmLogAcesso.DBEdit1.Text then
    begin
      Accept := True;
    end;
  end;
end;

procedure TDMII.sds_sddata_allReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco ? : ' + E.Message,
    MtInformation, [mbok], 0);
end;

procedure TDMII.CarregaPerfil;
begin
  codigoPerfil := FrmLogin.COD_PERFIL;
  sdt_Verif_Perfil.Close;
  sdt_Verif_Perfil.Params[0].AsInteger := codigoPerfil;
  sdt_Verif_Perfil.Open;
end;

end.
