unit UnDM;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, Classes, SysUtils, sqldb, DB, FileUtil, ComCtrls, DBCtrls,
  Controls, StdCtrls, LR_Class, LR_DBSet, LR_ChBox, Forms, Graphics, Dialogs,
  DBGrids, ExtCtrls, ZConnection, ZDataset, ZSqlUpdate, IniFiles,
  ZAbstractDataset, ZSqlMetadata, LR_BarC, LR_E_TXT, LR_Desgn, LR_PGrid,
  ATGauge, Winsock, LR_DSet, LR_Shape, Variants;

type

  { TDM }

  TDM = class(TDataModule)
    cds_AssuntCODIGO: TLongintField;
    cds_AssuntCURSO: TStringField;
    cds_AssuntDATA: TDateField;
    cds_AssuntTITULOASSUN: TStringField;
    cds_AutoresCODIGO: TLongintField;
    cds_AutoresCOD_CIDADE: TLongintField;
    cds_AutoresCOD_DEPARTAMENTO: TLongintField;
    cds_AutoresDATA: TDateField;
    cds_AutoresINSTITUICAO: TStringField;
    cds_AutoresNOME: TStringField;
    cds_AutoresNOME_CIDADE: TStringField;
    cds_AutoresNOME_DEP: TStringField;
    cds_AutoresOUTROS: TStringField;
    cds_AutoresUF: TStringField;
    cds_CadCidadesCODIGO: TLongintField;
    cds_CadCidadesDATA: TDateField;
    cds_CadCidadesNOME_CIDADE: TStringField;
    cds_CadCidadesUF: TStringField;
    cds_CadDepCODIGO: TLongintField;
    cds_CadDepDATA: TDateField;
    cds_CadDepNOME_DEP: TStringField;
    cds_ExcRepetidosCODIGO: TLongintField;
    cds_ExcRepetidosCOD_USUARIO: TLongintField;
    cds_ExcRepetidosDATAATUAL: TDateField;
    cds_ExcRepetidosORDEM: TLongintField;
    cds_LogACAO: TStringField;
    cds_logadosCODIGO: TLongintField;
    cds_logadosCOD_USUARIO: TLongintField;
    cds_logadosDATAATUAL: TDateField;
    cds_logadosORDEM: TLongintField;
    cds_LogAPLICATIVO: TStringField;
    cds_LogCODIGO: TLongintField;
    cds_LogCOD_ACAO: TLongintField;
    cds_LogCOD_REGISTRO: TLongintField;
    cds_LogCOD_USUARIO: TLongintField;
    cds_LogDISCRIMINACAO: TStringField;
    cds_LogHORA: TTimeField;
    cds_LogINSERDATA: TDateField;
    cds_User: TZQuery;
    cds_UserAddIDARQUIVOS: TLongintField;
    cds_UserAddIDUSUARIOS: TLongintField;
    cds_UserADMINISTRADOR: TLongintField;
    cds_UserCodADMINISTRADOR: TLongintField;
    cds_UserCodCOD_PERFIL: TLongintField;
    cds_UserCodCOD_USUARIO: TLongintField;
    cds_UserCodDATA: TDateField;
    cds_UserCodLEMBRAR_SENHA: TStringField;
    cds_UserCodLOGIN: TStringField;
    cds_UserCodNIVEL: TLongintField;
    cds_UserCodNOME: TStringField;
    cds_UserCodSENHA: TStringField;
    cds_UserCodTIPO_TODOS: TLongintField;
    cds_UserCOD_PERFIL: TLongintField;
    cds_UserCOD_USUARIO: TLongintField;
    cds_UserDATA: TDateField;
    cds_UserLEMBRAR_SENHA: TStringField;
    cds_UserLOGIN: TStringField;
    cds_UserNIVEL: TLongintField;
    cds_UserNOME: TStringField;
    cds_UserNOMEL: TStringField;
    cds_UserSENHA: TStringField;
    cds_UserTIPO_TODOS: TLongintField;
    DataSourceRelArquivo: TDataSource;
    Dtsrc_Logando: TDataSource;
    DtsrcExcLogados: TDataSource;
    frBarCodeObject1: TfrBarCodeObject;
    frDBDataSetZQueryLogParam: TfrDBDataSet;
    frDBDataSetLogTodos: TfrDBDataSet;
    frDBDataSetArquivo: TfrDBDataSet;
    frDesigner1: TfrDesigner;
    frDesigner2: TfrDesigner;
    frReportLogParam: TfrReport;
    frReportLogTodos: TfrReport;
    frReportArquivo: TfrReport;
    listFieldsACAO: TStringField;
    listFieldsAPLICATIVO: TStringField;
    listFieldsCODIGO: TLongintField;
    listFieldsCOD_ACAO: TLongintField;
    listFieldsCOD_REGISTRO: TLongintField;
    listFieldsCOD_USUARIO: TLongintField;
    listFieldsDISCRIMINACAO: TStringField;
    listFieldsHORA: TTimeField;
    listFieldsINSERDATA: TDateField;
    sdss_UserADMINISTRADOR: TLongintField;
    sdss_UserCOD_USUARIO: TLongintField;
    sdss_UserLOGIN: TStringField;
    sdss_UserNOME: TStringField;
    sdss_UserNOMEL: TStringField;
    sdss_UserSENHA: TStringField;
    sds_ArquCOD_ASSUNTO: TLongintField;
    sds_ArquCOD_USUARIO: TLongintField;
    sds_ArquDATA: TDateField;
    sds_ArquDESCRICAO: TStringField;
    sds_ArquID: TLongintField;
    sds_ArquIDUSUARIOS: TLongintField;
    sds_ArquNOMEAUTOR: TStringField;
    sds_ArquNOMEUSER: TStringField;
    sds_ArquNOME_ARQUIVO: TStringField;
    sds_ArquTITULO: TStringField;
    sds_ArquTITULOASSUN: TStringField;
    sds_ArquTodosCOD_USUARIO: TLongintField;
    sds_ArquTodosDATA: TDateField;
    sds_ArquTodosDESCRICAO: TStringField;
    sds_ArquTodosID: TLongintField;
    sds_ArquTodosINFORMACOES: TMemoField;
    sds_ArquTodosLOGIN: TStringField;
    sds_ArquTodosNIVEL: TLongintField;
    sds_ArquTodosNOMEAUTOR: TStringField;
    sds_ArquTodosNOMEUSER: TStringField;
    sds_ArquTodosNOME_ARQUIVO: TStringField;
    sds_ArquTodosTITULO: TStringField;
    sds_ArquTodosTITULOASSUN: TStringField;
    sds_AssuntCODIGO: TLongintField;
    sds_AssuntTITULOASSUN: TStringField;
    sds_Assunt_CadCODIGO: TLongintField;
    sds_Assunt_CadTITULOASSUN: TStringField;
    sds_AutoresCODIGO: TLongintField;
    sds_AutoresCOD_CIDADE: TLongintField;
    sds_AutoresCOD_DEPARTAMENTO: TLongintField;
    sds_AutoresINSTITUICAO: TStringField;
    sds_AutoresNOME: TStringField;
    sds_AutoresNOME_CIDADE: TStringField;
    sds_AutoresNOME_DEP: TStringField;
    sds_AutoresUF: TStringField;
    sds_BuscaCidadesCODIGO: TLongintField;
    sds_BuscaCidadesDATA: TDateField;
    sds_BuscaCidadesNOME_CIDADE: TStringField;
    sds_BuscaCidadesUF: TStringField;
    sds_Cont_LogarCODIGO: TLongintField;
    sds_Cont_LogarCOD_USUARIO: TLongintField;
    sds_Cont_LogarDATAATUAL: TDateField;
    sds_Cont_LogarORDEM: TLongintField;
    sds_lista_UsuariosCOD_USUARIO: TLongintField;
    sds_lista_UsuariosIDARQUIVOS: TLongintField;
    sds_lista_UsuariosIDUSUARIOS: TLongintField;
    sds_lista_UsuariosNOME: TStringField;
    sds_OpenADMINISTRADOR: TLongintField;
    sds_OpenAssuntCODIGO: TLongintField;
    sds_OpenAssuntCURSO: TStringField;
    sds_OpenAssuntDATA: TDateField;
    sds_OpenAssuntTITULOASSUN: TStringField;
    sds_OpenCidadesCODIGO: TLongintField;
    sds_OpenCidadesDATA: TDateField;
    sds_OpenCidadesNOME_CIDADE: TStringField;
    sds_OpenCidadesUF: TStringField;
    sds_OpenCOD_PERFIL: TLongintField;
    sds_OpenCOD_USUARIO: TLongintField;
    sds_OpenDATA: TDateField;
    sds_OpenDepCODIGO: TLongintField;
    sds_OpenDepDATA: TDateField;
    sds_OpenDepNOME_DEP: TStringField;
    sds_OpenLEMBRAR_SENHA: TStringField;
    sds_OpenLOGIN: TStringField;
    sds_OpenNIVEL: TLongintField;
    sds_OpenNOME: TStringField;
    sds_OpenNOMEL: TStringField;
    sds_OpenSENHA: TStringField;
    sds_OpenTIPO_TODOS: TLongintField;
    sds_PesquiDepCODIGO: TLongintField;
    sds_PesquiDepDATA: TDateField;
    sds_PesquiDepNOME_DEP: TStringField;
    sds_Qry_CidadesCODIGO: TLongintField;
    sds_Qry_CidadesDATA: TDateField;
    sds_Qry_CidadesNOME_CIDADE: TStringField;
    sds_Qry_CidadesUF: TStringField;
    sds_Qry_NomeCODIGO: TLongintField;
    sds_Qry_NomeDATA: TDateField;
    sds_Qry_NomeNOME_DEP: TStringField;
    sds_Report_DetalheADMINISTRADOR: TLongintField;
    sds_Report_DetalheCOD_USUARIO: TLongintField;
    sds_Report_DetalheDESCRICAO: TStringField;
    sds_Report_DetalheID: TLongintField;
    sds_Report_DetalheINFORMACOES: TMemoField;
    sds_Report_DetalheLOGIN: TStringField;
    sds_Report_DetalheNIVEL: TLongintField;
    sds_Report_DetalheNOME: TStringField;
    sds_Report_DetalheNOME_1: TStringField;
    sds_Report_DetalheNOME_ARQUIVO: TStringField;
    sds_Report_DetalheTITULOASSUN: TStringField;
    sds_userCodADMINISTRADOR: TLongintField;
    sds_userCodCOD_USUARIO: TLongintField;
    sds_userCodLOGIN: TStringField;
    sds_userCodNOME: TStringField;
    sds_userCodNOMEL: TStringField;
    sds_userCodSENHA: TStringField;
    sds_UserPorCriterioCOD_USUARIO: TLongintField;
    sds_UserPorCriterioIDUSUARIOS: TLongintField;
    sds_UserPorCriterioNOME: TStringField;
    sds_User_UsuariosCOD_USUARIO: TLongintField;
    sds_User_UsuariosIDARQUIVOS: TLongintField;
    sds_User_UsuariosIDUSUARIOS: TLongintField;
    sds_User_UsuariosLOGIN: TStringField;
    sds_User_UsuariosNOME: TStringField;
    sds_viewCODIGO: TLongintField;
    sds_viewCOD_ASSUNTO: TLongintField;
    sds_viewCOD_AUTOR: TLongintField;
    sds_viewCOD_USUARIO: TLongintField;
    sds_viewDATA: TDateField;
    sds_viewDESCRICAO: TStringField;
    sds_viewID: TLongintField;
    sds_viewNOMEAUT: TStringField;
    sds_viewNOMEUSER: TStringField;
    sds_viewNOME_ARQUIVO: TStringField;
    sds_viewTITULO: TStringField;
    sds_viewTITULOASSUN: TStringField;
    sdt_Verif_PerfilARQUI_ASSUNTOS: TStringField;
    sdt_Verif_PerfilARQUI_AUTORES: TStringField;
    sdt_Verif_PerfilARQUI_CONSULTAR: TStringField;
    sdt_Verif_PerfilARQUI_EDITAR: TStringField;
    sdt_Verif_PerfilARQUI_EXCLUIR: TStringField;
    sdt_Verif_PerfilARQUI_INSERIR: TStringField;
    sdt_Verif_PerfilARQUI_LOCALIZAR: TStringField;
    sdt_Verif_PerfilARQUI_USUARIO: TStringField;
    sdt_Verif_PerfilASSUNTOS_EDITAR: TStringField;
    sdt_Verif_PerfilASSUNTOS_EXCLUIR: TStringField;
    sdt_Verif_PerfilASSUNTOS_INSERIR: TStringField;
    sdt_Verif_PerfilASSUNTOS_TRAZER: TStringField;
    sdt_Verif_PerfilAUTORES_EDITAR: TStringField;
    sdt_Verif_PerfilAUTORES_EXCLUIR: TStringField;
    sdt_Verif_PerfilAUTORES_INSERIR: TStringField;
    sdt_Verif_PerfilAUTORES_TRAZER: TStringField;
    sdt_Verif_PerfilCODIGO: TLongintField;
    sdt_Verif_PerfilCONFIG_BOTOES: TStringField;
    sdt_Verif_PerfilCONFIG_CONVERTER: TStringField;
    sdt_Verif_PerfilMENU_ARQUI_ASSUNTOS: TStringField;
    sdt_Verif_PerfilMENU_ARQUI_AUTORES: TStringField;
    sdt_Verif_PerfilMENU_ARQUI_CONSULTAS: TStringField;
    sdt_Verif_PerfilMENU_MANUTENCAO_SQL: TStringField;
    sdt_Verif_PerfilMENU_MANUTENCAO_TEMP: TStringField;
    sdt_Verif_PerfilMENU_USUARIO_CADASTRO: TStringField;
    sdt_Verif_PerfilMENU_USUARIO_PERFIL: TStringField;
    sdt_Verif_PerfilNOMEL: TStringField;
    sdt_Verif_PerfilUSUARIO_EDITAR: TStringField;
    sdt_Verif_PerfilUSUARIO_EXCLUIR: TStringField;
    sdt_Verif_PerfilUSUARIO_INSERIR: TStringField;
    sdt_Verif_PerfilUSUARIO_TRAZER: TStringField;
    SimpleDataSetUseNomeNOMEL: TStringField;
    sdt_Combo: TZQuery;
    dst_Login: TZQuery;
    cds_Log: TZQuery;
    sdt_Verif: TZQuery;
    sds_Verif: TZQuery;
    cds_logados: TZQuery;
    cds_ExcRepetidos: TZQuery;
    Qury: TZQuery;
    sdt_List: TZQuery;
    sdt_ExcAtual: TZQuery;
    Qry_Secun: TZQuery;
    sds_cont: TZQuery;
    sds_Cont_Logar: TZQuery;
    sdt_Verif_Perfil: TZQuery;
    ZConnection: TZConnection;
    ZQArquivoCOD_ASSUNTO: TLongintField;
    ZQArquivoCOD_AUTOR: TLongintField;
    ZQArquivoCOD_USUARIO: TLongintField;
    ZQArquivoDADOS: TBlobField;
    ZQArquivoDATA: TDateField;
    ZQArquivoDESCRICAO: TStringField;
    ZQArquivoEXTENCAO: TStringField;
    ZQArquivoHORA: TTimeField;
    ZQArquivoID: TLongintField;
    ZQArquivoINFORMACOES: TMemoField;
    ZQArquivoNOME: TStringField;
    ZQArquivoNOME_ARQUIVO: TStringField;
    ZQArquivoSIZE_ARQUIVO: TFloatField;
    ZQArquivoTAMANHO: TStringField;
    ZQArquivoTITULO: TStringField;
    ZQArquivoTITULOASSUN: TStringField;
    ZQLocalisaArquivoCOD_USUARIO: TLongintField;
    ZQLocalisaArquivoDESCRICAO: TStringField;
    ZQLocalisaArquivoID: TLongintField;
    ZQLocalisaArquivoLOGIN: TStringField;
    ZQLocalisaArquivoNIVEL: TLongintField;
    ZQLocalisaArquivoNOME: TStringField;
    ZQLocalisaArquivoNOME_1: TStringField;
    ZQLocalisaArquivoNOME_ARQUIVO: TStringField;
    ZQLocalisaArquivoTITULO: TStringField;
    ZQLocalisaArquivoTITULOASSUN: TStringField;
    sds_Arqu: TZQuery;
    sds_ArquTodos: TZQuery;
    sds_Assunt: TZQuery;
    sds_Autores: TZQuery;
    cds_UserAdd: TZQuery;
    ZQryConsultaSetAutoresCODIGO: TLongintField;
    ZQryConsultaSetAutoresNOME: TStringField;
    ZQryConsultaSetUserCOD_USUARIO: TLongintField;
    ZQryConsultaSetUserNOME: TStringField;
    ZQryCosultaAutoresCODIGO: TLongintField;
    ZQryCosultaAutoresCOD_CIDADE: TLongintField;
    ZQryCosultaAutoresCOD_DEPARTAMENTO: TLongintField;
    ZQryCosultaAutoresDATA: TDateField;
    ZQryCosultaAutoresINSTITUICAO: TStringField;
    ZQryCosultaAutoresNOME: TStringField;
    ZQryCosultaAutoresOUTROS: TStringField;
    ZQuery1: TZQuery;
    ZQuery1NOME_ARQUIVO: TStringField;
    ZQuery2: TZQuery;
    ZQuery2COD_ASSUNTO: TLongintField;
    ZQuery2COD_AUTOR: TLongintField;
    ZQuery2COD_USUARIO: TLongintField;
    ZQuery2DATA: TDateField;
    ZQuery2DESCRICAO: TStringField;
    ZQuery2EXTENCAO: TStringField;
    ZQuery2HORA: TTimeField;
    ZQuery2ID: TLongintField;
    ZQuery2INFORMACOES: TMemoField;
    ZQuery2NOME_ARQUIVO: TStringField;
    ZQuery2NOME_ARQUIVO_ESPECIAL: TStringField;
    ZQuery2SIZE_ARQUIVO: TFloatField;
    ZQuery2TAMANHO: TStringField;
    ZQuery2TITULO: TStringField;
    sds_User_Usuarios: TZQuery;
    sds_Open: TZQuery;
    SimpleDataSetUseNome: TZQuery;
    SimpleDataSetUseNomeADMINISTRADOR: TLongintField;
    SimpleDataSetUseNomeCOD_USUARIO: TLongintField;
    SimpleDataSetUseNomeLOGIN: TStringField;
    SimpleDataSetUseNomeNOME: TStringField;
    SimpleDataSetUseNomeSENHA: TStringField;
    sdss_User: TZQuery;
    sds_UserPorCriterio: TZQuery;
    sds_view: TZQuery;
    sds_userCod: TZQuery;
    cds_UserCod: TZQuery;
    cds_Assunt: TZQuery;
    sds_Report_Detalhe: TZQuery;
    sds_IncCidades: TZQuery;
    sds_OpenCidades: TZQuery;
    cds_CadCidades: TZQuery;
    sds_BuscaCidades: TZQuery;
    sds_Qry_Cidades: TZQuery;
    cds_Autores: TZQuery;
    sds_Qry_Nome: TZQuery;
    sds_OpenAutorList: TZQuery;
    sds_OpenAutorListCODIGO: TLongintField;
    sds_OpenAutorListCOD_CIDADE: TLongintField;
    sds_OpenAutorListCOD_DEPARTAMENTO: TLongintField;
    sds_OpenAutorListDATA: TDateField;
    sds_OpenAutorListINSTITUICAO: TStringField;
    sds_OpenAutorListNOME: TStringField;
    sds_OpenAutorListNOME_DEP: TStringField;
    sds_OpenAutorListOUTROS: TStringField;
    sds_OpenAssunt: TZQuery;
    sds_Assunt_Cad: TZQuery;
    cds_CadDep: TZQuery;
    sds_PesquiDep: TZQuery;
    sds_OpenDep: TZQuery;
    ZQArquivo: TZQuery;
    ZQryConsultaSetUser: TZQuery;
    ZQryConsultaSetAutores: TZQuery;
    ZQryCosultaAutores: TZQuery;
    ZQueryOpenAutores: TZQuery;
    ZQueryLogParam: TZQuery;
    ZQueryAssistente: TZQuery;
    ZQueryAssistenteACAO: TStringField;
    ZQueryAssistenteAPLICATIVO: TStringField;
    ZQueryAssistenteCODIGO: TLongintField;
    ZQueryAssistenteCOD_REGISTRO: TLongintField;
    ZQueryAssistenteCOD_USUARIO: TLongintField;
    ZQueryAssistenteDISCRIMINACAO: TStringField;
    ZQueryAssistenteHORA: TTimeField;
    ZQueryAssistenteINSERDATA: TDateField;
    ZQueryAssistenteNOME: TStringField;
    ZQueryLogParamACAO: TStringField;
    ZQueryLogParamAPLICATIVO: TStringField;
    ZQueryLogParamCODIGO: TLongintField;
    ZQueryLogParamCOD_ACAO: TLongintField;
    ZQueryLogParamCOD_REGISTRO: TLongintField;
    ZQueryLogParamCOD_USUARIO: TLongintField;
    ZQueryLogParamDISCRIMINACAO: TStringField;
    ZQueryLogParamHORA: TTimeField;
    ZQueryLogParamINSERDATA: TDateField;
    ZQueryLogParamNOME: TStringField;
    ZQueryOpenAutoresCODIGO: TLongintField;
    ZQueryOpenAutoresCOD_CIDADE: TLongintField;
    ZQueryOpenAutoresCOD_DEPARTAMENTO: TLongintField;
    ZQueryOpenAutoresDATA: TDateField;
    ZQueryOpenAutoresINSTITUICAO: TStringField;
    ZQueryOpenAutoresNOME: TStringField;
    ZQueryOpenAutoresNOME_CIDADE: TStringField;
    ZQueryOpenAutoresNOME_DEP: TStringField;
    ZQueryOpenAutoresOUTROS: TStringField;
    ZQueryOpenAutoresUF: TStringField;
    ZQueryRelatorioArquivo: TZQuery;
    ZQueryRelatorioArquivoDATA: TDateField;
    ZQueryRelatorioArquivoDESCRICAO: TStringField;
    ZQueryRelatorioArquivoHORA: TTimeField;
    ZQueryRelatorioArquivoID: TLongintField;
    ZQueryRelatorioArquivoNOME_ARQUIVO: TStringField;
    ZQueryRelatorioArquivoTITULO: TStringField;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    ZUpdateSQL3: TZUpdateSQL;
    ZUpdateSQL4: TZUpdateSQL;
    ZUpdateSQL5: TZUpdateSQL;
    ZUpdateSQL6: TZUpdateSQL;
    ZUpdateSQL7: TZUpdateSQL;
    ZUpdateSQLAutores: TZUpdateSQL;
    ZUpdateSQLCadDep: TZUpdateSQL;
    ZUpdateSQLCidades: TZUpdateSQL;
    ZUpdateSQL_User: TZUpdateSQL;
    procedure cds_AssuntNewRecord(DataSet: TDataSet);
    procedure cds_AutoresNewRecord(DataSet: TDataSet);
    procedure cds_CadCidadesNewRecord(DataSet: TDataSet);
    procedure cds_CadDepNewRecord(DataSet: TDataSet);
    procedure cds_ExcRepetidosNewRecord(DataSet: TDataSet);
    procedure cds_logadosBeforePost(DataSet: TDataSet);
    procedure cds_logadosNewRecord(DataSet: TDataSet);
    procedure cds_LogBeforePost(DataSet: TDataSet);
    procedure cds_LogNewRecord(DataSet: TDataSet);
    procedure cds_UserAddApplyUpdateError(DataSet: TDataSet;
      E: EDatabaseError; var DataAction: TDataAction);
    procedure cds_UserBeforePost(DataSet: TDataSet);
    procedure cds_UserNewRecord(DataSet: TDataSet);
    procedure frReportArquivoEnterRect(Memo: TStringList; View: TfrView);
    procedure frReportLogTodosGetValue(const ParName: string;
      var ParValue: variant);
    procedure ProgressBar1;
    procedure sdss_UserADMINISTRADORGetText(Sender: TField; var aText: string;
      DisplayText: boolean);
    procedure sds_lista_UsuariosFilterRecord(DataSet: TDataSet;
      var Accept: boolean);
    procedure SimpleDataSetUseNomeADMINISTRADORGetText(Sender: TField;
      var aText: string; DisplayText: boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure ZConnectionBeforeConnect(Sender: TObject);
    procedure ZQArquivoBeforePost(DataSet: TDataSet);
    procedure ZQArquivoNewRecord(DataSet: TDataSet);
    procedure VerificaErroCount;
  private

  public

    codigo: integer;
    codigoUser: integer;
    CodUser: integer;
    TipoUser: string;
    condNivel: integer;
    checado: integer;
    adminis: integer;
    codigoArqui: integer;
    codigoLogado: integer;
    cordoform: string;
    atual: string;
    function Remover(str: String): String;
    function leriniAtual(tabela_ini, campo_ini: string): string;
    function myColor: TColor;
    function lerini(tabela_ini, campo_ini: string): string;
    function VerificaUser(codigoParam: integer): boolean;
    function Verifica(codigoParam: integer): boolean;
    function COUNTDADOS: integer;
    function PreencheCombo: TStrings;
    function PreencheList: TStrings;
    function receberValor: integer;
    function receberUsuario: integer;
    function GetIP: string;

    procedure ExcluirAtual(CodUserUnic: integer);
    procedure IncrementaPersonalizado(Nome_Tabela: string; Chave_Primaria: TField);
    procedure gravariniAtual(tabela_ini, campo_ini, valor_ini: string);
    procedure gravarini(tabela_ini, campo_ini, valor_ini: string);

  end;

var
  DM: TDM;
  ComboTemp: integer;
  myresult: string;

implementation

{$R *.lfm}



uses UnCadArquivos, Unlogin, UnAbertura, uncadastrousuarios, unDlgPesquisaArquivo,
  Math, Printers;

function TDM.Remover(str: String): String;
var
   x: integer;
   st: AnsiString;
begin
st:='';
for x:=1 to length(str) do
    begin
    if (str[x] <> '%') then
    st:=st + str[x];
    end;
Remover:=st;
//st:='';
//for x:=1 to length(str) do
//    begin
//    if (str[x] <> '-') and
//       (str[x] <> '.') and
//       (str[x] <> ',') and
//       (str[x] <> '/') and
//       (str[x] <> '%') then
//    st:=st + str[x];
//    end;
//Remover:=st;
end;

procedure TDM.gravariniAtual(tabela_ini, campo_ini, valor_ini: string);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'atual.ini');
  ServerIni.WriteString(TABELA_INI, CAMPO_INI, VALOR_INI);
  ServerIni.UpdateFile;
  ServerIni.Free;
