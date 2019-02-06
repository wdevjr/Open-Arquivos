object FrmTelaTexto: TFrmTelaTexto
  Left = 0
  Top = 0
  Caption = 'Visualizar Texto'
  ClientHeight = 279
  ClientWidth = 566
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
    Width = 566
    Height = 232
    Align = alClient
    Color = 13363947
    DataField = 'DESCRICAO'
    DataSource = FrPrincipal.Dtsrc
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitWidth = 612
    ExplicitHeight = 244
  end
  object Panel1: TPanel
    Left = 0
    Top = 232
    Width = 566
    Height = 47
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 567
    object Button1: TButton
      Left = 467
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
