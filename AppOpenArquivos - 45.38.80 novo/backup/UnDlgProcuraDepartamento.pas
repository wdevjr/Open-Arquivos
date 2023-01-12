unit UnDlgProcuraDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ZDataset;

type

  { TFrmDlgProcuraDepartamento }

  TFrmDlgProcuraDepartamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditOK: TEdit;
    Dtsrc: TDataSource;
    Label1: TLabel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

  public
    constructor Create(AOWner: TComponent; DataSet: TZQuery);
      reintroduce;
  end;

var
  FrmDlgProcuraDepartamento: TFrmDlgProcuraDepartamento;

implementation

{$R *.lfm}

uses UnDM, UDMII;

procedure TFrmDlgProcuraDepartamento.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

constructor TFrmDlgProcuraDepartamento.Create(AOWner: TComponent; DataSet: TZQuery);
begin
  inherited Create(AOWner);
  Dtsrc.DataSet := DataSet;
end;

procedure TFrmDlgProcuraDepartamento.SpeedButton1Click(Sender: TObject);
begin
  with Dtsrc.DataSet as TZQuery do
  begin
    Close;
    Params[0].AsString := UpperCase('%' + EditOK.Text + '%');
    try
      Open;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao Consultar!', 'Erro na Consutar: mensagem nativa do Banco: ' +
          E.Message, mtError, [mbOK], 0);
      end;
    end;
    BitBtn1.Enabled := not IsEmpty;
  end;

end;

end.
