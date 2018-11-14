unit UDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, FMTBcd, Provider, SimpleDS,
  MidasLib, ComCtrls, DBCtrls, Controls, StdCtrls,
  WideStrings,
  DBXFirebird, DBXPool, Data.DBXMsSQL, Datasnap.DBClient, frxClass, frxDBSet,
  frxExportPDF, frxGradient, frxDesgn;

type
  TDM = class(TDataModule)
    sdt_Combo: TSQLDataSet;
    dst_Login_Con: TSQLDataSet;
    sdss_User: TSimpleDataSet;
    sdss_UserCOD_USUARIO: TIntegerField;
    sdss_UserNOME: TStringField;
    sdss_UserLOGIN: TStringField;
    sdss_UserSENHA: TStringField;
    sdss_UserNOMEL: TStringField;
    sdss_UserADMINISTRADOR: TIntegerField;
    sdsss_User: TSimpleDataSet;
    sdsss_UserCOD_USUARIO: TIntegerField;
    sdsss_UserNOME: TStringField;
    sdsss_UserLOGIN: TStringField;
    sdsss_UserSENHA: TStringField;
    sdsss_UserNOMEL: TStringField;
    sdsss_UserADMINISTRADOR: TIntegerField;
    sds_Open: TSimpleDataSet;
    sds_OpenCOD_USUARIO: TIntegerField;
    sds_OpenNOME: TStringField;
    sds_OpenLOGIN: TStringField;
    sds_OpenSENHA: TStringField;
    sds_OpenLEMBRAR_SENHA: TStringField;
    sds_OpenNIVEL: TIntegerField;
    sds_OpenCOD_PERFIL: TIntegerField;
    sds_OpenADMINISTRADOR: TIntegerField;
    sds_OpenNOMEL: TStringField;
    sds_Cont: TSimpleDataSet;
    sdt_Verif: TSQLDataSet;
    sdt_User: TSQLDataSet;
    sdt_UserCOD_USUARIO: TIntegerField;
    sdt_UserNOME: TStringField;
    sdt_UserLOGIN: TStringField;
    sdt_UserSENHA: TStringField;
    sdt_UserLEMBRAR_SENHA: TStringField;
    sdt_UserNIVEL: TIntegerField;
    sdt_UserCOD_PERFIL: TIntegerField;
    sdt_UserADMINISTRADOR: TIntegerField;
    sdt_UserNOMEL: TStringField;
    dsp_User: TDataSetProvider;
    cds_User: TClientDataSet;
    cds_UserCOD_USUARIO: TIntegerField;
    cds_UserNOME: TStringField;
    cds_UserLOGIN: TStringField;
    cds_UserSENHA: TStringField;
    cds_UserLEMBRAR_SENHA: TStringField;
    cds_UserNIVEL: TIntegerField;
    cds_UserCOD_PERFIL: TIntegerField;
    cds_UserADMINISTRADOR: TIntegerField;
    cds_UserNOMEL: TStringField;
    sdt_User_Cod: TSQLDataSet;
    sdt_User_CodCOD_USUARIO: TIntegerField;
    sdt_User_CodNOME: TStringField;
    sdt_User_CodLOGIN: TStringField;
    sdt_User_CodSENHA: TStringField;
    sdt_User_CodLEMBRAR_SENHA: TStringField;
    sdt_User_CodDATA: TDateField;
    sdt_User_CodNIVEL: TIntegerField;
    sdt_User_CodCOD_PERFIL: TIntegerField;
    sdt_User_CodADMINISTRADOR: TIntegerField;
    dsp_UserCod: TDataSetProvider;
    cds_UserCod: TClientDataSet;
    cds_UserCodCOD_USUARIO: TIntegerField;
    cds_UserCodNOME: TStringField;
    cds_UserCodLOGIN: TStringField;
    cds_UserCodSENHA: TStringField;
    cds_UserCodLEMBRAR_SENHA: TStringField;
    cds_UserCodDATA: TDateField;
    cds_UserCodNIVEL: TIntegerField;
    cds_UserCodCOD_PERFIL: TIntegerField;
    cds_UserCodADMINISTRADOR: TIntegerField;
    qry_script: TSQLQuery;
    sds_UserCod: TSimpleDataSet;
    sds_UserCodCOD_USUARIO: TIntegerField;
    sds_UserCodNOME: TStringField;
    sds_UserCodLOGIN: TStringField;
    sds_UserCodSENHA: TStringField;
    sds_UserCodNOMEL: TStringField;
    sds_UserCodADMINISTRADOR: TIntegerField;
    dsp_scrpt: TDataSetProvider;
    cds_script: TClientDataSet;
    sds_Log_I: TSimpleDataSet;
    sds_Report_Detalhe: TSimpleDataSet;
    sds_Report_DetalheID: TIntegerField;
    sds_Report_DetalheCOD_USUARIO: TIntegerField;
    sds_Report_DetalheTITULOASSUN: TStringField;
    sds_Report_DetalheNOME: TStringField;
    sds_Report_DetalheDESCRICAO: TStringField;
    sds_Report_DetalheNOME_ARQUIVO: TStringField;
    sds_Report_DetalheINFORMACOES: TMemoField;
    sds_Report_DetalheLOGIN: TStringField;
    sds_Report_DetalheNIVEL: TIntegerField;
    sds_Report_DetalheNOME_1: TStringField;
    sdt_Assunt: TSQLDataSet;
    sdt_AssuntCODIGO: TIntegerField;
    sdt_AssuntCURSO: TStringField;
    sdt_AssuntDATA: TDateField;
    sdt_AssuntTITULOASSUN: TStringField;
    dsp_Assunt: TDataSetProvider;
    cds_Assunt: TClientDataSet;
    cds_AssuntCODIGO: TIntegerField;
    cds_AssuntCURSO: TStringField;
    cds_AssuntDATA: TDateField;
    cds_AssuntTITULOASSUN: TStringField;
    sds_Assunt: TSimpleDataSet;
    sds_AssuntCODIGO: TIntegerField;
    sds_AssuntTITULOASSUN: TStringField;
    sds_Assunt_Cad: TSimpleDataSet;
    sds_Assunt_CadCODIGO: TIntegerField;
    sds_Assunt_CadTITULOASSUN: TStringField;
    sds_OpenAssunt: TSimpleDataSet;
    sds_OpenAssuntCODIGO: TIntegerField;
    sds_OpenAssuntTITULOASSUN: TStringField;
    sds_OpenAssuntDATA: TDateField;
    sds_OpenAssuntCURSO: TStringField;
    sdt_Autores: TSQLDataSet;
    dsp_Autores: TDataSetProvider;
    cds_Autores: TClientDataSet;
    sdt_AutoresCODIGO: TIntegerField;
    sdt_AutoresNOME: TStringField;
    sdt_AutoresINSTITUICAO: TStringField;
    sdt_AutoresCOD_DEPARTAMENTO: TIntegerField;
    sdt_AutoresCOD_CIDADE: TIntegerField;
    sdt_AutoresDATA: TDateField;
    sdt_AutoresOUTROS: TStringField;
    sdt_AutoresNOME_DEP: TStringField;
    sdt_AutoresNOME_CIDADE: TStringField;
    sdt_AutoresUF: TStringField;
    cds_AutoresCODIGO: TIntegerField;
    cds_AutoresNOME: TStringField;
    cds_AutoresINSTITUICAO: TStringField;
    cds_AutoresCOD_DEPARTAMENTO: TIntegerField;
    cds_AutoresCOD_CIDADE: TIntegerField;
    cds_AutoresDATA: TDateField;
    cds_AutoresOUTROS: TStringField;
    cds_AutoresNOME_DEP: TStringField;
    cds_AutoresNOME_CIDADE: TStringField;
    cds_AutoresUF: TStringField;
    sds_Qry_Nome: TSimpleDataSet;
    sds_OpenAutorList: TSimpleDataSet;
    sds_Cont_Logar: TSimpleDataSet;
    sds_Qry_Cidades: TSimpleDataSet;
    sds_Qry_CidadesCODIGO: TIntegerField;
    sds_Qry_CidadesNOME_CIDADE: TStringField;
    sds_Qry_CidadesUF: TStringField;
    sds_Autores: TSimpleDataSet;
    sds_AnteCount: TSimpleDataSet;
    sds_AutoresCODIGO: TIntegerField;
    sds_AutoresNOME: TStringField;
    sds_AutoresINSTITUICAO: TStringField;
    sds_AutoresCOD_DEPARTAMENTO: TIntegerField;
    sds_AutoresNOME_DEP: TStringField;
    sds_OpenAutorListCODIGO: TIntegerField;
    sds_OpenAutorListNOME: TStringField;
    sds_OpenAutorListINSTITUICAO: TStringField;
    sds_OpenAutorListCOD_DEPARTAMENTO: TIntegerField;
    sds_OpenAutorListCOD_CIDADE: TIntegerField;
    sds_OpenAutorListDATA: TDateField;
    sds_OpenAutorListOUTROS: TStringField;
    sds_OpenAutorListNOME_DEP: TStringField;
    sds_TempLogado: TSimpleDataSet;
    sdt_Logados: TSQLDataSet;
    sdt_LogadosCODIGO: TIntegerField;
    sdt_LogadosORDEM: TIntegerField;
    sdt_LogadosCOD_USUARIO: TIntegerField;
    dsp_Logados: TDataSetProvider;
    cds_Logados: TClientDataSet;
    cds_LogadosCODIGO: TIntegerField;
    cds_LogadosORDEM: TIntegerField;
    cds_LogadosCOD_USUARIO: TIntegerField;
    DtsrcLogados: TDataSource;
    Qry_Secun: TSQLQuery;
    sdt_ExcAtual: TSQLDataSet;
    sdt_ExcAtualCOD_USUARIO: TIntegerField;
    sdt_ExcAtualCODIGO: TIntegerField;
    sdt_ExcAtualORDEM: TIntegerField;
    sdt_ExcUser: TSQLDataSet;
    sdt_ExcUserCOD_USUARIO: TIntegerField;
    sdt_ExcUserCODIGO: TIntegerField;
    sdt_ExcUserORDEM: TIntegerField;
    dsp_ExcUser: TDataSetProvider;
    cds_ExcUser: TClientDataSet;
    cds_ExcUserCOD_USUARIO: TIntegerField;
    cds_ExcUserCODIGO: TIntegerField;
    cds_ExcUserORDEM: TIntegerField;
    sdt_ExcRepetidos: TSQLDataSet;
    sdt_ExcRepetidosCOD_USUARIO: TIntegerField;
    sdt_ExcRepetidosCODIGO: TIntegerField;
    sdt_ExcRepetidosORDEM: TIntegerField;
    dsp_ExcRepetidos: TDataSetProvider;
    cds_ExcRepetidos: TClientDataSet;
    cds_ExcRepetidosCOD_USUARIO: TIntegerField;
    cds_ExcRepetidosCODIGO: TIntegerField;
    cds_ExcRepetidosORDEM: TIntegerField;
    sdt_CadDep: TSQLDataSet;
    dsp_CadDep: TDataSetProvider;
    cds_CadDep: TClientDataSet;
    cds_CadDepCODIGO: TIntegerField;
    cds_CadDepNOME_DEP: TStringField;
    cds_CadDepDATA: TDateField;
    Dtsrc_Logando: TDataSource;
    sds_RecordCountParams: TSimpleDataSet;
    sds_RecordCountParamsCOD_USUARIO: TIntegerField;
    sds_RecordCountParamsCODIGO: TIntegerField;
    sds_RecordCountParamsDATAATUAL: TDateField;
    sds_RecordCountParamsORDEM: TIntegerField;
    sds_OpenDep: TSimpleDataSet;
    sds_OpenDepCODIGO: TIntegerField;
    sds_OpenDepNOME_DEP: TStringField;
    sds_OpenDepDATA: TDateField;
    sds_PesquiDep: TSimpleDataSet;
    sds_PesquiDepCODIGO: TIntegerField;
    sds_PesquiDepNOME_DEP: TStringField;
    sds_PesquiDepDATA: TDateField;
    Qury: TSQLQuery;
    sdt_Log: TSQLDataSet;
    dsp_Log: TDataSetProvider;
    cds_Log: TClientDataSet;
    sds_Verif: TSimpleDataSet;
    DtsrcExcLogados: TDataSource;
    sdt_Arquivo: TSQLDataSet;
    dsp_Arquivo: TDataSetProvider;
    cds_Arquivo: TClientDataSet;
    sdt_ArquivoID: TIntegerField;
    sdt_ArquivoCOD_USUARIO: TIntegerField;
    sdt_ArquivoCOD_ASSUNTO: TIntegerField;
    sdt_ArquivoCOD_AUTOR: TIntegerField;
    sdt_ArquivoTITULO: TStringField;
    sdt_ArquivoNOME_ARQUIVO: TStringField;
    sdt_ArquivoEXTENCAO: TStringField;
    sdt_ArquivoDESCRICAO: TStringField;
    sdt_ArquivoHORA: TTimeField;
    sdt_ArquivoDADOS: TBlobField;
    sdt_ArquivoTAMANHO: TStringField;
    sdt_ArquivoINFORMACOES: TMemoField;
    sdt_ArquivoTITULOASSUN: TStringField;
    sdt_ArquivoNOME: TStringField;
    cds_ArquivoID: TIntegerField;
    cds_ArquivoCOD_USUARIO: TIntegerField;
    cds_ArquivoCOD_ASSUNTO: TIntegerField;
    cds_ArquivoCOD_AUTOR: TIntegerField;
    cds_ArquivoTITULO: TStringField;
    cds_ArquivoNOME_ARQUIVO: TStringField;
    cds_ArquivoEXTENCAO: TStringField;
    cds_ArquivoDESCRICAO: TStringField;
    cds_ArquivoHORA: TTimeField;
    cds_ArquivoDADOS: TBlobField;
    cds_ArquivoTAMANHO: TStringField;
    cds_ArquivoINFORMACOES: TMemoField;
    cds_ArquivoTITULOASSUN: TStringField;
    cds_ArquivoNOME: TStringField;
    sdt_CadCidades: TSQLDataSet;
    dsp_CadCidades: TDataSetProvider;
    cds_CadCidades: TClientDataSet;
    sdt_CadCidadesCODIGO: TIntegerField;
    sdt_CadCidadesNOME_CIDADE: TStringField;
    sdt_CadCidadesUF: TStringField;
    cds_CadCidadesCODIGO: TIntegerField;
    cds_CadCidadesNOME_CIDADE: TStringField;
    cds_CadCidadesUF: TStringField;
    sdt_CadCidadesDATA: TDateField;
    cds_CadCidadesDATA: TDateField;
    sds_BuscaCidades: TSimpleDataSet;
    sds_OpenCidades: TSimpleDataSet;
    sds_OpenCidadesCODIGO: TIntegerField;
    sds_OpenCidadesNOME_CIDADE: TStringField;
    sds_OpenCidadesUF: TStringField;
    sds_OpenCidadesDATA: TDateField;
    sds_IncCidades: TSimpleDataSet;
    DSCidades: TDataSource;
    sds_BuscaCidadesCODIGO: TIntegerField;
    sds_BuscaCidadesNOME_CIDADE: TStringField;
    sds_Qry_CidadesDATA: TDateField;
    sds_Qry_NomeCODIGO: TIntegerField;
    sds_Qry_NomeNOME_DEP: TStringField;
    sds_Qry_NomeDATA: TDateField;
    sdt_CadDepCODIGO: TIntegerField;
    sdt_CadDepNOME_DEP: TStringField;
    sdt_CadDepDATA: TDateField;
    sdt_ArquivoSIZE_ARQUIVO: TSingleField;
    cds_ArquivoSIZE_ARQUIVO: TSingleField;
    sds_BuscaCidadesDATA: TDateField;
    sdt_List: TSimpleDataSet;
    TESTE: TSimpleDataSet;
    TESTECOD_USUARIO: TIntegerField;
    TESTENOME: TStringField;
    sds_Arqu: TSimpleDataSet;
    SQLConnection: TSQLConnection;
    sdt_LogCODIGO: TIntegerField;
    sdt_LogCOD_USUARIO: TIntegerField;
    sdt_LogHORA: TTimeField;
    sdt_LogCOD_ACAO: TIntegerField;
    sdt_LogACAO: TStringField;
    sdt_LogAPLICATIVO: TStringField;
    sdt_LogCOD_REGISTRO: TIntegerField;
    sdt_LogDISCRIMINACAO: TStringField;
    cds_LogCODIGO: TIntegerField;
    cds_LogCOD_USUARIO: TIntegerField;
    cds_LogHORA: TTimeField;
    cds_LogCOD_ACAO: TIntegerField;
    cds_LogACAO: TStringField;
    cds_LogAPLICATIVO: TStringField;
    cds_LogCOD_REGISTRO: TIntegerField;
    cds_LogDISCRIMINACAO: TStringField;
    dst_Login: TSQLDataSet;
    sdt_UserAdd: TSQLDataSet;
    sdt_UserAddIDARQUIVOS: TIntegerField;
    sdt_UserAddIDUSUARIOS: TIntegerField;
    sdt_UserAddNOME: TStringField;
    dsp_UserAdd: TDataSetProvider;
    sds_lista_Usuarios: TSimpleDataSet;
    cds_UserAdd: TClientDataSet;
    sds_listaAdd: TSimpleDataSet;
    sds_listaAddCOD_USUARIO: TIntegerField;
    sds_listaAddNOME: TStringField;
    sds_lista_UsuariosCOD_USUARIO: TIntegerField;
    sds_lista_UsuariosNOME: TStringField;
    sds_lista_UsuariosIDARQUIVOS: TIntegerField;
    sds_lista_UsuariosIDUSUARIOS: TIntegerField;
    sdt_UserTIPO_TODOS: TIntegerField;
    cds_UserTIPO_TODOS: TIntegerField;
    sds_ArquTodos: TSimpleDataSet;
    sds_ArquTodosID: TIntegerField;
    sds_ArquTodosCOD_USUARIO: TIntegerField;
    sds_ArquTodosDESCRICAO: TStringField;
    sds_ArquTodosNOME_ARQUIVO: TStringField;
    sds_ArquTodosLOGIN: TStringField;
    sds_ArquTodosNIVEL: TIntegerField;
    sds_ArquTodosNOME: TStringField;
    sds_ArquTodosTITULO: TStringField;
    cds_UserAddIDARQUIVOS: TIntegerField;
    cds_UserAddIDUSUARIOS: TIntegerField;
    cds_UserAddNOME: TStringField;
    sds_OpenTIPO_TODOS: TIntegerField;
    sds_view_todos: TSimpleDataSet;
    sds_view_todosID: TIntegerField;
    sds_view_todosCOD_ASSUNTO: TIntegerField;
    sds_view_todosCOD_USUARIO: TIntegerField;
    sds_view_todosDESCRICAO: TStringField;
    sds_view_todosTITULO: TStringField;
    sds_view_todosNOME_ARQUIVO: TStringField;
    sds_view_todosLOGIN: TStringField;
    sds_view_todosNIVEL: TIntegerField;
    sds_view_todosNOME: TStringField;
    sds_view_todosTITULOASSUN: TStringField;
    sds_view: TSimpleDataSet;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    sds_Report_DetalheADMINISTRADOR: TIntegerField;
    frxGradientObject1: TfrxGradientObject;
    frxDesigner1: TfrxDesigner;
    sds_view_todosDATA: TStringField;
    sdt_LogINSERDATA: TDateField;
    cds_LogINSERDATA: TDateField;
    sdt_LogadosDATAATUAL: TDateField;
    cds_LogadosDATAATUAL: TDateField;
    sdt_ArquivoDATA: TDateField;
    cds_ArquivoDATA: TDateField;
    sdt_UserDATA: TDateField;
    cds_UserDATA: TDateField;
    sds_OpenDATA: TDateField;
    sdt_ExcUserDATAATUAL: TDateField;
    cds_ExcUserDATAATUAL: TDateField;
    sdt_ExcRepetidosDATAATUAL: TDateField;
    cds_ExcRepetidosDATAATUAL: TDateField;
    SimpleDataSetUseNome: TSimpleDataSet;
    SimpleDataSetUseNomeCOD_USUARIO: TIntegerField;
    SimpleDataSetUseNomeNOME: TStringField;
    SimpleDataSetUseNomeLOGIN: TStringField;
    SimpleDataSetUseNomeSENHA: TStringField;
    SimpleDataSetUseNomeADMINISTRADOR: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    function PreencheCombo: TStrings;
    function PreencheList: TStrings;
    function receberValor: Integer;
    function receberUsuario: Integer;
    procedure cds_UserReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_UserNewRecord(DataSet: TDataSet);
    procedure sds_ViewFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cds_AssuntNewRecord(DataSet: TDataSet);
    procedure cds_AutoresNewRecord(DataSet: TDataSet);
    procedure cds_LogadosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_scriptReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_AssuntFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure sds_Assunt_CadFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cds_UserBeforePost(DataSet: TDataSet);
    procedure cds_UserCodReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_AutoresFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure sds_OpenAutorListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cds_LogadosNewRecord(DataSet: TDataSet);
    procedure cds_LogNewRecord(DataSet: TDataSet);
    procedure cds_ArquivoNewRecord(DataSet: TDataSet);
    procedure cds_ArquivoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_ArquivoBeforePost(DataSet: TDataSet);
    procedure sds_OpenCidadesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cds_CadCidadesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_CadCidadesNewRecord(DataSet: TDataSet);
    procedure sds_BuscaCidadesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sds_Qry_NomeFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure sds_Qry_CidadesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sds_OpenAssuntFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sds_OpenDepFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure sds_PesquiDepFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cds_CadDepNewRecord(DataSet: TDataSet);
    procedure cds_CadDepReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sdt_ListFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cds_LogBeforePost(DataSet: TDataSet);
    procedure cds_LogadosBeforePost(DataSet: TDataSet);
    procedure sds_lista_UsuariosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_listaAddReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_lista_UsuariosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cds_UserAddReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure sds_Report_DetalheADMINISTRADORGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private

  public
    codigo: Integer;
    codigoUser: Integer;
    CodUser: Integer;
    TipoUser: string;
    condNivel: Integer;
    checado: Integer;
    adminis: Integer;
    codigoArqui: Integer;
    codigoLogado: Integer;
    Function VerificaUser(codigoParam: Integer): Boolean;
    Function Verifica(codigoParam: Integer): Boolean;
    Function COUNTDADOS: Integer;
    procedure IncrementaPersonalizado(Nome_Tabela: String;
      Chave_Primaria: TField);
    procedure Gauge;
    procedure VerificaErroCount;
    procedure ExcluirAtual(CodUser: Integer);
  end;

