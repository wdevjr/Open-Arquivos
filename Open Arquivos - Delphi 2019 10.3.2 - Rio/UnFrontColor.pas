unit UnFrontColor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmFrontColor = class(TForm)
    ColorBox1: TColorBox;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFrontColor: TFrmFrontColor;

implementation

uses UProjeto;

{$R *.dfm}

procedure TFrmFrontColor.BitBtn1Click(Sender: TObject);
begin
  FrPrincipal.Panel10.Color := ColorBox1.Selected;
  FrPrincipal.PanelPergunta.Color := ColorBox1.Selected;
  FrPrincipal.Panel12.Color := ColorBox1.Selected;
  FrPrincipal.PanelAutor.Color := ColorBox1.Selected;
  FrPrincipal.Color := ColorBox1.Selected;
  FrPrincipal.ListView1.Color := ColorBox1.Selected;
end;

end.
