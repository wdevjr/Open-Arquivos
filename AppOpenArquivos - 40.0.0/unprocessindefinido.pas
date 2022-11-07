unit UnProcessIndefinido;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  GifAnim, TplGifAnimatorUnit;

type

  { TfrmSplash }

  TfrmSplash = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
  private

  public

  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.lfm}

end.