var
  DM: TDM;
  StrLogin: string;
  numNivel: Integer;
  num: Integer;
  admarq, codArqu: Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses Dialogs, UProjeto, Unlogin, UnContrUser, UnConsultaEspecial, UnAbertura;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  SQLConnection.ConnectionName := 'OPENARQUIVOS';
  SQLConnection.DriverName := 'FireBird';
  SQLConnection.GetDriverFunc := 'getSQLDriverInterBase';
  SQLConnection.LibraryName := 'dbxfb.dll';
  SQLConnection.VendorLib := 'fbclient.dll';
  SQLConnection.LoadParamsFromIniFile('dbxConnections.ini');
  SQLConnection.Open;

end;

procedure TDM.IncrementaPersonalizado(Nome_Tabela: String;
  Chave_Primaria: TField);
var
  Qry: TSQLQuery;
begin
  // if Chave_Primaria.DataSet.State <> dsInsert then
  // exit; // termina a execução caso não esteja em modo de inserção
  Qry := TSQLQuery.Create(nil); // cria uma instância do objeto
  try
    Qry.SQLConnection := SQLConnection; // componente de conexão
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

procedure TDM.Gauge;
begin
  Abertura.Gauge1.MaxValue := sdt_Combo.RecordCount;
  sdt_Combo.First;
  if not sdt_Combo.Eof then
    repeat
      Abertura.Gauge1.Progress := Abertura.Gauge1.Progress + 1;
      Sleep(1000);
      sdt_Combo.Next
    until sdt_Combo.Eof;
