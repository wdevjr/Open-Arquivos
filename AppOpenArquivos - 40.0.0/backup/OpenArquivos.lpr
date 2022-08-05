program OpenArquivos;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  UnPrinc,
  UnDM,
  UnCadLog,
  UnUtilitLog,
  zcomponent,
  unDlgPesquisaArquivo,
  UnDlgProcuraAutor,
  UnDlgProcuraDepartamento,
  UnCadDepartamento,
  UnCadCidades,
  UAutoPreench,
  UndDlgProcuraCidades,
  UnLogin,
  UnCadPerfil,
  UnCadAutores,
  UnCadAssuntos,
  UnAbertura,
  unDlgDescricao,
  UnDlgProcuraPerfilUser,
  ULocalizarUser,
  UnDlgProcuraPerfil,
  UnDlgDialogAssunto,
  UnDlgProcuraAssunto,
  undlgpesquisautores,
  UnProcessIndefinido,
  UnatribuiUsuariosPorArquivos,
  UnIncluirUsuarios,
  UnConsultaEspecial,
  UnLocalizarUserCod,
  UnConsultEspMaximized,
  datetimectrls,
  uncadastrousuarios,
  pkg_gifanim,
  UDMII,
  undlgpesquisaUsuario,
  lazreportpdfexport,
  thema,
  UnCadArquivos;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Title:='OpenArquivos';
  Application.Scaled := True;
  Application.Initialize;

  Abertura := TAbertura.Create(nil);
  Abertura.Show;
  Abertura.Refresh;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMII, DMII);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.