end;

procedure TDM.gravarini(tabela_ini, campo_ini, valor_ini: string);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'color.ini');
  ServerIni.WriteString(TABELA_INI, CAMPO_INI, VALOR_INI);
  ServerIni.UpdateFile;
  ServerIni.Free;
end;

procedure TDM.IncrementaPersonalizado(Nome_Tabela: string; Chave_Primaria: TField);
var
  Qry: TZQuery;
begin
  // if Chave_Primaria.DataSet.State <> dsInsert then
  // exit; // termina a execução caso não esteja em modo de inserção
  Qry := TZQuery.Create(nil); // cria uma instância do objeto
  try
    Qry.Connection := ZConnection; // componente de conexão
    Qry.SQL.Add('SELECT MAX(' + Chave_Primaria.FieldName + ') FROM ' + Nome_Tabela);
    Qry.Open;
    if (Qry.Fields[0].IsNull) or (Qry.Fields[0].AsInteger = 0) then
      // se a tabela está vazia retornará um valor inicial...
      Chave_Primaria.AsInteger := 1025
    // então este será o primeiro registro
    else
      Chave_Primaria.AsInteger := Qry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(Qry); // tira o objeto da memória
  end;
end;

procedure TDM.cds_LogNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('LOG', cds_LogCODIGO);
end;

