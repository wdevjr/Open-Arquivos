object FrmProcedimento: TFrmProcedimento
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 76
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 141
    Top = 13
    Width = 319
    Height = 16
    Caption = 'Processamento sendo feito Por Favor Aguarde ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Gauge1: TGauge
    Left = 39
    Top = 43
    Width = 478
    Height = 23
    ForeColor = clInactiveCaption
    Progress = 0
    ShowText = False
  end
  object Dtsrc: TDataSource
    Left = 536
    Top = 8
  end
end
