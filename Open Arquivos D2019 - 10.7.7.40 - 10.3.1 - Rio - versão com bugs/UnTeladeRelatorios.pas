unit UnTeladeRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, jpeg, DB,
  SimpleDS;

type
  TFrmRelatoriosGerais = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    DtsrcMult: TDataSource;
    Panel5: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    EditUserCod: TEdit;
    Label9: TLabel;
    EditUserName: TEdit;
    SpeedButtonUser: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    EditCodAssunto: TEdit;
    Label12: TLabel;
    EditNomeAssunto: TEdit;
    SpeedButtonAssunto: TSpeedButton;
    Label7: TLabel;
    PanelGridBar: TPanel;
    SpeedButton3: TSpeedButton;
    AtivarPesquiza01: TSpeedButton;
    AtivarPesquiza02: TSpeedButton;
    Label5: TLabel;
    SpeedButtonAutor: TSpeedButton;
    AtivarPesquiza03: TSpeedButton;
    EditCodAutor: TEdit;
    EditNomeAutor: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    AtivarPesquiza04: TSpeedButton;
    Label17: TLabel;
    Edit2: TEdit;
    PanelAlertPresente: TPanel;
    SpeedButtonArquivo: TSpeedButton;
    Label16: TLabel;
    NumLocalizados: TLabel;
    Label19: TLabel;
    PanelAlertArquiAusente: TPanel;
    Label2: TLabel;
    Image4: TImage;
    Image1: TImage;
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonArquivoClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure EditNomeAutorChange(Sender: TObject);
    procedure EditNomeAutorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonAutorClick(Sender: TObject);
    procedure EditNomeAutorKeyPress(Sender: TObject; var Key: Char);
    procedure AtivarPesquiza03Click(Sender: TObject);
    procedure AtivarPesquiza04Click(Sender: TObject);
    procedure SpeedButtonAssuntoClick(Sender: TObject);
    procedure AtivarPesquiza02Click(Sender: TObject);
    procedure EditNomeAssuntoChange(Sender: TObject);
    procedure EditNomeAssuntoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNomeAssuntoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonUserClick(Sender: TObject);
    procedure AtivarPesquiza01Click(Sender: TObject);
    procedure EditUserNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditUserNameChange(Sender: TObject);
    procedure EditUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditMultConsultKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

  end;

var
  FrmRelatoriosGerais: TFrmRelatoriosGerais;

implementation

uses UDMII, UDM, UnGridPesquiza;

{$R *.dfm}

procedure TFrmRelatoriosGerais.AtivarPesquiza01Click(Sender: TObject);
begin
  if (DMII.DSCliente.DataSet.IsEmpty = False) and
    (DMII.DSCliente.DataSet.RecordCount > 0) then
  begin
    SpeedButtonUser.Enabled := True;
  end;
end;

procedure TFrmRelatoriosGerais.AtivarPesquiza02Click(Sender: TObject);
begin
  if (DMII.DSAssunto.DataSet.IsEmpty = False) and
    (DMII.DSAssunto.DataSet.RecordCount > 0) then
  begin
    SpeedButtonAssunto.Enabled := True;
  end;
end;

procedure TFrmRelatoriosGerais.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmRelatoriosGerais.EditNomeAssuntoChange(Sender: TObject);
begin
  if EditNomeAssunto.Text <> '' then
  begin
    AtivarPesquiza02.Visible := True;
  end;
end;

procedure TFrmRelatoriosGerais.EditNomeAssuntoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    DMII.DSCliente.DataSet.close;
    DMII.DSAssunto.DataSet.close;
    DMII.DSAutor.DataSet.close;
    if EditNomeAssunto.Text <> '' then
    begin
      with DMII.DSAssunto.DataSet as TSimpleDataSet do
      Begin
        close;
        Params[0].AsString := '%' + EditNomeAssunto.Text + '%';
        Open;
        FrmGridAba := TFrmGridAba.Create(self);
        FrmGridAba.DBGrid1.DataSource := DMII.DSAssunto;
        if (FrmGridAba.showModal = mrOk) and (not DMII.DSAssunto.DataSet.IsEmpty)
        then
        begin
          TEdit(Sender).Text := DMII.DSAssunto.DataSet['TITULOASSUN'];
          EditCodAssunto.Text := DMII.DSAssunto.DataSet.FieldByName
            ('CODIGO').AsString;
        end;
      end;
    end;
  end;