procedure TDM.cds_UserAddApplyUpdateError(DataSet: TDataSet;
  E: EDatabaseError; var DataAction: TDataAction);
begin
  ShowMessage('Esse Usuário já Existe no Arquivo! ');
end;

procedure TDM.cds_UserBeforePost(DataSet: TDataSet);
begin
  checado := frmlogin.ADMIN;
  if cds_User.State = dsInsert then
  begin
    cds_UserDATA.Value := Date;

    if (checado = 0) then
    begin
      cds_UserADMINISTRADOR.Value := 0;
      cds_UserCOD_PERFIL.Value := 101;
      // sinal de erro na varificação ...
      cds_UserNIVEL.Value := 0;
      cds_UserTIPO_TODOS.Value := 0;
    end;
  end;
end;

procedure TDM.cds_UserNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('USUARIO', cds_UserCOD_USUARIO);
end;

function TDM.lerini(tabela_ini, campo_ini: string): string;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'color.ini');
  Result := ServerIni.ReadString(tabela_ini, campo_ini, '');
  ServerIni.Free;
end;

function TDM.leriniAtual(tabela_ini, campo_ini: string): string;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'atual.ini');
  Result := ServerIni.ReadString(tabela_ini, campo_ini, '');
  ServerIni.Free;
end;

