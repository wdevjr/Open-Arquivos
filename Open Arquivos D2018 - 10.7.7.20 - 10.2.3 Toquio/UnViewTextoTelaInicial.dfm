object FrmTelaTexto: TFrmTelaTexto
  Left = 0
  Top = 0
  Caption = 'Visualizar Texto'
  ClientHeight = 300
  ClientWidth = 612
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
    Width = 612
    Height = 244
    Align = alClient
    DataField = 'DESCRICAO'
    DataSource = FrPrincipal.Dtsrc
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 244
    Width = 612
    Height = 56
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 184
    ExplicitWidth = 510
    object Button1: TButton
      Left = 520
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
