// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr.,RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !
unit UnManutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, DBCtrls;

type
  TFrmMatencao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Dtscr: TDataSource;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMatencao: TFrmMatencao;

implementation

Uses UDM;

{$R *.dfm}

procedure TFrmMatencao.BitBtn1Click(Sender: TObject);
begin
  if (Memo1.Text = '') then
  begin
    MessageDlg('Informe Primeiro o Comando SQL!', mtWarning, [mbOK], 0);
  end
  else
  begin
    DM.qry_script.Close;
    DM.cds_script.Close;
    DM.qry_script.SQL.Clear;
    DM.qry_script.SQL.Add(Memo1.Text);
    DM.qry_script.Open;
    DM.cds_script.Open;
  end;
end;

procedure TFrmMatencao.BitBtn2Click(Sender: TObject);
begin
  DM.qry_script.Close;
  DM.cds_script.Close;
  Close;
end;

procedure TFrmMatencao.FormShow(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
