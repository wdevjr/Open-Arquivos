unit UnProcessIndefinido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Samples.Gauges, WinTypes, WinProcs, Vcl.Graphics,
  Vcl.Imaging.GIFImg, GifImage, Vcl.ComCtrls;

type
  TfrmSplash = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

end.
