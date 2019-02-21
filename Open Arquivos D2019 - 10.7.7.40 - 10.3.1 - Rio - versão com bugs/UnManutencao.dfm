object FrmMatencao: TFrmMatencao
  Left = 219
  Top = 230
  Caption = 'Utilit'#225'rio de Maten'#231#227'o'
  ClientHeight = 350
  ClientWidth = 648
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 43
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 14
      Width = 192
      Height = 14
      Caption = 'Manuten'#231#227'o da Base de Dados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 278
      Top = 15
      Width = 213
      Height = 13
      Caption = 'Para uso exclusivo do Desenvolvedor!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 298
    Width = 648
    Height = 52
    Align = alBottom
    TabOrder = 1
    object Panel5: TPanel
      Left = 462
      Top = 1
      Width = 185
      Height = 50
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn2: TBitBtn
        Left = 94
        Top = 12
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        OnClick = BitBtn2Click
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 16
      Width = 219
      Height = 25
      DataSource = Dtscr
      VisibleButtons = [nbInsert, nbPost, nbCancel]
      Flat = True
      ConfirmDelete = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 43
    Width = 648
    Height = 72
    Align = alTop
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 520
      Height = 70
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 520
        Height = 70
        Align = alClient
        Color = 14939380
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo1')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object BitBtn1: TBitBtn
      Left = 536
      Top = 6
      Width = 100
      Height = 60
      Caption = 'Executar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000120B0000120B00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333300003333333333333333333300003333333083333333333300003333
        33380833333333330000333333330083333333330000333333330B0833333333
        00003333330000B08333333300003333330BBFBB08333333000033333330FB00
        00333333000033333330BFB0833333330000333300000BFB0833333300003333
        0FBFBFBFB08333330000333330FBFB00003333330000333330BFBFB083333333
        00003333330BFBFB0833333300003333330FFFBFF0833333000033333330FBFF
        BF08333300003333333000000000333300003333333333333333333300003333
        33333333333333330000}
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 115
    Width = 648
    Height = 183
    Align = alClient
    Color = 15790320
    DataSource = Dtscr
    FixedColor = clWhite
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Dtscr: TDataSource
    Left = 616
    Top = 120
  end
end
