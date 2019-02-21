object FrmThemas: TFrmThemas
  Left = 0
  Top = 0
  Caption = 'Galeria de Themas'
  ClientHeight = 412
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object aplicar: TSpeedButton
    Left = 167
    Top = 181
    Width = 89
    Height = 36
    Caption = 'Aplicar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = aplicarClick
  end
  object cancela: TSpeedButton
    Left = 167
    Top = 143
    Width = 90
    Height = 32
    Caption = 'Cancela'
    OnClick = cancelaClick
  end
  object SpeedButton1: TSpeedButton
    Left = 143
    Top = 370
    Width = 111
    Height = 32
    Caption = 'Fechar'
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 159
    Height = 19
    Caption = 'Themas do Sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gravarThema: TSpeedButton
    Left = 167
    Top = 105
    Width = 89
    Height = 32
    Caption = 'Gravar'
    Enabled = False
    OnClick = gravarThemaClick
  end
  object ListBox1: TListBox
    Left = 8
    Top = 43
    Width = 153
    Height = 321
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'Amakrits'
      'Amethyst Kamri'
      'Aqua Graphite'
      'Aqua Light Slate'
      'Auric'
      'Carbon'
      'Charcoal Dark Slate'
      'Cobalt XEMedia'
      'Cyan Dusk'
      'Cyan Night'
      'Emerald Light Slate'
      'Golden Graphite'
      'Iceberg Classico'
      'Lavender Classico'
      'Light'
      'Luna'
      'Obsidian'
      'Ruby Graphite'
      'Sapphire Kamri'
      'Silver'
      'Slate Classico'
      'Smokey Quartz Kamri'
      'Turquoise Gray'
      'Windows'
      'Windows10')
    ParentFont = False
    TabOrder = 0
    OnClick = ListBox1Click
  end
end
