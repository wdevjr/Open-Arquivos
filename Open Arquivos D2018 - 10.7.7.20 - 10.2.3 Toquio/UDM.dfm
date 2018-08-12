object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 900
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
    Left = 360
    Top = 160
    object sdsss_UserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
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
    Left = 440
    Top = 160
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
    object sds_OpenDATA: TDateField
      FieldName = 'DATA'
      Required = True
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
  end
  object sds_Cont: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 520
    Top = 160
  end
  object sdt_Verif: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    Left = 608
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
    object sdt_UserDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
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
    object cds_UserDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
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
    Active = True
    Aggregates = <>
    Connection = SQLConnection
    DataSet.CommandText = 
      'select AQ.ID,AQ.COD_USUARIO,TITULOASSUN,TE.NOME,AQ.DESCRICAO,AQ.' +
      'NOME_ARQUIVO,AQ.INFORMACOES, UR.LOGIN,UR.NIVEL,UR.NOME '#13#10'from AR' +
      'QUIVOLIST AQ'#13#10'inner join USUARIO UR on AQ.COD_USUARIO = UR.COD_U' +
      'SUARIO'#13#10'inner join ASSUNTO SS on AQ.COD_ASSUNTO = SS.CODIGO'#13#10'inn' +
      'er join AUTORES TE on AQ.COD_AUTOR = TE.CODIGO  '#13#10'where ID =:ID'
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
    object sdt_ExcAtualDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
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
    object sdt_ExcUserDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_ExcUserORDEM: TIntegerField
      FieldName = 'ORDEM'
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
    object cds_ExcUserDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_ExcUserORDEM: TIntegerField
      FieldName = 'ORDEM'
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
    object sdt_ExcRepetidosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = []
    end
    object sdt_ExcRepetidosORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = []
    end
  end
  object dsp_ExcRepetidos: TDataSetProvider
    DataSet = sdt_ExcRepetidos
    UpdateMode = upWhereKeyOnly
    Left = 200
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
    object cds_ExcRepetidosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = []
    end
    object cds_ExcRepetidosORDEM: TIntegerField
      FieldName = 'ORDEM'
      ProviderFlags = []
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
    object sdt_LogINSERDATA: TDateField
      FieldName = 'INSERDATA'
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
    object cds_LogINSERDATA: TDateField
      FieldName = 'INSERDATA'
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
  end
  object sds_Verif: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 688
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
    object sdt_ArquivoDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
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
    object cds_ArquivoDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
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
    OnFilterRecord = sds_ArquFilterRecord
    Left = 112
    Top = 152
    object sds_ArquID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sds_ArquCOD_ASSUNTO: TIntegerField
      FieldName = 'COD_ASSUNTO'
    end
    object sds_ArquCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_ArquDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 20000
    end
    object sds_ArquTITULO: TStringField
      FieldName = 'TITULO'
      Size = 140
    end
    object sds_ArquNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 300
    end
    object sds_ArquDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object sds_ArquIDUSUARIOS: TIntegerField
      FieldName = 'IDUSUARIOS'
      Required = True
    end
    object sds_ArquNOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
    object sds_ArquTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
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
      'Database=127.0.0.1:D:\Banco\3.x\OPENARQUIVOS\OPENARQUIVOS.FDB'
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
    Connected = True
    Left = 40
    Top = 184
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
    Top = 32
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
    DataSet.CommandText = 
      'select AQ.ID,AQ.COD_USUARIO,AQ.DESCRICAO,AQ.TITULO,AQ.NOME_ARQUI' +
      'VO,UR.LOGIN,UR.NIVEL,UR.NOME '#13#10'from ARQUIVOLIST AQ'#13#10'inner join U' +
      'SUARIO UR on AQ.COD_USUARIO = UR.COD_USUARIO '#13#10'where (AQ.DESCRIC' +
      'AO like :DESCRICAO) '#13#10'or (AQ.TITULO like :TITULO) '#13#10'order by AQ.' +
      'DESCRICAO, AQ.TITULO desc'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TITULO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftString
        Name = 'TITULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
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
      'IO=:idUser)'#13#10'order by AQ.NOME_ARQUIVO desc'
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
      end>
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
    object sds_view_todosDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object sds_view_todosTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
  end
  object sds_view: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnFilterRecord = sds_ViewFilterRecord
    Left = 112
    Top = 328
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
    ReportOptions.LastChange = 43323.944124421290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 408
    Top = 328
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
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 49.133890000000000000
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
          Top = 15.118120000000000000
          Width = 151.181200000000000000
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
          Left = 162.519790000000000000
          Top = 15.118120000000000000
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
          Left = 181.417440000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 755.906000000000000000
        Top = 166.299320000000000000
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
          Left = 11.338590000000000000
          Top = 7.559059999999990000
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
          Top = 86.929190000000200000
          Width = 695.433520000000000000
          Height = 18.897650000000000000
          DataField = 'TITULOASSUN'
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
          DataField = 'NOME'
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
          DataField = 'DESCRICAO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
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
      'NOME_1=NOME_1')
    DataSet = sds_Report_Detalhe
    BCDToCurrency = False
    Left = 528
    Top = 328
  end
end
