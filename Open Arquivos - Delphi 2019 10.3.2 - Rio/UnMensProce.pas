unit UnMensProce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, DBClient, Data.DB,
  Vcl.StdCtrls, Vcl.Samples.Gauges;

type
  TFrmProcedimento = class(TForm)
    Dtsrc: TDataSource;
    Label1: TLabel;
    Gauge1: TGauge;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TClientDataSet);
      reintroduce;
    procedure Progress;
  end;

var
  FrmProcedimento: TFrmProcedimento;

implementation

uses UDM;
{$R *.dfm}

constructor TFrmProcedimento.Create(AOWner: TComponent;
  DataSet: TClientDataSet);
begin
  inherited Create(AOWner);
  Dtsrc.DataSet := DataSet;
end;

procedure TFrmProcedimento.FormActivate(Sender: TObject);
begin
  Refresh;
  Sleep(1000);
end;

procedure TFrmProcedimento.Progress;
begin
  with Dtsrc.DataSet as TClientDataSet do
  Begin
    // ProgressBar1.Max := RecordCount;
    // ProgressBar1.Min := 0;
    // ProgressBar1.Position := 0;
    // First;
    // if not(DM.cds_Arquivo.Eof) then
    // repeat
    // ProgressBar1.Position := ProgressBar1.Position + 1;
    // Sleep(1000);
    // Next
    // until Eof;
    Gauge1.MaxValue := DM.cds_Arquivo.RecordCount;
    DM.cds_Arquivo.First;
    if not DM.cds_Arquivo.Eof then
      repeat
        Gauge1.Progress := Gauge1.Progress + 1;
        Sleep(1000);
        DM.cds_Arquivo.Next
      until DM.cds_Arquivo.Eof;
  End;
end;

end.
