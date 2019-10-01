object FrmTelaTexto: TFrmTelaTexto
  Left = 0
  Top = 0
  Caption = 'Visualizar Texto'
  ClientHeight = 382
  ClientWidth = 697
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
  object DBMemo1: TDBMemo
    Left = 0
    Top = 0
    Width = 697
    Height = 335
    Align = alClient
    Color = 13363947
    DataField = 'DESCRICAO'
    DataSource = FrPrincipal.Dtsrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 335
    Width = 697
    Height = 47
    Align = alBottom
    TabOrder = 1
    object Panel2: TPanel
      Left = 456
      Top = 1
      Width = 240
      Height = 45
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Button1: TButton
        Left = 144
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
end
