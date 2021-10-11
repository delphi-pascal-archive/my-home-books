object frmSplash: TfrmSplash
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmSplash'
  ClientHeight = 270
  ClientWidth = 391
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTit: TRzLabel
    Left = 28
    Top = 93
    Width = 338
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbTit'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -35
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object RzLabel2: TRzLabel
    Left = 28
    Top = 46
    Width = 338
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = #1050#1072#1090#1072#1083#1086#1075#1080#1079#1072#1090#1086#1088' '#1082#1085#1080#1075
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lbState: TRzLabel
    Left = 0
    Top = 244
    Width = 391
    Height = 26
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbState'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
end
