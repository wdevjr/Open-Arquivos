program OpenArquivos;


uses
  Vcl.Forms,
  ABOUT in 'ABOUT.pas' {AboutBox},
  GifImage in 'GifImage.pas',
  UAutoPreench in 'UAutoPreench.pas' {frmGrid},
  UDM in 'UDM.pas' {DM: TDataModule},
  UDMII in 'UDMII.pas' {DMII: TDataModule},
  ULocalizarUser in 'ULocalizarUser.pas' {FrmLocalizarUser},
  UnAbertura in 'UnAbertura.pas' {Abertura},
  UnCadAssuntos in 'UnCadAssuntos.pas' {FrmCadAssuntos},
  UnCadAutores in 'UnCadAutores.pas' {FrmCadAutor},
  UnCadCidades in 'UnCadCidades.pas' {FrmCadCidades},
  UnCadDepartamento in 'UnCadDepartamento.pas' {FrmCadDepartamento},
  UnCadLog in 'UnCadLog.pas' {FrmCadLogDet},
  UnCadPerfil in 'UnCadPerfil.pas' {FrmCadPerfil},
  UnConfigArqu in 'UnConfigArqu.pas' {FrmConfigArqu},
  UnConsultaEspecial in 'UnConsultaEspecial.pas' {FrmView},
  UnConsultEspMaximized in 'UnConsultEspMaximized.pas' {FrmviewMax},
  UnContrUser in 'UnContrUser.pas' {FrmContrUser},
  UndDlgProcuraCidades in 'UndDlgProcuraCidades.pas' {FrmDlgProcuraCidades},
  UnDlgProcuraAssunto in 'UnDlgProcuraAssunto.pas' {FrmLocalizaAssunto},
  UnDlgProcuraAutor in 'UnDlgProcuraAutor.pas' {FrmLocalizarAutor},
  UnDlgProcuraCidDep in 'UnDlgProcuraCidDep.pas' {FrmDlgProcurarCidDep},
  UnDlgProcuraDepartamento in 'UnDlgProcuraDepartamento.pas' {FrmDlgProcuraDepartamento},
  UnDlgProcuraPerfil in 'UnDlgProcuraPerfil.pas' {FrmDlgProcuraPerfil},
  UnDlgProcuraPerfilProc_I in 'UnDlgProcuraPerfilProc_I.pas' {FrmDlgProcuraPerfiProc_I},
  UnDlgProcuraPerfilUser in 'UnDlgProcuraPerfilUser.pas',
  UnGridPesquiza in 'UnGridPesquiza.pas' {FrmGridAba},
  UnLocalizarUserCod in 'UnLocalizarUserCod.pas' {FrmLocalizarUserCod},
  UnLogin in 'UnLogin.pas' {FrmLogin},
  UnManutencao in 'UnManutencao.pas' {FrmMatencao},
  UnMensProce in 'UnMensProce.pas' {FrmProcedimento},
  UnProcessIndefinido in 'UnProcessIndefinido.pas' {frmSplash},
  UnStatus in 'UnStatus.pas' {FrmStatus},
  UnTeladeRelatorios in 'UnTeladeRelatorios.pas' {FrmRelatoriosGerais},
  UnUtilitLog in 'UnUtilitLog.pas' {FrmLogAcesso},
  UProjeto in 'UProjeto.pas' {FrPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UnIncluirUsuarios in 'UnIncluirUsuarios.pas' {frmIncluir},
  UnNovVersao in 'UnNovVersao.pas' {FrmArquProc},
  UnatribuiUsuariosPorArquivos in 'UnatribuiUsuariosPorArquivos.pas' {FrmAtribuiUser},
  UThema in 'UThema.pas' {FrmThemas},
  UnFrontColor in 'UnFrontColor.pas' {FrmFrontColor},
  UnViewTextoTelaInicial in 'UnViewTextoTelaInicial.pas' {FrmTelaTexto},
  reinit in 'reinit.pas',
  remain in 'remain.pas' {MainForm};

{$R *.res}

begin

  Application.MainFormOnTaskbar := True;
  Application.Initialize;
  //Abertura := TAbertura.Create(Application);
  //Abertura.Show;
  //Abertura.Refresh;



  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMII, DMII);
  Application.CreateForm(TFrPrincipal, FrPrincipal);
  Application.CreateForm(TFrmThemas, FrmThemas);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmGrid, frmGrid);
  Application.CreateForm(TFrmLocalizarUser, FrmLocalizarUser);
  Application.CreateForm(TFrmCadAssuntos, FrmCadAssuntos);
  Application.CreateForm(TFrmCadAutor, FrmCadAutor);
  Application.CreateForm(TFrmCadCidades, FrmCadCidades);
  Application.CreateForm(TFrmCadDepartamento, FrmCadDepartamento);
  Application.CreateForm(TFrmCadLogDet, FrmCadLogDet);
  Application.CreateForm(TFrmCadPerfil, FrmCadPerfil);
  Application.CreateForm(TFrmConfigArqu, FrmConfigArqu);
  Application.CreateForm(TFrmView, FrmView);
  Application.CreateForm(TFrmviewMax, FrmviewMax);
  Application.CreateForm(TFrmContrUser, FrmContrUser);
  Application.CreateForm(TFrmDlgProcuraCidades, FrmDlgProcuraCidades);
  Application.CreateForm(TFrmLocalizaAssunto, FrmLocalizaAssunto);
  Application.CreateForm(TFrmLocalizarAutor, FrmLocalizarAutor);
  Application.CreateForm(TFrmDlgProcurarCidDep, FrmDlgProcurarCidDep);
  Application.CreateForm(TFrmDlgProcuraDepartamento, FrmDlgProcuraDepartamento);
  Application.CreateForm(TFrmDlgProcuraPerfil, FrmDlgProcuraPerfil);
  Application.CreateForm(TFrmDlgProcuraPerfiProc_I, FrmDlgProcuraPerfiProc_I);
  Application.CreateForm(TFrmGridAba, FrmGridAba);
  Application.CreateForm(TFrmLocalizarUserCod, FrmLocalizarUserCod);
  Application.CreateForm(TFrmMatencao, FrmMatencao);
  Application.CreateForm(TFrmProcedimento, FrmProcedimento);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TFrmStatus, FrmStatus);
  Application.CreateForm(TFrmRelatoriosGerais, FrmRelatoriosGerais);
  Application.CreateForm(TFrmLogAcesso, FrmLogAcesso);
  Application.CreateForm(TfrmIncluir, frmIncluir);
  Application.CreateForm(TFrmArquProc, FrmArquProc);
  Application.CreateForm(TFrmAtribuiUser, FrmAtribuiUser);
  Application.CreateForm(TFrmFrontColor, FrmFrontColor);
  Application.CreateForm(TFrmTelaTexto, FrmTelaTexto);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAbertura, Abertura);
  Application.Run;

end.