end;

procedure TFrmRelatoriosGerais.EditNomeAssuntoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    EditCodAssunto.Clear;
    EditNomeAssunto.Clear;
    AtivarPesquiza02.Visible := False;
    SpeedButtonAssunto.Enabled := False;
  end;
end;

procedure TFrmRelatoriosGerais.EditNomeAutorChange(Sender: TObject);
begin
  if EditNomeAutor.Text <> '' then
  begin
    AtivarPesquiza03.Visible := True;
  end;
end;

procedure TFrmRelatoriosGerais.EditNomeAutorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    DMII.DSCliente.DataSet.close;
    DMII.DSAssunto.DataSet.close;
    DMII.DSAutor.DataSet.close;
    if EditNomeAutor.Text <> '' then
    begin
      with DMII.DSAutor.DataSet as TSimpleDataSet do
      Begin
        close;
        Params[0].AsString := '%' + EditNomeAutor.Text + '%';
        Open;
        FrmGridAba := TFrmGridAba.Create(self);
        FrmGridAba.DBGrid1.DataSource := DMII.DSAutor;
        if (FrmGridAba.showModal = mrOk) and (not DMII.DSAutor.DataSet.IsEmpty)
        then
        begin
          TEdit(Sender).Text := DMII.DSAutor.DataSet['NOME'];
          EditCodAutor.Text := DMII.DSAutor.DataSet.FieldByName
            ('CODIGO').AsString;
        end;
      end;
    end;
  end;
end;

procedure TFrmRelatoriosGerais.EditNomeAutorKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    EditCodAutor.Clear;
    EditNomeAutor.Clear;
    AtivarPesquiza03.Visible := False;
    SpeedButtonAutor.Enabled := False;
  end;
end;

procedure TFrmRelatoriosGerais.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
  begin
    AtivarPesquiza04.Visible := True;
  end
  else
    AtivarPesquiza04.Visible := False;

end;

procedure TFrmRelatoriosGerais.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    Edit2.Clear;
    AtivarPesquiza04.Visible := False;
    PanelAlertPresente.Visible := False;
    PanelAlertArquiAusente.Visible := False;
    SpeedButtonArquivo.Enabled := False;
  end;
end;

