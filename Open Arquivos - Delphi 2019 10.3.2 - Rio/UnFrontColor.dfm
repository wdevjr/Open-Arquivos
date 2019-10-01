object FrmFrontColor: TFrmFrontColor
  Left = 0
  Top = 0
  Caption = 'Mudar Cor de Fundo'
  ClientHeight = 97
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ColorBox1: TColorBox
    Left = 32
    Top = 32
    Width = 145
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Aplicar Cor'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
