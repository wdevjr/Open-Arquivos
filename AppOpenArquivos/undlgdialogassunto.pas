unit UnDlgDialogAssunto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  DBGrids, StdCtrls, Grids, ZDataset;

type

  { TFrmPesquisaAssunto }

  TFrmPesquisaAssunto = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BtnOk: TBitBtn;
    Dtsrc: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmPesquisaAssunto: TFrmPesquisaAssunto;

implementation

{$R *.lfm}

{ TFrmPesquisaAssunto }

uses UnDM, Unprinc;

procedure TFrmPesquisaAssunto.BitBtn2Click(Sender: TObject);
begin
  DM.sds_Assunt.Close;
  DM.sds_Assunt.Params[0].Value := '%' + Edit1.Text + '%';
  DM.sds_Assunt.Open;
  with Dtsrc.DataSet as TZQuery do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmPesquisaAssunto.BtnOkClick(Sender: TObject);
begin
  //FrPrincipal.Label15.Caption := '';

  //FrPrincipal.Label15.Caption := DM.sds_AssuntTITULOASSUN.AsString;

  //if FrPrincipal.Label15.Caption <> '' then
  //begin
  //  FrPrincipal.Label15.Visible := True;
  //end;

end;

procedure TFrmPesquisaAssunto.FormActivate(Sender: TObject);
begin
  Color := DM.myColor;
end;

procedure TFrmPesquisaAssunto.FormShow(Sender: TObject);
begin
  with Dtsrc.DataSet as TZQuery do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

end.
