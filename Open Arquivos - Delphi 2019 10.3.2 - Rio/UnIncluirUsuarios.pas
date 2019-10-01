unit UnIncluirUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Data.DBXFirebird, Datasnap.DBClient,
  SimpleDS;

type
  TfrmIncluir = class(TForm)
    DBGrd_lista_usuarios: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtnIncluir: TBitBtn;
    BitBtnFechar: TBitBtn;
    DtsrcAdionar: TDataSource;
    Usua: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    sds_Pesq_User: TSimpleDataSet;
    Edit1: TEdit;
    sds_Pesq_UserCOD_USUARIO: TIntegerField;
    sds_Pesq_UserNOME: TStringField;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure DBGrd_lista_usuariosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure DBGrd_lista_usuariosCellClick(Column: TColumn);
    procedure sds_Pesq_UserReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluir: TfrmIncluir;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmIncluir.BitBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmIncluir.BitBtnIncluirClick(Sender: TObject);
begin
  // DM.sds_lista_Usuarios.Open;
  // DM.sds_lista_Usuarios.Refresh;

end;

procedure TfrmIncluir.Button1Click(Sender: TObject);
begin
  sds_Pesq_User.close;
  sds_Pesq_User.Params[0].AsString := '%' + Edit1.Text + '%';
  sds_Pesq_User.Open;

end;

procedure TfrmIncluir.DBGrd_lista_usuariosCellClick(Column: TColumn);
begin
  with sds_Pesq_User do
  begin
    BitBtnIncluir.Enabled := not IsEmpty;
  end;
end;

procedure TfrmIncluir.DBGrd_lista_usuariosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd(sds_Pesq_User.RecNo) then
  begin
    DBGrd_lista_usuarios.Canvas.Brush.Color := $00CBEAEB;
    DBGrd_lista_usuarios.Canvas.Font.Color := clBlack;
    DBGrd_lista_usuarios.Canvas.FillRect(Rect);
    DBGrd_lista_usuarios.DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else
  begin
    DBGrd_lista_usuarios.Canvas.Brush.Color := $00FFF4F4;
    /// DBGrd_lista_usuarios.Canvas.Font.Color:=clBlack;
    DBGrd_lista_usuarios.Canvas.FillRect(Rect);
    DBGrd_lista_usuarios.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  if gdfocused in State then
  begin
    DBGrd_lista_usuarios.Canvas.Brush.Color := $00808040;
    DBGrd_lista_usuarios.Canvas.Font.Color := clWhite;
    DBGrd_lista_usuarios.Canvas.FillRect(Rect);
    DBGrd_lista_usuarios.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmIncluir.FormShow(Sender: TObject);
begin
  DM.sds_lista_Usuarios.Open;
end;

procedure TfrmIncluir.sds_Pesq_UserReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro na consulta do DataSet: sds_Pesq_User! ' + E.Message,
    mtError, [mbOK], 0);
end;

end.
