object frmLibNew: TfrmLibNew
  Left = 148
  Top = 86
  BorderStyle = bsToolWindow
  Caption = #1053#1086#1074#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103
  ClientHeight = 481
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 2
    Top = 3
    Width = 630
    Height = 407
    BorderInner = fsFlatRounded
    BorderOuter = fsNone
    TabOrder = 0
    object btDo: TRzButton
      Left = 236
      Top = 172
      Width = 83
      Height = 45
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072
      TabOrder = 1
      OnClick = btDoClick
    end
    object PanelStat: TRzPanel
      Left = 326
      Top = 142
      Width = 299
      Height = 101
      BorderOuter = fsFlatRounded
      TabOrder = 2
      object lbTime: TRzLabel
        Left = 180
        Top = 5
        Width = 24
        Height = 13
        Caption = 'lbTim'
      end
      object lbState: TRzLabel
        Left = 9
        Top = 3
        Width = 127
        Height = 15
        AutoSize = False
        Caption = #1048#1076#1077#1090' '#1086#1073#1088#1072#1073#1086#1090#1082#1072'...'
        WordWrap = True
      end
      object lbTim1: TRzLabel
        Left = 267
        Top = 5
        Width = 24
        Height = 13
        Caption = 'lbTim'
      end
      object PanelStat1: TPanel
        Left = 6
        Top = 20
        Width = 261
        Height = 76
        TabOrder = 0
        Visible = False
        object RzLabel4: TRzLabel
          Left = 4
          Top = 2
          Width = 92
          Height = 13
          AutoSize = False
          Caption = #1053#1072#1081#1076#1077#1085#1086' '#1092#1072#1081#1083#1086#1074':'
        end
        object RzLabel3: TRzLabel
          Left = 4
          Top = 21
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1086' '#1082#1085#1080#1075':'
        end
        object lbtotal: TRzLabel
          Left = 106
          Top = 3
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '000000'
        end
        object lbtreat: TRzLabel
          Left = 106
          Top = 21
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lbtreat'
        end
        object RzLabel2: TRzLabel
          Left = 5
          Top = 41
          Width = 66
          Height = 13
          AutoSize = False
          Caption = #1042#1085#1077#1089#1077#1085#1086':'
        end
        object RzLabel1: TRzLabel
          Left = 5
          Top = 60
          Width = 66
          Height = 13
          AutoSize = False
          Caption = #1054#1096#1080#1073#1086#1082':'
        end
        object lbOK: TRzLabel
          Left = 66
          Top = 41
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lbOK'
        end
        object lberr: TRzLabel
          Left = 66
          Top = 60
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lberr'
        end
      end
      object PanelStat2: TPanel
        Left = 67
        Top = 20
        Width = 226
        Height = 76
        TabOrder = 1
        Visible = False
        object RzLabel7: TRzLabel
          Left = 4
          Top = 2
          Width = 92
          Height = 13
          AutoSize = False
          Caption = #1050#1085#1080#1075':'
        end
        object RzLabel8: TRzLabel
          Left = 4
          Top = 21
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #1040#1074#1090#1086#1088#1086#1074':'
        end
        object lbB: TRzLabel
          Left = 52
          Top = 3
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '000000'
        end
        object lbA: TRzLabel
          Left = 52
          Top = 21
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lbtreat'
        end
        object Labeln: TRzLabel
          Left = 4
          Top = 40
          Width = 46
          Height = 13
          AutoSize = False
          Caption = #1057#1077#1088#1080#1081':'
        end
        object LabelN1: TRzLabel
          Left = 4
          Top = 59
          Width = 50
          Height = 13
          AutoSize = False
          Caption = #1046#1072#1085#1088#1086#1074':'
        end
        object lbS: TRzLabel
          Left = 49
          Top = 40
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lbOK'
        end
        object lbG: TRzLabel
          Left = 49
          Top = 59
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lberr'
        end
        object LabelN3: TRzLabel
          Left = 121
          Top = 34
          Width = 46
          Height = 13
          AutoSize = False
          Caption = #1060#1072#1081#1083#1086#1074':'
        end
        object lbF: TRzLabel
          Left = 166
          Top = 34
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'lbOK'
        end
      end
    end
    object PanelLog: TRzPanel
      Left = 2
      Top = 245
      Width = 626
      Height = 160
      Align = alBottom
      TabOrder = 3
      object RzLabel5: TRzLabel
        Left = 10
        Top = 6
        Width = 113
        Height = 13
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1087#1072#1087#1082#1080':'
      end
      object lbLog: TRzLabel
        Left = 318
        Top = 6
        Width = 94
        Height = 13
        Caption = #1054#1096#1080#1073#1082#1080' '#1074' '#1092#1072#1081#1083#1072#1093':'
      end
      object meCur: TRzMemo
        Left = 9
        Top = 23
        Width = 300
        Height = 133
        Color = clInfoBk
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        FocusColor = clHighlightText
      end
      object meErr: TRzMemo
        Left = 317
        Top = 23
        Width = 299
        Height = 133
        Color = clInfoBk
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        FocusColor = clHighlightText
      end
      object btSaveLog: TRzButton
        Left = 477
        Top = 3
        Width = 135
        Height = 18
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1083#1086#1075' '#1074' '#1092#1072#1081#1083
        TabOrder = 2
        OnClick = btSaveLogClick
      end
    end
    object PanelUpd: TRzPanel
      Left = 11
      Top = 10
      Width = 624
      Height = 128
      TabOrder = 5
      object rgOper: TRzRadioGroup
        Left = 8
        Top = 1
        Width = 214
        Height = 80
        Caption = #1044#1077#1081#1089#1090#1074#1080#1103
        Items.Strings = (
          #1053#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' '#1074' '#1087#1072#1087#1082#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
          #1053#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' '#1074' '#1076#1088#1091#1075#1086#1081' '#1087#1072#1087#1082#1077
          #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1074#1086#1081#1089#1090#1074#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080)
        TabOrder = 1
        OnClick = rgOperClick
      end
      object PanelUpd0: TRzPanel
        Left = 197
        Top = 26
        Width = 394
        Height = 112
        BorderInner = fsFlatRounded
        BorderOuter = fsNone
        TabOrder = 3
        Visible = False
        object RzLabel9: TRzLabel
          Left = 16
          Top = 21
          Width = 184
          Height = 13
          Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1092#1072#1081#1083#1099', '#1076#1072#1090#1072' '#1082#1086#1090#1086#1088#1099#1093' >'
        end
        object dp1: TRzDateTimePicker
          Left = 206
          Top = 18
          Width = 97
          Height = 21
          Date = 39930.629923495370000000
          Time = 39930.629923495370000000
          TabOrder = 0
        end
        object rbUpd01: TRzRadioButton
          Left = 30
          Top = 50
          Width = 92
          Height = 15
          Caption = #1047#1072#1085#1086#1089#1080#1090#1100' '#1074' '#1041#1044
          TabOrder = 1
        end
        object rbUpd02: TRzRadioButton
          Left = 137
          Top = 51
          Width = 143
          Height = 15
          Caption = #1058#1086#1083#1100#1082#1086' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object PanelUpd1: TRzPanel
        Left = 229
        Top = 5
        Width = 391
        Height = 121
        BorderInner = fsFlatRounded
        BorderOuter = fsNone
        TabOrder = 2
        Visible = False
        object Label5: TLabel
          Left = 8
          Top = 13
          Width = 108
          Height = 13
          Caption = #1055#1072#1087#1082#1072' '#1089' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077#1084
        end
        object chDel: TRzCheckBox
          Left = 11
          Top = 53
          Width = 201
          Height = 15
          Caption = #1059#1076#1072#1083#1103#1090#1100' '#1092#1072#1081#1083#1099' '#1087#1086#1089#1083#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
          State = cbUnchecked
          TabOrder = 2
          Visible = False
        end
        object edSourPathUpd: TRzButtonEdit
          Tag = 3
          Left = 122
          Top = 12
          Width = 265
          Height = 21
          Text = 'd:\Delph4\NetLibrs\CataLib\lr\upd\'
          TabOrder = 0
          OnButtonClick = btPathClick
        end
        object chReplace: TRzCheckBox
          Left = 11
          Top = 46
          Width = 144
          Height = 15
          Caption = #1047#1072#1084#1077#1085#1103#1090#1100' '#1089#1090#1072#1088#1099#1077' '#1092#1072#1081#1083#1099
          State = cbUnchecked
          TabOrder = 1
        end
        object RzPanel3: TRzPanel
          Left = 228
          Top = 35
          Width = 160
          Height = 38
          TabOrder = 3
          object rbUpd03: TRzRadioButton
            Left = 4
            Top = 4
            Width = 143
            Height = 15
            Caption = #1058#1086#1083#1100#1082#1086' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RzRadioButton1: TRzRadioButton
            Left = 4
            Top = 19
            Width = 92
            Height = 15
            Caption = #1047#1072#1085#1086#1089#1080#1090#1100' '#1074' '#1041#1044
            TabOrder = 1
          end
        end
        object rgShablon: TRzRadioGroup
          Left = 179
          Top = 71
          Width = 216
          Height = 41
          Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1080#1079
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'fb2'
            #1080#1084#1103' '#1092#1072#1081#1083#1072)
          StartXPos = 5
          StartYPos = 4
          TabOrder = 4
          OnClick = rgShablonClick
          object edShablonFrom: TRzEdit
            Left = 121
            Top = 15
            Width = 89
            Height = 21
            Text = '%f_%n_%t'
            TabOrder = 0
          end
        end
        object RzGroupBox1: TRzGroupBox
          Left = 8
          Top = 71
          Width = 163
          Height = 42
          Caption = #1064#1072#1073#1083#1086#1085' '#1080#1084#1077#1085#1080' '#1092#1072#1081#1083#1072
          TabOrder = 5
          object edShablonTo: TRzEdit
            Left = 9
            Top = 15
            Width = 147
            Height = 21
            Text = '%L\%f_%n\%f_%n_%t'
            TabOrder = 0
          end
        end
      end
      object PanelUpd2: TRzPanel
        Left = 206
        Top = 16
        Width = 394
        Height = 112
        BorderInner = fsFlatRounded
        BorderOuter = fsNone
        TabOrder = 0
        Visible = False
        object Label3: TLabel
          Left = 9
          Top = 44
          Width = 82
          Height = 13
          Caption = #1050#1086#1088#1085#1077#1074#1072#1103' '#1087#1072#1087#1082#1072
        end
        object Label1: TLabel
          Left = 8
          Top = 77
          Width = 43
          Height = 13
          Caption = #1060#1072#1081#1083' '#1041#1044
          Visible = False
        end
        object Label4: TLabel
          Left = 39
          Top = 14
          Width = 55
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edSourPathNew: TRzButtonEdit
          Tag = 4
          Left = 101
          Top = 40
          Width = 283
          Height = 21
          TabOrder = 0
          OnButtonClick = btPathClick
        end
        object rgSourNew: TRzRadioGroup
          Left = 98
          Top = 66
          Width = 167
          Height = 36
          Caption = #1060#1072#1081#1083' '#1041#1044' '#1074' '#1087#1072#1087#1082#1077':'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #1087#1088#1086#1075#1088#1072#1084#1084#1099
            #1082#1086#1083#1083#1077#1082#1094#1080#1080)
          TabOrder = 1
        end
        object edLibNameNew: TRzEdit
          Left = 100
          Top = 12
          Width = 282
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object gbExt: TRzGroupBox
      Left = 8
      Top = 129
      Width = 220
      Height = 114
      Caption = #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1090#1100' '#1092#1072#1081#1083#1099
      TabOrder = 0
      object RzLabel6: TRzLabel
        Left = 87
        Top = 17
        Width = 54
        Height = 13
        Caption = #1053#1086#1074#1099#1081' '#1090#1080#1087
      end
      object RzLabel10: TRzLabel
        Left = 85
        Top = 53
        Width = 132
        Height = 13
        Caption = #1064#1072#1073#1083#1086#1085' '#1085#1072#1079#1074#1072#1085#1080#1103' ('#1085#1077' fb2)'
      end
      object lbShablons: TRzLabel
        Left = 85
        Top = 93
        Width = 20
        Height = 13
        Caption = '(...)'
      end
      object lvExt: TRzListView
        Left = 5
        Top = 19
        Width = 77
        Height = 90
        Checkboxes = True
        Columns = <
          item
            Width = 20
          end
          item
            Width = 10
          end>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsList
      end
      object btAddExt: TButton
        Left = 152
        Top = 30
        Width = 62
        Height = 20
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = btAddExtClick
      end
      object edExt: TEdit
        Left = 86
        Top = 30
        Width = 60
        Height = 21
        TabOrder = 2
      end
      object edShablon: TEdit
        Left = 85
        Top = 69
        Width = 128
        Height = 21
        TabOrder = 3
        Text = '%t'
      end
    end
    object PanelNew: TRzPanel
      Left = 5
      Top = 31
      Width = 624
      Height = 128
      TabOrder = 4
      object Label2: TLabel
        Left = 12
        Top = 16
        Width = 55
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edLibName: TRzEdit
        Left = 73
        Top = 14
        Width = 256
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rgSour: TRzRadioGroup
        Left = 352
        Top = 3
        Width = 257
        Height = 40
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          #1055#1072#1087#1082#1072' '#1089' '#1092#1072#1081#1083#1072#1084#1080
          #1060#1072#1081#1083' '#1041#1044
          #1060#1072#1081#1083' csv')
        TabOrder = 1
        OnClick = rgSourClick
      end
      object PanelSrcDir: TRzPanel
        Left = 10
        Top = 46
        Width = 604
        Height = 77
        BorderInner = fsFlatRounded
        BorderOuter = fsNone
        TabOrder = 2
        object lbSourPath: TLabel
          Left = 9
          Top = 20
          Width = 82
          Height = 13
          Caption = #1050#1086#1088#1085#1077#1074#1072#1103' '#1087#1072#1087#1082#1072
        end
        object lbLibPathFile: TLabel
          Left = 9
          Top = 45
          Width = 43
          Height = 13
          Caption = #1060#1072#1081#1083' '#1041#1044
          Visible = False
        end
        object rgDBPath: TRzRadioGroup
          Left = 409
          Top = 9
          Width = 169
          Height = 36
          Caption = #1060#1072#1081#1083' '#1041#1044' '#1074' '#1087#1072#1087#1082#1077':'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #1087#1088#1086#1075#1088#1072#1084#1084#1099
            #1082#1086#1083#1083#1077#1082#1094#1080#1080)
          TabOrder = 0
        end
        object edLibPathFile: TRzButtonEdit
          Tag = 2
          Left = 101
          Top = 43
          Width = 283
          Height = 21
          TabOrder = 1
          Visible = False
          OnButtonClick = btPathClick
        end
        object edSourPath: TRzButtonEdit
          Tag = 1
          Left = 101
          Top = 16
          Width = 283
          Height = 21
          TabOrder = 2
          OnButtonClick = btPathClick
        end
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 462
    Width = 635
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    object Stat0: TRzStatusPane
      Left = 0
      Top = 0
      Height = 19
      Align = alLeft
    end
    object Stat1: TRzStatusPane
      Left = 100
      Top = 0
      Height = 19
      Align = alLeft
    end
    object StatProgress: TRzProgressStatus
      Left = 200
      Top = 0
      Width = 171
      Height = 19
      Align = alLeft
      ParentShowHint = False
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 417
    Width = 635
    Height = 45
    Align = alBottom
    BorderInner = fsFlatRounded
    BorderOuter = fsNone
    TabOrder = 2
    object btExit: TRzButton
      Left = 276
      Top = 13
      Width = 78
      Height = 24
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = btExitClick
    end
  end
  object DirDialog: TRzSelDirDialog
    CenterToParent = True
    Position = poOwnerFormCenter
    DriveTypes = [dtFixed, dtNetwork, dtCDROM, dtRAM]
    Prompt = #1050#1086#1088#1085#1077#1074#1072#1103' '#1087#1072#1087#1082#1072
    PromptFolders = #1055#1072#1087#1082#1080
    PromptDrives = #1044#1080#1089#1082#1080
    Caption = #1053#1086#1074#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 46
    Top = 375
  end
  object SaveDial: TRzSaveDialog
    Options = [osoHideReadOnly, osoOverwritePrompt, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden]
    Left = 10
    Top = 375
  end
  object OpenDial: TRzOpenDialog
    Options = [osoFileMustExist, osoHideReadOnly, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden]
    Left = 87
    Top = 375
  end
end
