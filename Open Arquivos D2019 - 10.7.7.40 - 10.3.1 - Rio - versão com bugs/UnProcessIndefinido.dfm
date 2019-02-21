object frmSplash: TfrmSplash
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Aguarde ...'
  ClientHeight = 87
  ClientWidth = 552
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 162
    Top = 18
    Width = 207
    Height = 13
    Caption = 'Aguarde o Inserimento do Arquivo ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 48
    Top = 37
    Width = 465
    Height = 25
    TabOrder = 0
  end
end
