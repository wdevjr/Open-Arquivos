object DMII: TDMII
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 941
  Width = 891
  object sdt_Perfil: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select PL.*'#13#10'from PERFIL PL'#13#10'where PL.CODIGO = :CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = DM.SQLConnection
    Left = 32
    Top = 24
    object sdt_PerfilCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_PerfilNOMEL: TStringField
      FieldName = 'NOMEL'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object sdt_PerfilARQUI_INSERIR: TStringField
      FieldName = 'ARQUI_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_EDITAR: TStringField
      FieldName = 'ARQUI_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_EXCLUIR: TStringField
      FieldName = 'ARQUI_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_CONSULTAR: TStringField
      FieldName = 'ARQUI_CONSULTAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_USUARIO: TStringField
      FieldName = 'ARQUI_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_ASSUNTOS: TStringField
      FieldName = 'ARQUI_ASSUNTOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_AUTORES: TStringField
      FieldName = 'ARQUI_AUTORES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilARQUI_LOCALIZAR: TStringField
      FieldName = 'ARQUI_LOCALIZAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilUSUARIO_INSERIR: TStringField
      FieldName = 'USUARIO_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilUSUARIO_EDITAR: TStringField
      FieldName = 'USUARIO_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilUSUARIO_EXCLUIR: TStringField
      FieldName = 'USUARIO_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilUSUARIO_TRAZER: TStringField
      FieldName = 'USUARIO_TRAZER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilCONFIG_CONVERTER: TStringField
      FieldName = 'CONFIG_CONVERTER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilCONFIG_BOTOES: TStringField
      FieldName = 'CONFIG_BOTOES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilASSUNTOS_INSERIR: TStringField
      FieldName = 'ASSUNTOS_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilASSUNTOS_EDITAR: TStringField
      FieldName = 'ASSUNTOS_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilASSUNTOS_TRAZER: TStringField
      FieldName = 'ASSUNTOS_TRAZER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilASSUNTOS_EXCLUIR: TStringField
      FieldName = 'ASSUNTOS_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilAUTORES_INSERIR: TStringField
      FieldName = 'AUTORES_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilAUTORES_EDITAR: TStringField
      FieldName = 'AUTORES_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilAUTORES_EXCLUIR: TStringField
      FieldName = 'AUTORES_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilAUTORES_TRAZER: TStringField
      FieldName = 'AUTORES_TRAZER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_ARQUI_CONSULTAS: TStringField
      FieldName = 'MENU_ARQUI_CONSULTAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_ARQUI_ASSUNTOS: TStringField
      FieldName = 'MENU_ARQUI_ASSUNTOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_ARQUI_AUTORES: TStringField
      FieldName = 'MENU_ARQUI_AUTORES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_USUARIO_CADASTRO: TStringField
      FieldName = 'MENU_USUARIO_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_USUARIO_PERFIL: TStringField
      FieldName = 'MENU_USUARIO_PERFIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_MANUTENCAO_SQL: TStringField
      FieldName = 'MENU_MANUTENCAO_SQL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdt_PerfilMENU_MANUTENCAO_TEMP: TStringField
      FieldName = 'MENU_MANUTENCAO_TEMP'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dstp_Perfil: TDataSetProvider
    DataSet = sdt_Perfil
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 24
  end
  object cds_Perfil: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dstp_Perfil'
    BeforePost = cds_PerfilBeforePost
    OnNewRecord = cds_PerfilNewRecord
    OnReconcileError = cds_PerfilReconcileError
    Left = 176
    Top = 24
    object cds_PerfilCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_PerfilNOMEL: TStringField
      FieldName = 'NOMEL'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cds_PerfilARQUI_INSERIR: TStringField
      FieldName = 'ARQUI_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_EDITAR: TStringField
      FieldName = 'ARQUI_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_EXCLUIR: TStringField
      FieldName = 'ARQUI_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_CONSULTAR: TStringField
      FieldName = 'ARQUI_CONSULTAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_USUARIO: TStringField
      FieldName = 'ARQUI_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_ASSUNTOS: TStringField
      FieldName = 'ARQUI_ASSUNTOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_AUTORES: TStringField
      FieldName = 'ARQUI_AUTORES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilARQUI_LOCALIZAR: TStringField
      FieldName = 'ARQUI_LOCALIZAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilUSUARIO_INSERIR: TStringField
      FieldName = 'USUARIO_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilUSUARIO_EDITAR: TStringField
      FieldName = 'USUARIO_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilUSUARIO_EXCLUIR: TStringField
      FieldName = 'USUARIO_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilUSUARIO_TRAZER: TStringField
      FieldName = 'USUARIO_TRAZER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilCONFIG_CONVERTER: TStringField
      FieldName = 'CONFIG_CONVERTER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilCONFIG_BOTOES: TStringField
      FieldName = 'CONFIG_BOTOES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilASSUNTOS_INSERIR: TStringField
      FieldName = 'ASSUNTOS_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilASSUNTOS_EDITAR: TStringField
      FieldName = 'ASSUNTOS_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilASSUNTOS_TRAZER: TStringField
      FieldName = 'ASSUNTOS_TRAZER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilASSUNTOS_EXCLUIR: TStringField
      FieldName = 'ASSUNTOS_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilAUTORES_INSERIR: TStringField
      FieldName = 'AUTORES_INSERIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilAUTORES_EDITAR: TStringField
      FieldName = 'AUTORES_EDITAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilAUTORES_EXCLUIR: TStringField
      FieldName = 'AUTORES_EXCLUIR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilAUTORES_TRAZER: TStringField
      FieldName = 'AUTORES_TRAZER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_ARQUI_CONSULTAS: TStringField
      FieldName = 'MENU_ARQUI_CONSULTAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_ARQUI_ASSUNTOS: TStringField
      FieldName = 'MENU_ARQUI_ASSUNTOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_ARQUI_AUTORES: TStringField
      FieldName = 'MENU_ARQUI_AUTORES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_USUARIO_CADASTRO: TStringField
      FieldName = 'MENU_USUARIO_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_USUARIO_PERFIL: TStringField
      FieldName = 'MENU_USUARIO_PERFIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_MANUTENCAO_SQL: TStringField
      FieldName = 'MENU_MANUTENCAO_SQL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cds_PerfilMENU_MANUTENCAO_TEMP: TStringField
      FieldName = 'MENU_MANUTENCAO_TEMP'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object sds_Pesq_PL: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select PL.CODIGO,PL.NOMEL'#13#10'from PERFIL PL '#13#10'where PL.NOMEL like ' +
      ':NOME'#13#10'order by PL.NOMEL'
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
    OnFilterRecord = sds_Pesq_PLFilterRecord
    Left = 104
    Top = 80
    object sds_Pesq_PLCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      Visible = False
    end
    object sds_Pesq_PLNOMEL: TStringField
      DisplayLabel = 'Nome do Usu'#225'rio do Perfil'
      FieldName = 'NOMEL'
      Size = 50
    end
  end
  object sds_Perfil: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME'#13#10'from USUARIO UR '#13#10'where NOME like' +
      ' :NOME or'#13#10'UR.COD_USUARIO = :COD_USUARIO'#13#10'order by UR.NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    Left = 32
    Top = 80
    object sds_PerfilCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_PerfilNOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
  end
  object sds_TempTable: TSimpleDataSet
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 136
  end
  object sds_sddata_all: TSimpleDataSet
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnFilterRecord = sds_sddata_allFilterRecord
    OnReconcileError = sds_sddata_allReconcileError
    Left = 112
    Top = 136
  end
  object cds_CadAssistent: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_ASSISTENT'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_CadAssistent'
    OnNewRecord = cds_CadAssistentNewRecord
    OnReconcileError = cds_CadAssistentReconcileError
    Left = 272
    Top = 192
    object cds_CadAssistentCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_CadAssistentLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cds_CadAssistentNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cds_CadAssistentSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds_CadAssistentFOTO: TBlobField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dsp_CadAssistent: TDataSetProvider
    DataSet = sdt_CadAssistent
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 192
  end
  object sdt_CadAssistent: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'select CODIGO, LOGIN, NOME, SENHA, FOTO from USUARIO_LOG'#13#10'where ' +
      'CODIGO =:COD_ASSISTENT'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_ASSISTENT'
        ParamType = ptInput
      end>
    SQLConnection = DM.SQLConnection
    Left = 32
    Top = 192
    object sdt_CadAssistentCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_CadAssistentLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
    end
    object sdt_CadAssistentNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object sdt_CadAssistentSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sdt_CadAssistentFOTO: TBlobField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object sds_LocalizarLogUser: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select CODIGO, NOME, LOGIN '#13#10'from USUARIO_LOG'#13#10'where NOME like :' +
      'NOME'#13#10'order by NOME'
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
    Left = 416
    Top = 248
    object sds_LocalizarLogUserCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_LocalizarLogUserNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sds_LocalizarLogUserLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 40
    end
  end
  object sds_OpenUser: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME'#13#10'from USUARIO UR  '#13#10'where UR.COD_U' +
      'SUARIO = :COD_USUARIO'
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
    Left = 136
    Top = 248
    object sds_OpenUserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_OpenUserNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sds_LocalUserSis: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME'#13#10'from USUARIO UR'#13#10'where NOME like ' +
      ':NOME'#13#10'order by NOME'
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
    Left = 240
    Top = 248
    object sds_LocalUserSisCOD_USUARIO: TIntegerField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_LocalUserSisNOME: TStringField
      DisplayLabel = 'Nome do Usu'#225'rio'
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sds_Multconsulta: TSimpleDataSet
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 40
    Top = 296
  end
  object DSCliente: TDataSource
    DataSet = sds_BuscaGridAba
    Left = 32
    Top = 360
  end
  object sds_BuscaGridAba: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select COD_USUARIO, NOME from USUARIO'#13#10'where NOME like :NOM'#13#10'ord' +
      'er by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOM'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOM'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_BuscaGridAbaFilterRecord
    Left = 120
    Top = 360
    object sds_BuscaGridAbaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_BuscaGridAbaNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object sds_Recebe_CodUser: TSimpleDataSet
    Aggregates = <>
    Connection = DM.SQLConnection
    DataSet.CommandText = 
      'select AU.COD_USUARIO,AU. NOME,AU.NIVEL,AU. LOGIN,AU. DATA, AU.A' +
      'DMINISTRADOR,NI.NOMEL from USUARIO AU'#13#10'inner join PERFIL NI on N' +
      'I.CODIGO = AU.COD_PERFIL'#13#10'where COD_USUARIO = :ID'
    DataSet.MaxBlobSize = -1
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
    Left = 240
    Top = 360
    object sds_Recebe_CodUserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object sds_Recebe_CodUserNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object sds_Recebe_CodUserNIVEL: TIntegerField
      FieldName = 'NIVEL'
      OnGetText = sds_Recebe_CodUserNIVELGetText
    end
    object sds_Recebe_CodUserLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sds_Recebe_CodUserDATA: TDateField
      FieldName = 'DATA'
    end
    object sds_Recebe_CodUserADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      OnGetText = sds_Recebe_CodUserADMINISTRADORGetText
    end
    object sds_Recebe_CodUserNOMEL: TStringField
      FieldName = 'NOMEL'
      Size = 70
    end
  end
  object DSAssunto: TDataSource
    DataSet = sds_BuscaGridAba_II
    Left = 32
    Top = 440
  end
  object sds_BuscaGridAba_II: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select CODIGO, TITULOASSUN from ASSUNTO'#13#10'where TITULOASSUN like ' +
      ':NOMEASSUNTO'#13#10'order by TITULOASSUN'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NOMEASSUNTO'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NOMEASSUNTO'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_BuscaGridAba_IIFilterRecord
    Left = 120
    Top = 440
    object sds_BuscaGridAba_IICODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_BuscaGridAba_IITITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
  end
  object sds_RecebeCodAssunto: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select CODIGO, CURSO, DATA, TITULOASSUN from ASSUNTO'#13#10'where CODI' +
      'GO =:XCODIGO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'XCODIGO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'XCODIGO'
        ParamType = ptInput
      end>
    Left = 240
    Top = 440
    object sds_RecebeCodAssuntoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sds_RecebeCodAssuntoCURSO: TStringField
      FieldName = 'CURSO'
      Size = 140
    end
    object sds_RecebeCodAssuntoDATA: TDateField
      FieldName = 'DATA'
    end
    object sds_RecebeCodAssuntoTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
  end
  object DSAutor: TDataSource
    DataSet = sds_BuscaGridAba_III
    Left = 32
    Top = 528
  end
  object sds_BuscaGridAba_III: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select CODIGO, NOME from AUTORES'#13#10'where NOME like :DNOME'#13#10'order ' +
      'by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'DNOME'
        ParamType = ptInput
      end>
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'DNOME'
        ParamType = ptInput
      end>
    OnFilterRecord = sds_BuscaGridAba_IIIFilterRecord
    Left = 120
    Top = 528
    object sds_BuscaGridAba_IIICODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_BuscaGridAba_IIINOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
  end
  object sds_RecebeCodAutor: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select AU.*,CI.NOME_CIDADE,CI.UF,DP.NOME_DEP '#13#10'from AUTORES AU'#13#10 +
      'inner join CIDADES CI on CI.CODIGO = AU.COD_CIDADE'#13#10'inner join D' +
      'EPARTAMENTOS DP on DP.CODIGO = AU.COD_DEPARTAMENTO'#13#10'where AU.COD' +
      'IGO =:DCODIGO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'DCODIGO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'DCODIGO'
        ParamType = ptInput
      end>
    Left = 240
    Top = 528
    object sds_RecebeCodAutorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sds_RecebeCodAutorNOME: TStringField
      FieldName = 'NOME'
      Size = 140
    end
    object sds_RecebeCodAutorINSTITUICAO: TStringField
      FieldName = 'INSTITUICAO'
      Size = 140
    end
    object sds_RecebeCodAutorCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object sds_RecebeCodAutorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object sds_RecebeCodAutorDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object sds_RecebeCodAutorOUTROS: TStringField
      FieldName = 'OUTROS'
      Size = 140
    end
    object sds_RecebeCodAutorNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Required = True
      Size = 70
    end
    object sds_RecebeCodAutorNOME_DEP: TStringField
      FieldName = 'NOME_DEP'
      Required = True
      Size = 140
    end
    object sds_RecebeCodAutorUF: TStringField
      FieldName = 'UF'
      Required = True
      Size = 2
    end
  end
  object sds_BuscaNomeArquivo: TSimpleDataSet
    Aggregates = <>
    Connection = DM.SQLConnection
    DataSet.CommandText = 
      'select AQ.ID,AQ.TITULO,AQ.NOME_ARQUIVO,AQ.EXTENCAO,AQ.DATA,AQ.DE' +
      'SCRICAO,AQ.HORA,AQ.TAMANHO,AQ.INFORMACOES,UR.NOME,OT.NOME,SN.TIT' +
      'ULOASSUN'#13#10'from ARQUIVOLIST AQ'#13#10'inner join USUARIO UR on UR.COD_U' +
      'SUARIO = AQ.COD_USUARIO'#13#10'inner join AUTORES OT on OT.CODIGO = AQ' +
      '.COD_AUTOR'#13#10'inner join ASSUNTO SN on SN.CODIGO = AQ.COD_ASSUNTO'#13 +
      #10'where AQ.DESCRICAO like :NDESCRICAO'#13#10'order by AQ.DESCRICAO'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'NDESCRICAO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftString
        Name = 'NDESCRICAO'
        ParamType = ptInput
      end>
    Left = 240
    Top = 616
    object sds_BuscaNomeArquivoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sds_BuscaNomeArquivoTITULO: TStringField
      FieldName = 'TITULO'
      Size = 140
    end
    object sds_BuscaNomeArquivoNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 300
    end
    object sds_BuscaNomeArquivoEXTENCAO: TStringField
      FieldName = 'EXTENCAO'
      FixedChar = True
      Size = 6
    end
    object sds_BuscaNomeArquivoDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object sds_BuscaNomeArquivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 20000
    end
    object sds_BuscaNomeArquivoHORA: TTimeField
      FieldName = 'HORA'
    end
    object sds_BuscaNomeArquivoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
    object sds_BuscaNomeArquivoINFORMACOES: TMemoField
      FieldName = 'INFORMACOES'
      BlobType = ftMemo
      Size = 1
    end
    object sds_BuscaNomeArquivoNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object sds_BuscaNomeArquivoNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 140
    end
    object sds_BuscaNomeArquivoTITULOASSUN: TStringField
      FieldName = 'TITULOASSUN'
      Size = 140
    end
  end
  object sdt_Verif_Perfil: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'select PL.*'#13#10'from PERFIL PL'#13#10'where PL.CODIGO = :CODIGO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 184
    Top = 80
    object sdt_Verif_PerfilCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdt_Verif_PerfilNOMEL: TStringField
      FieldName = 'NOMEL'
      Size = 70
    end
    object sdt_Verif_PerfilARQUI_INSERIR: TStringField
      FieldName = 'ARQUI_INSERIR'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_EDITAR: TStringField
      FieldName = 'ARQUI_EDITAR'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_EXCLUIR: TStringField
      FieldName = 'ARQUI_EXCLUIR'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_CONSULTAR: TStringField
      FieldName = 'ARQUI_CONSULTAR'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_USUARIO: TStringField
      FieldName = 'ARQUI_USUARIO'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_ASSUNTOS: TStringField
      FieldName = 'ARQUI_ASSUNTOS'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_AUTORES: TStringField
      FieldName = 'ARQUI_AUTORES'
      Size = 1
    end
    object sdt_Verif_PerfilARQUI_LOCALIZAR: TStringField
      FieldName = 'ARQUI_LOCALIZAR'
      Size = 1
    end
    object sdt_Verif_PerfilUSUARIO_INSERIR: TStringField
      FieldName = 'USUARIO_INSERIR'
      Size = 1
    end
    object sdt_Verif_PerfilUSUARIO_EDITAR: TStringField
      FieldName = 'USUARIO_EDITAR'
      Size = 1
    end
    object sdt_Verif_PerfilUSUARIO_EXCLUIR: TStringField
      FieldName = 'USUARIO_EXCLUIR'
      Size = 1
    end
    object sdt_Verif_PerfilUSUARIO_TRAZER: TStringField
      FieldName = 'USUARIO_TRAZER'
      Size = 1
    end
    object sdt_Verif_PerfilCONFIG_CONVERTER: TStringField
      FieldName = 'CONFIG_CONVERTER'
      Size = 1
    end
    object sdt_Verif_PerfilCONFIG_BOTOES: TStringField
      FieldName = 'CONFIG_BOTOES'
      Size = 1
    end
    object sdt_Verif_PerfilASSUNTOS_INSERIR: TStringField
      FieldName = 'ASSUNTOS_INSERIR'
      Size = 1
    end
    object sdt_Verif_PerfilASSUNTOS_EDITAR: TStringField
      FieldName = 'ASSUNTOS_EDITAR'
      Size = 1
    end
    object sdt_Verif_PerfilASSUNTOS_TRAZER: TStringField
      FieldName = 'ASSUNTOS_TRAZER'
      Size = 1
    end
    object sdt_Verif_PerfilASSUNTOS_EXCLUIR: TStringField
      FieldName = 'ASSUNTOS_EXCLUIR'
      Size = 1
    end
    object sdt_Verif_PerfilAUTORES_INSERIR: TStringField
      FieldName = 'AUTORES_INSERIR'
      Size = 1
    end
    object sdt_Verif_PerfilAUTORES_EDITAR: TStringField
      FieldName = 'AUTORES_EDITAR'
      Size = 1
    end
    object sdt_Verif_PerfilAUTORES_EXCLUIR: TStringField
      FieldName = 'AUTORES_EXCLUIR'
      Size = 1
    end
    object sdt_Verif_PerfilAUTORES_TRAZER: TStringField
      FieldName = 'AUTORES_TRAZER'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_ARQUI_CONSULTAS: TStringField
      FieldName = 'MENU_ARQUI_CONSULTAS'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_ARQUI_ASSUNTOS: TStringField
      FieldName = 'MENU_ARQUI_ASSUNTOS'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_ARQUI_AUTORES: TStringField
      FieldName = 'MENU_ARQUI_AUTORES'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_USUARIO_CADASTRO: TStringField
      FieldName = 'MENU_USUARIO_CADASTRO'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_USUARIO_PERFIL: TStringField
      FieldName = 'MENU_USUARIO_PERFIL'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_MANUTENCAO_SQL: TStringField
      FieldName = 'MENU_MANUTENCAO_SQL'
      Size = 1
    end
    object sdt_Verif_PerfilMENU_MANUTENCAO_TEMP: TStringField
      FieldName = 'MENU_MANUTENCAO_TEMP'
      Size = 1
    end
  end
  object DSBuscaUsuario: TDataSource
    DataSet = sds_BuscaUsuario
    Left = 64
    Top = 680
  end
  object sds_BuscaUsuario: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select UR.COD_USUARIO,UR.NOME '#13#10'from USUARIO UR '#13#10'where UR.NOME ' +
      'like :NOME'#13#10'order by UR.NOME'
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
    Left = 168
    Top = 680
    object sds_BuscaUsuarioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_BuscaUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object dsp_Visual: TDataSetProvider
    DataSet = sdt_Visual
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 776
  end
  object sdt_Visual: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'select *  from VISUALIZADOR'#13#10'where ID=:ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DM.SQLConnection
    Left = 72
    Top = 776
    object sdt_VisualID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdt_VisualCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdt_VisualVISUAL: TIntegerField
      FieldName = 'VISUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cds_Visual: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Visual'
    OnNewRecord = cds_VisualNewRecord
    OnReconcileError = cds_VisualReconcileError
    Left = 312
    Top = 776
    object cds_VisualID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_VisualCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cds_VisualVISUAL: TIntegerField
      FieldName = 'VISUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sds_OpenPesqUser: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select COD_USUARIO, NOME from USUARIO'#13#10'where COD_USUARIO =:COD_U' +
      'SUARIO_ARQ'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO_ARQ'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USUARIO_ARQ'
        ParamType = ptInput
      end>
    OnReconcileError = sds_OpenPesqUserReconcileError
    Left = 416
    Top = 192
    object sds_OpenPesqUserCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object sds_OpenPesqUserNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
end
