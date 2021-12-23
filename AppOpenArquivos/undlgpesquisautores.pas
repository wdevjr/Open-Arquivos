unit undlgpesquisautores;



interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  DBGrids, StdCtrls, ZDataset, DB;

type

  { TFrmPesquisaAutor }

  TFrmPesquisaAutor = class(TForm)
    BitBtn1: TBitBtn;
    btnOk: TBitBtn;
    BitBtn2: TBitBtn;
    Dtsrc: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmPesquisaAutor: TFrmPesquisaAutor;

implementation

{$R *.lfm}

uses UnDM, UnPrinc;

{ TFrmPesquisaAutor }

procedure TFrmPesquisaAutor.FormShow(Sender: TObject);
begin
  with Dtsrc.DataSet as TZQuery do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmPesquisaAutor.BitBtn1Click(Sender: TObject);
begin
  DM.sds_Autores.Close;
  DM.sds_Autores.Params[0].Value := '%' + Edit1.Text + '%';
  DM.sds_Autores.Open;

  with Dtsrc.DataSet as TZQuery do
  begin
    BtnOk.Enabled := not IsEmpty;
  end;
end;

procedure TFrmPesquisaAutor.btnOkClick(Sender: TObject);
begin
  //FrPrincipal.Label16.Caption := '';

  //FrPrincipal.Label16.Caption := DM.sds_AutoresNOME.AsString;

  //if FrPrincipal.Label16.Caption <> '' then
  //begin
  //  FrPrincipal.Label16.Visible := True;
  //end;
end;

procedure TFrmPesquisaAutor.FormActivate(Sender: TObject);
begin
  Color := DM.myColor;
end;

end.
