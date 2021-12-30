unit thema;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, ColorBox;

type

  { TFrmThema }

  TFrmThema = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    ColorBox1: TColorBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    PanelView: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public
    ResultColor: string;
  end;

var
  FrmThema: TFrmThema;
  myresult, myresult2: string;

implementation

uses UnDM;

{$R *.lfm}

{ TFrmThema }

function HexToTColor(sColor: string): TColor;
begin
  Result :=
    RGB(
    { get red value }
    StrToInt('$' + Copy(sColor, 1, 2)),
    { get green value }
    StrToInt('$' + Copy(sColor, 3, 2)),
    { get blue value }
    StrToInt('$' + Copy(sColor, 5, 2)));
end;

function GetHTMLColor(cl: TColor): string;
var
  rgbColor: TColorRef;
begin
  //  if IsBackColor then
  //    Result := 'bg'
  //  else
  Result := '';
  rgbColor := ColorToRGB((cl));
  Result := Result + '#' + Format('%.2x%.2x%.2x',
    [GetRValue(rgbColor), GetGValue(rgbColor), GetBValue(rgbColor)]);
end;


function GetHTMLColorSemCerquilha(cl: TColor): string;
var
  rgbColor: TColorRef;
begin
  //  if IsBackColor then
  //    Result := 'bg'
  //  else
  Result := '';
  rgbColor := ColorToRGB((cl));
  Result := Result + Format('%.2x%.2x%.2x', [GetRValue(rgbColor),
    GetGValue(rgbColor), GetBValue(rgbColor)]);
end;

function myHexToColor(AValue: string): TColor;
var
  iRed: integer;
  iGreen: integer;
  iBlue: integer;
begin
  iRed := StrToInt('$' + AValue[1] + AValue[2]);
  iGreen := StrToInt('$' + AValue[3] + AValue[4]);
  iBlue := StrToInt('$' + AValue[5] + AValue[6]);
  Result := RGB(iRed, iGreen, iBlue);
  myresult := ColortoString(Result);
end;

procedure TFrmThema.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmThema.BitBtn3Click(Sender: TObject);
var
  temp: TColor;
