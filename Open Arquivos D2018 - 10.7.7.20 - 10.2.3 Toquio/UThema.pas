unit UThema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Themes, Data.DB;

type
  TFrmThemas = class(TForm)
    ListBox1: TListBox;
    aplicar: TSpeedButton;
    cancela: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    gravarThema: TSpeedButton;
    procedure ListBox1Click(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure cancelaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gravarThemaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmThemas: TFrmThemas;

implementation

{$R *.dfm}

uses UDM, UProjeto, UnContrUser, UnLogin;

procedure TFrmThemas.aplicarClick(Sender: TObject);
var
  thema: TStyleManager;
  aparencia:String;
begin
 try
  // ok.Enabled:=true;
  cancela.Enabled := true;
  gravarThema.Enabled := true;
  //thema := TStyleManager.Create();
  //thema.TrySetStyle(ListBox1.Items[ListBox1.ItemIndex]);
  //aparencia:= ListBox1.Items[ListBox1.ItemIndex];
  //if (FrmContrUser.Dtscu.DataSet.State = dsEdit) or
  //  (FrmContrUser.Dtscu.DataSet.State = dsInsert) or
  //  (FrmContrUser.Dtscu.DataSet.State = dsBrowse) then
  //begin
    // DM.cds_User.Edit;
    // DM.cds_UserTHEMA.AsString := ListBox1.Items[ListBox1.ItemIndex];
  //end;
  Except
  on E: Exception do
  begin

  end;
 end;
end;

procedure TFrmThemas.cancelaClick(Sender: TObject);
var
  thema: TStyleManager;
begin
  ListBox1.ItemIndex := -1;
  cancela.Enabled := false;
  gravarThema.Enabled := false;
  // ok.Enabled:=false;
  aplicar.Enabled := false;
  // thema:=TStyleManager.Create();
  // thema.SetStyle('Windows');
  // DM.FDQryClienteTHEMA.AsString:='Windows';
  // DM.FDQryCliente.Post;
  // DM.FDQryCliente.ApplyUpdates(0);
  // DM.FDQryCliente.CommitUpdates;
end;

procedure TFrmThemas.FormShow(Sender: TObject);
begin
  // ok.Enabled:=False;
  cancela.Enabled := false;
  aplicar.Enabled := false;

  with (FrPrincipal.Dtsrc.DataSet) do
  begin
    // gravarThema.Enabled:=not IsEmpty;
    gravarThema.Enabled := FrPrincipal.Dtsrc.State in [dsInsert, dsEdit];

  end;
end;

procedure TFrmThemas.ListBox1Click(Sender: TObject);
begin
  aplicar.Enabled := true;
  // cancela.Enabled:=true;
  // gravarThema.Enabled:=true;

  // ok.Enabled:=False;
end;

procedure TFrmThemas.okClick(Sender: TObject);
begin
  cancela.Enabled := false;
  aplicar.Enabled := false;
end;

procedure TFrmThemas.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmThemas.gravarThemaClick(Sender: TObject);
begin
  if (FrPrincipal.Dtsrc.DataSet.State = dsEdit) or
    (FrPrincipal.Dtsrc.DataSet.State = dsInsert) then
  begin
    DM.cds_User.Post;
    DM.cds_User.ApplyUpdates(0);
  end;
end;

end.
