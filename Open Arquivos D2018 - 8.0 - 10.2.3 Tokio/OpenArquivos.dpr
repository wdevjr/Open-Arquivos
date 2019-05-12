program OpenArquivos;

uses
  Vcl.Forms,
  ABOUT in 'ABOUT.pas' {AboutBox} ,
  GifImage in 'GifImage.pas',
  UAutoPreench in 'UAutoPreench.pas' {frmGrid} ,
  UDM in 'UDM.pas' {DM: TDataModule} ,
  UDMII in 'UDMII.pas' {DMII: TDataModule} ,
  ULocalizarUser in 'ULocalizarUser.pas' {FrmLocalizarUser} ,
  UnAbertura in 'UnAbertura.pas' {Abertura} ,
  UnCadAssuntos in 'UnCadAssuntos.pas' {FrmCadAssuntos} ,
  UnCadAutores in 'UnCadAutores.pas' {FrmCadAutor} ,
  UnCadCidades in 'UnCadCidades.pas' {FrmCadCidades} ,
  UnCadDepartamento in 'UnCadDepartamento.pas' {FrmCadDepartamento} ,
  UnCadLog in 'UnCadLog.pas' {FrmCadLogDet} ,
  UnCadPerfil in 'UnCadPerfil.pas' {FrmCadPerfil} ,
  UnConfigArqu in 'UnConfigArqu.pas' {FrmConfigArqu} ,
  UnConsultaEspecial in 'UnConsultaEspecial.pas' {FrmView} ,
  UnConsultEspMaximized in 'UnConsultEspMaximized.pas' {FrmviewMax} ,
  UnContrUser in 'UnContrUser.pas' {FrmContrUser} ,
  UndDlgProcuraCidades in 'UndDlgProcuraCidades.pas' {FrmDlgProcuraCidades} ,
  UnDlgProcuraAssunto in 'UnDlgProcuraAssunto.pas' {FrmLocalizaAssunto} ,
  UnDlgProcuraAutor in 'UnDlgProcuraAutor.pas' {FrmLocalizarAutor} ,
  UnDlgProcuraCidDep in 'UnDlgProcuraCidDep.pas' {FrmDlgProcurarCidDep} ,
  UnDlgProcuraDepartamento
    in 'UnDlgProcuraDepartamento.pas' {FrmDlgProcuraDepartamento} ,
  UnDlgProcuraPerfil in 'UnDlgProcuraPerfil.pas' {FrmDlgProcuraPerfil} ,
  UnDlgProcuraPerfilProc_I
    in 'UnDlgProcuraPerfilProc_I.pas' {FrmDlgProcuraPerfiProc_I} ,
  UnDlgProcuraPerfilUser in 'UnDlgProcuraPerfilUser.pas',
  UnGridPesquiza in 'UnGridPesquiza.pas' {FrmGridAba} ,
  UnLocalizarUserCod in 'UnLocalizarUserCod.pas' {FrmLocalizarUserCod} ,
  UnLogin in 'UnLogin.pas' {FrmLogin} ,
  UnManutencao in 'UnManutencao.pas' {FrmMatencao} ,
  UnMensProce in 'UnMensProce.pas' {FrmProcedimento} ,
  UnProcessIndefinido in 'UnProcessIndefinido.pas' {frmSplash} ,
  UnStatus in 'UnStatus.pas' {FrmStatus} ,
  UnTeladeRelatorios in 'UnTeladeRelatorios.pas' {FrmRelatoriosGerais} ,
  UnUtilitLog in 'UnUtilitLog.pas' {FrmLogAcesso} ,
  UProjeto in 'UProjeto.pas' {FrPrincipal} ,
  Vcl.Themes,
  Vcl.Styles,
  UnIncluirUsuarios in 'UnIncluirUsuarios.pas' {frmIncluir} ,
  UnNovVersao in 'UnNovVersao.pas' {FrmArquProc} ,
  UnatribuiUsuariosPorArquivos
    in 'UnatribuiUsuariosPorArquivos.pas' {FrmAtribuiUser} ,
  UThema in 'UThema.pas' {FrmThemas} ,
  UnFrontColor in 'UnFrontColor.pas' {FrmFrontColor} ,
  UnViewTextoTelaInicial in 'UnViewTextoTelaInicial.pas' {FrmTelaTexto} ,
  reinit in 'reinit.pas',
  remain in 'remain.pas' {MainForm};

{$R *.res}

begin

  Application.MainFormOnTaskbar := True;
  Application.Initialize;
  Abertura := TAbertura.Create(Application);
  Abertura.Show;
  Abertura.Refresh;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMII, DMII);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;

end.