end;

function TDM.PreencheCombo: TStrings;
var
  aStr: TStrings;
begin
  aStr := TStringList.Create;
  sdt_Combo.Close;
  sdt_Combo.CommandText := 'select LOGIN from USUARIO order by LOGIN';
  sdt_Combo.Open;
  sdt_Combo.First;
  while not sdt_Combo.Eof do
  begin
    aStr.Add(sdt_Combo.FieldByname('LOGIN').AsString);
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
  sdt_List.DataSet.CommandText :=
    'select COD_USUARIO, NOME from USUARIO order by NOME';
  sdt_List.Open;
  sdt_List.First;
  while not sdt_List.Eof do
  begin
    // Str.Add(sdt_List.FieldByName('COD_USUARIO').AsString);
    Str.Add(sdt_List.FieldByname('NOME').AsString);
    sdt_List.Next;
  end;
  Result := Str;
end;

Function TDM.VerificaUser(codigoParam: Integer): Boolean;
begin
  Result := False;
  sdt_Verif.Close;
  sdt_Verif.CommandText := '';
  sdt_Verif.CommandText := 'select COD_USUARIO,NIVEL from USUARIO ' +
    'where COD_USUARIO = ' + IntToStr(codigoParam);
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

Function TDM.Verifica(codigoParam: Integer): Boolean;
begin
  Result := False;
  sds_Verif.Close;
  sds_Verif.DataSet.CommandText := '';
  sds_Verif.DataSet.CommandText := 'select CODIGO,COD_USUARIO from NUM_LOGADOS '
    + ' where COD_USUARIO = ' + IntToStr(codigoParam);

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
    end
  end;