procedure TDM.frReportArquivoEnterRect(Memo: TStringList; View: TfrView);
var
  bmp: TBitmap;
  pv: TfrPictureView;
  factor: double;
  R: TRect;
begin
  if Memo.Count = 0 then
    exit;
  if (Memo[0] = 'FrmDlgPesquisa.BarcodeQR1') and (View is TfrPictureView) then
  begin
    pv := View as TfrPictureView;
    factor := Max(Printer.XDpi, Printer.YDpi) / Screen.PixelsPerInch;
    bmp := TBitmap.Create;
    try
      bmp.Width := Round(pv.Width * factor);
      bmp.Height := Round(pv.Height * factor);

      R := Rect(0, 0, FrmDlgPesquisa.BarcodeQR1.Width, FrmDlgPesquisa.BarcodeQR1.Height);
      bmp.SetSize(FrmDlgPesquisa.BarcodeQR1.Width, FrmDlgPesquisa.BarcodeQR1.Height);
      // bmp.Canvas.Brush.Color := clWhite;
      bmp.Canvas.FillRect(R);
      FrmDlgPesquisa.BarcodeQR1.PaintOnCanvas(bmp.Canvas, R);
      //FrmDlgPesquisa.BarcodeQR1.Draw(
      //  TScaledCanvasDrawer.Create(bmp.Canvas, factor, [scaleFont, scalePen]),
      //  Rect(0, 0, bmp.Width, bmp.Height));
      pv.Picture.Bitmap.Assign(bmp);
    finally
      bmp.Free;
    end;
  end;

