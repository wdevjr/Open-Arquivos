object FrmArquProc: TFrmArquProc
  Left = 0
  Top = 0
  Caption = 'Localizar Arquivo ...'
  ClientHeight = 552
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClick = FormClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 879
    Height = 396
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -213
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'C'#243'digo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Descri'#231#227'o'
        Width = 606
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'T'#237'tulo'
        Width = 388
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_ARQUIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Nome do Arquivo'
        Width = 600
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Nome do Autor do Arquivo'
        Width = 200
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 485
    Width = 879
    Height = 48
    Align = alBottom
    Color = 14083559
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 435
    object Panel3: TPanel
      Left = 602
      Top = 1
      Width = 276
      Height = 46
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BtnOk: TBitBtn
        Left = 105
        Top = 10
        Width = 75
        Height = 25
        Caption = 'OK'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 186
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Fechar'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
          9090808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF824B4B824B4BA64B4BA94D4D4E1E1FFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9494949494948F8F8F91
          9191808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
          4B824B4B824B4BFF00FFFF00FFFF00FF9494949494949898989D9D9D9D9D9D95
          9595808080949494949494949494949494949494949494FF00FFFF00FFFF00FF
          824B4BD45859CB5556C95455C95253B74F524E1E1FFE8B8CFB9A9CF8AAABF7B5
          B6F7B5B6824B4BFF00FFFF00FFFF00FF949494A8A8A8A3A3A3A2A2A2A1A1A198
          9898808080D0D0D0D5D5D5DBDBDBDFDFDFDFDFDF949494FF00FFFF00FFFF00FF
          824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
          41F7B5B6824B4BFF00FFFF00FFFF00FF949494ABABABA8A8A8A7A7A7A6A6A69D
          9D9D8080808F8F8F8E8E8E8E8E8E868686DFDFDF949494FF00FFFF00FFFF00FF
          824B4BDD6364D75F60D55E5FD55C5DC2575A4E1E1F2AB44D1CBF4C1EBC4C13BC
          45F7B5B6824B4BFF00FFFF00FFFF00FF949494B1B1B1ADADADACACACABABABA1
          A1A18080809292929292929393938B8B8BDFDFDF949494FF00FFFF00FFFF00FF
          824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
          43F7B5B6824B4BFF00FFFF00FFFF00FF949494B6B6B6B2B2B2B0B0B0B3B3B3A3
          A3A38080808F8F8F8E8E8E909090898989DFDFDF949494FF00FFFF00FFFF00FF
          824B4BEB6D6EE26768E67E7FFAD3D4CC6E704E1E1FA5D89750D16F42C9662DC7
          58F7B5B6824B4BFF00FFFF00FFFF00FF949494BBBBBBB5B5B5C1C1C1ECECECB0
          B0B0808080DADADAB7B7B7ADADADA1A1A1DFDFDF949494FF00FFFF00FFFF00FF
          824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
          C7F7B5B6824B4BFF00FFFF00FFFF00FF949494C0C0C0BABABAC4C4C4ECECECB1
          B1B1808080F1F1F1EFEFEFEEEEEEE8E8E8DFDFDF949494FF00FFFF00FFFF00FF
          824B4BF87879F07576EE7273F07374D165664E1E1FFCEFC7FFFFD5FFFFD3FFFF
          D7F7B5B6824B4BFF00FFFF00FFFF00FF949494C5C5C5C1C1C1BEBEBEC0C0C0AD
          ADAD808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
          824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
          D5F7B5B6824B4BFF00FFFF00FFFF00FF949494CACACAC6C6C6C5C5C5C4C4C4B2
          B2B2808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
          824B4BFF8384FC7F80FB7E7FFE7F80DA6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFF
          D5F7B5B6824B4BFF00FFFF00FFFF00FF949494CDCDCDCACACAC9C9C9CACACAB5
          B5B5808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
          824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
          D5F7B5B6824B4BFF00FFFF00FFFF00FF949494CFCFCFCCCCCCCCCCCCCCCCCCB9
          B9B9808080E8E8E8EFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
          824B4B824B4BE27576FE8182FF8687E576774E1E1FFAEBC5FCFBD1FCFBCFFCFB
          D1F7B5B6824B4BFF00FFFF00FFFF00FF949494949494BBBBBBCBCBCBCECECEBD
          BDBD808080E6E6E6ECECECEBEBEBECECECDFDFDF949494FF00FFFF00FFFF00FF
          FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
          4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FF949494A4A4A4AEAEAEB1
          B1B1808080949494949494949494949494949494949494FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF824B4B824B4B4E1E1FFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92929290
          9090808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ModalResult = 2
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 879
    Height = 89
    Align = alTop
    Color = 14083559
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 80
      Top = 57
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label2: TLabel
      Left = 100
      Top = 17
      Width = 30
      Height = 13
      Caption = 'T'#237'tulo:'
    end
    object EditProc1: TEdit
      Left = 136
      Top = 15
      Width = 341
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = EditProc1Change
      OnKeyPress = EditProc1KeyPress
    end
    object Panel4: TPanel
      Left = 738
      Top = 1
      Width = 140
      Height = 87
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
    object EditProc2: TEdit
      Left = 136
      Top = 55
      Width = 341
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnChange = EditProc2Change
    end
    object BitBtn3: TBitBtn
      Left = 499
      Top = 22
      Width = 121
      Height = 48
      Caption = 'Procurar'
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000CCFF000099
        FF000000000077777700777777007777770077777700FFFFFF00000000000000
        0000000000000000000000000000000000000000000077777700777777007777
        7700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000000000CCFF0000CCFF0000CCFF000099
        FF000099FF000000000077777700777777005555550000000000C0C0C000FFFF
        FF00CC999900CC999900CC999900CC9999009966660000000000555555007777
        77007777770077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000000000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099
        FF000099FF000099FF000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
        FF00CC999900CC999900CC999900CC9999009966660099666600555555000000
        0000777777007777770077777700FFFFFF00FFFFFF00FFFFFF00000000000000
        000000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099
        FF000099FF000099FF0000000000CC999900FFFFFF00C0C0C000000000000000
        0000000000000000000000000000000000000000000099666600996666009966
        660000000000777777007777770077777700FFFFFF00FFFFFF000000000000CC
        FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099
        FF000099FF0000000000CC999900CC9999000000000055555500FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0055555500000000009966
        66009966660000000000777777007777770077777700FFFFFF000000000000CC
        FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099
        FF000099FF0000000000CC99990000000000FFFFFF00C0C0C000555555000000
        00000000000000000000000000000000000055555500C0C0C000FFFFFF000000
        00009966660000000000777777007777770077777700FFFFFF000000000000CC
        FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF00000000000000
        00000099FF000000000055555500FFFFFF000000000055555500CC999900FFFF
        FF00CC999900CC999900CC999900CC999900CC9999005555550000000000FFFF
        FF000000000000000000777777007777770077777700FFFFFF000000000000CC
        FF0000CCFF0000CCFF0000CCFF0000CCFF0000000000000000006666CC000000
        AA000000000000000000FFFFFF000000000000000000CC999900CC999900CC99
        9900FFFFFF00CC999900CC999900CC999900CC999900CC999900C0C0C0000000
        0000FFFFFF00000000007777770077777700FFFFFF00FFFFFF000000000000CC
        FF0000CCFF0000CCFF0000000000000000006666CC006666CC006666CC000000
        AA000000990000000000FFFFFF0000000000996666000000000055555500CC99
        9900CC999900FFFFFF00CC999900CC9999005555550000000000000000000000
        0000FFFFFF000000000077777700FFFFFF00FFFFFF00FFFFFF000000000000CC
        FF0000000000000000006666CC006666CC006666CC006666CC006666CC000000
        AA000000990000000000FFFFFF00000000009966660099666600996666000000
        0000000000000000000000000000000000009966660099666600996666000000
        0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        00006666CC006666CC006666CC006666CC006666CC006666CC00000000000000
        00000000AA000000AA0000000000FFFFFF000000000000000000996666009966
        660099666600996666009966660099666600996666000000000000000000FFFF
        FF00000000007777770077777700FFFFFF00FFFFFF00FFFFFF00000000006666
        CC006666CC006666CC006666CC006666CC000000000000000000FF9999006633
        3300000000000000AA000000AA0000000000FFFFFF00FFFFFF00000000000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        0000000000007777770077777700FFFFFF00FFFFFF00FFFFFF00000000006666
        CC006666CC006666CC000000000000000000FF999900FF999900FF9999006633
        330066333300000000000000AA000000AA000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000CC99
        990000000000777777007777770077777700FFFFFF00FFFFFF00000000006666
        CC000000000000000000FF999900FF999900FF999900FF999900FF9999006633
        33006633330066333300000000000000AA000000AA0000000000000000000000
        00000000000000000000000000000000000000000000CC999900FFFFFF00CC99
        9900CC99990000000000777777007777770077777700FFFFFF00000000000000
        0000FF999900FF999900FF999900FF999900FF999900FF999900FF9999006633
        3300663333006633330066333300000000000000AA0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000CC999900FFFF
        FF0055555500000000000000000077777700777777007777770000000000FF99
        9900FF999900FF999900FF999900FF999900FF999900FF999900FF9999006633
        3300663333006633330066333300663333000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00555555000000
        000000000000000000000000000000000000777777007777770000000000FF99
        9900FF999900FF999900FF999900FF999900FF999900FF999900FF9999006633
        3300663333006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
        55000000000000000000000000000000000000000000FFFFFF0000000000FF99
        9900FF999900FF999900FF999900FF999900FF999900FF999900FF9999006633
        3300663333006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF005555550000000000000000000000000000000000FFFFFF0000000000FF99
        9900FF999900FF999900FF999900FF999900FF999900FF999900FF9999006633
        3300663333006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0055555500000000000000000055555500FFFFFF0000000000FF99
        9900FF999900FF999900FF999900FF999900FF999900FF999900FF9999006633
        3300663333006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF99
        9900FF999900FF999900FF999900FF999900FF999900FFFFFF00FFFFFF006633
        3300663333006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF99
        9900FF999900FF999900FF999900FFFFFF00FFFFFF00FFCCCC00FFCCCC00FFCC
        CC00663333006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF99
        9900FF999900FFFFFF00FFFFFF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
        CC00FFCCCC006633330066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
        CC00FFCCCC00FFCCCC0066333300663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFCC
        CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
        CC00FFCCCC00FFCCCC00FFCCCC00663333006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
        CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC006633330000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
        CC00FFCCCC00FFCCCC00FFCCCC000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
        CC00FFCCCC000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFCCCC000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object StsBr: TStatusBar
    Left = 0
    Top = 533
    Width = 879
    Height = 19
    Panels = <
      item
        Style = psOwnerDraw
        Width = 800
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    OnDrawPanel = StsBrDrawPanel
    ExplicitTop = 483
  end
  object Dtsrc: TDataSource
    DataSet = DM.sds_Arqu
    Left = 336
    Top = 128
  end
  object DtsrcTodos: TDataSource
    DataSet = DM.sds_ArquTodos
    Left = 360
    Top = 200
  end
end
