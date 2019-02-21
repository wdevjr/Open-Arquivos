unit UnAbertura;

interface

uses

  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, DB, DBClient, Registry, DBCtrls,
  Gauges,
  Vcl.Controls, Vcl.Graphics, System.Classes, Forms, Vcl.Imaging.pngimage;

type
  TAbertura = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Image3: TImage;
    Label3: TLabel;
    Image4: TImage;
    Gauge1: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    Image5: TImage;
  private
    { Private declarations }
  public

  end;

var
  Abertura: TAbertura;

implementation

uses UnLogin;

{$R *.dfm}

end.