end;

procedure TDM.frReportLogTodosGetValue(const ParName: string; var ParValue: variant);
begin
  case ParName of
    'Num': ParValue := DM.ZQueryAssistente.RecordCount;
  end;
end;


procedure TDM.cds_LogBeforePost(DataSet: TDataSet);
begin
  if cds_Log.State = dsInsert then
    IncrementaPersonalizado('LOG', cds_LogCODIGO);
  cds_LogINSERDATA.Value := Date;
end;

procedure TDM.cds_logadosBeforePost(DataSet: TDataSet);
begin
  if cds_Logados.State = dsInsert then
    IncrementaPersonalizado('NUM_LOGADOS', cds_LogadosCODIGO);
  cds_LogadosDATAATUAL.Value := Date;
end;

procedure TDM.cds_logadosNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('NUM_LOGADOS', cds_LogadosCODIGO);
end;

procedure TDM.cds_ExcRepetidosNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('NUM_LOGADOS', cds_LogadosCODIGO);
end;

procedure TDM.cds_AssuntNewRecord(DataSet: TDataSet);
begin
  DM.IncrementaPersonalizado('ASSUNTO', cds_AssuntCODIGO);
end;

procedure TDM.cds_AutoresNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('Autores', cds_AutoresCODIGO);
end;