begin
  if (CheckBox1.Checked = True) then
  begin
    if (Edit2.Text <> '') then
    begin
      PanelView.Color := myHexToColor(trim(StringReplace(Edit2.Text, '#', '', [rfReplaceall])));
    end
    else
    begin
      ShowMessage('Informe um Hexadecimal Valido!');
      Abort;
    end;

    try
      //DM.gravariniAtual('MODO', 'ATUAL',DM.atual));
      DM.gravarini('HEX', 'CORHEX', Edit2.Text);
      DM.gravarini('HEX', 'ATUAL', 'TRUE');
      DM.gravarini('TCOLOR', 'ATUAL', 'FALSE');
      temp := myHexToColor(trim(StringReplace(
        (DM.lerini('HEX', 'CORHEX')), '#', '', [rfReplaceall])));
      PanelView.Color := temp;
    except
      on e: Exception do
      begin
        MessageDlg('Erro ao gravar arquivo INI! ' + #13 +
          'ou você não possue previlégios ' + #13 + 'Mensagem nativa do Erro: ' +
          e.Message, mtError, [mbOK], 0);
      end;
    end;
  end
  else if (CheckBox1.Checked = False) then
  begin
    if (ColorBox1.ColorNames[ColorBox1.ItemIndex] = 'Custom ...') then
    begin
      try
        //DM.gravariniAtual('MODO', 'ATUAL',DM.atual));
        DM.gravarini('HEX', 'CORHEX', (GetHTMLColor(ColorBox1.Selected)));
        DM.gravarini('HEX', 'ATUAL', 'TRUE');
        DM.gravarini('TCOLOR', 'ATUAL', 'FALSE');
        temp := myHexToColor(trim(StringReplace(
          (DM.lerini('HEX', 'CORHEX')), '#', '', [rfReplaceall])));
        PanelView.Color := temp;
      except
        on e: Exception do
        begin
          MessageDlg('Erro ao gravar arquivo INI! ' + #13 +
            'ou você não possue previlégios ' + #13 + 'Mensagem nativa do Erro: ' +
            e.Message, mtError, [mbOK], 0);
        end;
      end;
    end
    else
    begin
      if (ColorBox1.ColorNames[ColorBox1.ItemIndex] <> 'Custom ...') then
      begin
        try
          DM.gravarini('TCOLOR', 'CORTCOLOR', ColorBox1.ColorNames[ColorBox1.ItemIndex]);
          DM.gravarini('TCOLOR', 'ATUAL', 'TRUE');
          DM.gravarini('HEX', 'ATUAL', 'FALSE');
        except
          on e: Exception do
          begin
            MessageDlg('Erro ao gravar arquivo INI! ' + #13 +
              'ou você não possue previlégios ' + #13 + 'Mensagem nativa do Erro: ' +
              e.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
      try
        PanelView.Color := StringToColor(DM.lerini('TCOLOR', 'CORTCOLOR'));
      except
        on e: Exception do
        begin
          MessageDlg('Erro ao Ler arquivo INI! ' + #13 + 'Mensagem nativa do Erro: ' +
            e.Message, mtError, [mbOK], 0);
        end;
      end;
    end;
  end;

end;

procedure TFrmThema.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked = True) then
  begin
    ColorBox1.Visible := False;
    Edit2.Text := (GetHTMLColor(ColorBox1.Selected));
    Label4.Visible := True;
    Edit2.Visible := True;
    SpeedButton2.Visible := True;
  end
  else
  begin
    Label4.Visible := False;
    Edit2.Visible := False;
    SpeedButton2.Visible := False;
    ColorBox1.Visible := True;
    PanelView.Color := ColorBox1.Selected;
  end;

  // if (CheckBox1.Checked = True) then
  // begin
  //// Edit1.Text:=ColorToString(ColorBox1.Selected);
  // Edit2.Text:=(GetHTMLColor(ColorBox1.Selected));
  // end else
  // begin
  //   PanelView.Color := ColorBox1.Selected;
  // end;
end;

procedure TFrmThema.ColorBox1Change(Sender: TObject);
begin

  if (CheckBox1.Checked = True) then
  begin
    // Edit1.Text:=ColorToString(ColorBox1.Selected);
    Edit2.Text := (GetHTMLColor(ColorBox1.Selected));
  end
  else
  begin
    PanelView.Color := ColorBox1.Selected;
  end;
end;

procedure TFrmThema.FormShow(Sender: TObject);
begin
  PanelView.Color := DM.myColor;
  // Edit1.Text:=ColorToString(DM.myColor);
  Edit2.Text := (GetHTMLColor(DM.myColor));
end;

procedure TFrmThema.SpeedButton1Click(Sender: TObject);
begin
  PanelView.Color := StringToColor(Edit1.Text);
end;

procedure TFrmThema.SpeedButton2Click(Sender: TObject);
begin
  if (Edit2.Text <> '') then
  begin
    PanelView.Color := myHexToColor(trim(StringReplace(Edit2.Text, '#', '', [rfReplaceall])));
  end
  else
  begin
    ShowMessage('Informe um Hexadecimal Valido!');
  end;
end;

//function myColor : TColor;
//var temp:TColor;
//    vartemp:String;
//begin
//    temp:= StringToColor(DM.lerini('TCOLOR', 'CORTCOLOR'));
//    vartemp:=ColorToString(temp);
//   if (Copy(vartemp,0,2) = 'cl') then
//    begin
//    Result:=temp;
//    end else
//        begin
//        temp:=myHexToColor(trim(StringReplace((DM.lerini('HEX', 'CORHEX')),'#','',[rfReplaceall])));
//        Result:=temp;
//        end;
//end;

end.
