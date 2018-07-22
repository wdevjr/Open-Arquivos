object frmIncluir: TfrmIncluir
  Left = 0
  Top = 0
  Caption = 'Incluir Usu'#225'rios'
  ClientHeight = 239
  ClientWidth = 503
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
  object DBGrd_lista_usuarios: TDBGrid
    Left = 24
    Top = 50
    Width = 459
    Height = 115
    BiDiMode = bdLeftToRight
    Color = 13828095
    Ctl3D = False
    DataSource = DtsrcAdionar
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrd_lista_usuariosDrawColumnCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 503
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Usua: TLabel
      Left = 16
      Top = 16
      Width = 111
      Height = 13
      Caption = 'Pessoas Existentes:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227072
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 171
    Width = 503
    Height = 68
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 37
      Width = 24
      Height = 13
      Caption = 'Obs:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 46
      Top = 37
      Width = 244
      Height = 13
      Caption = 'Clique duas vezes na tabela e clique em Ok.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtnIncluir: TBitBtn
      Left = 303
      Top = 6
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtnFechar: TBitBtn
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtnFecharClick
    end
  end
  object DtsrcAdionar: TDataSource
    DataSet = DM.sds_listaAdd
    Left = 176
  end
end