procedure TDM.cds_CadCidadesNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('Cidades', cds_CadCidadesCODIGO);
end;

procedure TDM.cds_CadDepNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('Departamentos', cds_CadDepCODIGO);
end;

procedure TDM.ZQArquivoBeforePost(DataSet: TDataSet);
var
  DataInserimento: string;
begin
  if FormArquivo.Dtsrc.DataSet.State = dsInsert then
  begin

    ZQArquivoDATA.Value := Date;
    // FormatDateTime('dd/MM/yyyy',StrToDate(DataInserimento));
    ZQArquivoHORA.Value := Time;
    // ZQArquivoHORA.Value:=TimeToStr(Time);  SQL SERVER ...

    ZQArquivoCOD_USUARIO.AsInteger := FrmLogin.COD_USUARIO;
  end;

end;

procedure TDM.ZQArquivoNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('ARQUIVOLIST', ZQArquivoID);
  ZQArquivoDATA.Value := Date;
  ZQArquivoHORA.Value := Time;

end;

procedure TDM.ProgressBar1;
begin
  Abertura.plGauge1.MaxValue := sdt_Combo.RecordCount;
  sdt_Combo.First;
  if not sdt_Combo.EOF then
    repeat
      Abertura.plGauge1.Progress := Abertura.plGauge1.Progress + 1;
      Sleep(1000);
      sdt_Combo.Next;
    until sdt_Combo.EOF;
