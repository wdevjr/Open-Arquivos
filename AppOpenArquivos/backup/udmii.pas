unit UDMII;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ZDataset, ZSqlUpdate, lr_e_pdf, lrPDFExport, DB, Dialogs;

type

  { TDMII }

  TDMII = class(TDataModule)
    cds_PerfilARQUI_ASSUNTOS: TStringField;
    cds_PerfilARQUI_AUTORES: TStringField;
    cds_PerfilARQUI_CONSULTAR: TStringField;
    cds_PerfilARQUI_EDITAR: TStringField;
    cds_PerfilARQUI_EXCLUIR: TStringField;
    cds_PerfilARQUI_INSERIR: TStringField;
    cds_PerfilARQUI_LOCALIZAR: TStringField;
    cds_PerfilARQUI_USUARIO: TStringField;
    cds_PerfilASSUNTOS_EDITAR: TStringField;
    cds_PerfilASSUNTOS_EXCLUIR: TStringField;
    cds_PerfilASSUNTOS_INSERIR: TStringField;
    cds_PerfilASSUNTOS_TRAZER: TStringField;
    cds_PerfilAUTORES_EDITAR: TStringField;
    cds_PerfilAUTORES_EXCLUIR: TStringField;
    cds_PerfilAUTORES_INSERIR: TStringField;
    cds_PerfilAUTORES_TRAZER: TStringField;
    cds_PerfilCODIGO: TLongintField;
    cds_PerfilCONFIG_BOTOES: TStringField;
    cds_PerfilCONFIG_CONVERTER: TStringField;
    cds_PerfilMENU_ARQUI_ASSUNTOS: TStringField;
    cds_PerfilMENU_ARQUI_AUTORES: TStringField;
    cds_PerfilMENU_ARQUI_CONSULTAS: TStringField;
    cds_PerfilMENU_MANUTENCAO_SQL: TStringField;
    cds_PerfilMENU_MANUTENCAO_TEMP: TStringField;
    cds_PerfilMENU_USUARIO_CADASTRO: TStringField;
    cds_PerfilMENU_USUARIO_PERFIL: TStringField;
    cds_PerfilNOMEL: TStringField;
    cds_PerfilUSUARIO_EDITAR: TStringField;
    cds_PerfilUSUARIO_EXCLUIR: TStringField;
    cds_PerfilUSUARIO_INSERIR: TStringField;
    cds_PerfilUSUARIO_TRAZER: TStringField;
    DSCliente: TDataSource;
    sds_BuscaGridAbaCOD_USUARIO: TLongintField;
    sds_BuscaGridAbaLOGIN: TStringField;
    sds_BuscaGridAbaNOME: TStringField;
    sds_LocalizarLogUserCODIGO: TLongintField;
    sds_LocalizarLogUserLOGIN: TStringField;
    sds_LocalizarLogUserNOME: TStringField;
    sds_LocalUserSisCOD_USUARIO: TLongintField;
    sds_LocalUserSisNOME: TStringField;
    sds_OpenPesqUserCOD_USUARIO: TLongintField;
    sds_OpenPesqUserNOME: TStringField;
    sds_OpenUserCOD_USUARIO: TLongintField;
    sds_OpenUserNOME: TStringField;
    sds_Pesq_PLCODIGO: TLongintField;
    sds_Pesq_PLNOMEL: TStringField;
    cds_CadAssistentCODIGO: TLongintField;
    cds_CadAssistentFOTO: TBlobField;
    cds_CadAssistentLOGIN: TStringField;
    cds_CadAssistentNOME: TStringField;
    cds_CadAssistentSENHA: TStringField;
    sdt_Verif_Perfil: TZQuery;
    cds_Perfil: TZQuery;
    sds_Pesq_PL: TZQuery;
    cds_CadAssistent: TZQuery;
    sds_LocalizarLogUser: TZQuery;
    sds_sddata_all: TZQuery;
    sds_LocalUserSis: TZQuery;
    sds_OpenUser: TZQuery;
    sds_OpenPesqUser: TZQuery;
    sds_BuscaGridAba: TZQuery;
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
    zQryNomeUsers: TZQuery;
    zQryNomeUsersNOME: TStringField;
    ZQueryConsultaNome: TZQuery;
    ZQueryConsultaNomeNOMEL: TStringField;
    ZUpdateSQLPerfil: TZUpdateSQL;
    procedure cds_PerfilBeforePost(DataSet: TDataSet);
    procedure cds_PerfilNewRecord(DataSet: TDataSet);
    procedure cds_CadAssistentNewRecord(DataSet: TDataSet);
    procedure cds_PerfilPostError(DataSet: TDataSet; E: EDatabaseError;
      var DataAction: TDataAction);
  private

  public
    codigoPerfil: integer;
    procedure CarregaPerfil;
  end;

