unit UnStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, DB;

type
  TFrmStatus = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Image1: TImage;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label6: TLabel;
    Dtscr: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatus: TFrmStatus;

implementation

{$R *.dfm}

procedure TFrmStatus.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