procedure TFrmRelatoriosGerais.EditMultConsultKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key in [#8, #48 .. #57]) then
    Key := #0;
end;

procedure TFrmRelatoriosGerais.EditUserNameChange(Sender: TObject);
begin
  if EditUserName.Text <> '' then
  begin
    AtivarPesquiza01.Visible := True;
  end;
end;

procedure TFrmRelatoriosGerais.EditUserNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  // esperimentando o procedimento ...
  if (Key = #13) then
  begin
    DMII.DSCliente.DataSet.close;
    DMII.DSAssunto.DataSet.close;
    DMII.DSAutor.DataSet.close;
    if EditUserName.Text <> '' then
    begin
      with DMII.DSCliente.DataSet as TSimpleDataSet do
      Begin
        close;
        Params[0].AsString := '%' + EditUserName.Text + '%';
        Open;
        FrmGridAba := TFrmGridAba.Create(self);
        FrmGridAba.DBGrid1.DataSource := DMII.DSCliente;
        if (FrmGridAba.showModal = mrOk) and (not DMII.DSCliente.DataSet.IsEmpty)
        then
        begin
          TEdit(Sender).Text := DMII.DSCliente.DataSet['NOME'];
          EditUserCod.Text := DMII.DSCliente.DataSet.FieldByName
            ('COD_USUARIO').AsString;
        end;
      end;
    end;
  end;
end;

procedure TFrmRelatoriosGerais.EditUserNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    EditUserCod.Clear;
    EditUserName.Clear;
    AtivarPesquiza01.Visible := False;
    SpeedButtonUser.Enabled := False;
  end;

end;

procedure TFrmRelatoriosGerais.AtivarPesquiza04Click(Sender: TObject);
begin
  try
    with DMII.sds_BuscaNomeArquivo do
    begin
      close;
      Params[0].AsString := '%' + Edit2.Text + '%';
      Screen.Cursor := crHourGlass;
      Open;
    end;
  Finally
    if DMII.sds_BuscaNomeArquivo.RecordCount = 0 then
    begin
      PanelAlertArquiAusente.Visible := True;
      PanelAlertPresente.Visible := False;
      Screen.Cursor := crDefault;
    end
    else
    begin
      PanelAlertArquiAusente.Visible := False;
      PanelAlertPresente.Visible := True;
      NumLocalizados.Caption := IntToStr(DMII.sds_BuscaNomeArquivo.RecordCount);
      Screen.Cursor := crDefault;
      SpeedButtonArquivo.Enabled := True;
    end;
  end;
end;

procedure TFrmRelatoriosGerais.SpeedButton3Click(Sender: TObject);
begin
  close;
end;

procedure TFrmRelatoriosGerais.AtivarPesquiza03Click(Sender: TObject);
begin
  if (DMII.DSAutor.DataSet.IsEmpty = False) and
    (DMII.DSAutor.DataSet.RecordCount > 0) then
  begin
    SpeedButtonAutor.Enabled := True;
  end;
end;

procedure TFrmRelatoriosGerais.SpeedButtonArquivoClick(Sender: TObject);
begin
  // DMII.RvProjectNomeArqui.ProjectFile :=
  // 'ReportGeral/ProjectRelatorioNomeArqui.rav';
  // DMII.RvProjectNomeArqui.Execute;
  // DMII.ppReport1.Print;
end;

procedure TFrmRelatoriosGerais.SpeedButtonAssuntoClick(Sender: TObject);
begin
  if (not DMII.sds_BuscaGridAba_II.Eof) then
  begin
    try
      with DMII.sds_RecebeCodAssunto do
      begin
        close;
        Params[0].AsInteger := StrToInt(EditCodAssunto.Text);
        Open;
      end;
    finally
      // DMII.RvProjectAssunto.ProjectFile :=
      // 'ReportGeral/ProjectRelatorioAssunto.rav';
      // DMII.RvProjectAssunto.Execute;
      // DMII.ppReportCodAssunto.Print;
    end;
  end;
end;

procedure TFrmRelatoriosGerais.SpeedButtonAutorClick(Sender: TObject);
begin
  if (not DMII.sds_BuscaGridAba_III.Eof) then
  begin
    try
      with DMII.sds_RecebeCodAutor do
      begin
        close;
        Params[0].AsInteger := StrToInt(EditCodAutor.Text);
        Open;
      end;
    finally
      // DMII.RvProjectAutor.ProjectFile :=
      // 'ReportGeral/ProjectRelatorioAutor.rav';
      // DMII.RvProjectAutor.Execute;
      // DMII.ppReportCodAutor.Print;
    end;
  end;
end;

procedure TFrmRelatoriosGerais.SpeedButtonUserClick(Sender: TObject);
begin

  if (not DMII.sds_BuscaGridAba.Eof) then
  begin
    try
      with DMII.sds_Recebe_CodUser do
      begin
        close;
        Params[0].AsInteger := StrToInt(EditUserCod.Text);
        Open;
      end;
    finally
      // DMII.RvProject1.ProjectFile := 'ReportGeral/ProjectUser.rav';
      // DMII.RvProject1.Execute;
    end;
  end;
  { if (not DMII.sds_BuscaGridAba.Eof) then
    begin
    try
    with DMII.sds_Recebe_CodUser do
    begin
    Close;
    Params[0].AsInteger:=StrToInt(EditUserCod.Text);
    open;
    end;
    finally
    DMII.ppReportCodUser.Print;
    end;
    end; }

end;

end.