var
  DMII: TDMII;

implementation

{$R *.lfm}

uses UnLogin, UnDM, UnCadPerfil;

procedure TDMII.cds_PerfilNewRecord(DataSet: TDataSet);
begin
  DM.IncrementaPersonalizado('PERFIL', cds_PerfilCODIGO);
end;

procedure TDMII.cds_PerfilBeforePost(DataSet: TDataSet);
begin
  //if cds_Perfil.State = dsInsert then
  //begin
  //  if (FrmCadPerfil.DBCheckBox3.Checked = True) then
  //  begin
  //    cds_PerfilARQUI_INSERIR.Value := 'S';
  //  end
  //  else
  //  begin
  //    cds_PerfilARQUI_INSERIR.Value := 'N';
  //  end;

  //if (FrmCadPerfil.DBCheckBox18.Checked = True) then
  //begin
  //  cds_PerfilARQUI_EDITAR.Value := 'S';
  //end
  //else
  //begin
  //  cds_PerfilARQUI_EDITAR.Value := 'N';
  //end;
  //if (FrmCadPerfil.DBCheckBox5.Checked = True) then
  //begin
  //  cds_PerfilARQUI_EXCLUIR.Value := 'S';
  //end
  //else
  //begin
  //  cds_PerfilARQUI_EXCLUIR.Value := 'N';
  //end;
  if (FrmCadPerfil.DBCheckBox7.Checked = True) then
  begin
    cds_PerfilARQUI_CONSULTAR.Value := 'S';
  end
  else
  begin
    cds_PerfilARQUI_CONSULTAR.Value := 'N';
  end;
  if (FrmCadPerfil.DBCheckBox8.Checked = True) then
  begin
    cds_PerfilARQUI_USUARIO.Value := 'S';
  end
  else
  begin
    cds_PerfilARQUI_USUARIO.Value := 'N';
  end;
  if (FrmCadPerfil.DBCheckBox33.Checked = True) then
  begin
    cds_PerfilARQUI_ASSUNTOS.Value := 'S';
  end
  else
  begin
    cds_PerfilARQUI_ASSUNTOS.Value := 'N';
  end;
  if (FrmCadPerfil.DBCheckBox34.Checked = True) then
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
  //if (FrmCadPerfil.DBCheckBox1.Checked = True) then
  //begin
  //  cds_PerfilARQUI_LOCALIZAR.Value := 'S';
  //end
  //else
  //begin
  //  cds_PerfilARQUI_LOCALIZAR.Value := 'N';
  //end;

  // Sess?o Usu?rio

  if (FrmCadPerfil.DBCheckBox11.Checked = True) then
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
  if (FrmCadPerfil.DBCheckBox19.Checked = True) then
  begin
    cds_PerfilUSUARIO_EDITAR.Value := 'S';
  end
  else
  begin
    cds_PerfilUSUARIO_EDITAR.Value := 'N';
  end;
  if (FrmCadPerfil.DBCheckBox13.Checked = True) then
  begin
    cds_PerfilUSUARIO_EXCLUIR.Value := 'S';
  end
  else
  begin
    cds_PerfilUSUARIO_EXCLUIR.Value := 'N';
  end;
  if (FrmCadPerfil.DBCheckBox14.Checked = True) then
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

        if (FrmCadPerfil.DBCheckBox35.Checked = true) then
        begin
          cds_PerfilCONFIG_CONVERTER.Value := 'S';
        end
        else
        begin
          cds_PerfilCONFIG_CONVERTER.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox36.Checked = true) then
        begin
          cds_PerfilCONFIG_BOTOES.Value := 'S';
        end
        else
        begin
          cds_PerfilCONFIG_BOTOES.Value := 'N';
        end;

        // Sess?o Assuntos

        if (FrmCadPerfil.DBCheckBox21.Checked = true) then
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
        if (FrmCadPerfil.DBCheckBox29.Checked = true) then
        begin
          cds_PerfilASSUNTOS_EDITAR.Value := 'S';
        end
        else
        begin
          cds_PerfilASSUNTOS_EDITAR.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox30.Checked = true) then
        begin
          cds_PerfilASSUNTOS_EXCLUIR.Value := 'S';
        end
        else
        begin
          cds_PerfilASSUNTOS_EXCLUIR.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox32.Checked = true) then
        begin
          cds_PerfilASSUNTOS_TRAZER.Value := 'S';
        end
        else
        begin
          cds_PerfilASSUNTOS_TRAZER.Value := 'N';
        end;

        // Sess?o Autores

        if (FrmCadPerfil.DBCheckBox25.Checked = true) then
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
        if (FrmCadPerfil.DBCheckBox22.Checked = true) then
        begin
          cds_PerfilAUTORES_EDITAR.Value := 'S';
        end
        else
        begin
          cds_PerfilAUTORES_EDITAR.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox23.Checked = true) then
        begin
          cds_PerfilAUTORES_EXCLUIR.Value := 'S';
        end
        else
        begin
          cds_PerfilAUTORES_EXCLUIR.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox27.Checked = true) then
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
        if (FrmCadPerfil.DBCheckBox37.Checked = true) then
        begin
          cds_PerfilMENU_ARQUI_CONSULTAS.Value := 'S';
        end
        else
        begin
          cds_PerfilMENU_ARQUI_CONSULTAS.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox2.Checked = true) then
        begin
          cds_PerfilMENU_ARQUI_ASSUNTOS.Value := 'S';
        end
        else
        begin
          cds_PerfilMENU_ARQUI_ASSUNTOS.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox38.Checked = true) then
        begin
          cds_PerfilMENU_ARQUI_AUTORES.Value := 'S';
        end
        else
        begin
          cds_PerfilMENU_ARQUI_AUTORES.Value := 'N';
        end;

        // Sess?o do Menu Usu?rio

        if (FrmCadPerfil.DBCheckBox39.Checked = true) then
        begin
          cds_PerfilMENU_USUARIO_CADASTRO.Value := 'S';
        end
        else
        begin
          cds_PerfilMENU_USUARIO_CADASTRO.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox40.Checked = true) then
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

        if (FrmCadPerfil.DBCheckBox42.Checked = true) then
        begin
          cds_PerfilMENU_MANUTENCAO_SQL.Value := 'S';
        end
        else
        begin
          cds_PerfilMENU_MANUTENCAO_SQL.Value := 'N';
        end;
        if (FrmCadPerfil.DBCheckBox43.Checked = true) then
        begin
          cds_PerfilMENU_MANUTENCAO_TEMP.Value := 'S';
        end
        else
        begin
          cds_PerfilMENU_MANUTENCAO_TEMP.Value := 'N';
        end;
         if (FrmCadPerfil.DBCheckBox44.State=cbChecked) then
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
  // end;
end;

procedure TDMII.cds_CadAssistentNewRecord(DataSet: TDataSet);
begin
  DM.IncrementaPersonalizado('USUARIO_LOG', cds_CadAssistentCODIGO);
end;

procedure TDMII.cds_PerfilPostError(DataSet: TDataSet; E: EDatabaseError;
  var DataAction: TDataAction);
begin
  DataAction:=daAbort;
  ShowMessage('Esse nome já Existe no Perfil!');
end;

procedure TDMII.CarregaPerfil;
begin
  sdt_Verif_Perfil.Connection := DM.ZConnection;
  //codigoPerfil := FrmLogin.COD_PERFIL;
  sdt_Verif_Perfil.Close;
  sdt_Verif_Perfil.Params[0].AsInteger := FrmLogin.COD_PERFIL;
  sdt_Verif_Perfil.Open;
end;

end.
