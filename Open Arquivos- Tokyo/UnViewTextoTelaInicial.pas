unit UnViewTextoTelaInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TFrmTelaTexto = class(TForm)
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaTexto: TFrmTelaTexto;

implementation

{$R *.dfm}

uses UProjeto;

procedure TFrmTelaTexto.Button1Click(Sender: TObject);
begin
  close;
end;

end.