end;

procedure TDM.ExcluirAtual(CodUser: Integer);
begin
  CodUser := frmlogin.COD_USUARIO;
  try
    sdt_ExcAtual.Close;
    sdt_ExcAtual.CommandText := '';
    sdt_ExcAtual.CommandText := 'delete from NUM_LOGADOS ' +
      ' where COD_USUARIO = ' + IntToStr(CodUser);
    sdt_ExcAtual.Open;
  Except
    on E: Exception do
    begin
      MessageDlg
        ('Erro de instrução SQL ou Algum problema no Banco ou Usuário inadequado !'
        + #13 + 'Mensagem nativa do erro é : ' + E.Message, mtError, [mbOk], 0);
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
        (Dtsrc_Logando.DataSet as TClientDataSet).ApplyUpdates(0);
      end;
    Except
      on E: Exception do
      begin
        MessageDlg
          ('Algum procedimento falhou na procedure de verificar erros de Logandos !'
          + #13 + 'Mensagem nativa da procedure : ' + E.Message, mtError,
          [mbOk], 0);
      end;
    end;
  end;
end;

Function TDM.COUNTDADOS: Integer;
var
  respMaxLogados: Integer;
begin
  Result := 0;
  respMaxLogados := 0;
  try
    DM.sds_AnteCount.Close;
    DM.sds_AnteCount.DataSet.CommandText := '';
    DM.sds_AnteCount.DataSet.CommandText := 'select COUNT(*) from NUM_LOGADOS ';
    DM.sds_AnteCount.Open;
    respMaxLogados := DM.sds_AnteCount.Fields[0].AsInteger;
  Except
    on E: Exception do
    begin
      MessageDlg
        ('Erro ao montar a instrução SQL[MAX] ou algum parametro de linha inconsistente !'
        + #13 + 'Mensagem Nativa do Erro : ' + E.Message, mtError, [mbOk], 0);
      Abort;
    end
    else
    begin
      Result := respMaxLogados;
    end;
  end;
end;

procedure TDM.cds_ArquivoBeforePost(DataSet: TDataSet);
var
DataInserimento:String;
begin
  if cds_Arquivo.State = dsInsert then
  begin
    DataInserimento := DM.cds_ArquivoDATA.AsString;

    cds_ArquivoDATA.Value := Date;//FormatDateTime('dd/MM/yyyy',StrToDate(DataInserimento));
    cds_ArquivoHORA.Value := Time;
  end;

  if cds_Arquivo.State = dsInsert then
  begin
    if FrPrincipal.DBText5.Caption = '' then
    begin
      cds_ArquivoCOD_ASSUNTO.Value := 0;
    end;
  end;
  if (FrPrincipal.CheckBox1.Checked = False) or
    (FrPrincipal.DBText3.Caption = '') then
  begin
    cds_ArquivoCOD_AUTOR.Value := 0;
  end;
end;

procedure TDM.cds_ArquivoNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('ARQUIVOLIST', cds_ArquivoID);
  // SQLComand := 'select gen_id(ARQUIVOLIST_ID_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_ArquivoID.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;
end;

procedure TDM.cds_ArquivoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.cds_AssuntNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('ASSUNTO', cds_AssuntCODIGO);
  // SQLComand := 'select gen_id(ASSUNTO_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_AssuntCODIGO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;
end;

procedure TDM.cds_AutoresNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('Autores', cds_AutoresCODIGO);
  // SQLComand := 'select gen_id(AUTORES_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_AutoresCODIGO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;

end;

procedure TDM.cds_CadCidadesNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('Cidades', cds_CadCidadesCODIGO);
  // SQLComand := 'select gen_id(CIDADES_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_CadCidadesCODIGO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;
end;

procedure TDM.cds_CadCidadesReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.cds_CadDepNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('DEPARTAMENTOS', cds_CadDepCODIGO);
  // SQLComand :=
  // 'select gen_id(DEPARTAMENTOS_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_CadDepCODIGO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;

end;

procedure TDM.cds_CadDepReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.cds_LogadosBeforePost(DataSet: TDataSet);
begin
  if cds_Logados.State = dsInsert then
    IncrementaPersonalizado('NUM_LOGADOS', cds_LogadosCODIGO);
  cds_LogadosDATAATUAL.Value := Date;

end;

procedure TDM.cds_LogadosNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('NUM_LOGADOS', cds_LogadosCODIGO);
  // var
  // ResultSet: TCustomSQLDataSet;
  // SQLComand: String;
  // begin
  // SQLComand :=
  // 'select gen_id(NUM_LOGADOS_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_LogadosCODIGO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;

end;

procedure TDM.cds_LogadosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.cds_LogBeforePost(DataSet: TDataSet);
begin
  if cds_Log.State = dsInsert then
    IncrementaPersonalizado('LOG', cds_LogCODIGO);
  cds_LogINSERDATA.Value := Date;

end;

procedure TDM.cds_LogNewRecord(DataSet: TDataSet);
begin
  IncrementaPersonalizado('LOG', cds_LogCODIGO);
  // var
  // ResultSet: TCustomSQLDataSet;
  // SQLComand: String;
  // begin
  // SQLComand := 'select gen_id(LOG_CODIGO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_LogCODIGO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;

end;

procedure TDM.cds_scriptReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.cds_UserAddReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Esse Usuário já Existe!', mtWarning, [mbOk], 0)
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
      cds_UserCOD_PERFIL.Value := 0;
      // sinal de erro na varificação ...
      cds_UserNIVEL.Value := 0;
      cds_UserTIPO_TODOS.Value := 0;
    end;
  end;
end;

procedure TDM.cds_UserCodReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.cds_UserNewRecord(DataSet: TDataSet);
var
  ResultSet: TCustomSQLDataSet;
  SQLComand: String;
begin
  IncrementaPersonalizado('USUARIO', cds_UserCOD_USUARIO);
  // SQLComand :=
  // 'select gen_id(USUARIO_COD_USUARIO_GEN,1)as NUM from RDB$DATABASE;';
  // ResultSet := nil;
  // try
  // DM.SQLConnection.Execute(SQLComand, nil, @ResultSet);
  // if Assigned(ResultSet) then
  // begin
  // cds_UserCOD_USUARIO.AsInteger := ResultSet.FieldByname('NUM').AsInteger;
  // end;
  // finally
  // ResultSet.Free;
  // end;
end;

procedure TDM.cds_UserReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.sds_ViewFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  user, assunto: Integer;
  exessao01, valor: Integer;
  Data: TDate;
begin
  // valor := 0;

end;

procedure TDM.sdt_ListFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sdt_List['COD_USUARIO'] = 99 then
  begin
    Accept := False;
  end
  else
    Accept := True;

end;

function TDM.receberValor: Integer;
var
  temp: Integer;
begin
  temp := frmlogin.ADMIN;
  Result := temp;
end;

procedure TDM.sds_AssuntFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sds_Assunt['CODIGO'] > 0 then
  begin
    Accept := True;
  end;
end;

procedure TDM.sds_Assunt_CadFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  exessao, valor: Integer;
begin
  Accept := False;
  valor := 0;
  exessao := sds_Assunt_Cad['CODIGO'];
  if sds_Assunt_Cad['CODIGO'] > valor then
  begin
    Accept := True;
  end;
end;

procedure TDM.sds_AutoresFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sds_Autores['CODIGO'] > 0 then
  begin
    Accept := True;
  end;
end;

procedure TDM.sds_BuscaCidadesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_BuscaCidades['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_listaAddReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.sds_lista_UsuariosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if (sds_lista_Usuarios['IDUSUARIOS'] = frmlogin.COD_USUARIO) then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_lista_UsuariosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.sds_OpenAssuntFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_OpenAssunt['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_OpenAutorListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_OpenAutorList['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_OpenCidadesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_OpenCidades['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_OpenDepFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sds_OpenDep['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_PesquiDepFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sds_PesquiDep['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_Qry_CidadesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if sds_Qry_Cidades['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_Qry_NomeFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if sds_Qry_Nome['CODIGO'] > 99 then
  begin
    Accept := True;
  end;

end;

procedure TDM.sds_Report_DetalheADMINISTRADORGetText(Sender: TField;
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

function TDM.receberUsuario: Integer;
var
  temp: Integer;
begin
  temp := frmlogin.COD_USUARIO;
  Result := temp;
end;

end.
