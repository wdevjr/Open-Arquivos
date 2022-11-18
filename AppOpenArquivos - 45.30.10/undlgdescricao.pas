unit unDlgDescricao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, Buttons,
  ExtCtrls, StdCtrls;

type

  { TFrmDlgDescricao }

  TFrmDlgDescricao = class(TForm)
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
  private

  public

  end;

var
  FrmDlgDescricao: TFrmDlgDescricao;

implementation

{$R *.lfm}

uses UnDM;

end.