end;

procedure TDM.sdss_UserADMINISTRADORGetText(Sender: TField; var aText: string;
  DisplayText: boolean);
begin
  if DisplayText then
  begin
    if Sender.Value = 1 then
      aText := 'Administrador'
    else if Sender.Value = 0 then
      aText := 'Usuário';
  end;
end;



procedure TDM.sds_lista_UsuariosFilterRecord(DataSet: TDataSet; var Accept: boolean);
begin
  {  Accept := False;
  if (sds_User_Usuarios['IDUSUARIOS'] = frmlogin.COD_USUARIO) then
  begin
    Accept := True;
  end; }
end;

procedure TDM.SimpleDataSetUseNomeADMINISTRADORGetText(Sender: TField;
  var aText: string; DisplayText: boolean);
begin
  if DisplayText then
  begin
    if Sender.Value = 1 then
      aText := 'Administrador'
    else if Sender.Value = 0 then
      aText := 'Usuário';
  end;
end;

procedure TDM.Timer1Timer(Sender: TObject);
begin
  ProgressBar1;
end;

procedure TDM.ZConnectionBeforeConnect(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'String_Conexao.ini');
  try
    ZConnection.Connected := False;
    ZConnection.HostName := Ini.ReadString('ZConnection', 'Hostname', '');
    ZConnection.Port := Ini.ReadInteger('ZConnection', 'Port', 0);
    ZConnection.Protocol := Ini.ReadString('ZConnection', 'Protocol', '');
    ZConnection.LibraryLocation :=
      Ini.ReadString('ZConnection', 'LibraryLocation', '');
    ZConnection.User := Ini.ReadString('ZConnection', 'User', '');
    ZConnection.Password := Ini.ReadString('ZConnection', 'Password', '');
    ZConnection.Database := Ini.ReadString('ZConnection', 'Database', '');
    ZConnection.ClientCodepage := Ini.ReadString('ZConnection', 'Charset', '');
    ZConnection.AutoEncodeStrings := False;


  except
    on E: Exception do
      MessageDlg('Erro ao conectar Banco!'#13'Erro: ', mtError, [mbOK], 0);
  end;
end;

function TDM.PreencheCombo: TStrings;
var
  aStr: TStrings;
begin
  aStr := TStringList.Create;
  sdt_Combo.Close;
  sdt_Combo.SQL.Add('select LOGIN from USUARIO order by LOGIN');
  sdt_Combo.Open;
  sdt_Combo.First;
  ComboTemp := sdt_Combo.RecordCount;
  while not sdt_Combo.EOF do
  begin
    aStr.Add(sdt_Combo.FieldByName('LOGIN').AsString);
    sdt_Combo.Next;
  end;
  Result := aStr;
end;

function TDM.PreencheList: TStrings;
var
  Str: TStrings;
begin
  Str := TStringList.Create;
  sdt_List.Close;
  sdt_List.SQL.Add('select COD_USUARIO, NOME from USUARIO order by NOME');
  sdt_List.Open;
  sdt_List.First;
  while not sdt_List.EOF do
  begin
    // Str.Add(sdt_List.FieldByName('COD_USUARIO').AsString);
    Str.Add(sdt_List.FieldByName('NOME').AsString);
    sdt_List.Next;
  end;
  Result := Str;
end;

function TDM.VerificaUser(codigoParam: integer): boolean;
begin
  Result := False;
  sdt_Verif.Close;
  sdt_Verif.SQL.Clear;
  sdt_Verif.SQL.Add('select COD_USUARIO,NIVEL from USUARIO ' +
    'where COD_USUARIO = ' + IntToStr(codigoParam));
  sdt_Verif.Open;
  with sdt_Verif do
  begin
    if not sdt_Verif.IsEmpty then
    begin
      if (Fields[1].AsInteger = 1) then
      begin
        Result := True;
      end
      else
        Result := False;
    end;
  end;
end;

function TDM.Verifica(codigoParam: integer): boolean;
begin
  Result := False;
  sds_Verif.Close;
  sds_Verif.SQL.Clear;
  sds_Verif.SQL.Add('select CODIGO,COD_USUARIO from NUM_LOGADOS ' +
    ' where COD_USUARIO = ' + IntToStr(codigoParam));

  sds_Verif.Open;

  with sds_Verif do
  begin
    if (RecordCount = 0) then
    begin
      Result := False;
    end
    else if (RecordCount >= 1) then
    begin
      Result := True;
    end;
  end;
end;

procedure TDM.ExcluirAtual(CodUserUnic: integer);
begin
  CodUserUnic := frmlogin.COD_USUARIO;
  try
    sdt_ExcAtual.Close;
    sdt_ExcAtual.SQL.Clear;
    sdt_ExcAtual.SQL.Add('delete from NUM_LOGADOS ' + ' where COD_USUARIO = ' +
      IntToStr(CodUser));
    sdt_ExcAtual.Open;
  except
    on E: Exception do
    begin
      MessageDlg
      ('Erro de instrução SQL ou Algum problema no Banco ou Usuário inadequado !'
        + #13 + 'Mensagem nativa do erro é : ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TDM.VerificaErroCount;
begin

  Qry_Secun.Close;
  Qry_Secun.SQL.Clear;
  Qry_Secun.SQL.Add('select COD_USUARIO from NUM_LOGADOS ' +
    ' where COD_USUARIO = 0');
  Qry_Secun.Open;
  if Qry_Secun.RecordCount >= 1 then
  begin
    try
      try
        DM.cds_ExcRepetidos.Close;
        DM.cds_ExcRepetidos.Params[0].AsInteger := 0;
        DM.cds_ExcRepetidos.Open;
      finally
        Dtsrc_Logando.DataSet.Delete;
        //(Dtsrc_Logando.DataSet as TClientDataSet).ApplyUpdates(0);
      end;
    except
      on E: Exception do
      begin
        MessageDlg
        ('Algum procedimento falhou na procedure de verificar erros de Logandos !'
          + #13 + 'Mensagem nativa da procedure : ' + E.Message, mtError,
          [mbOK], 0);
      end;
    end;
  end;
end;



function TDM.COUNTDADOS: integer;
var
  respMaxLogados: integer;
begin
  Result := 0;
  respMaxLogados := 0;
  try
    // DM.sds_AnteCount.Close;
    //   DM.sds_AnteCount.DataSet.CommandText := '';
    //  DM.sds_AnteCount.DataSet.CommandText := 'select COUNT(*) from NUM_LOGADOS ';
    //  DM.sds_AnteCount.Open;
    // respMaxLogados := DM.sds_AnteCount.Fields[0].AsInteger;
  except
    on E: Exception do
    begin
      MessageDlg
      ('Erro ao montar a instrução SQL[MAX] ou algum parametro de linha inconsistente !'
        + #13 + 'Mensagem Nativa do Erro : ' + E.Message, mtError, [mbOK], 0);
      Abort;
    end
    else
    begin
      Result := respMaxLogados;
    end;
  end;
end;

function TDM.receberValor: integer;
var
  temp: integer;
begin
  temp := frmlogin.ADMIN;
  Result := temp;
end;

function TDM.receberUsuario: integer;
var
  temp: integer;
begin
  temp := frmlogin.COD_USUARIO;
  Result := temp;
end;

function TDM.GetIP: string;
  //--> Declare a Winsock na clausula uses da unit
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Nome: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Nome, 255);
  Gethostname(PChar(Nome), 255);
  SetLength(Nome, StrLen(PChar(Nome)));
  HostEnt := gethostbyname(PChar(Nome));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d', [byte(h_addr^[0]), byte(h_addr^[1]),
      byte(h_addr^[2]), byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

function myHexToColor(AValue: string): TColor;
var
  iRed: integer;
  iGreen: integer;
  iBlue: integer;
begin
  iRed := StrToInt('$' + AValue[1] + AValue[2]);
  iGreen := StrToInt('$' + AValue[3] + AValue[4]);
  iBlue := StrToInt('$' + AValue[5] + AValue[6]);
  Result := RGB(iRed, iGreen, iBlue);
  myresult := ColortoString(Result);
end;

function TDM.myColor: TColor;
var
  temp: TColor;
  vartemp: string;
begin
  temp := StringToColor(DM.lerini('TCOLOR', 'CORTCOLOR'));
  vartemp := ColorToString(temp);
  try
    if (DM.lerini('TCOLOR', 'ATUAL') = 'TRUE') and
      (DM.lerini('HEX', 'ATUAL') = 'FALSE') then
    begin
      if (Copy(vartemp, 0, 2) = 'cl') then
      begin
        Result := temp;
      end;
    end
    else
    if (DM.lerini('HEX', 'ATUAL') = 'TRUE') and
      (DM.lerini('TCOLOR', 'ATUAL') = 'FALSE') then
    begin
      temp := myHexToColor(trim(StringReplace(
        (DM.lerini('HEX', 'CORHEX')), '#', '', [rfReplaceall])));
      Result := temp;
    end;
  except
    on e: Exception do
    begin
      MessageDlg('Erro ao Ler arquivo INI! ' + '#13' + 'Mensagem nativa do Erro: ' +
        e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

end.
