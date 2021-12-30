unit UnAbertura;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, TplGaugeUnit, TplLCDScreenUnit, TplGradGaugeUnit, ATGauge;

type

  { TAbertura }

  TAbertura = class(TForm)
    Image4: TImage;
    plGauge1: TplGauge;
    ProgressBar1: TATGauge;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
  private

  public

  end;

var
  Abertura: TAbertura;

implementation

{$R *.lfm}

uses UnDM;

end.
