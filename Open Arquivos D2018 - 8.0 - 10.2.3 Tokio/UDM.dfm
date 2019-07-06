object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 1104
  Width = 972
  object sdt_Combo: TSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 208
    Top = 24
  end
  object dst_Login_Con: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 288
    Top = 24
  end
  object sdss_User: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME,UR.LOGIN,UR.SENHA,PL.NOMEL,UR.ADMI' +
      'NISTRADOR'#13#10'from USUARIO UR'#13#10'inner join PERFIL PL on PL.CODIGO = ' +
      'UR.COD_PERFIL'#13#10'where NOME like :NOME'#13#10'order by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Left = 288
    Top = 152
    object sdss_UserCOD_USUARIO: TIntegerField
      DisplayLabel = 'C'#243'digo Usu'#225'rio'
      FieldName = 'COD_USUARIO'
      Required = True
      Visible = False
    end
    object sdss_UserNOME: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      FieldName = 'NOME'
      Size = 70
    end
    object sdss_UserLOGIN: TStringField
      DisplayLabel = 'Login Usu'#225'rio'
      FieldName = 'LOGIN'
    end
    object sdss_UserSENHA: TStringField
      FieldName = 'SENHA'
      Visible = False
      Size = 50
    end
    object sdss_UserNOMEL: TStringField
      DisplayLabel = 'Nome Perfil'
      FieldName = 'NOMEL'
      Size = 70
    end
    object sdss_UserADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      Required = True
      Visible = False
    end
  end
  object sdsss_User: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME,UR.LOGIN,UR.SENHA,PL.NOMEL,UR.ADMI' +
      'NISTRADOR'#13#10'from USUARIO UR'#13#10'inner join PERFIL PL on PL.CODIGO = ' +
      'UR.COD_PERFIL'#13#10'where UR.COD_USUARIO =:COD_USUARIO'#13#10'order by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 368
    Top = 152
    object sdsss_UserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
      Visible = False
    end
    object sdsss_UserNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object sdsss_UserLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sdsss_UserSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object sdsss_UserNOMEL: TStringField
      FieldName = 'NOMEL'
      Size = 70
    end
    object sdsss_UserADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      Required = True
    end
  end
  object sds_Open: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select UR.*, PE. NOMEL'#13#10'from USUARIO UR'#13#10'inner join PERFIL PE on' +
      ' PE.CODIGO = UR.COD_PERFIL '#13#10'order by UR.NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 432
    Top = 152
    object sds_OpenCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_OpenNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object sds_OpenLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sds_OpenSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object sds_OpenLEMBRAR_SENHA: TStringField
      FieldName = 'LEMBRAR_SENHA'
      FixedChar = True
      Size = 1
    end
    object sds_OpenNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object sds_OpenCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      Required = True
    end
    object sds_OpenADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      Required = True
    end
    object sds_OpenNOMEL: TStringField
      FieldName = 'NOMEL'
      Size = 70
    end
    object sds_OpenTIPO_TODOS: TIntegerField
      FieldName = 'TIPO_TODOS'
    end
    object sds_OpenDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object sds_Cont: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 600
    Top = 152
  end
  object sdt_Verif: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    Left = 656
    Top = 160
  end
  object sdt_User: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select UR.*,PL.NOMEL'#13#10'from USUARIO UR'#13#10'inner join PERFIL PL on P' +
      'L.CODIGO = UR.COD_PERFIL  '#13#10'where UR.COD_USUARIO = :COD_USUARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 216
    object sdt_UserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_UserNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object sdt_UserLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_UserSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sdt_UserLEMBRAR_SENHA: TStringField
      FieldName = 'LEMBRAR_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sdt_UserNIVEL: TIntegerField
      FieldName = 'NIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_UserCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_UserADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_UserTIPO_TODOS: TIntegerField
      FieldName = 'TIPO_TODOS'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_UserNOMEL: TStringField
      FieldName = 'NOMEL'
      ProviderFlags = []
      Size = 70
    end
    object sdt_UserDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_User: TDataSetProvider
    DataSet = sdt_User
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 216
  end
  object cds_User: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_User'
    BeforePost = cds_UserBeforePost
    OnNewRecord = cds_UserNewRecord
    OnReconcileError = cds_UserReconcileError
    Left = 288
    Top = 216
    object cds_UserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_UserNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cds_UserLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
    end
    object cds_UserSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds_UserLEMBRAR_SENHA: TStringField
      FieldName = 'LEMBRAR_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cds_UserNIVEL: TIntegerField
      FieldName = 'NIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_UserCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_UserADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_UserTIPO_TODOS: TIntegerField
      FieldName = 'TIPO_TODOS'
      ProviderFlags = [pfInUpdate]
    end
    object cds_UserNOMEL: TStringField
      FieldName = 'NOMEL'
      ProviderFlags = []
      Size = 70
    end
    object cds_UserDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sdt_User_Cod: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select UR.* from USUARIO UR'#13#10'where UR.COD_USUARIO =:COD_USUARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 368
    Top = 216
    object sdt_User_CodCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_User_CodNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object sdt_User_CodLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_User_CodSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sdt_User_CodLEMBRAR_SENHA: TStringField
      FieldName = 'LEMBRAR_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sdt_User_CodDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_User_CodNIVEL: TIntegerField
      FieldName = 'NIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_User_CodCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_User_CodADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_UserCod: TDataSetProvider
    DataSet = sdt_User_Cod
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 216
  end
  object cds_UserCod: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_UserCod'
    OnReconcileError = cds_UserCodReconcileError
    Left = 536
    Top = 216
    object cds_UserCodCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_UserCodNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cds_UserCodLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
    end
    object cds_UserCodSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds_UserCodLEMBRAR_SENHA: TStringField
      FieldName = 'LEMBRAR_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cds_UserCodDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_UserCodNIVEL: TIntegerField
      FieldName = 'NIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_UserCodCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_UserCodADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qry_script: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 112
    Top = 280
  end
  object sds_UserCod: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME,UR.LOGIN,UR.SENHA,PL.NOMEL,UR.ADMI' +
      'NISTRADOR'#13#10'from USUARIO UR'#13#10'inner join PERFIL PL on PL.CODIGO = ' +
      'UR.COD_PERFIL'#13#10'where COD_USUARIO =:COD_USUARIO'#13#10'order by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    Left = 624
    Top = 216
    object sds_UserCodCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_UserCodNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object sds_UserCodLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sds_UserCodSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object sds_UserCodNOMEL: TStringField
      FieldName = 'NOMEL'
      Size = 70
    end
    object sds_UserCodADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      Required = True
    end
  end
  object dsp_scrpt: TDataSetProvider
    DataSet = qry_script
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 280
  end
  object cds_script: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_scrpt'
    OnReconcileError = cds_scriptReconcileError
    Left = 288
    Top = 280
  end
  object sds_Log_I: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 776
    Top = 160
  end
  object sds_Report_Detalhe: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select AQ.ID,AQ.COD_USUARIO,TITULOASSUN,TE.NOME,AQ.DESCRICAO,AQ.' +
      'NOME_ARQUIVO,AQ.INFORMACOES, UR.LOGIN,UR.NIVEL,UR.NOME,UR.ADMINI' +
      'STRADOR '#13#10'from ARQUIVOLIST AQ'#13#10'inner join USUARIO UR on AQ.COD_U' +
      'SUARIO = UR.COD_USUARIO'#13#10'inner join ASSUNTO SS on AQ.COD_ASSUNTO' +
      ' = SS.CODIGO'#13#10'inner join AUTORES TE on AQ.COD_AUTOR = TE.CODIGO ' +
      ' '#13#10'where ID =:ID'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 304
    Top = 336
    object sds_Report_DetalheID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sds_Report_DetalheCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_Report_DetalheTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
    object sds_Report_DetalheNOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
    object sds_Report_DetalheDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 20000
    end
    object sds_Report_DetalheNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 300
    end
    object sds_Report_DetalheINFORMACOES: TMemoField
      FieldName = 'INFORMACOES'
      BlobType = ftMemo
      Size = 1
    end
    object sds_Report_DetalheLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sds_Report_DetalheNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object sds_Report_DetalheNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 70
    end
    object sds_Report_DetalheADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      Required = True
      OnGetText = sds_Report_DetalheADMINISTRADORGetText
    end
  end
  object sdt_Assunt: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select CODIGO, CURSO, DATA, TITULOASSUN from ASSUNTO'#13#10'where CODI' +
      'GO =:CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 392
    object sdt_AssuntCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_AssuntCURSO: TStringField
      FieldName = 'CURSO'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object sdt_AssuntDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_AssuntTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
  end
  object dsp_Assunt: TDataSetProvider
    DataSet = sdt_Assunt
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 392
  end
  object cds_Assunt: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Assunt'
    OnNewRecord = cds_AssuntNewRecord
    Left = 296
    Top = 392
    object cds_AssuntCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_AssuntCURSO: TStringField
      FieldName = 'CURSO'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object cds_AssuntDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cds_AssuntTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
  end
  object sds_Assunt: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select CODIGO,TITULOASSUN'#13#10'from ASSUNTO'#13#10'where TITULOASSUN like ' +
      ':TITULOASSUN'#13#10'order by TITULOASSUN'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'TITULOASSUN'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'TITULOASSUN'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_AssuntFilterRecord
    Left = 400
    Top = 392
    object sds_AssuntCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      Visible = False
    end
    object sds_AssuntTITULOASSUN: TStringField
      DisplayLabel = 'Titulo  Assunto'
      FieldName = 'TITULOASSUN'
      Size = 140
    end
  end
  object sds_Assunt_Cad: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select CODIGO,TITULOASSUN'#13#10'from ASSUNTO'#13#10'where TITULOASSUN like ' +
      ':TITULOASSUN'#13#10'order by TITULOASSUN'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'TITULOASSUN'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'TITULOASSUN'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_Assunt_CadFilterRecord
    Left = 536
    Top = 392
    object sds_Assunt_CadCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_Assunt_CadTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
  end
  object sds_OpenAssunt: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 'select * from ASSUNTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Filtered = True
    Params = <>
    OnFilterRecord = sds_OpenAssuntFilterRecord
    Left = 632
    Top = 392
    object sds_OpenAssuntCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_OpenAssuntTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
    object sds_OpenAssuntDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object sds_OpenAssuntCURSO: TStringField
      FieldName = 'CURSO'
      Size = 140
    end
  end
  object sdt_Autores: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select AU.*, DE.NOME_DEP,CI.NOME_CIDADE,CI.UF'#13#10' from AUTORES AU'#13 +
      #10'inner Join DEPARTAMENTOS DE on DE.CODIGO = AU.COD_DEPARTAMENTO'#13 +
      #10'inner join CIDADES CI on CI.CODIGO = AU.COD_CIDADE'#13#10'where AU.CO' +
      'DIGO=:CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 456
    object sdt_AutoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_AutoresNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object sdt_AutoresINSTITUICAO: TStringField
      FieldName = 'INSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object sdt_AutoresCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_AutoresCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_AutoresDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_AutoresOUTROS: TStringField
      FieldName = 'OUTROS'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object sdt_AutoresNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      ProviderFlags = []
      Required = True
      Size = 140
    end
    object sdt_AutoresNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Required = True
      Size = 70
    end
    object sdt_AutoresUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Required = True
      Size = 2
    end
  end
  object dsp_Autores: TDataSetProvider
    DataSet = sdt_Autores
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 456
  end
  object cds_Autores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Autores'
    OnNewRecord = cds_AutoresNewRecord
    Left = 296
    Top = 456
    object cds_AutoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_AutoresNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object cds_AutoresINSTITUICAO: TStringField
      FieldName = 'INSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object cds_AutoresCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_AutoresCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_AutoresDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cds_AutoresOUTROS: TStringField
      FieldName = 'OUTROS'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object cds_AutoresNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 140
    end
    object cds_AutoresNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Required = True
      Size = 70
    end
    object cds_AutoresUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Required = True
      Size = 2
    end
  end
  object sds_Qry_Nome: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select * from DEPARTAMENTOS'#13#10'where NOME_DEP like :NOME_DEP'#13#10'orde' +
      'r by NOME_DEP'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME_DEP'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOME_DEP'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_Qry_NomeFilterRecord
    Left = 536
    Top = 456
    object sds_Qry_NomeCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sds_Qry_NomeNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      Size = 140
    end
    object sds_Qry_NomeDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object sds_OpenAutorList: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select TS.*,DE.NOME_DEP'#13#10'from AUTORES TS'#13#10'inner join DEPARTAMENT' +
      'OS DE on DE.CODIGO = TS.COD_DEPARTAMENTO'#13#10'order by DE.NOME_DEP'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Filtered = True
    Params = <>
    OnFilterRecord = sds_OpenAutorListFilterRecord
    Left = 752
    Top = 456
    object sds_OpenAutorListCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_OpenAutorListNOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
    object sds_OpenAutorListINSTITUICAO: TStringField
      FieldName = 'INSTITUICAO'
      Size = 140
    end
    object sds_OpenAutorListCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object sds_OpenAutorListCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object sds_OpenAutorListDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object sds_OpenAutorListOUTROS: TStringField
      FieldName = 'OUTROS'
      Size = 140
    end
    object sds_OpenAutorListNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      Required = True
      Size = 140
    end
  end
  object sds_Cont_Logar: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 112
    Top = 520
  end
  object sds_Qry_Cidades: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select * from CIDADES'#13#10'where NOME_CIDADE like :NOME'#13#10'order by NO' +
      'ME_CIDADE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_Qry_CidadesFilterRecord
    Left = 648
    Top = 456
    object sds_Qry_CidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_Qry_CidadesNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Required = True
      Size = 70
    end
    object sds_Qry_CidadesUF: TStringField
      FieldName = 'UF'
      Required = True
      Size = 2
    end
    object sds_Qry_CidadesDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object sds_Autores: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select AU.CODIGO,AU.NOME,AU.INSTITUICAO, AU.COD_DEPARTAMENTO,DE.' +
      'NOME_DEP'#13#10'from AUTORES AU'#13#10'inner join DEPARTAMENTOS DE on DE.COD' +
      'IGO = AU.COD_DEPARTAMENTO'#13#10'where NOME like :NOME'#13#10'order by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_AutoresFilterRecord
    Left = 400
    Top = 456
    object sds_AutoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      Visible = False
    end
    object sds_AutoresNOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
    object sds_AutoresINSTITUICAO: TStringField
      FieldName = 'INSTITUICAO'
      Size = 140
    end
    object sds_AutoresCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object sds_AutoresNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      Required = True
      Size = 140
    end
  end
  object sds_AnteCount: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 200
    Top = 520
  end
  object sds_TempLogado: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 304
    Top = 520
  end
  object sdt_Logados: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select NL.* from NUM_LOGADOS NL'#13#10'where NL.CODIGO =:CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 584
    object sdt_LogadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_LogadosORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_LogadosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_LogadosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_Logados: TDataSetProvider
    DataSet = sdt_Logados
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 584
  end
  object cds_Logados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Logados'
    BeforePost = cds_LogadosBeforePost
    OnNewRecord = cds_LogadosNewRecord
    OnReconcileError = cds_LogadosReconcileError
    Left = 296
    Top = 584
    object cds_LogadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_LogadosORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_LogadosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_LogadosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object DtsrcLogados: TDataSource
    Left = 536
    Top = 520
  end
  object Qry_Secun: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 640
    Top = 520
  end
  object sdt_ExcAtual: TSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 744
    Top = 520
    object sdt_ExcAtualCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sdt_ExcAtualCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdt_ExcAtualORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
  end
  object sdt_ExcUser: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select COD_USUARIO, CODIGO, DATAATUAL, ORDEM from NUM_LOGADOS'#13#10'w' +
      'here COD_USUARIO = :COD_USUARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 400
    Top = 584
    object sdt_ExcUserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_ExcUserCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_ExcUserORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_ExcUserDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_ExcUser: TDataSetProvider
    DataSet = sdt_ExcUser
    UpdateMode = upWhereKeyOnly
    Left = 536
    Top = 584
  end
  object cds_ExcUser: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_ExcUser'
    Left = 640
    Top = 584
    object cds_ExcUserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_ExcUserCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_ExcUserORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_ExcUserDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sdt_ExcRepetidos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select COD_USUARIO, CODIGO, DATAATUAL, ORDEM from NUM_LOGADOS'#13#10'w' +
      'here COD_USUARIO = :COD_USUARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 648
    object sdt_ExcRepetidosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_ExcRepetidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sdt_ExcRepetidosORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = []
    end
    object sdt_ExcRepetidosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_ExcRepetidos: TDataSetProvider
    DataSet = sdt_ExcRepetidos
    UpdateMode = upWhereKeyOnly
    Left = 208
    Top = 648
  end
  object cds_ExcRepetidos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_ExcRepetidos'
    Left = 296
    Top = 648
    object cds_ExcRepetidosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_ExcRepetidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cds_ExcRepetidosORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = []
    end
    object cds_ExcRepetidosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sdt_CadDep: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select * from DEPARTAMENTOS'#13#10'where CODIGO =:CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 704
    object sdt_CadDepCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdt_CadDepNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object sdt_CadDepDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsp_CadDep: TDataSetProvider
    DataSet = sdt_CadDep
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 704
  end
  object cds_CadDep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_CadDep'
    OnNewRecord = cds_CadDepNewRecord
    OnReconcileError = cds_CadDepReconcileError
    Left = 296
    Top = 704
    object cds_CadDepCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_CadDepNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 140
    end
    object cds_CadDepDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object Dtsrc_Logando: TDataSource
    Left = 536
    Top = 648
  end
  object sds_RecordCountParams: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select COD_USUARIO, CODIGO, DATAATUAL, ORDEM from NUM_LOGADOS'#13#10'w' +
      'here COD_USUARIO = :COD_USUARIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 672
    Top = 648
    object sds_RecordCountParamsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_RecordCountParamsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_RecordCountParamsDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      Required = True
    end
    object sds_RecordCountParamsORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
  end
  object sds_OpenDep: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 'select * from DEPARTAMENTOS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Filtered = True
    Params = <>
    OnFilterRecord = sds_OpenDepFilterRecord
    Left = 536
    Top = 704
    object sds_OpenDepCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_OpenDepNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      Required = True
      Size = 140
    end
    object sds_OpenDepDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object sds_PesquiDep: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select * from DEPARTAMENTOS'#13#10'where NOME_DEP like :NOME_DEP'#13#10'orde' +
      'r by NOME_DEP'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME_DEP'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOME_DEP'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_PesquiDepFilterRecord
    Left = 672
    Top = 704
    object sds_PesquiDepCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_PesquiDepNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      Required = True
      Size = 140
    end
    object sds_PesquiDepDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object Qury: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 400
    Top = 520
  end
  object sdt_Log: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select * from LOG'#13#10'where CODIGO = :CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 368
    Top = 24
    object sdt_LogCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_LogCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_LogHORA: TTimeField
      FieldName = 'HORA'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_LogCOD_ACAO: TIntegerField
      FieldName = 'COD_ACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_LogACAO: TStringField
      FieldName = 'ACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_LogAPLICATIVO: TStringField
      FieldName = 'APLICATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object sdt_LogCOD_REGISTRO: TIntegerField
      FieldName = 'COD_REGISTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_LogDISCRIMINACAO: TStringField
      FieldName = 'DISCRIMINACAO'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object sdt_LogINSERDATA: TDateField
      FieldName = 'INSERDATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_Log: TDataSetProvider
    DataSet = sdt_Log
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 24
  end
  object cds_Log: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Log'
    BeforePost = cds_LogBeforePost
    OnNewRecord = cds_LogNewRecord
    Left = 536
    Top = 24
    object cds_LogCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_LogCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_LogHORA: TTimeField
      FieldName = 'HORA'
      ProviderFlags = [pfInUpdate]
    end
    object cds_LogCOD_ACAO: TIntegerField
      FieldName = 'COD_ACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_LogACAO: TStringField
      FieldName = 'ACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cds_LogAPLICATIVO: TStringField
      FieldName = 'APLICATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cds_LogCOD_REGISTRO: TIntegerField
      FieldName = 'COD_REGISTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_LogDISCRIMINACAO: TStringField
      FieldName = 'DISCRIMINACAO'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cds_LogINSERDATA: TDateField
      FieldName = 'INSERDATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sds_Verif: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 704
    Top = 160
  end
  object DtsrcExcLogados: TDataSource
    DataSet = cds_ExcRepetidos
    Left = 400
    Top = 648
  end
  object sdt_Arquivo: TSQLDataSet
    CommandText = 
      'select AQ.*, SS.TITULOASSUN,UT.NOME'#13#10'from ARQUIVOLIST AQ'#13#10'inner ' +
      'join ASSUNTO SS on AQ.COD_ASSUNTO = SS.CODIGO'#13#10'inner join AUTORE' +
      'S UT on AQ.COD_AUTOR = UT.CODIGO '#13#10'where ID=:ID'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 80
    object sdt_ArquivoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_ArquivoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_ArquivoCOD_ASSUNTO: TIntegerField
      DisplayWidth = 15
      FieldName = 'COD_ASSUNTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_ArquivoCOD_AUTOR: TIntegerField
      FieldName = 'COD_AUTOR'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_ArquivoTITULO: TStringField
      FieldName = 'TITULO'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object sdt_ArquivoNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object sdt_ArquivoEXTENCAO: TStringField
      FieldName = 'EXTENCAO'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object sdt_ArquivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 20000
    end
    object sdt_ArquivoHORA: TTimeField
      FieldName = 'HORA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!90:00:00;1;_'
    end
    object sdt_ArquivoDADOS: TBlobField
      FieldName = 'DADOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_ArquivoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sdt_ArquivoINFORMACOES: TMemoField
      FieldName = 'INFORMACOES'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object sdt_ArquivoSIZE_ARQUIVO: TSingleField
      FieldName = 'SIZE_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_ArquivoTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      ProviderFlags = []
      Size = 140
    end
    object sdt_ArquivoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 140
    end
    object sdt_ArquivoDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsp_Arquivo: TDataSetProvider
    DataSet = sdt_Arquivo
    UpdateMode = upWhereKeyOnly
    Left = 208
    Top = 80
  end
  object cds_Arquivo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Arquivo'
    BeforePost = cds_ArquivoBeforePost
    OnNewRecord = cds_ArquivoNewRecord
    OnReconcileError = cds_ArquivoReconcileError
    Left = 288
    Top = 80
    object cds_ArquivoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_ArquivoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ArquivoCOD_ASSUNTO: TIntegerField
      FieldName = 'COD_ASSUNTO'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ArquivoCOD_AUTOR: TIntegerField
      FieldName = 'COD_AUTOR'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ArquivoTITULO: TStringField
      FieldName = 'TITULO'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object cds_ArquivoNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cds_ArquivoEXTENCAO: TStringField
      FieldName = 'EXTENCAO'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object cds_ArquivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 20000
    end
    object cds_ArquivoHORA: TTimeField
      FieldName = 'HORA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!90:00:00;1;_'
    end
    object cds_ArquivoDADOS: TBlobField
      FieldName = 'DADOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_ArquivoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object cds_ArquivoINFORMACOES: TMemoField
      FieldName = 'INFORMACOES'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cds_ArquivoSIZE_ARQUIVO: TSingleField
      FieldName = 'SIZE_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ArquivoTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      ProviderFlags = []
      Size = 140
    end
    object cds_ArquivoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 140
    end
    object cds_ArquivoDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sdt_CadCidades: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select * from CIDADES'#13#10'where CODIGO =:CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 112
    Top = 760
    object sdt_CadCidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdt_CadCidadesNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object sdt_CadCidadesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sdt_CadCidadesDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsp_CadCidades: TDataSetProvider
    DataSet = sdt_CadCidades
    Left = 200
    Top = 760
  end
  object cds_CadCidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_CadCidades'
    OnNewRecord = cds_CadCidadesNewRecord
    OnReconcileError = cds_CadCidadesReconcileError
    Left = 296
    Top = 760
    object cds_CadCidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_CadCidadesNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cds_CadCidadesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cds_CadCidadesDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sds_BuscaCidades: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select CODIGO,NOME_CIDADE,DATA'#13#10'from CIDADES'#13#10'where NOME_CIDADE ' +
      'LIKE :NOME'#13#10'order by NOME_CIDADE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_BuscaCidadesFilterRecord
    Left = 400
    Top = 760
    object sds_BuscaCidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sds_BuscaCidadesNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Required = True
      Size = 70
    end
    object sds_BuscaCidadesDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object sds_OpenCidades: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 'select * from CIDADES'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Filtered = True
    Params = <>
    OnFilterRecord = sds_OpenCidadesFilterRecord
    Left = 536
    Top = 760
    object sds_OpenCidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sds_OpenCidadesNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 70
    end
    object sds_OpenCidadesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object sds_OpenCidadesDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object sds_IncCidades: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 760
    Top = 760
  end
  object DSCidades: TDataSource
    Left = 672
    Top = 760
  end
  object sdt_List: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Filtered = True
    Params = <>
    OnFilterRecord = sdt_ListFilterRecord
    Left = 872
    Top = 160
  end
  object TESTE: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 'select COD_USUARIO,NOME from USUARIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 928
    Top = 160
    object TESTECOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object TESTENOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sds_Arqu: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 112
    Top = 152
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'OPENARQUIVOS'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=16.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=127.0.0.1:E:\Bancos\OPENARQUIVOS\2\OPENARQUIVOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet=win1252'
      'Trim Char=False')
    Left = 40
    Top = 152
  end
  object dst_Login: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 112
    Top = 24
  end
  object sdt_UserAdd: TSQLDataSet
    CommandText = 
      'select A.*, U.NOME from ARQUIVOS_USUARIOS A'#13#10'inner join USUARIO ' +
      'U on A.IDUSUARIOS = U.COD_USUARIO'#13#10'where (A.IDARQUIVOS=:IDARQUIV' +
      'OS) and (A.IDUSUARIOS=:IDUSUARIOS)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDARQUIVOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 392
    Top = 80
    object sdt_UserAddIDARQUIVOS: TIntegerField
      FieldName = 'IDARQUIVOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdt_UserAddIDUSUARIOS: TIntegerField
      FieldName = 'IDUSUARIOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdt_UserAddNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 70
    end
  end
  object dsp_UserAdd: TDataSetProvider
    DataSet = sdt_UserAdd
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 80
  end
  object sds_lista_Usuarios: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select  U.COD_USUARIO, U.NOME,A.IDARQUIVOS,A.IDUSUARIOS  from US' +
      'UARIO U'#13#10'inner join  ARQUIVOS_USUARIOS A  on U.COD_USUARIO = A.I' +
      'DUSUARIOS'#13#10'where  (A.IDARQUIVOS=:IDARQUIVOS)'#13#10'and (U.NOME like :' +
      'nome)'#13#10'order by U.NOME desc'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'IDARQUIVOS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDARQUIVOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_lista_UsuariosFilterRecord
    OnReconcileError = sds_lista_UsuariosReconcileError
    Left = 672
    Top = 80
    object sds_lista_UsuariosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
      Visible = False
    end
    object sds_lista_UsuariosIDARQUIVOS: TIntegerField
      FieldName = 'IDARQUIVOS'
      Required = True
      Visible = False
    end
    object sds_lista_UsuariosIDUSUARIOS: TIntegerField
      DisplayLabel = 'C'#243'digo da Pessoa'
      FieldName = 'IDUSUARIOS'
      Required = True
    end
    object sds_lista_UsuariosNOME: TStringField
      DisplayLabel = 'Nome da Pessoa'
      FieldName = 'NOME'
      Size = 70
    end
  end
  object cds_UserAdd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDARQUIVOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_UserAdd'
    OnReconcileError = cds_UserAddReconcileError
    Left = 576
    Top = 80
    object cds_UserAddIDARQUIVOS: TIntegerField
      FieldName = 'IDARQUIVOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_UserAddIDUSUARIOS: TIntegerField
      FieldName = 'IDUSUARIOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_UserAddNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 70
    end
  end
  object sds_listaAdd: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 'select  COD_USUARIO, NOME  from USUARIO'#13#10#13#10'order by NOME desc'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnReconcileError = sds_listaAddReconcileError
    Left = 672
    Top = 24
    object sds_listaAddCOD_USUARIO: TIntegerField
      DisplayLabel = 'C'#243'digo da Pessoa'
      FieldName = 'COD_USUARIO'
      Required = True
      Visible = False
    end
    object sds_listaAddNOME: TStringField
      DisplayLabel = 'Nome da Pessoa'
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sds_ArquTodos: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 152
    object sds_ArquTodosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sds_ArquTodosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_ArquTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 20000
    end
    object sds_ArquTodosTITULO: TStringField
      FieldName = 'TITULO'
      Size = 140
    end
    object sds_ArquTodosNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 300
    end
    object sds_ArquTodosLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sds_ArquTodosNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object sds_ArquTodosNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sds_view_todos: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select AQ.ID,AQ.COD_ASSUNTO,AQ.COD_USUARIO,AQ.DESCRICAO,AQ.TITUL' +
      'O,AQ.NOME_ARQUIVO,UR.LOGIN,UR.NIVEL,UR.NOME,S.TITULOASSUN,AQ.DAT' +
      'A'#13#10'from ARQUIVOLIST AQ'#13#10'inner join USUARIO UR on AQ.COD_USUARIO ' +
      '= UR.COD_USUARIO '#13#10'inner join ASSUNTO S on (S.CODIGO = AQ.COD_AS' +
      'SUNTO)'#13#10'where (AQ.NOME_ARQUIVO like :nomearquivo)'#13#10'or  (AQ.DESCR' +
      'ICAO like :descric)'#13#10'or (AQ.ID=:IDARQ)'#13#10'or  (AQ.TITULO like :til' +
      ')'#13#10'or (AQ.DATA=:dt)'#13#10'or (AQ.COD_ASSUNTO=:ASST)'#13#10'or (AQ.COD_USUAR' +
      'IO=:idUser)'#13#10'and (AQ.DATA >= :dsinicio)'#13#10'and (AQ.DATA <= :dsfim)' +
      #13#10'order by AQ.NOME_ARQUIVO desc'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'nomearquivo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descric'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDARQ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'til'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idUser'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dsinicio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dsfim'
        ParamType = ptInput
      end>
    ObjectView = False
    Params = <
      item
        DataType = ftString
        Name = 'nomearquivo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descric'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDARQ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'til'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idUser'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dsinicio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dsfim'
        ParamType = ptInput
      end>
    Left = 200
    Top = 336
    object sds_view_todosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sds_view_todosCOD_ASSUNTO: TIntegerField
      FieldName = 'COD_ASSUNTO'
    end
    object sds_view_todosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_view_todosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 20000
    end
    object sds_view_todosTITULO: TStringField
      FieldName = 'TITULO'
      Size = 140
    end
    object sds_view_todosNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 300
    end
    object sds_view_todosLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sds_view_todosNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object sds_view_todosNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object sds_view_todosTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
    object sds_view_todosDATA: TStringField
      FieldName = 'DATA'
      Required = True
      Size = 10
    end
  end
  object sds_view: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 112
    Top = 336
  end
  object SimpleDataSetUseNome: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME,UR.LOGIN,UR.SENHA,UR.ADMINISTRADOR' +
      #13#10'from USUARIO UR'#13#10'where NOME like :NOME'#13#10'order by NOME desc'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    Left = 520
    Top = 136
    object SimpleDataSetUseNomeCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object SimpleDataSetUseNomeNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object SimpleDataSetUseNomeLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object SimpleDataSetUseNomeSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object SimpleDataSetUseNomeADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      Required = True
    end
  end
  object sds_UserPorCriterio: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select DISTINCT N.IDUSUARIOS, PO.NOME from ARQUIVOS_USUARIOS N'#13#10 +
      'inner join ARQUIVOLIST  AQ  on N.IDARQUIVOS = AQ.ID'#13#10'inner join ' +
      'USUARIO PO on N.IDUSUARIOS =  PO.COD_USUARIO'#13#10'where  PO.NOME lik' +
      'e :pnome'#13#10'order by PO.NOME desc'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'pnome'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftString
        Name = 'pnome'
        ParamType = ptInput
      end>
    Left = 856
    Top = 216
    object sds_UserPorCriterioIDUSUARIOS: TIntegerField
      FieldName = 'IDUSUARIOS'
      Required = True
      Visible = False
    end
    object sds_UserPorCriterioNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sdstemp: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 720
    Top = 216
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DataSetName = 'frxUserDataSet1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43322.045178831000000000
    ReportOptions.LastChange = 43518.149269884300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 392
    Top = 296
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftGradient
        Fill.StartColor = 16774348
        Fill.EndColor = clNone
        Fill.GradientStyle = gsHorizontal
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 30.236240000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dados da Consulta Atual por sele'#231#227'o:')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 7.559060000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'd "de" mmmm "de" yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 204.094620000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #224's')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Left = 226.771800000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 661.417750000000000000
          Top = 7.559060000000000000
          Width = 45.354360000000000000
          Height = 34.015770000000000000
          Picture.Data = {
            0A544A504547496D61676524260000FFD8FFE000104A46494600010100000100
            010000FFDB008400090607121112151210131515131518121515151715171515
            15151715171615171515181D2820181D251B151521312225292B2E2E2E171F33
            38332D37282D2E2B010A0A0A0E0D0E1A10101B2D2620252D2D2D2D2D2D2D2B2D
            2D2D2D2B2D2D2D2B2D2D2D2D2D2D2B2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
            2D2D2D2D2D2D2D2D2DFFC000110800E700DA03011100021101031101FFC4001C
            0000010501010100000000000000000000000102040506030708FFC400421000
            0103020304060804040504030000000100020304110521310612415113226171
            819107324252A1B1C1D1336272921423E1F05382B2C2F115A2B3D2247393FFC4
            001B01010003010101010000000000000000000001030402050607FFC4003511
            0002020102040208040701010000000000010203110412213141510513223261
            718191B1D1A1C1E1F006141523334252F172FFDA000C03010002110311003F00
            F7140080100200400801002004025D00D2F4035D30080E2EAD60D5CDF30A328E
            9424FA3106211FBEDFDC13289F2E7D9FC87B6A9A7420F71BA93969AE63C4C108
            1E2440381402A0040080100200400801002004008010020040080100201A5C80
            ACC431E821C9CF1BDEEB7ACEF21A78AE2538AE669A74775BEAC78777C119EABD
            B171FC28C01CDC6E7C87DD54EFEC8F4EBF085FEF2F914F538F543F595C3B1BD5
            F88CFE2AB7649F53757A0D3C3FD73EFE2409277BBD6739DDE49F9AE1B6CD51AE
            11E492F80CDD3C8A83ACA13A3772284EE5DC3AC34B8F34E23116778B159D9EAC
            AF1D85C48F239295649752A968E89F382F97D8B3A5DAE99BEB86BFE0558AF92E
            662B3C1A997A8DAFC4BDA0DAD85F60F2587F369FB87D6CAD8DD1679B7784DF5F
            18ADCBD9F62FE0AB6B85C104730AE3CD7171786486BD081E8010020040080100
            200400801002004008042501578BE3B1538B38DDFC183371EFE43B4AE25351E6
            6AD3E8EDBDFA2B877E862F12DA29E6B8BEE33DD6EA7F53B53E1659E56C99EED1
            E1F4D5C7197DDFD8AA6B49D02A8DCF0B99D9B4C7895383876763A36068E1E6A7
            072E6D8F43902509C1CDD30E63CD464E941F6186A1BCD328EBCB97610CEC3C42
            6513B248E6E6C679781B28E0769CD1C9F4BEE95183B56771696BE680F51C5BD9
            AB4F868A63394791CDDA6A750BD359FA9ABC1B6B9AEB366B31DCFD93E3C16985
            E9F06781ABF07B2BF4AAF497E3FA9AC82A43B8ABCF18920A0150020040080100
            200400801002011CEB2031B8F6D65EF1D290783A5D40EC6733DBA77ACF3BBA44
            F6F49E17FEF77CBEFF0063279937CC93A939927B4ACE7B584963A1223A7F7BC9
            4E0ADD9D8EE001A2E8E3988F781A9504A8B7C88D2560E02EA3716C6A7D4E0FA9
            71E36EE5CE4B157147173AEA0B121A4A1D60692A09C084A138109427020711A2
            827191FF00C4BB439F7A9C9CF968E6F703A65D9A8507693459E0B8FC94E40F5A
            3F74F0FD27E8ADAEE70F71E7EB7C32BD4ADCB84BBF7F79E8784E2EC99A1CC75C
            7C41E44705B632525947C95FA7B289ECB16196EC7DD745239002004008010020
            0400806BDC00B9C80D50733CFB69368CD4131426D08C9CEE327303937E6B2596
            EEE0B91F49A1F0F54E2CB3D6E8BB7EBF428E365F21FF000AA3D26F1C593228C3
            7BF9AE8A2526C739D6D50259224B57EEF9AE5C8BA357722B9E4EAA0B92C0D254
            1D60E9490191ED8DBAB8868F12A52CBC1C59355C1CDF459354760DFF00E3B7FF
            00CCFF00ECAFFE5DF73C7FEB91FF0087F3FD069D837FF8EDFD87EE9FCBBEE4FF
            005C87FC3F9FE834EC1C9FE3B7F61FBA8FE5DF727FAE43FE1FCFF42831EC2FF8
            5788CC81EEB5CD811BBCAF72A9B21B5E327A7A3D4FF330DEA385F52C29F63A77
            C4D9039A1CE17E8DD706C74CF9F62ED5126B2659F8BD30B5C1A785D514F5F854
            F07E2C6E03DEB5DBFB864AB94251E68DF46AA9BBD4927F520DD706AC084A1381
            A4A1381F0634FA4707B332756DF270ED531B5D6F28AAFF000F86B21B27F3EA8F
            4ED9ADA08EAA30F61EC734EAD3C8AF42BB14E3947C3EB7456692D75D9F07D1AE
            E6898FBAB0C83D0020040080100200280C0ED8E3E6573A9A23FCB6E52B87B478
            B07673F2596DB33E8A3E8BC3343E5C55D62E2F92EDEDFB19C8997C87FC2A4F56
            4F1C593D8D00582E8CEDB7CC64D306FD91B3A8C1B204B3176BE4B86CD3182473
            BA83BC16D876CDD4CF9B59BADF79FD51E0353E4AC8D52918AFF10A29E6F2FB2E
            3FA1A21B270C113E494991CD6B8FBAD06D9643EEAEF2631596797FD52DBAC8C2
            B5B536BDE526C2D2F49521C748DA5DFE63D56FCC9F05550B32C9E878BDBB34FB
            7FE9E3F367A45D6C3E506DD0921E2D88369E274AFD1A321CCF01E6B99C945659
            7E9B4F2BEC55C7A987D97C31D5733AA27CD81DBC6FA3DFC00EC1F60B2D507396
            E67D1788EA63A5A553573C7C97DD9E8175ACF9710A029F10D9CA69B37461AEF7
            99D53F0C8AAE5545F437D1E25A9AB94B2BB3E266714D8973017C52B77466449D
            5B0FD432F92A25A7C714CF674DE3719B51B20F3ECE3F818AA99C305CF8769599
            BC1F4108B9BC2296694B8DCAA9F1374528AC2266078BC94B2891872D1EDE0E6F
            DF91565763ADE518F5FA2AF5953AE7CFA3ECFF007CCF6DD9FC6193C6D7B0DC38
            7FC83DABD58C949651F9C6A289D163AE6B8A2F5A6EBA2915002004008010199D
            B5C70C1188A2369A5B807DC6FB4EFA054DD66D585CCF57C2F44AE9EF9FAB1FC5
            F4479FC4CD00FF0093CCAC88FA593EACB1899BA2DE6BA3349E58C9E7DDEF46CE
            A10DC407BC9CCAE326951C0C250EB07A5ECDE114EC8A395B182F735AE2E7758D
            C8E17D3C16DAE114933E4F5DABBA564AB72E09E30B817B7569E6947B653EE524
            9F9B75BFB8807E17555CF1067A3E170DDAA8FB38FC8AFF0047F4BBB0BA43AC8E
            CBF4B72F9DD7142F4726AF1AB775CA1D97D4D412AF3C612E80C1ED0CEFAEAA6D
            3427A8C2778F0BFB4E3DDA0F1592C6EC96D47D2E8611D1699DF6737CBF25F1E6
            6CA8A9590B1B1C62CD68B0FB9ED5A629258478175B2B66E73E6CEC4A92B12E80
            8D5D5AC8585F23835A38FD00E25732928ACB2DA699DB35082CB3CCB6AB6A5D3E
            59B621EAB38B8F3773EED02C56DAE5EE3EBFC3BC323471E72EFDBDC62A79CBCD
            CF80E4B33793DF8C545611CAE84E44BA119347B15B4069A50C71FE548403C9AE
            390777702B4E9EDD8F0F933C2F1BF0F5A9ABCC82F4E3F8AEDF63DB30FA90E0BD
            13E149C801002004071ABA86C6C73DE6CD682E27B00BA86F0B2CEE1094E4A31E
            6F81E45595CEA895F3BF579EA8F7583D503FBE2BCF72DCF733EDAAA23456AA8F
            4E7ED7D49148CB0B9E3F2528AEC79781F3CBBA2FE4A5B39843732B9CF2732B83
            5A5824E1987C951208E3172753C1A3892A6317278455A8BE14437CFF00F4BBDA
            DC0D94D1425999BB9AF71D5C48BDCF96415B6D6A2960F3FC375B3D45B3DDF05D
            8D66CAC9BD490F636DE448FA2BEA7E823C4F118E3553F7FD4B4BAB0C664BD22C
            F686360D5CF26DCC35A72F37059F50F8247B9E050CDB293E8BEAFF0042FF0009
            A5E8608E3F75AD07F55AEE3E77574162291E56A6DF36E94FBBFC3A12EEA4A4A3
            DABC5BF8786CCFC593A9181ADCE4481D97F321556CF6AE1CCF47C3749E7DB997
            AB1E2C6ECB60C29A2BBBF15F62F3CB937C3E69557B57B49F12D6FF0033670F55
            72FB9757569E7084A80576318BC74CCDF90E7ECB47ACE3D83EAB99CD45713569
            74966A27B61F17D11E5BB47B44F9DDBD21FD118D1A3FBE2B0D9639733ECB43A0
            8531DB0F8BFDFD0CB4D3171BB951CCF5A315158473BA13912EA4E7225D08C885
            08C9EABE8EB680CB1F46F3D78EC0F6B7D93F4F05E969ECDD1C3E68F84F1AD12D
            3DFBA3EACB8AF63EA8F4785F70AF3C73A20040080C4FA48C4ACC652B4E729DE7
            FE86F0F136F259B513E1B4F7BC0F4F99CAF7FEBC17BD98F81972070FA2CC8F7A
            4F0B24F73AC3B02ECCC964AD9A5DE375C366B8C76AC1230BC3E4A8904718CF52
            7834732A6317278457A8D442886F9FFE9E9D836151D34618CCCFB4EE2E3CCFD9
            6E84145611F1FAAD54F513DD2F82EC41DB6837E91E78B0B5FE46C7E04AE2E598
            1A7C267B3551F6E51CF61E4BD1B0727483FEF27EAA287E81D78BC71AA97B52FA
            17D7571E6194C7E3E9ABE9A2E0C064779DFF00DA167B16EB123DBD14BC9D15B6
            77E1FBF99A8255E78A32490341713600124F203546CEA317269233383406AE73
            5B20EA37AB4ED3C87B7E77FEC2A20B7CB7BF81EC6AEC5A5A16961CDF19BFC8D3
            5D5C78C349424A4DA2DA2652B6C3AD29D197D3B5DC87CD57658A27A1A1D04F52
            F3CA3DFEC794E338E3E5797B9DBCF3C78347201619CDB793ECB4DA38D50518AC
            228DEF24DCE65546F585C10DBA923225D08C897439C897524644BA1192CF66F1
            334F3B5F7EA9EABBB89D7C0AB699EC964F37C534BFCCE9DC5735C57BD7DCF7AC
            1EAB79A17A67C096A8010014078EE355FF00C4554D2FB21C6367E961B5FC4DCF
            8AF3A72DD36CFB9D251E469A15F5C65FBDFDB90FA36E57E6888B5F1C1CEB66F6
            7CD4499DD50EA4325725F834DB078A08A6313BD596D63C9E34F3171E4AFA2787
            8EE791E31A67654AC5CE3F43D0C95B0F9623D742248DEC3A39AE6F9821449656
            0B2A9B859192E8D333DE8FDC7F877B4EAD95E0FED67D6EA8D3FABF13D5F1B4BC
            F8C9758AFAB2FAB2B5910BC8E03E67B82B65351E67975D53B1E228CEC4C9E4A8
            7D4C2CB073446D3265668CC9B76ACE9CE52DD15F33D494E9869E344DF27978EE
            587FD36777E254381E4C161E795D77E5CDF39197F98A63EAD7F3192E041C0B5D
            34AE07220BAE08E44714F27DAC98EB9C5A7184563D83D987CD180229B202C1AE
            6822DCAE14EC92E4C877D53799C38BEA9886BE68BF1A2B8F7E337F814DF28FAC
            BE43C8AACFF1CB0FB32936A76D238181B0E6F70D6D937C0EA5713BD25E89BFC3
            FC22774B36725F8FE879657624F9492E27324924DC93DA562726CFB0AA885692
            4B910AEA0B7217439C897423225D491912E873912EA48C897423221439C9EC3E
            8F716E92165CE606E9EF192F4EA96E8267C1788E9FC8D4CA2B9735EE67A1466E
            158611C80AEDA1ADE829A593DD63ADDF6B0F8AE2C96D8B669D1D3E75F0AFBB47
            8ED236CC1CCE7E2579CB91F7763CC996C5DBADEE0ACE48C696E9158E75F3559A
            D2C0D2541D245F631B3F2534514E09B90D2FE71BF56F87D42BA75B8A4CF374BA
            FAF516CEA7F0F6AEBFBEC6EF00C4C54C0C93DAB59E393C6BF7F15AAB9EE8E4F9
            AD6E99E9EE70E9D3DC585D766432387CEF826A986366F3DF2EF33DD00B6E49EE
            B859949C64E2B99EDEA231BEAAAC93E0A387F32C99491C3FCDA9787C878BB300
            F263574A318FA537C4C6ED9DBFDBA5617EF99C9B89CD506D4EDDC67191DF41A5
            FCD479929FABF33A7A7AA959B5E5F644FA3A1DC3BCE7B9EFB5B79C4E5CEC340A
            C8C31C5BCB33DB76F5B52497644BBAECA06972127373D4649C19FC7B66E2A804
            801AF3FB5DDE381ED0B3D9429715C19E8E93C46CA1AE39479662B80CB0C9B9BA
            75B67C3BCF11DAB134E2F0CFAED3EBABB61BB244C4A80C3BBBC733AE56B1D7E4
            50B69D42B738215D497644BA1CE44BA923225D0E7225D08C897524644BA1CE4D
            97A37AEDD91F1DF9387C8FD3CD6BD34B9A3E6BC7EAE30B3DEBF35F99ED94325D
            A16B3E709280C77A53A9DDA30CBDBA49236F95DE7FD0B3EA9E2183DCFE1EAF76
            AF77FCC5BFCBF330348E6B9C0020F71E4B1A3E9EC4D27924D7C9A0F15D499553
            1EA42257068C171B278774F50D045D8CEBBBC341E26CACAA3BA460F13D4791A7
            6D737C11E9B530B646963C5DAE0411CC15B9ACAC33E3AB9CAB929479A31782EF
            50561A779FE54BEA38E97F60F7FB27C16687F6E7B5F267D0EAF6EBB48AE8FAD1
            E6BEBF7469F18AFE859D51791C7758DE64F157593DAB8733C3D3D3E64B8F25CC
            825ECA38F7DFD699F7279B9DCBB1A157C2A8E5F334625A99ED8F08AFDFCC8387
            503EA9DD35413B9EC8D2FDC383571083B1EE917DD74288F97573FDFE269181AD
            1668000D00D169E4796DB6F2C0BD060617A138184A82469280A8C431A0D77450
            37A59790CDADFD45533B70F6C78B36D3A4CADF63DB1FAFB8E74583F5BA5A9774
            92F2F61BD8071511AB8EE9F16756EABD1F2EA588FE2CC67A4CA7B49BFCC30FC3
            73E81517AC59EF3DAF05B3D0DBEFFB985BAACF77225D0E7225D08C8975273912
            E84644BA1190234ED527392D76527DCA961E608FEFC95D43C4CF2BC623BB4AFD
            8D33DF702977983B96F3E3CB64079C7A6197AB4CDE05D2BBC40681FEA2B1EB1F
            047D57F0BC733B65EC4BE6DFD8F3DC3BD7EE05628F33EA6FF54654D5BB7C90E3
            C867C91C9E4EABAA3B5650D15EFE7F051B99D7910EC6A361F6B994CF7327680C
            90B7F9835691A070E2DCCF72BE8B941FA478BE31E132D4414AA7C63D3BFBBDA7
            AB3260E01CD2083982330473057A193E21C5C5E1F32AB6970BFE2612D690D95B
            D68DDC9C3877155D90DCBDA6DD06ABF97B72F8C5F06BD853ECE564B393535566
            8859B961A6F06FF31DF3F354D52726E72E9FB66AD6D75D5FD9A78EE79F874456
            513DF88551738911B732070603D56F8FDD531CDD665F23458A3A4A30B9FE7DCD
            C8B0161A0C805BCF05F1E2C09500692848D2501C6AAA591B4BDEE0D68E2572E4
            92CB3B842537B62B89446AA7ACCA2BC507190FAEFF00D2380546E959EAF05DCD
            FE5D5A6E33F4A5DBA2F796941411C0DDD8DB6E6789EF2AD8414561192DBA76BC
            C992495D9598CF4934FBD135DC8387959C3E4B2EA17267B3E0F3C58D7EFB1E5D
            7541F4F912EA4E7225D08C897423225D49CE44BA1193A4C2CD6771F9A9384F8B
            3A616FB4D19FCC1775F09A32EB96ED3CD7B0F7DD9496EC0BD13E20D2A03CBBD3
            13BAF4E3B253F167D961D6743EC3F8597A36BFFE7F330940EB6F1E416489F4D7
            2CE1115AC73B404F7027E4B92E728C79B17A07FB8FFDAEFB21CF990EEBE68DEF
            A37C25934152CA88EED73A2167020E4D766DE47ADAAD7A68A945A67CBF8F6AE7
            55D54AA961A4F97BD7D89F0D354E14E3D1EF5451139B4672C3DA0711FDE5C7B4
            A54F2E31FA19276E9FC4D7A5885BDFA48D0D7E2AC34AF9E2376EE12D3A664580
            20E60DCE8AD9D8B63923C9AF4D28EA15535C7267715269F0E8A2F6A5B17789DF
            70F90F059A7E85297737D3FDDD64A7D172FA161B0D4DB94FBFC64738F837AA3E
            209F15669A38867B99FC4ACDD6EDECBEBC4D092B41E78D250084A824AAC531A6
            C47A360324C748DBAF7B8F00AB9DAA3C17166AA34B2B16E7C23DC894D843E570
            96B0EF3BD9887A8CEFE67FBCD70AB727BA7F22D9EA635C7650B1DDF565DE8AF3
            10D2E50069721251ED745BF4CEFCA5A7C2FBA7E6A9BD6606DD04B6DCBDA78F3A
            9DE091B8ECBF29FB2CD947D76E4C6F40FF0071FF00B5DF64CA237213A07FB8FF
            00DAEFB27023284E81FEE3FF006BBECA7288C88607FB8EFDA7EC99473910C2FF
            0071DFB4A9CA2328EB5E2DBA3905D32A83E672A477F319FA9BF3530F5915EA78
            D33F73FA1EF1B18FEA05E89F0E6BD01E63E995B9D31FFEE1FF008CAC3AC5EAFC
            4FAEFE1597F997FF003F99E750BECD7F70F9D96347D54F8CA26D30A8DAD863DD
            1916B4F7922E4950781A894A56CB3DC9685269B657F0DE7F3FFB47DD6ED2FAAF
            DE78BE27FE48FBBF32E495A4F34CC6D75186C2E3192D0F7C6D7B47AAEBBC676E
            0564BEB4A395D4F53437B94D29F1C2787D5702BBD203EC206F0B38F9582E755D
            1177862F5D97FB327FF8B0FE90AFA7FC68C1ACFF003CBDE5992AC331CE594341
            7388006A49B008DA5CCEA316DE114326252D512CA4BB23D1D3B85BC230753DAB
            3B9CA7C21CBB9B9535D0B75DC5FF00CFDC9F86E191C03AA2EE3EB3DD9BDC7B4A
            B215A87233DD7CED7C7976E84C2E5D948D2E424E524A06A40EF3650D92A2DF22
            B6A71EA766B2027936EE3F0554AE82EA69868EE9728FCF815388ED036563A364
            4F21CD2DB9B34663554CF51169A46DA34138C949BE455420868075B2C67B0871
            424450042849C9EE5272D8C666E0BA8AE25537846676B2C2616F745FBEE5698F
            22697E8957439C8CFD41590F591C6AE58A27EE67BAEC57AA17A07C59B3080F3E
            F4C34F7A789FEE4B6EE0E69FA86AC9AC5E8A7ED3E93F866CDBA89C3BC7E8D7EA
            793076BDBF7BAC07DA337181C9BD0467F2DBF6F57E8A0F0B54B174BDFF00526A
            141330B648E75A27EEBAD7D6C0D9595293788B336A655C639B165170CC4678FF
            001A22E1EF347CED97C96956D91F5D1E6BD369ECFF0014F1EC643DA7C4239295
            E5AECDA6276E9C9D948D272EEBA8B6C8CA1C19D6974D6557ADCB83CACF4E4577
            A406DE385E3B47980573AA5C132DF0C7894E2586C3556FD306F18DCE6F813BC3
            FD44782B34D2CC3067F11862ECF75FA17E4ABCC2516D8B2F4FBD6B863D8F2DE0
            E683620F3162A8D42F433D8DBA078B71DD34583EB2189A2EF631B616BB8345AD
            9582B37462B9942AEC9C9E136CADA8DA9A76E4D739E7F2B49F8955BD4411A21A
            0BA5CD60AF9B69E577E1416ED79FF6854CB55D91AE1E18BFDA5F220CD89553FD
            69430726340F8EBF1553BE6FA9AE1A1A63D33EF223E9C3B37B9CF3F99C4AA9C9
            BE6698D718F2439B1346800F05C9DE07212214244500442463DC8436707B9747
            0D8FA61A9F0564519EC7D0C7ED24BBD3BBB000AE8F22DAF844E183B37A66761B
            ABEA599A32F88CF6E9E5F23DDB6359D40B69F266B90198F48B45D2D14A06AD01
            E3BD843BE8A9BE3BAB67A5E0F7795AC849F578F9F03C26EBCB3F446CD6EC9CD7
            84B7DD71F239FDD19E4EB63FDCCF745DA8319DF0E9F7256BB85C03DC722BAAE5
            B64994EA2BDF54A26CC95EA1F3440C570F64D1BDA5A2EE6900DB306D91BAAE75
            C64B91A29BE75C934F819E9DA6AB0D1C64886638EF446CE1E2DB9F10A87E9D3E
            D5F91B62D53ABF63FCFF00529362712E8A7DC71EACB66FF9BD9FB78AA74F3DB2
            C7735EBE9DF5E57347A212B79E09C2AE16C8C731F9B5C083DC544926B0CEE127
            09292E68CC637B3713607185A77DB675C925CE035173D9F20B35944547D13D1D
            3EB672B129BE0C8C3016985B3523DE5C4076EB8821C38B7202C755C3A138E625
            D1D6CA36B85897C0874F3878E4464E07507915959EA279E2755048D28044240A
            01A5412221235C50338BDCBA470D9C1C6EBA48ADB24B8EEB7B82B57033379679
            FD6CBBD239DCC956A5C0D2B822CB65A1DE9AFC87C49FE8B450B8E4F27C5ECC57
            18777F43DDF6562B30772D47CF9A44045C4210F639A742083DC458A732632716
            9AE87CE388D2986592276AC739BE4723E562BC89476B68FD368B95D546C5D526
            58ECAD56ECDB87478B7F98663E175CB29D6477433D8D815C1E60D280B7A196A2
            5BEECA32D6F6BFC969ADDB3E4CF3AF8E9A9F5A1CFF007DC9CCA4A8E33DBB9B7F
            B2B542CEB2323BF4FD2BFC4ADA30692A4C4F76F47537735C45AD2FB4D3DEA239
            AE787C9FD4EAD6AFAB7C561C7A7B0C86D361A69A72064C775E33D97D3BC1FA2C
            D6C3648F4B4B72B6BCF5EA6DF66B163510873810E6F55C6D93881EB03C6EB5D5
            66F89E46AE8F2ACC2E4CB32E56998638A824A1C15FD0CB2D29D01E922FD0ED40
            EE2A9AFD19387C8DBA85E64236AF73F7898D60DD21E9623BB2FF00DAFEC77DD4
            5B529715CCEB4BAB75FA32E5F428D95043B724696483D93C7B41E2B14A2D3C33
            DA85919ACA3B2E4B04402150488848D2501C9EE5272D91DEE5D15B63A9DBED79
            2B228A2C9742263D55B913B99197D158965E0E20B2CC42B4BF26C76228EF63EF
            1BF86816BA56227CE789DBBEEC76E07B7E0916EB02B4F38B54032417080F16F4
            A785F47502603AB20B3BF5B7FA7C961D4C312DDDCFB0FE1FD56EA5D2F9C78AF7
            3FD7EA62E294B5C1C356904782CA7BD2E2B0CF42A4A81231AF6E8E17FBAACF22
            517178675287275A4A9746E0E6F88E63915D426E2F28AEDAA36C76C8D19C563D
            C0F2EB5F871BF2B2DDE74319C9E1FF00276EF704BE3D0A0C7AB7F8866E01BB62
            1CD71F583868472596DBF77048F4F4DA2F29EE6F8FE03B0EC4A2A966E56359D2
            C3773B7C0DD200F5C5F85B5574271B17A5CD196EA2CA67FDACE1F6FA15D53B72
            D2EE8E8E032DB89EA37C06A077D94CAE4B91A6BF09935BAD963F1383F1FC475E
            8E06F61373E77557F305EBC374DDD9C9FB595B18BC94EC701992D765DF912BA5
            787E1743E52644936BDB2C9149D1964919373BD70E61F59BCF45CCE7C54BB13F
            D39D709477653374C9438070CC1008EE2B4E72784E2D3C321E2940C9DBBAF19F
            B2EE2D3CC15C4E0A4B8975374AA79466E07B9AE314B948DE3C1C38382C128B8B
            C33DFAAC564728EE5725A228021424E4F729396CE0F72E8E1B39B5BBC6CBA4B2
            5729611249B0EE56A4656F2643692B379E1A34199FA7F7DABB82EA5D15845445
            197B8346A4D958965E0E6CB1571727D0F58D8DA0CC58642C16F4B07C94A4E4DB
            7D4F54A3659A10824200280C9EDD60C2A69DECB75BD661E4E1A7DBC5576437C7
            06CD06A9E9AF8D9D3AFB9F33C21E082411620904722350BCCC1F7EA49ACAE468
            364F10B130B8EB9B3BF88FAAE64BA997530CFA48D4AE0C82150044244280CEED
            64CD018CD1CED4F10CE37E7FD0AEE0BA97D51CBC9513626583A3A73B8C1AB864
            E79E64EA3B977B7B96A8678C880E95C75738F8952778426F9E67CCA011AEB1BF
            240D64F47D8DC47A487709CD9A7E83A791B8F256532E1B7B1F37AFA76599EE5F
            172B8C2536D0D217344ACFC48F31F99BC5A55374372C9B34776C961F26408250
            F6870D08BAC27B8B88F42463DC8436707B97470D9C4DC9B05D2456DE090C66E8
            F9AB52C19A52C90316AC11B093FDF20BAE7C088ACF130F2C85C4B8EA7356A582
            D2EF65E84B9DBE4760FA95A298F53C8F14BF954BDEFF0023D9F65283740365A0
            F18D930648072004047AB8B78140789FA47C0BA197A760EABCD9FD8EE07C7E6B
            16A2BC3DC8FAAF04D6EF87912E6B97BBB7C0C6B5E41041B10410791198598F75
            9BBC171313B2FA3DB60F1DBCC761554960C3386D64F5C9C814035CEB66541279
            FE2957D2CAE7F0D1BFA469FDF6ABD2C236C23B5608ABA3A0400A080406B3098C
            D274521D1DD597B03CE5E4B88CF13C9E76B2BF362CDA172D8781818E72806661
            67452C90FB3EBB3F4BB51E072586C8E247BDA6B37C132438AACD2717B9748E1B
            389B9C82E922B93C1DE38F77BD5A960CD3964E5513068BA9384B262B18AEE95D
            607AA3E279AB231C16A444A580C8E0D1C7E038956463B9E0AEEB55507367A66C
            B615A0032165B52C2C1F2D39B9C9CA5CD9EAB85536EB429392C9002004023820
            33DB4785B66639AE170E0410A1A4D619DD764AB929C5E1A3C231EC29D4B298DD
            A6AC7736FDC715E7595EC783EDF45AC8EA6ADEB9F55D991A82B9D0BC3D9AF11C
            08E4570D64D124A4B0CDEE1F5CC9981ECF11C41E4550D60CAD638120AE41C6A6
            10F6961BD9C2C6D91B710A53C129E1E48D06150B3D58DBDE45CFC51C99D39C9F
            524085A346B7C828C919635F4EC3AB1A7FCA132C6591A6C2A076B1B7C32F929D
            CCED4E4BA911BB3D1070702EC883BB7B836EFCD4F98CEBCC782CAA620F6969E2
            2DFD5705648C0AACBE2DD77AF19DC778687C96DAE5989E26AAAD93F793CB9766
            7C19E9E6E9A7DE6FAB182DBFBC4EBE0164B65967B1A3A9C2396757B9546B6CE6
            D61769E6BB4B2552924766B037456258334A59394F2868B95D1C733258E62BBC
            4B1A7B09FA05DC63D596A582900E01581BC2CB363B3583916BFAC75ECEC5AEB8
            6D47CE6B753E74F8725CBEE7AB6CE619BA064AC319AE8DB60807A0040080101C
            678EE10188DB0D9D6CEC2D70CF569E2D3CC2E2705258668D2EA67A7B14E1F15D
            D1E338950BE0798E4162343C1C39858250717867D969F530BE1BE1FF008261F5
            EF81DBCC3DE3838722B8714CB1F137185E291CEDBB4D9C3D669D47DC76AA2516
            8A9AC135724085091109114010A1222010A82484E9FA097A4B12C78B38345CEF
            0D0D95B54F6B32EAA9F3170E62CF532CFD500C51F127D770E4392EA7767822BA
            746A2F321F1441A0358320A9E66C6D23AB60F7BC958A2532B3B0E26DA2B12286
            C8B5350183352738C991C5F192F25AC397177D07DD7718F5658960A60AC24D2E
            CFE0C6E1EF1D6E0397F55A6BAF1C59E16BB59BFF00B70E5D7DBFA1E99B3B8468
            48571E61BBA2A7DD08098801002004008010112AE9C3820309B57B34C99A4387
            711AB4F30B99C149619A34DA9B34F3DD0FFD3C9316C2A5A675A4197070D0FD8F
            62C53ADC799F55A6D657A88E63CFAAEA46A797748707163868E0B8C27CCD0DB3
            5785E3C4802603F5B743DE351E0A9952FA1C6F45EB5C08B8371CC2A5AC1D2681
            41221424440214242CA0647080953B59CB9A1FD00E39AE944E2563E806C345DA
            452DE4E323C0D57471CCA5C4F1B64795EE790D7FA78AE926F90DBDCCA57E24F9
            4E66CDE5F73C55B18A47444630B8D9A2E4F00BA4B2732928ACC9E11A6C0F0237
            0E78BBB80E03FAAD55D78E2CF0B59AE767A10F57EA7A1605836970AD3CE37587
            51068D10166020150020040080100201084043ABA50E080C8E3B80B5E0873410
            75054349F067509CA12DD1786797E39B22F8897437737DD3EB0EE3C5669D18E3
            13DED378B297A37707DFA7C4CD07B987883C4687C42A791EAE549649F438DC91
            1C8DBBB43DED39150D27CCE1C7B1A1A2DAF61CA568EF197C0FDD56EA5D08DD24
            5CD3E2D4D27AAF68EFCBFA2ADD4D7427CCF6939AD69D2C7BB35CED3ADCFB8EDC
            1C93032C1081AF701A94057D5E2B0C7EBC8D1D9717F25D24DF221A651D6ED5C6
            3F0C171F21E6576A122308CFD6E3934BC774721AF9AB15690C9584AEC82650E1
            AF974166FBC7E9CD771ADC8C9A8D6574F07C5F635F836001BA0249D49D4AD318
            28F23C2D46AACB9FA5CBB1B7C1F05D325D99CD8D050868D10166D6D900E40080
            10020040080100201084046A8A705014388E120DF2406331DD966497DE6E7CC6
            4478AE65052E65F4EA6CA5FA0FEC61F11D919597E8DDBC391C8F9E85512A1F43
            D6ABC560F858B1EEE45054D33E33691A5BDE32F3D154E2D733D085D0B3D47938
            DD41D8F64CE6FAAE70EE2421184486E2738D2693F79FBA8C2241D8A4E759A4FD
            C546D5D89C9C24A87BBD67B8F7B89F99538432CE402920568B9B0CCF2199F242
            1B49659634B82CAFE1BA3B7ECAC8D52662B7C4298705C5FB0BFC37669A2C5DD6
            3CC8CBC02BA35247997F885B6705C17B3EE6B30FC13B15A6035586E0C0704068
            E9290350135AD40390020040080100200400801002004072922050106A6801E0
            80A4ADC181E080A2ACC07B1019EADD928DDAC62FD82DF25C3845F434C3577439
            4995351B1ACE1BCDF1BFCD72E989A23E2772E786437EC7F27BBC82E7C85DCB17
            8ACFAC50C1B2278BCF904F217727FAACBFE7F13AC7B2238B9C7CBECA7C9470FC
            52C7C9226C1B2B18F62FDE495D2AA28A25AFBE5D7E45BD2602064D681DC2CBB4
            92E46594E527993C96F49817629392F28B04038202F2970E038202CA28004076
            0100A8010020040080100200400801002004008042101CDF102808D2D183C101
            0A5C301E08087260E392023BB041C901CFFE8839201CDC107240488F061C9012
            E1C2C0E0809B15081C10129900080EA1A8072004008010020040080100200400
            8010020040080100200B201A5A80431A01A620804E842017A108051184038310
            0B6402A004008010020040080100200407FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture2: TfrxPictureView
          Left = 616.063390000000000000
          Top = 7.559060000000000000
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000FFF000215FF587280FF62757DFF677074FFFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000BFF0000
            0FFFB2CFE4FF18394DFF000718FF657885FF78848AFF6C7071FFFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000DFF00000FFF8BA3BBFF819E
            B9FFBADCF9FF0E314BFF7E9DB4FF00000FFF5C6C78FF697178FF787A7AFFFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00000C19FF00000FFF859EB8FF84A3C2FF7498BCFF6F96
            BCFF9DC7ECFF40698AFF092D4BFF83A1BAFF000719FF63707EFF777F86FF7072
            73FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000EFF000317FF7B96B0FF7998B7FF7198BEFF709AC7FF6291C4FF6B9C
            CEFF9ECFFDFF3B6893FF133C63FF7FA4C6FF3F5C77FF000012FF606F7FFF717A
            83FF7C8085FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000011FF000A
            22FF83A0BBFF7B9AB9FF7A9EC2FF749EC8FF6696C6FF6094C9FF69A1DCFF5F99
            D4FF94CDFFFF306395FF3F6D9CFF001F49FF84A8CCFF516F8CFF000117FF5868
            79FF616A77FF6B7178FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000012FF000016FF7A97B6FF7696
            B9FF6D91B7FF749DC4FF628CB9FF74A4D4FF5E94CBFF5B95D0FF5B99D9FF518F
            CFFF94D0FFFF2F679EFF275B90FF104070FF6B96C1FF3E6389FF486584FF0006
            1EFF6A7B8EFF6C7884FF626A71FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000010FFF000011FF8AA2BEFF7997BAFF799DC5FF759C
            C8FF729CC9FF6C9AC9FF6B9CCEFF6095C8FF5C95CDFF68A4E0FF4B8BCBFF5E9E
            DEFF82BFFDFF3670ABFF286199FF33679CFF043366FF75A0CBFF3F648AFF4B6A
            89FF000014FF657788FF65717BFF73797EFFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000DFF8B9BB2FF88A0BEFF7A9ABEFF759AC6FF6F99C8FF6A97
            CAFF6394C6FF6C9ED2FF699BCFFF6095C8FF6199D0FF619CD4FF5995D1FF5391
            CDFF95D1FFFF1F5B97FF29639EFF346BA4FF003469FF6A9ACAFF3D6893FF4065
            8BFF506D8CFF000012FF6B7B8BFF69727BFF7B7F80FFFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000012FF829AB6FF819EC3FF7398C4FF6E99CCFF6897CDFF6396
            CEFF6EA1D9FF588CC1FF5A8FC2FF689DD0FF6297CAFF5B91C6FF659DD4FF6EA7
            DEFF8FC8FFFF3169A4FF276098FF245D95FF366EA5FF002A5DFF6D9DCDFF456F
            9AFF3F6387FF516E89FF00000FFF6B7985FF717679FF706F6BFFFFFFFF00FFFF
            FF00FFFFFF00000015FF7D99BBFF7A9EC6FF6C97C8FF6998CEFF6297D0FF5F95
            D1FF5F96CFFF6BA1D6FF699BCFFF6596C6FF6D9ECEFF6FA0D0FF6495C5FF5B8E
            C0FF99CEFFFF1E5489FF4A80B7FF10487FFF336BA2FF083E73FF6194C6FF2C5A
            89FF4C759CFF7192B3FF29435BFF00000DFF727A81FF6D6D6DFF8E8B83FFFFFF
            FF00FFFFFF00000015FF7B9ABBFF789EC8FF6A97CAFF6598D0FF6096D2FF5E96
            D1FF5B91CDFF6197CEFF699CCEFF6B9CCAFF6695C1FF6693BEFF6E9BC6FF74A3
            CFFFA0CEFDFF4475A5FF245789FF386DA0FF2E6499FF2B6196FF003265FF4377
            A6FF709DC8FF0E3457FF4A6782FF000516FF707B83FF767A7BFFFFFFFF00FFFF
            FF00FFFFFF00000012FF7D9AB9FF7A9FC5FF6A98C8FF6598D0FF6096D2FF5E96
            D1FF699FDBFF5A90C7FF6798CAFF6E9CCBFF6994BFFF77A3CCFF7CA6D0FF5C86
            B0FFA3CDF7FF325D88FF366591FF3F719FFF2F6497FF21588BFF083E73FF5489
            BBFF002B59FF477097FF51708FFF000011FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000FFF7E9CB5FF7BA0C2FF6C99C5FF6799CDFF6097D0FF5E96
            D1FF6097D0FF70A3DBFF6897CAFF6995C4FF7AA5D0FF709AC4FF6992B9FF85AC
            D2FFA4CAEDFF487093FF406B92FF366690FF346897FF2E6598FF00386CFF043B
            6EFF356795FF46729BFF335475FF000A22FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000AFF829DB1FF7FA1BFFF6F99C3FF699ACCFF6098CFFF5E96
            D1FF588FC8FF6295CDFF6392C5FF6E9AC9FF76A0CBFF668EB8FF81A8CFFFCBF0
            FFFFD6F9FFFFD5F8FFFF3E6689FF3A668FFF2E608EFF376C9EFF002A5DFF5F96
            C9FF356998FF33618AFF517496FF000015FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000008FF7E9EB1FF7AA1C1FF6F99C4FF6A99CCFF6498CDFF6197
            CCFF6DA2D5FF5B8ABEFF7CA0D6FF7795CEFF7290CBFFD3F0FFFFCFF0FFFF3050
            85FF3C587AFF365771FFCDFAFFFF396A92FF396390FF386696FF063B6DFF5C95
            C8FF2D6497FF3A6897FF4A6A8EFF000015FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000008FF7EA7C0FF6094BCFF719BD0FF6E97CEFF5A8ABAFF71A5
            CEFF5E92BAFF78A2CDFF7F8DC8FFE3E6FFFFDFE4FFFF0E1A80FF000B78FF0000
            47FF4A5D83FF416276FF145173FFBCF9FFFF426293FF436192FF053666FF5D9A
            CCFF2A649FFF3A67A0FF48608AFF000014FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000070FFF6B96B1FF6B9FC8FF6A8FC7FF7699D1FF759FCCFF6D9D
            C1FF75A7C5FFD1F4FFFFDDE2FFFF342C7FFF040069FF595AD4FF060D92FF000C
            7AFF000029FF000222FF00032CFF67BDEBFFC3F5FFFF355D91FF043866FF639F
            CDFF2E6AA0FF346399FF506690FF000015FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000080FFF6E93ADFF7199C3FF85A1D7FF738EC1FF6F92BAFFD2F9
            FFFFD3FBFFFF00001DFF18225EFF6462B4FF6D69D3FF6461DCFF0A098FFF1B21
            98FF132174FF000030FF54BDF0FF46BFF1FF3091CBFFAAF7FFFF002351FF6DA4
            CBFF25628AFF30648CFF4D6A91FF000014FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000106FF8FAAC4FF7897BEFF7B97C6FFD6F5FFFFD6F9FFFFC9EE
            FFFFD7F9FFFF00001BFF7881BAFF7372C2FF625DC6FF7069E2FF000080FF0000
            7DFF111887FF001972FF00003DFF4ECFFFFF279EE3FF3494D6FFBAF8FFFF6598
            B9FF3B7892FF3F758EFF476386FF00001BFFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000104FF94A6BDFFD8F1FFFFCEF5FFFF002D52FF00061EFFC2EA
            FDFFE1FCFFFF000018FF656BA0FF7775C1FF6961C6FF7168E0FF140F90FF0A06
            8DFF0E0792FF00158EFF000040FF49B8FCFF2FA4F5FF3597E3FF00002AFFCDFC
            FFFF25626CFF376B77FF627493FF000012FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000103FFF1FAFFFF18304CFF0B4261FF000921FFA0E4F1FFC9FE
            FFFFDBF6FFFF000014FF7276A6FF736FB7FF7970D1FF574EC2FF12108CFF0F0E
            94FF0E059CFF00058BFF00004FFF4BB2F7FF2A9EF5FF3299E8FF00002BFF3E69
            84FFCCFFFFFF427274FF58637EFF000011FFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000DFFDDFCFFFF004759FF000914FF96FAFAFFADFA
            F7FF35585CFF00071BFF72739FFF736CAFFFEDE2FFFFE4DEFFFF9BA0FFFF0005
            84FF060297FF041398FF000042FF5EC4FFFF40BDFFFF2E9EEAFF5696CCFF0000
            1CFF255557FFDFFFFFFF677084FF01000FFFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00000011FF000812FF76F8F8FF84FFF7FFA2FF
            F8FF386967FF00000BFFE7EFFFFFEDEDFFFFA098EBFFA39FFFFF8A93FAFF8696
            FFFF000385FF002092FF00003BFF3EBCF2FF30C2FFFF1EA0E1FF58A4D8FF0000
            1CFF5E8086FFE4FCFCFFE9F6FFFF00000BFFFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00D6FBFFFF001317FF63EFE8FF6FFCE9FF067A
            67FF286D63FF41676CFF000019FF9AA7DBFFA2A1EBFF9D9CF2FF939BF4FF8DA4
            FFFF759DFDFF002877FF000230FF25D2F2FF09C0EAFF12B0DEFF45A5D3FF0000
            1FFFE6F9FFFF00060DFF000107FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000010BFF80E1E4FF6FF2E8FF87FFFBFF0062
            4AFF4A9D8EFF9AD3D2FF9BC4DBFF000022FF9DA4E3FFABADF4FF979CE7FF8598
            E1FF000032FF000132FF35CAE4FF21D6E6FF20D8EEFF019FBDFF50B3D9FF0000
            1FFF000013FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000080AFF90F7F0FF8EFFEEFFA1FF
            F8FF096350FF9BE5DFFFAFEAF9FFC6EFFFFF000132FF989CD6FF000033FF0000
            28FF00001FFF74C7DDFF51CFDAFF60F4FAFF56E9F3FF78F8FFFF8BE4FFFF0000
            1AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000807FFB5FFFAFF9EF7
            E3FFB5FFF7FF83CEC6FFC6FFFFFF000B23FF182F55FF000024FF5D5982FF6065
            86FF000A1BFFAEE8EEFF00090DFF001517FF00090FFF000711FF000B1AFFFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000700FFD1FF
            FCFFCAFFFEFFC5FFFDFFC4F5FFFF000012FF1D324EFF6E7693FF73738BFFF5F5
            FFFFF2F7FFFF000609FF7C999DFFB3D6DAFF809FA8FF000710FFFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000006
            00FFD2FDF4FFD7FFFFFF00010AFF36475AFF2A374DFFE6F0FFFFE7EEF7FF0C0F
            14FF060005FF1A1517FFF7F9F9FFFBFEFFFFE4E2EEFF000006FFFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00000400FFE4F6F5FF000008FFFDF9FFFFEBF0FFFF000810FF000704FFFFFF
            FF00FFFFFF00292227FF979A98FFF0F6F5FF91939EFF0B0E12FFFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000001FFFFF9FFFF09000AFF030311FFFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00171B16FF08110EFF000008FFFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00}
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 755.906000000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1ID: TfrxMemoView
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'ID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."ID"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
        end
        object frxDBDataset1TITULOASSUN: TfrxMemoView
          Left = 7.559060000000000000
          Top = 86.929190000000000000
          Width = 695.433520000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."TITULOASSUN"]')
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 64.252010000000200000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Titulo do Assunto:')
          ParentFont = False
        end
        object frxDBDataset1NOME: TfrxMemoView
          Left = 3.779530000000000000
          Top = 154.960730000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 132.283550000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proprietario:')
          ParentFont = False
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          Left = 3.779530000000000000
          Top = 241.889920000000000000
          Width = 699.213050000000000000
          Height = 336.378170000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Font.Quality = fqProof
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          FillType = ftGradient
          Fill.StartColor = 16700346
          Fill.EndColor = clWhite
          Fill.GradientStyle = gsHorizontal
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 196.535560000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o do Arquivo:')
          ParentFont = False
        end
      end
    end
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 592
    Top = 288
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 704
    Top = 296
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'COD_USUARIO=COD_USUARIO'
      'TITULOASSUN=TITULOASSUN'
      'NOME=NOME'
      'DESCRICAO=DESCRICAO'
      'NOME_ARQUIVO=NOME_ARQUIVO'
      'INFORMACOES=INFORMACOES'
      'LOGIN=LOGIN'
      'NIVEL=NIVEL'
      'NOME_1=NOME_1'
      'ADMINISTRADOR=ADMINISTRADOR')
    DataSet = sds_Report_Detalhe
    BCDToCurrency = False
    Left = 488
    Top = 296
  end
end
