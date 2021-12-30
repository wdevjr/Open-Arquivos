// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnDlgProcuraPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, DB, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ZDataset;

type

  { TFrmDlgProcuraPerfil }

  TFrmDlgProcuraPerfil = class(TForm)
    Dtscp: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BtnOk: TBitBtn;
    EditPerfil: TEdit;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOWner: TComponent; DataSet: TZQuery);
      reintroduce;
  end;

var
  FrmDlgProcuraPerfil: TFrmDlgProcuraPerfil;

implementation

uses UnDM, UDMII;

{$R *.lfm}

constructor TFrmDlgProcuraPerfil.Create(AOWner: TComponent; DataSet: TZQuery);
begin
  inherited Create(AOWner);
  Dtscp.DataSet := DataSet;
end;

procedure TFrmDlgProcuraPerfil.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  { if Odd(DMII.sds_Pesq_PL.RecNo) then
    begin
    DBGrid1.Canvas.Brush.Color := $00CBEAEB;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
    DBGrid1.Canvas.Brush.Color := $00FFF4F4;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if gdfocused in State then
    begin
    DBGrid1.Canvas.Brush.Color := $00808040;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end; }
end;

procedure TFrmDlgProcuraPerfil.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDlgProcuraPerfil.FormShow(Sender: TObject);
begin
  with DMII.sds_Pesq_PL do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmDlgProcuraPerfil.SpeedButton1Click(Sender: TObject);
begin
  with Dtscp.DataSet as TZQuery do
  begin
    Close;
    Params[0].AsString := '%' + EditPerfil.Text + '%';
    Open;
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
