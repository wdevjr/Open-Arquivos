// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnConsultEspMaximized;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DBCtrls, DB;

type

  { TFrmviewMax }

  TFrmviewMax = class(TForm)
    DBGrid1Max: TDBGrid;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Dtsrc: TDataSource;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel6: TPanel;
    Image2: TImage;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1MaxCellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    selecAtualReport: integer;
  public
    codigoArquMax: integer;
  end;

var
  FrmviewMax: TFrmviewMax;

implementation

uses UnDM, unprinc, UnConsultaEspecial, UnLogin;

{$R *.lfm}

procedure TFrmviewMax.FormShow(Sender: TObject);
begin
  DBMemo1.DataField := 'DESCRICAO';
  if (FrmLogin.TODOS = 0) then
  begin
    Dtsrc.DataSet := DM.sds_view;
  end;
  { else
    begin
    Dtsrc.DataSet := DM.sds_view_todos;
    end; }
end;

procedure TFrmviewMax.SpeedButton1Click(Sender: TObject);
begin
  BitBtn1.Visible := True;
end;

procedure TFrmviewMax.BitBtn1Click(Sender: TObject);
begin
  DM.sds_view.Close;
  FrmView.Close;
end;

procedure TFrmviewMax.DBGrid1MaxCellClick(Column: TColumn);
begin
  if (DBGrid1Max.DataSource.DataSet.FieldCount <> 0) then
  begin
    codigoArquMax := DBGrid1Max.DataSource.DataSet.Fields[0].AsInteger;
    selecAtualReport := DBGrid1Max.DataSource.DataSet.Fields[0].AsInteger;
  end
  else
    Abort;

end;

procedure TFrmviewMax.SpeedButton2Click(Sender: TObject);
begin
  try
    try
      DM.ZQueryRelatorioArquivo.Close;
      DM.ZQueryRelatorioArquivo.Params[0].Value :=
        DM.sds_view.FieldByName('ID').AsInteger;
      DM.ZQueryRelatorioArquivo.Open;
    except
      on E: Exception do
      begin
        MessageDlg('Erro de Consulta de Arquivo!', E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    DM.frReportArquivo.LoadFromFile('Reports/RelConsultaArquivosDefault.lrf');
    DM.frReportArquivo.showReport;
  end;

end;

end.
