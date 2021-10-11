object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 707
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Pages: TRzPageControl
    Left = 0
    Top = 91
    Width = 742
    Height = 597
    ActivePage = TabAvt
    Align = alClient
    ParentColor = False
    TabIndex = 0
    TabOrder = 0
    OnChange = PagesChange
    FixedDimension = 19
    object TabAvt: TRzTabSheet
      Caption = #1040#1074#1090#1086#1088#1099
      object PanelAvt: TRzSizePanel
        Tag = 1001
        Left = 0
        Top = 0
        Width = 210
        Height = 574
        BorderInner = fsFlatRounded
        BorderWidth = 1
        SizeBarStyle = ssBump
        SizeBarWidth = 6
        TabOrder = 0
        object RzPanel16: TRzPanel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 191
          Height = 41
          Align = alTop
          BorderOuter = fsFlatRounded
          ParentColor = True
          TabOrder = 0
          DesignSize = (
            191
            41)
          object Label19: TLabel
            Left = 10
            Top = 16
            Width = 30
            Height = 13
            Caption = #1055#1086#1080#1089#1082
          end
          object tbClearEdAuthor: TRzToolButton
            Left = 159
            Top = 10
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100
            ImageIndex = 36
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            ExplicitLeft = 197
          end
          object edLocateA: TRzEdit
            Tag = 1
            AlignWithMargins = True
            Left = 53
            Top = 12
            Width = 101
            Height = 21
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Anchors = [akLeft, akTop, akRight]
            Color = clCaptionText
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = edLocateAChange
          end
        end
        object tvAvt: TVirtualStringTree
          Tag = 1
          AlignWithMargins = True
          Left = 6
          Top = 53
          Width = 191
          Height = 515
          Align = alClient
          CheckImageKind = ckXP
          Colors.UnfocusedSelectionColor = clHighlight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
          Header.SortDirection = sdDescending
          IncrementalSearch = isAll
          ParentFont = False
          TabOrder = 1
          TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
          OnChange = tvAvtChange
          OnCompareNodes = tvAvtCompareNodes
          OnGetText = tvAvtGetText
          OnHeaderClick = tvAvtHeaderClick
          Columns = <
            item
              Position = 0
              Tag = 1
              Width = 187
              WideText = #1060#1048#1054' '#1072#1074#1090#1086#1088#1086#1074
            end>
        end
      end
      object PanelA: TPanel
        Left = 210
        Top = 0
        Width = 528
        Height = 574
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PanelRightA: TRzSizePanel
          Tag = 1002
          AlignWithMargins = True
          Left = 358
          Top = 3
          Width = 167
          Height = 568
          Align = alRight
          BorderInner = fsFlat
          Constraints.MinWidth = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          SizeBarStyle = ssBump
          SizeBarWidth = 6
          TabOrder = 0
          object Image4: TImage
            Tag = 301
            AlignWithMargins = True
            Left = 11
            Top = 4
            Width = 152
            Height = 373
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 181
            ExplicitHeight = 198
          end
          object RzSizePanel15: TRzSizePanel
            Left = 8
            Top = 380
            Width = 158
            Height = 187
            Align = alBottom
            Constraints.MinHeight = 100
            Side = sdTop
            ParentColor = True
            SizeBarStyle = ssBump
            SizeBarWidth = 6
            TabOrder = 0
            object RzPanel33: TRzPanel
              Left = 0
              Top = 101
              Width = 158
              Height = 86
              Align = alBottom
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel80: TRzLabel
                Left = 5
                Top = -1
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1048#1079#1076'-'#1074#1086':'
              end
              object RzLabel81: TRzLabel
                Left = 5
                Top = 13
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1088#1086#1076':'
              end
              object RzLabel82: TRzLabel
                Left = 5
                Top = 27
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1076':'
              end
              object RzLabel83: TRzLabel
                Left = 5
                Top = 69
                Width = 56
                Height = 13
                AutoSize = False
                Caption = 'ISBN:'
              end
              object RzLabel84: TRzLabel
                Tag = 206
                Left = 63
                Top = -1
                Width = 29
                Height = 13
                Caption = 'lblBPA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel85: TRzLabel
                Tag = 207
                Left = 63
                Top = 13
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel86: TRzLabel
                Tag = 211
                Left = 63
                Top = 69
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel87: TRzLabel
                Tag = 208
                Left = 63
                Top = 27
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel88: TRzLabel
                Left = 5
                Top = 55
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1055#1077#1088#1077#1074#1086#1076':'
              end
              object RzLabel89: TRzLabel
                Tag = 209
                Left = 63
                Top = 41
                Width = 56
                Height = 13
                Caption = '30-10-2009'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel90: TRzLabel
                Left = 5
                Top = 41
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1057#1077#1088#1080#1103':'
              end
              object RzLabel91: TRzLabel
                Tag = 210
                Left = 63
                Top = 55
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
            object RzMemo4: TRzMemo
              Tag = 302
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 152
              Height = 88
              Align = alClient
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              ReadOnlyColor = clCaptionText
            end
          end
        end
        object PanelBookA: TRzPanel
          Tag = 1001
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 352
          Height = 568
          Margins.Right = 0
          Align = alClient
          BorderInner = fsFlatRounded
          BorderOuter = fsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object RzPanel30: TRzPanel
            Tag = 10
            Left = 2
            Top = 2
            Width = 348
            Height = 44
            Align = alTop
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 0
            object RzLabel7: TRzLabel
              Tag = 102
              AlignWithMargins = True
              Left = 333
              Top = 3
              Width = 12
              Height = 38
              Align = alRight
              Alignment = taRightJustify
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLowerRight
              ExplicitHeight = 19
            end
            object RzLabel8: TRzLabel
              Tag = 101
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 285
              Height = 38
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
              CenterPoint = cpLowerRight
            end
          end
          object RzPanel31: TRzPanel
            Left = 2
            Top = 467
            Width = 348
            Height = 99
            Align = alBottom
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 1
            object RzLabel32: TRzLabel
              Tag = 201
              AlignWithMargins = True
              Left = 9
              Top = 0
              Width = 336
              Height = 14
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBAvtA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              Layout = tlCenter
              ExplicitLeft = 10
              ExplicitWidth = 53
            end
            object RzLabel33: TRzLabel
              Tag = 202
              AlignWithMargins = True
              Left = 9
              Top = 14
              Width = 336
              Height = 27
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBTitA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 0
              ExplicitWidth = 318
            end
            object RzLabel54: TRzLabel
              Left = 9
              Top = 41
              Width = 35
              Height = 13
              AutoSize = False
              Caption = #1046#1072#1085#1088':'
            end
            object RzLabel55: TRzLabel
              Tag = 203
              Left = 52
              Top = 41
              Width = 30
              Height = 13
              Caption = 'lblBGA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object RzPanel32: TRzPanel
              AlignWithMargins = True
              Left = 3
              Top = 60
              Width = 342
              Height = 36
              Align = alBottom
              BorderInner = fsFlatRounded
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel76: TRzLabel
                Left = 8
                Top = 4
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1055#1072#1087#1082#1072':'
              end
              object RzLabel77: TRzLabel
                Left = 8
                Top = 19
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1060#1072#1081#1083':'
              end
              object RzLabel78: TRzLabel
                Tag = 204
                Left = 52
                Top = 4
                Width = 36
                Height = 13
                Caption = 'lblBDirA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel79: TRzLabel
                Tag = 205
                Left = 52
                Top = 19
                Width = 33
                Height = 13
                Caption = 'lblBFilA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object tvBooksA: TVirtualStringTree
            Tag = 1
            AlignWithMargins = True
            Left = 5
            Top = 49
            Width = 342
            Height = 415
            Align = alClient
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionColor = clNavy
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Background = clBackground
            Header.DefaultHeight = 17
            Header.Font.Charset = RUSSIAN_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.MainColumn = 1
            Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize]
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            Images = ilBool
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmBook
            SelectionBlendFactor = 0
            ShowHint = False
            TabOrder = 2
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
            OnChange = tvBooksAChange
            OnCompareNodes = tvBooksACompareNodes
            OnDblClick = tvBooksADblClick
            OnGetText = tvBooksAGetText
            OnGetImageIndexEx = tvBooksAGetImageIndexEx
            OnHeaderClick = tvBooksAHeaderClick
            OnInitNode = tvBooksAInitNode
            Columns = <
              item
                Margin = 0
                MaxWidth = 1000
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 0
                Spacing = 10
                Width = 167
                WideText = #1042#1099#1073#1086#1088
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                Alignment = taCenter
                MaxWidth = 80
                MinWidth = 35
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 1
                Spacing = 10
                Width = 40
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                BiDiMode = bdRightToLeft
                MaxWidth = 200
                MinWidth = 65
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 2
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 3
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 4
                Width = 205
                WideText = #1046#1072#1085#1088
              end>
          end
        end
      end
    end
    object TabSer: TRzTabSheet
      Caption = #1057#1077#1088#1080#1080
      object PanelSer: TRzSizePanel
        Left = 0
        Top = 0
        Width = 246
        Height = 574
        BorderInner = fsFlatRounded
        BorderWidth = 1
        SizeBarStyle = ssBump
        SizeBarWidth = 6
        TabOrder = 0
        object RzPanel1: TRzPanel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 227
          Height = 41
          Align = alTop
          BorderOuter = fsFlatRounded
          ParentColor = True
          TabOrder = 0
          DesignSize = (
            227
            41)
          object Label1: TLabel
            Left = 10
            Top = 16
            Width = 30
            Height = 13
            Caption = #1055#1086#1080#1089#1082
          end
          object RzToolButton1: TRzToolButton
            Left = 195
            Top = 10
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100
            ImageIndex = 36
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            ExplicitLeft = 197
          end
          object edLocateS: TRzEdit
            Tag = 3
            AlignWithMargins = True
            Left = 53
            Top = 12
            Width = 137
            Height = 21
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = edLocateAChange
          end
        end
        object tvSer: TVirtualStringTree
          Tag = 3
          AlignWithMargins = True
          Left = 6
          Top = 53
          Width = 227
          Height = 515
          Align = alClient
          CheckImageKind = ckXP
          Colors.UnfocusedSelectionColor = clHighlight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
          Header.SortDirection = sdDescending
          IncrementalSearch = isAll
          ParentFont = False
          TabOrder = 1
          TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
          OnChange = tvAvtChange
          OnCompareNodes = tvAvtCompareNodes
          OnGetText = tvAvtGetText
          OnHeaderClick = tvAvtHeaderClick
          ExplicitHeight = 496
          Columns = <
            item
              Position = 0
              Tag = 3
              Width = 227
              WideText = #1053#1072#1079#1074#1072#1085#1080#1103' '#1089#1077#1088#1080#1081
            end>
        end
      end
      object PanelS: TPanel
        Left = 246
        Top = 0
        Width = 492
        Height = 574
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 555
        object PanelRightS: TRzSizePanel
          Tag = 1002
          AlignWithMargins = True
          Left = 322
          Top = 3
          Width = 167
          Height = 568
          Align = alRight
          BorderInner = fsFlat
          Constraints.MinWidth = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          SizeBarStyle = ssBump
          SizeBarWidth = 6
          TabOrder = 0
          ExplicitHeight = 549
          object Image1: TImage
            Tag = 301
            AlignWithMargins = True
            Left = 11
            Top = 4
            Width = 152
            Height = 373
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 181
            ExplicitHeight = 198
          end
          object RzSizePanel9: TRzSizePanel
            Left = 8
            Top = 380
            Width = 158
            Height = 187
            Align = alBottom
            Constraints.MinHeight = 100
            Side = sdTop
            ParentColor = True
            SizeBarStyle = ssBump
            SizeBarWidth = 6
            TabOrder = 0
            ExplicitTop = 361
            object RzPanel3: TRzPanel
              Left = 0
              Top = 101
              Width = 158
              Height = 86
              Align = alBottom
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel1: TRzLabel
                Left = 5
                Top = -1
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1048#1079#1076'-'#1074#1086':'
              end
              object RzLabel2: TRzLabel
                Left = 5
                Top = 13
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1088#1086#1076':'
              end
              object RzLabel3: TRzLabel
                Left = 5
                Top = 27
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1076':'
              end
              object RzLabel4: TRzLabel
                Left = 5
                Top = 69
                Width = 56
                Height = 13
                AutoSize = False
                Caption = 'ISBN:'
              end
              object RzLabel5: TRzLabel
                Tag = 206
                Left = 63
                Top = -1
                Width = 29
                Height = 13
                Caption = 'lblBPA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel6: TRzLabel
                Tag = 207
                Left = 63
                Top = 13
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel9: TRzLabel
                Tag = 211
                Left = 63
                Top = 69
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel10: TRzLabel
                Tag = 208
                Left = 63
                Top = 27
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel11: TRzLabel
                Left = 5
                Top = 55
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1055#1077#1088#1077#1074#1086#1076':'
              end
              object RzLabel12: TRzLabel
                Tag = 209
                Left = 63
                Top = 41
                Width = 56
                Height = 13
                Caption = '30-10-2009'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel13: TRzLabel
                Left = 5
                Top = 41
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1057#1077#1088#1080#1103':'
              end
              object RzLabel14: TRzLabel
                Tag = 210
                Left = 63
                Top = 55
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
            object RzMemo1: TRzMemo
              Tag = 302
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 152
              Height = 88
              Align = alClient
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              ReadOnlyColor = clCaptionText
            end
          end
        end
        object PanelBookS: TRzPanel
          Tag = 1001
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 316
          Height = 568
          Margins.Right = 0
          Align = alClient
          BorderInner = fsFlatRounded
          BorderOuter = fsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 549
          object RzPanel9: TRzPanel
            Tag = 10
            Left = 2
            Top = 2
            Width = 312
            Height = 44
            Align = alTop
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 0
            object RzLabel15: TRzLabel
              Tag = 102
              AlignWithMargins = True
              Left = 297
              Top = 3
              Width = 12
              Height = 19
              Align = alRight
              Alignment = taRightJustify
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLowerRight
            end
            object RzLabel16: TRzLabel
              Tag = 101
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 253
              Height = 38
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
              CenterPoint = cpLowerRight
            end
          end
          object RzPanel10: TRzPanel
            Left = 2
            Top = 467
            Width = 312
            Height = 99
            Align = alBottom
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 1
            ExplicitTop = 448
            object RzLabel17: TRzLabel
              Tag = 201
              AlignWithMargins = True
              Left = 9
              Top = 0
              Width = 300
              Height = 14
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBAvtA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              Layout = tlCenter
              ExplicitLeft = 10
              ExplicitWidth = 53
            end
            object RzLabel18: TRzLabel
              Tag = 202
              AlignWithMargins = True
              Left = 9
              Top = 14
              Width = 300
              Height = 27
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBTitA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 0
              ExplicitWidth = 318
            end
            object RzLabel19: TRzLabel
              Left = 9
              Top = 41
              Width = 35
              Height = 13
              AutoSize = False
              Caption = #1046#1072#1085#1088':'
            end
            object RzLabel20: TRzLabel
              Tag = 203
              Left = 52
              Top = 41
              Width = 30
              Height = 13
              Caption = 'lblBGA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object RzPanel11: TRzPanel
              AlignWithMargins = True
              Left = 3
              Top = 60
              Width = 306
              Height = 36
              Align = alBottom
              BorderInner = fsFlatRounded
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel21: TRzLabel
                Left = 8
                Top = 4
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1055#1072#1087#1082#1072':'
              end
              object RzLabel22: TRzLabel
                Left = 8
                Top = 19
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1060#1072#1081#1083':'
              end
              object RzLabel23: TRzLabel
                Tag = 204
                Left = 52
                Top = 4
                Width = 36
                Height = 13
                Caption = 'lblBDirA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel24: TRzLabel
                Tag = 205
                Left = 52
                Top = 19
                Width = 33
                Height = 13
                Caption = 'lblBFilA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object tvBooksS: TVirtualStringTree
            Tag = 3
            AlignWithMargins = True
            Left = 5
            Top = 49
            Width = 306
            Height = 415
            Align = alClient
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionColor = clNavy
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Background = clBackground
            Header.DefaultHeight = 17
            Header.Font.Charset = ANSI_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.MainColumn = 1
            Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize]
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            Images = ilBool
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmBook
            SelectionBlendFactor = 0
            ShowHint = False
            TabOrder = 2
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
            OnChange = tvBooksAChange
            OnCompareNodes = tvBooksACompareNodes
            OnDblClick = tvBooksADblClick
            OnGetText = tvBooksAGetText
            OnGetImageIndexEx = tvBooksAGetImageIndexEx
            OnHeaderClick = tvBooksAHeaderClick
            OnInitNode = tvBooksAInitNode
            ExplicitHeight = 396
            Columns = <
              item
                Margin = 0
                MaxWidth = 1000
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 0
                Spacing = 10
                Width = 167
                WideText = #1042#1099#1073#1086#1088
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                Alignment = taCenter
                MaxWidth = 80
                MinWidth = 35
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 1
                Spacing = 10
                Width = 40
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                BiDiMode = bdRightToLeft
                MaxWidth = 200
                MinWidth = 65
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 2
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 3
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 4
                Width = 205
                WideText = #1046#1072#1085#1088
              end>
          end
        end
      end
    end
    object TabGen: TRzTabSheet
      Caption = #1046#1072#1085#1088#1099
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 555
      object PanelGen: TRzSizePanel
        Left = 0
        Top = 0
        Width = 246
        Height = 574
        BorderInner = fsFlatRounded
        BorderWidth = 1
        SizeBarStyle = ssBump
        SizeBarWidth = 6
        TabOrder = 0
        ExplicitHeight = 555
        object RzPanel2: TRzPanel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 227
          Height = 41
          Align = alTop
          BorderOuter = fsFlatRounded
          ParentColor = True
          TabOrder = 0
          object rbGen1: TRzRadioButton
            Tag = 1
            Left = 16
            Top = 14
            Width = 36
            Height = 15
            Caption = #1042#1089#1077
            TabOrder = 0
            OnClick = rbGen1Click
          end
          object rbGen2: TRzRadioButton
            Tag = 2
            Left = 108
            Top = 14
            Width = 79
            Height = 15
            Caption = #1048#1084#1077#1102#1097#1080#1077#1089#1103
            TabOrder = 1
            OnClick = rbGen1Click
          end
        end
        object tvGen: TVirtualStringTree
          Tag = 4
          AlignWithMargins = True
          Left = 6
          Top = 53
          Width = 227
          Height = 515
          Align = alClient
          CheckImageKind = ckXP
          Colors.UnfocusedSelectionColor = clHighlight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
          Header.SortDirection = sdDescending
          IncrementalSearch = isAll
          ParentFont = False
          TabOrder = 1
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight]
          TreeOptions.PaintOptions = [toPopupMode, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
          OnChange = tvAvtChange
          OnCompareNodes = tvAvtCompareNodes
          OnGetText = tvAvtGetText
          OnHeaderClick = tvAvtHeaderClick
          ExplicitHeight = 496
          Columns = <
            item
              Position = 0
              Tag = 4
              Width = 227
              WideText = #1053#1072#1079#1074#1072#1085#1080#1103' '#1078#1072#1085#1088#1086#1074
            end>
        end
      end
      object PanelG: TPanel
        Left = 246
        Top = 0
        Width = 492
        Height = 574
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 555
        object PanelRightG: TRzSizePanel
          Tag = 1002
          AlignWithMargins = True
          Left = 322
          Top = 3
          Width = 167
          Height = 568
          Align = alRight
          BorderInner = fsFlat
          Constraints.MinWidth = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          SizeBarStyle = ssBump
          SizeBarWidth = 6
          TabOrder = 0
          ExplicitHeight = 549
          object Image2: TImage
            Tag = 301
            AlignWithMargins = True
            Left = 11
            Top = 4
            Width = 152
            Height = 373
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 181
            ExplicitHeight = 198
          end
          object RzSizePanel2: TRzSizePanel
            Left = 8
            Top = 380
            Width = 158
            Height = 187
            Align = alBottom
            Constraints.MinHeight = 100
            Side = sdTop
            ParentColor = True
            SizeBarStyle = ssBump
            SizeBarWidth = 6
            TabOrder = 0
            ExplicitTop = 361
            object RzPanel12: TRzPanel
              Left = 0
              Top = 101
              Width = 158
              Height = 86
              Align = alBottom
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel25: TRzLabel
                Left = 5
                Top = -1
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1048#1079#1076'-'#1074#1086':'
              end
              object RzLabel26: TRzLabel
                Left = 5
                Top = 13
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1088#1086#1076':'
              end
              object RzLabel27: TRzLabel
                Left = 5
                Top = 27
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1076':'
              end
              object RzLabel28: TRzLabel
                Left = 5
                Top = 69
                Width = 56
                Height = 13
                AutoSize = False
                Caption = 'ISBN:'
              end
              object RzLabel29: TRzLabel
                Tag = 206
                Left = 63
                Top = -1
                Width = 29
                Height = 13
                Caption = 'lblBPA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel30: TRzLabel
                Tag = 207
                Left = 63
                Top = 13
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel31: TRzLabel
                Tag = 211
                Left = 63
                Top = 69
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel34: TRzLabel
                Tag = 208
                Left = 63
                Top = 27
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel35: TRzLabel
                Left = 5
                Top = 55
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1055#1077#1088#1077#1074#1086#1076':'
              end
              object RzLabel36: TRzLabel
                Tag = 209
                Left = 63
                Top = 41
                Width = 56
                Height = 13
                Caption = '30-10-2009'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel37: TRzLabel
                Left = 5
                Top = 41
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1057#1077#1088#1080#1103':'
              end
              object RzLabel38: TRzLabel
                Tag = 210
                Left = 63
                Top = 55
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
            object RzMemo2: TRzMemo
              Tag = 302
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 152
              Height = 88
              Align = alClient
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              ReadOnlyColor = clCaptionText
            end
          end
        end
        object PanelBookG: TRzPanel
          Tag = 1001
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 316
          Height = 568
          Margins.Right = 0
          Align = alClient
          BorderInner = fsFlatRounded
          BorderOuter = fsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 549
          object RzPanel14: TRzPanel
            Tag = 10
            Left = 2
            Top = 2
            Width = 312
            Height = 44
            Align = alTop
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 0
            object RzLabel39: TRzLabel
              Tag = 102
              AlignWithMargins = True
              Left = 297
              Top = 3
              Width = 12
              Height = 19
              Align = alRight
              Alignment = taRightJustify
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLowerRight
            end
            object RzLabel40: TRzLabel
              Tag = 101
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 242
              Height = 38
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
              CenterPoint = cpLowerRight
            end
          end
          object RzPanel15: TRzPanel
            Left = 2
            Top = 467
            Width = 312
            Height = 99
            Align = alBottom
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 1
            ExplicitTop = 448
            object RzLabel41: TRzLabel
              Tag = 201
              AlignWithMargins = True
              Left = 9
              Top = 0
              Width = 300
              Height = 14
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBAvtA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              Layout = tlCenter
              ExplicitLeft = 10
              ExplicitWidth = 53
            end
            object RzLabel42: TRzLabel
              Tag = 202
              AlignWithMargins = True
              Left = 9
              Top = 14
              Width = 300
              Height = 27
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBTitA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 0
              ExplicitWidth = 318
            end
            object RzLabel43: TRzLabel
              Left = 9
              Top = 41
              Width = 35
              Height = 13
              AutoSize = False
              Caption = #1046#1072#1085#1088':'
            end
            object RzLabel44: TRzLabel
              Tag = 203
              Left = 52
              Top = 41
              Width = 30
              Height = 13
              Caption = 'lblBGA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object RzPanel17: TRzPanel
              AlignWithMargins = True
              Left = 3
              Top = 60
              Width = 306
              Height = 36
              Align = alBottom
              BorderInner = fsFlatRounded
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel45: TRzLabel
                Left = 8
                Top = 4
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1055#1072#1087#1082#1072':'
              end
              object RzLabel46: TRzLabel
                Left = 8
                Top = 19
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1060#1072#1081#1083':'
              end
              object RzLabel47: TRzLabel
                Tag = 204
                Left = 52
                Top = 4
                Width = 36
                Height = 13
                Caption = 'lblBDirA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel48: TRzLabel
                Tag = 205
                Left = 52
                Top = 19
                Width = 33
                Height = 13
                Caption = 'lblBFilA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object tvBooksG: TVirtualStringTree
            Tag = 4
            AlignWithMargins = True
            Left = 5
            Top = 49
            Width = 306
            Height = 415
            Align = alClient
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionColor = clNavy
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Background = clBackground
            Header.DefaultHeight = 17
            Header.Font.Charset = ANSI_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.MainColumn = 1
            Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize]
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            Images = ilBool
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmBook
            SelectionBlendFactor = 0
            ShowHint = False
            TabOrder = 2
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
            OnChange = tvBooksAChange
            OnCompareNodes = tvBooksACompareNodes
            OnDblClick = tvBooksADblClick
            OnGetText = tvBooksAGetText
            OnGetImageIndexEx = tvBooksAGetImageIndexEx
            OnHeaderClick = tvBooksAHeaderClick
            OnInitNode = tvBooksAInitNode
            ExplicitHeight = 396
            Columns = <
              item
                Margin = 0
                MaxWidth = 1000
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 0
                Spacing = 10
                Width = 167
                WideText = #1042#1099#1073#1086#1088
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                Alignment = taCenter
                MaxWidth = 80
                MinWidth = 35
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 1
                Spacing = 10
                Width = 40
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                BiDiMode = bdRightToLeft
                MaxWidth = 200
                MinWidth = 65
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 2
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 3
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 4
                Width = 205
                WideText = #1046#1072#1085#1088
              end>
          end
        end
      end
    end
    object TabBook: TRzTabSheet
      Caption = #1050#1085#1080#1075#1080
      object PanelBook: TRzSizePanel
        Left = 0
        Top = 0
        Width = 246
        Height = 574
        BorderInner = fsFlatRounded
        BorderWidth = 1
        SizeBarStyle = ssBump
        SizeBarWidth = 6
        TabOrder = 0
        object RzPanel7: TRzPanel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 227
          Height = 41
          Align = alTop
          BorderOuter = fsFlatRounded
          ParentColor = True
          TabOrder = 0
          DesignSize = (
            227
            41)
          object Label4: TLabel
            Left = 10
            Top = 16
            Width = 30
            Height = 13
            Caption = #1055#1086#1080#1089#1082
          end
          object RzToolButton4: TRzToolButton
            Left = 195
            Top = 10
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100
            ImageIndex = 36
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            ExplicitLeft = 197
          end
          object edLocateB: TRzEdit
            Tag = 2
            AlignWithMargins = True
            Left = 53
            Top = 12
            Width = 137
            Height = 21
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = edLocateAChange
          end
        end
        object tvBook: TVirtualStringTree
          Tag = 2
          AlignWithMargins = True
          Left = 6
          Top = 53
          Width = 227
          Height = 515
          Align = alClient
          CheckImageKind = ckXP
          Colors.UnfocusedSelectionColor = clHighlight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
          Header.SortDirection = sdDescending
          IncrementalSearch = isAll
          ParentFont = False
          TabOrder = 1
          TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
          OnChange = tvAvtChange
          OnCompareNodes = tvAvtCompareNodes
          OnGetText = tvAvtGetText
          OnHeaderClick = tvAvtHeaderClick
          ExplicitHeight = 496
          Columns = <
            item
              Position = 0
              Tag = 2
              Width = 227
              WideText = #1053#1072#1079#1074#1072#1085#1080#1103' '#1082#1085#1080#1075
            end>
        end
      end
      object PanelB: TPanel
        Left = 246
        Top = 0
        Width = 492
        Height = 574
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 555
        object PanelRightB: TRzSizePanel
          Tag = 1002
          AlignWithMargins = True
          Left = 322
          Top = 3
          Width = 167
          Height = 568
          Align = alRight
          BorderInner = fsFlat
          Constraints.MinWidth = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          SizeBarStyle = ssBump
          SizeBarWidth = 6
          TabOrder = 0
          ExplicitHeight = 549
          object Image3: TImage
            Tag = 301
            AlignWithMargins = True
            Left = 11
            Top = 4
            Width = 152
            Height = 373
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 181
            ExplicitHeight = 198
          end
          object RzSizePanel4: TRzSizePanel
            Left = 8
            Top = 380
            Width = 158
            Height = 187
            Align = alBottom
            Constraints.MinHeight = 100
            Side = sdTop
            ParentColor = True
            SizeBarStyle = ssBump
            SizeBarWidth = 6
            TabOrder = 0
            ExplicitTop = 361
            object RzPanel18: TRzPanel
              Left = 0
              Top = 101
              Width = 158
              Height = 86
              Align = alBottom
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel49: TRzLabel
                Left = 5
                Top = -1
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1048#1079#1076'-'#1074#1086':'
              end
              object RzLabel50: TRzLabel
                Left = 5
                Top = 13
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1088#1086#1076':'
              end
              object RzLabel51: TRzLabel
                Left = 5
                Top = 27
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1076':'
              end
              object RzLabel52: TRzLabel
                Left = 5
                Top = 69
                Width = 56
                Height = 13
                AutoSize = False
                Caption = 'ISBN:'
              end
              object RzLabel53: TRzLabel
                Tag = 206
                Left = 63
                Top = -1
                Width = 29
                Height = 13
                Caption = 'lblBPA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel56: TRzLabel
                Tag = 207
                Left = 63
                Top = 13
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel57: TRzLabel
                Tag = 211
                Left = 63
                Top = 69
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel58: TRzLabel
                Tag = 208
                Left = 63
                Top = 27
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel59: TRzLabel
                Left = 5
                Top = 55
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1055#1077#1088#1077#1074#1086#1076':'
              end
              object RzLabel60: TRzLabel
                Tag = 209
                Left = 63
                Top = 41
                Width = 56
                Height = 13
                Caption = '30-10-2009'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel61: TRzLabel
                Left = 5
                Top = 41
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1057#1077#1088#1080#1103':'
              end
              object RzLabel62: TRzLabel
                Tag = 210
                Left = 63
                Top = 55
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
            object RzMemo3: TRzMemo
              Tag = 302
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 152
              Height = 88
              Align = alClient
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              ReadOnlyColor = clCaptionText
            end
          end
        end
        object PanelBookB: TRzPanel
          Tag = 1001
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 316
          Height = 568
          Margins.Right = 0
          Align = alClient
          BorderInner = fsFlatRounded
          BorderOuter = fsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 549
          object RzPanel20: TRzPanel
            Tag = 10
            Left = 2
            Top = 2
            Width = 312
            Height = 44
            Align = alTop
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 0
            object RzLabel63: TRzLabel
              Tag = 102
              AlignWithMargins = True
              Left = 297
              Top = 3
              Width = 12
              Height = 19
              Align = alRight
              Alignment = taRightJustify
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLowerRight
            end
            object RzLabel64: TRzLabel
              Tag = 101
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 248
              Height = 38
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
              CenterPoint = cpLowerRight
            end
          end
          object RzPanel21: TRzPanel
            Left = 2
            Top = 467
            Width = 312
            Height = 99
            Align = alBottom
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 1
            ExplicitTop = 448
            object RzLabel65: TRzLabel
              Tag = 201
              AlignWithMargins = True
              Left = 9
              Top = 0
              Width = 300
              Height = 14
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBAvtA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              Layout = tlCenter
              ExplicitLeft = 10
              ExplicitWidth = 53
            end
            object RzLabel66: TRzLabel
              Tag = 202
              AlignWithMargins = True
              Left = 9
              Top = 14
              Width = 300
              Height = 27
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBTitA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 0
              ExplicitWidth = 318
            end
            object RzLabel67: TRzLabel
              Left = 9
              Top = 41
              Width = 35
              Height = 13
              AutoSize = False
              Caption = #1046#1072#1085#1088':'
            end
            object RzLabel68: TRzLabel
              Tag = 203
              Left = 52
              Top = 41
              Width = 30
              Height = 13
              Caption = 'lblBGA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object RzPanel22: TRzPanel
              AlignWithMargins = True
              Left = 3
              Top = 60
              Width = 306
              Height = 36
              Align = alBottom
              BorderInner = fsFlatRounded
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel69: TRzLabel
                Left = 8
                Top = 4
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1055#1072#1087#1082#1072':'
              end
              object RzLabel70: TRzLabel
                Left = 8
                Top = 19
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1060#1072#1081#1083':'
              end
              object RzLabel71: TRzLabel
                Tag = 204
                Left = 52
                Top = 4
                Width = 36
                Height = 13
                Caption = 'lblBDirA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel72: TRzLabel
                Tag = 205
                Left = 52
                Top = 19
                Width = 33
                Height = 13
                Caption = 'lblBFilA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object tvBooksB: TVirtualStringTree
            Tag = 2
            AlignWithMargins = True
            Left = 5
            Top = 49
            Width = 306
            Height = 415
            Align = alClient
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionColor = clNavy
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Background = clBackground
            Header.DefaultHeight = 17
            Header.Font.Charset = ANSI_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.MainColumn = 1
            Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize]
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            Images = ilBool
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmBook
            SelectionBlendFactor = 0
            ShowHint = False
            TabOrder = 2
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
            OnChange = tvBooksAChange
            OnCompareNodes = tvBooksACompareNodes
            OnDblClick = tvBooksADblClick
            OnGetText = tvBooksAGetText
            OnGetImageIndexEx = tvBooksAGetImageIndexEx
            OnHeaderClick = tvBooksAHeaderClick
            OnInitNode = tvBooksAInitNode
            ExplicitHeight = 396
            Columns = <
              item
                Margin = 0
                MaxWidth = 1000
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 0
                Spacing = 10
                Width = 167
                WideText = #1042#1099#1073#1086#1088
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                Alignment = taCenter
                MaxWidth = 80
                MinWidth = 35
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 1
                Spacing = 10
                Width = 40
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                BiDiMode = bdRightToLeft
                MaxWidth = 200
                MinWidth = 65
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 2
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 3
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 4
                Width = 205
                WideText = #1046#1072#1085#1088
              end>
          end
        end
      end
    end
    object TabTot: TRzTabSheet
      Caption = #1054#1090#1073#1086#1088
      object PanelTot: TRzSizePanel
        Left = 0
        Top = 0
        Width = 210
        Height = 574
        BorderInner = fsFlatRounded
        BorderWidth = 1
        SizeBarStyle = ssBump
        SizeBarWidth = 6
        TabOrder = 0
        object btTotS: TRzRapidFireButton
          Left = 7
          Top = 68
          Width = 42
          Height = 19
          GroupIndex = 1
          Down = True
          Caption = #1058#1077#1082#1089#1090
          Flat = True
          OnClick = btTotSClick
        end
        object btTotF: TRzRapidFireButton
          Left = 55
          Top = 68
          Width = 42
          Height = 19
          GroupIndex = 1
          Caption = #1063#1080#1089#1083#1086
          Flat = True
          OnClick = btTotSClick
        end
        object btTotD: TRzRapidFireButton
          Left = 103
          Top = 69
          Width = 42
          Height = 19
          GroupIndex = 1
          Caption = #1044#1072#1090#1072
          Flat = True
          OnClick = btTotSClick
        end
        object btTotB: TRzRapidFireButton
          Left = 154
          Top = 70
          Width = 42
          Height = 19
          GroupIndex = 1
          Caption = #1044#1072'/'#1053#1077#1090
          Flat = True
          OnClick = btTotSClick
        end
        object btTotO1: TRzRapidFireButton
          Left = 9
          Top = 98
          Width = 22
          Height = 15
          GroupIndex = 2
          Down = True
          Caption = '='
          Flat = True
          OnClick = btTotSClick
        end
        object btTotO2: TRzRapidFireButton
          Left = 35
          Top = 97
          Width = 22
          Height = 15
          GroupIndex = 2
          Caption = '<>'
          Flat = True
          OnClick = btTotSClick
        end
        object btTotO4: TRzRapidFireButton
          Left = 88
          Top = 98
          Width = 22
          Height = 15
          GroupIndex = 2
          Caption = '<'
          Flat = True
          OnClick = btTotSClick
        end
        object btTotO3: TRzRapidFireButton
          Left = 61
          Top = 98
          Width = 22
          Height = 15
          GroupIndex = 2
          Caption = '>'
          Flat = True
          OnClick = btTotSClick
        end
        object btTotO6: TRzRapidFireButton
          Left = 145
          Top = 98
          Width = 34
          Height = 15
          GroupIndex = 2
          Caption = #1077#1089#1090#1100
          Flat = True
          OnClick = btTotSClick
        end
        object btTotO5: TRzRapidFireButton
          Left = 113
          Top = 98
          Width = 28
          Height = 15
          GroupIndex = 2
          Caption = 'like'
          Flat = True
          OnClick = btTotSClick
        end
        object cbFldsT: TRzComboBox
          Left = 21
          Top = 32
          Width = 155
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnClick = cbFldsTClick
        end
        object cbTotVal: TRzComboBox
          Left = 9
          Top = 147
          Width = 187
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
        end
        object edTotVal: TRzEdit
          Left = 9
          Top = 170
          Width = 151
          Height = 21
          TabOrder = 2
        end
        object btFind: TRzBitBtn
          Left = 75
          Top = 254
          Width = 79
          Height = 27
          Caption = #1048#1089#1082#1072#1090#1100
          ParentColor = True
          TabOrder = 3
          OnClick = btFindClick
          ImageIndex = 15
          Images = ImgList0
        end
        object rbTot: TRzRadioGroup
          Left = 14
          Top = 114
          Width = 138
          Height = 29
          Columns = 2
          Items.Strings = (
            #1042#1099#1073#1086#1088
            #1042#1074#1086#1076)
          ParentColor = True
          StartYPos = -5
          TabOrder = 4
          OnClick = rbTotClick
        end
      end
      object PanelT: TPanel
        Left = 210
        Top = 0
        Width = 528
        Height = 574
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 555
        object PanelRightT: TRzSizePanel
          Tag = 1002
          AlignWithMargins = True
          Left = 358
          Top = 3
          Width = 167
          Height = 568
          Align = alRight
          BorderInner = fsFlat
          Constraints.MinWidth = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          SizeBarStyle = ssBump
          SizeBarWidth = 6
          TabOrder = 0
          ExplicitHeight = 549
          object Image5: TImage
            Tag = 301
            AlignWithMargins = True
            Left = 11
            Top = 4
            Width = 152
            Height = 373
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 181
            ExplicitHeight = 198
          end
          object RzSizePanel6: TRzSizePanel
            Left = 8
            Top = 380
            Width = 158
            Height = 187
            Align = alBottom
            Constraints.MinHeight = 100
            Side = sdTop
            ParentColor = True
            SizeBarStyle = ssBump
            SizeBarWidth = 6
            TabOrder = 0
            ExplicitTop = 361
            object RzPanel23: TRzPanel
              Left = 0
              Top = 101
              Width = 158
              Height = 86
              Align = alBottom
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel73: TRzLabel
                Left = 5
                Top = -1
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1048#1079#1076'-'#1074#1086':'
              end
              object RzLabel74: TRzLabel
                Left = 5
                Top = 13
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1088#1086#1076':'
              end
              object RzLabel75: TRzLabel
                Left = 5
                Top = 27
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1043#1086#1076':'
              end
              object RzLabel92: TRzLabel
                Left = 5
                Top = 69
                Width = 56
                Height = 13
                AutoSize = False
                Caption = 'ISBN:'
              end
              object RzLabel93: TRzLabel
                Tag = 206
                Left = 63
                Top = -1
                Width = 29
                Height = 13
                Caption = 'lblBPA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel94: TRzLabel
                Tag = 207
                Left = 63
                Top = 13
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel95: TRzLabel
                Tag = 211
                Left = 63
                Top = 69
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel96: TRzLabel
                Tag = 208
                Left = 63
                Top = 27
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel97: TRzLabel
                Left = 5
                Top = 55
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1055#1077#1088#1077#1074#1086#1076':'
              end
              object RzLabel98: TRzLabel
                Tag = 209
                Left = 63
                Top = 41
                Width = 56
                Height = 13
                Caption = '30-10-2009'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel99: TRzLabel
                Left = 5
                Top = 41
                Width = 56
                Height = 13
                AutoSize = False
                Caption = #1057#1077#1088#1080#1103':'
              end
              object RzLabel100: TRzLabel
                Tag = 210
                Left = 63
                Top = 55
                Width = 43
                Height = 13
                Caption = 'RzLabel8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
            object RzMemo5: TRzMemo
              Tag = 302
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 152
              Height = 88
              Align = alClient
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              ReadOnlyColor = clCaptionText
            end
          end
        end
        object PanelBookT: TRzPanel
          Tag = 1001
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 352
          Height = 568
          Margins.Right = 0
          Align = alClient
          BorderInner = fsFlatRounded
          BorderOuter = fsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 549
          object RzPanel25: TRzPanel
            Tag = 10
            Left = 2
            Top = 2
            Width = 348
            Height = 44
            Align = alTop
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 0
            object RzLabel101: TRzLabel
              Tag = 102
              AlignWithMargins = True
              Left = 333
              Top = 3
              Width = 12
              Height = 19
              Align = alRight
              Alignment = taRightJustify
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLowerRight
            end
            object RzLabel102: TRzLabel
              Tag = 101
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 287
              Height = 38
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
              CenterPoint = cpLowerRight
            end
          end
          object RzPanel26: TRzPanel
            Left = 2
            Top = 467
            Width = 348
            Height = 99
            Align = alBottom
            BorderOuter = fsNone
            ParentColor = True
            TabOrder = 1
            ExplicitTop = 448
            object RzLabel103: TRzLabel
              Tag = 201
              AlignWithMargins = True
              Left = 9
              Top = 0
              Width = 336
              Height = 14
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBAvtA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              Layout = tlCenter
              ExplicitLeft = 10
              ExplicitWidth = 53
            end
            object RzLabel104: TRzLabel
              Tag = 202
              AlignWithMargins = True
              Left = 9
              Top = 14
              Width = 336
              Height = 27
              Margins.Left = 9
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              Caption = 'lblBTitA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 0
              ExplicitWidth = 318
            end
            object RzLabel105: TRzLabel
              Left = 9
              Top = 41
              Width = 35
              Height = 13
              AutoSize = False
              Caption = #1046#1072#1085#1088':'
            end
            object RzLabel106: TRzLabel
              Tag = 203
              Left = 52
              Top = 41
              Width = 30
              Height = 13
              Caption = 'lblBGA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object RzPanel27: TRzPanel
              AlignWithMargins = True
              Left = 3
              Top = 60
              Width = 342
              Height = 36
              Align = alBottom
              BorderInner = fsFlatRounded
              BorderOuter = fsNone
              ParentColor = True
              TabOrder = 0
              object RzLabel107: TRzLabel
                Left = 8
                Top = 4
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1055#1072#1087#1082#1072':'
              end
              object RzLabel108: TRzLabel
                Left = 8
                Top = 19
                Width = 43
                Height = 13
                AutoSize = False
                Caption = #1060#1072#1081#1083':'
              end
              object RzLabel109: TRzLabel
                Tag = 204
                Left = 52
                Top = 4
                Width = 36
                Height = 13
                Caption = 'lblBDirA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object RzLabel110: TRzLabel
                Tag = 205
                Left = 52
                Top = 19
                Width = 33
                Height = 13
                Caption = 'lblBFilA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object tvBooksT: TVirtualStringTree
            Tag = 5
            AlignWithMargins = True
            Left = 5
            Top = 49
            Width = 342
            Height = 415
            Align = alClient
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionColor = clNavy
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Background = clBackground
            Header.DefaultHeight = 17
            Header.Font.Charset = ANSI_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.MainColumn = 1
            Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize]
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            Images = ilBool
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmBook
            SelectionBlendFactor = 0
            ShowHint = False
            TabOrder = 2
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
            OnChange = tvBooksAChange
            OnCompareNodes = tvBooksACompareNodes
            OnDblClick = tvBooksADblClick
            OnGetText = tvBooksAGetText
            OnGetImageIndexEx = tvBooksAGetImageIndexEx
            OnHeaderClick = tvBooksAHeaderClick
            OnInitNode = tvBooksAInitNode
            ExplicitHeight = 396
            Columns = <
              item
                Margin = 0
                MaxWidth = 1000
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 0
                Spacing = 10
                Width = 167
                WideText = #1042#1099#1073#1086#1088
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                Alignment = taCenter
                MaxWidth = 80
                MinWidth = 35
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 1
                Spacing = 10
                Width = 40
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                BiDiMode = bdRightToLeft
                MaxWidth = 200
                MinWidth = 65
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 2
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 3
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                MinWidth = 40
                Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 4
                Width = 205
                WideText = #1046#1072#1085#1088
              end>
          end
        end
      end
    end
    object TabLibs: TRzTabSheet
      Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1080
      object PanelLib1: TRzPanel
        Left = 0
        Top = 0
        Width = 738
        Height = 574
        Align = alClient
        TabOrder = 0
        object PanelLib: TRzSizePanel
          Left = 2
          Top = 2
          Width = 246
          Height = 570
          BorderInner = fsFlatRounded
          BorderWidth = 1
          TabOrder = 0
          object tvLib: TVirtualStringTree
            AlignWithMargins = True
            Left = 6
            Top = 53
            Width = 229
            Height = 511
            Align = alClient
            CheckImageKind = ckXP
            Colors.UnfocusedSelectionColor = clHighlight
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.DefaultHeight = 17
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
            Header.SortDirection = sdDescending
            IncrementalSearch = isAll
            ParentFont = False
            TabOrder = 0
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
            TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
            OnChange = tvAvtChange
            OnCompareNodes = tvAvtCompareNodes
            OnGetText = tvAvtGetText
            OnHeaderClick = tvAvtHeaderClick
            ExplicitHeight = 492
            Columns = <
              item
                Position = 0
                Width = 229
                WideText = #1053#1072#1079#1074#1072#1085#1080#1077
              end>
          end
          object RzPanel6: TRzPanel
            AlignWithMargins = True
            Left = 6
            Top = 6
            Width = 229
            Height = 41
            Align = alTop
            BorderOuter = fsFlatRounded
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              229
              41)
            object Label3: TLabel
              Left = 10
              Top = 16
              Width = 30
              Height = 13
              Caption = #1055#1086#1080#1089#1082
              Visible = False
            end
            object RzToolButton3: TRzToolButton
              Left = 197
              Top = 10
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100
              ImageIndex = 36
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object RzEdit3: TRzEdit
              AlignWithMargins = True
              Left = 53
              Top = 12
              Width = 139
              Height = 21
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
          end
        end
        object sgLib: TRzStringGrid
          AlignWithMargins = True
          Left = 268
          Top = 22
          Width = 448
          Height = 547
          Margins.Left = 20
          Margins.Top = 20
          Margins.Right = 20
          TabStop = False
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          ColCount = 3
          DefaultRowHeight = 22
          FixedCols = 0
          FixedRows = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
          ParentColor = True
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 1
          OnSelectCell = sgLibSelectCell
          ExplicitHeight = 528
        end
      end
    end
    object TabSheet8: TRzTabSheet
      Caption = 'TabSheet8'
      object Label5: TLabel
        Left = 20
        Top = 79
        Width = 31
        Height = 13
        Caption = 'Label5'
      end
      object Button1: TButton
        Left = 21
        Top = 34
        Width = 72
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
      end
      object me1: TMemo
        Left = 217
        Top = 11
        Width = 361
        Height = 313
        Lines.Strings = (
          'me1')
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 688
    Width = 742
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    ParentColor = True
    TabOrder = 1
    object Stat0: TRzStatusPane
      Left = 0
      Top = 0
      Height = 19
      Align = alLeft
      ExplicitLeft = 598
      ExplicitHeight = 20
    end
    object Stat1: TRzStatusPane
      Left = 100
      Top = 0
      Width = 200
      Height = 19
      Align = alLeft
    end
    object StatProgress: TRzProgressStatus
      Left = 300
      Top = 0
      Width = 171
      Height = 19
      Align = alLeft
      ParentShowHint = False
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
      ExplicitLeft = 200
    end
  end
  object MainBar: TToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 31
    BorderWidth = 1
    ButtonWidth = 76
    Caption = 'MainBar'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HotTrackColor = 13682103
    Images = ImgList0
    Indent = 2
    List = True
    ParentFont = False
    ShowCaptions = True
    AllowTextButtons = True
    TabOrder = 2
    Wrapable = False
    object btRead: TToolButton
      Tag = 1
      Left = 2
      Top = 0
      Caption = 'read'
      ImageIndex = 11
    end
    object btDir: TToolButton
      Tag = 2
      Left = 26
      Top = 0
      Caption = 'dir2'
      ImageIndex = 14
    end
    object ToolButton6: TToolButton
      Left = 50
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object btRu: TToolButton
      Tag = 4
      Left = 58
      Top = 0
      ImageIndex = 17
      Style = tbsTextButton
      OnClick = btRuClick
    end
    object tbEn: TToolButton
      Tag = 5
      Left = 93
      Top = 0
      ImageIndex = 16
      Style = tbsTextButton
      OnClick = btRuClick
    end
    object ToolButton3: TToolButton
      Left = 128
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object btSel: TToolButton
      Tag = 1
      Left = 136
      Top = 0
      Caption = 'btSel'
      ImageIndex = 13
      OnClick = miBookSelClick
    end
    object btUnSel: TToolButton
      Tag = 3
      Left = 160
      Top = 0
      Caption = 'btUnSel'
      ImageIndex = 21
      OnClick = miBookSelClick
    end
    object ToolButton4: TToolButton
      Left = 184
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 17
      Style = tbsSeparator
    end
    object btSets: TToolButton
      Tag = 10
      Left = 192
      Top = 0
      Caption = 'btSets'
      ImageIndex = 12
      OnClick = miSetsClick
    end
    object ToolButton5: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object cbLib: TRzComboBox
      AlignWithMargins = True
      Left = 224
      Top = 0
      Width = 123
      Height = 24
      AllowEdit = False
      Style = csDropDownList
      Ctl3D = False
      FrameStyle = fsStatus
      FrameVisible = True
      ItemHeight = 16
      ParentCtl3D = False
      TabOrder = 0
      OnChange = cbLibChange
    end
    object btCbLibSeparator: TToolButton
      Left = 347
      Top = 0
      Width = 8
      Caption = 'btCbLibSeparator'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object btTabA: TToolButton
      Tag = 1
      Left = 355
      Top = 0
      Caption = #1040
      Style = tbsTextButton
      OnClick = btTabAClick
    end
    object btTabS: TToolButton
      Tag = 2
      Left = 376
      Top = 0
      Caption = #1057
      Style = tbsTextButton
      OnClick = btTabAClick
    end
    object btTabG: TToolButton
      Tag = 3
      Left = 395
      Top = 0
      Caption = #1046
      Style = tbsTextButton
      OnClick = btTabAClick
    end
    object btTabB: TToolButton
      Tag = 4
      Left = 419
      Top = 0
      Caption = #1050
      Style = tbsTextButton
      OnClick = btTabAClick
    end
    object btTabT: TToolButton
      Tag = 5
      Left = 438
      Top = 0
      Caption = #1054
      Style = tbsTextButton
      OnClick = btTabAClick
    end
    object btTabL: TToolButton
      Tag = 6
      Left = 458
      Top = 0
      Caption = #1051
      Style = tbsTextButton
      OnClick = btTabAClick
    end
  end
  object EngBar: TToolBar
    Left = 0
    Top = 61
    Width = 742
    Height = 30
    BorderWidth = 1
    ButtonWidth = 35
    Caption = 'RusBar'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HotTrackColor = 13682103
    Indent = 2
    List = True
    ParentFont = False
    ShowCaptions = True
    AllowTextButtons = True
    TabOrder = 3
    Wrapable = False
    object btStarE: TToolButton
      Tag = 90
      Left = 2
      Top = 0
      Caption = '*'
      ImageIndex = 0
      Style = tbsTextButton
      OnClick = btStarRClick
    end
    object btStar1E: TToolButton
      Tag = 93
      Left = 26
      Top = 0
      Caption = '#'
      ImageIndex = 2
      Style = tbsTextButton
      OnClick = btStarRClick
    end
    object btAZE: TToolButton
      Tag = 92
      Left = 51
      Top = 0
      Caption = 'A-Z'
      ImageIndex = 1
      Style = tbsTextButton
      OnClick = btStarRClick
    end
  end
  object RusBar: TToolBar
    Left = 0
    Top = 31
    Width = 742
    Height = 30
    BorderWidth = 1
    ButtonWidth = 37
    Caption = 'RusBar'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HotTrackColor = 13682103
    Indent = 2
    List = True
    ParentFont = False
    ShowCaptions = True
    AllowTextButtons = True
    TabOrder = 4
    Wrapable = False
    object ToolButton1: TToolButton
      Tag = 90
      Left = 2
      Top = 0
      Caption = '*'
      ImageIndex = 0
      Style = tbsTextButton
      OnClick = btStarRClick
    end
    object ToolButton2: TToolButton
      Tag = 93
      Left = 26
      Top = 0
      Caption = '#'
      ImageIndex = 2
      Style = tbsTextButton
      OnClick = btStarRClick
    end
    object btAZR: TToolButton
      Tag = 91
      Left = 51
      Top = 0
      Caption = #1040'-'#1071
      ImageIndex = 1
      Style = tbsTextButton
      OnClick = btStarRClick
    end
  end
  object MMenu1: TMainMenu
    Images = ImgList0
    OwnerDraw = True
    Left = 130
    Top = 253
    object miLib: TMenuItem
      Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1103
      OnAdvancedDrawItem = miLibAdvancedDrawItem
      object miLibChoise: TMenuItem
        AutoHotkeys = maManual
        AutoLineReduction = maManual
        Caption = #1042#1099#1073#1088#1072#1090#1100
        OnAdvancedDrawItem = miLibAdvancedDrawItem
        object miLibAll: TMenuItem
          Caption = #1042#1089#1077
          Checked = True
          OnClick = miLibAllClick
          OnAdvancedDrawItem = miLibAdvancedDrawItem
        end
      end
      object mi0N1: TMenuItem
        Caption = '_'
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miLibNew: TMenuItem
        Tag = 1
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 18
        OnClick = miLibNewClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miLibUpd: TMenuItem
        Tag = 2
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 20
        OnClick = miLibNewClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miLibDel: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ImageIndex = 19
        OnClick = miLibDelClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object mi0N2: TMenuItem
        Caption = '_'
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
    end
    object miBook: TMenuItem
      Caption = #1050#1085#1080#1075#1072
      OnAdvancedDrawItem = miLibAdvancedDrawItem
      object miBookRead: TMenuItem
        Tag = 1
        Caption = #1063#1080#1090#1072#1090#1100
        ImageIndex = 11
        OnClick = miBookInfoClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBookDir1: TMenuItem
        Tag = 1
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
        ImageIndex = 14
        OnClick = miBookDir1Click
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBookDir2: TMenuItem
        Tag = 2
        Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103
        OnClick = miBookDir1Click
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBook1: TMenuItem
        Caption = '_'
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBookInfo: TMenuItem
        Tag = 2
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
        ImageIndex = 5
        OnClick = miBookInfoClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBook2: TMenuItem
        Caption = '_'
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBookSel: TMenuItem
        Tag = 1
        Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
        ImageIndex = 13
        OnClick = miBookSelClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miiBookSelPic: TMenuItem
        Tag = 2
        Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
        OnClick = miBookSelClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miBookUnsel: TMenuItem
        Tag = 3
        Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1086#1090#1084#1077#1090#1082#1080
        ImageIndex = 21
        OnClick = miBookSelClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
    end
    object miTools: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OnAdvancedDrawItem = miLibAdvancedDrawItem
      object miToolsGen: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1078#1072#1085#1088#1086#1074
        OnClick = miToolsGenClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miTools1: TMenuItem
        Caption = '_'
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miToolsExportLeft: TMenuItem
        Tag = 1
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1083#1077#1074#1086#1075#1086' '#1089#1087#1080#1089#1082#1072
        OnClick = miToolsExportBooksClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
      object miToolsExportBooks: TMenuItem
        Tag = 2
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1087#1088#1072#1074#1086#1075#1086' '#1089#1087#1080#1089#1082#1072
        OnClick = miToolsExportBooksClick
        OnAdvancedDrawItem = miLibAdvancedDrawItem
      end
    end
    object miSets: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = miSetsClick
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object mnAbout: TMenuItem
      Caption = '?'
      OnClick = mnAboutClick
    end
  end
  object SaveDial: TRzSaveDialog
    Options = [osoHideReadOnly, osoOverwritePrompt, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden]
    Left = 439
    Top = 246
  end
  object ilBool: TImageList
    DrawingStyle = dsTransparent
    Left = 455
    Top = 144
  end
  object OpenDial: TRzOpenDialog
    Options = [osoFileMustExist, osoHideReadOnly, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden]
    Left = 378
    Top = 272
  end
  object ImgList0: TImageList
    Left = 393
    Top = 175
    Bitmap = {
      494C010117001900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000203E5C00FFFFFF00FFFFFF0047586500122D4700122D
      4700122D4700122D4700122D4700122D4700000000007D776C007D766B007D75
      6A007D74690084796C008D7F6F008C7E6D008C7D6B008C7D6D007D6F61007D6F
      61007D6F60007D6E5F0084746300443D36000000000074838A00696969001919
      1900191919001919190019191900191919001919190019191900191919001919
      190019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086B2DF0086B2DF0086B2DF0086B2
      DF0086B2DF0086B2DF00203E5C00FFFFFF00FFFFFF004758650066A5DB00589A
      D5004A90CF003D87C900317EC400122D4700C4BFB600FFFFED00FFFDE500FFFB
      E200FFFFE200CDC3B500696E720089808E0082838A007E706000FFFAD600FFEC
      C900FFEAC700FFE9C500FFF4CD008474630074838A000000000079A2B0004659
      5F003D71A200376C9F0030679C0029629800235D95001D59920018558F001449
      7D0019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A5B7B004A5B7B004A5B7B004A5B
      7B00577DA8007CA8D500203E5C00FFFFFF00FFFFFF00475865007AB4E4006CA9
      DE005E9FD7005095D100438BCC00122D4700BDB9B100FFFBE400FFF2DC00FFF0
      D900FFF4DB00BAB0A300FFFFFF00FFFFFF00D9EEDF0079655C00FFF0CE00FFE1
      C100FFE0BF00FFDEBD00FFE9C5007D6E5F00FF00FF004699BD0098DBF0008FC2
      D4002D434E002D434E00407CB6003776B1003070AD00286BAA002165A6001A58
      930019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A5B7B004A5B7B004A5B7B00577D
      A8007CA8D500203E5C00FFFFFF00446060000F2B2C00475865008FC3ED0080B8
      E60072AEE00064A3DA005699D400122D4700BDBAB300FFFCE800FFF4DF00FFF2
      DC00FFF6DE00BBB2A600FCEDFF00FFFFFF00FFFFFF0080808000FFF2D900FFE3
      C300FFE1C100FFE0BF00FFEAC7007D6F6000FF00FF004699BD0098DBF000196B
      AC003797C4003797C4002D434E00447FB8003B79B3003373AF002C6DAB00235D
      950019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A5B7B004A5B7B00577DA8007CA8
      D500203E5C00FFFFFF00FFFFFF004460600065E3E60047586500A3D2F50095C8
      EF0086BDE90078B2E3006AA8DD00122D4700BDBBB300FFFEEB00FFF5E300FFF4
      DF00FFF8E100C4B2B300C0C0C000C0C0C000C0C0C00080808000FFE1C100FFE0
      BF00FFE3C300FFE1C100FFECC9007D6F6100FF00FF00FF00FF003797C4003797
      C4003AB4EE003AB4EE003797C4002D434E004882BA003F7CB5003776B1002C64
      9A0019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A5B7B005983AF007CA8D500203E
      5C00FFFFFF00FFFFFF00FFFFFF004460600078E7E90047586500B6E0FE00A9D6
      F8009BCCF2008DC2EC007EB7E500122D4700BDBCB500FFFFEF00FFF7E600FFF5
      E300FFF4DF00FFFFF500FFFFFF00FFFFFF00FFFFFF00FFE1C100FFE0BF00FFE1
      C100FFECD300FFE3C300FFEDCB007D706100FF00FF00FF00FF00196BAC0065D4
      EC0065D4EC003AB4EE003AB4EE003797C4002D434E004C85BC00437FB800366C
      9F0019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006593C0007CA8D500203E5C00FFFF
      FF00FFFFFF00625B560041383100446060008AEAEC004758650095B2C100637A
      8A00607789005D758700749AB700122D4700BDBDB600FFFFF100FFF9E900FFF7
      E600FFF5E300FFF7E600FFFFFF00FFF5E700FFF0DD00FFE3C300FFE1C100FFE1
      C100FFE0BF00FFE8CD00FFF0CE007D706200FF00FF00FF00FF0069696900196B
      AC0065D4EC0065D4EC003AB4EE003AB4EE003797C4002D434E005088BE004174
      A40019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000366CA200203E5C00FFFFFF00FFFF
      FF00FFFFFF00625B5600EED0B900446060009DEDEF00475865009FB9C100677D
      8A00647B8A006178890081A3BD00122D4700BDBEB800FFFFF400FFFBEB00FFF9
      E900FFF7E600FFFCE800FFFFF200FFFFE700FFFDE300FFFCE200FFF2E600FFE3
      C300FFE1C100FFEEE000FFF0D1007D716400FF00FF00FF00FF00696969009FC4
      E800196BAC0065D4EC0065D4EC003AB4EE003AB4EE003797C4002D434E004C7C
      AA0019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000C8C0C00FFFFFF00FFFF
      FF00FFFFFF00625B5600F0D6C10044606000AEF1F20047586500E8FFFF00DEFD
      FF00D3F5FF00C7EDFF00BAE3FF00122D4700BDBDB800FFFFF800FFFDEE00FFFB
      EB00FFFFEE00BFBBB4005A5F63007A72800074747C006F695F00FFFCE200FFEE
      D900FFF2E500FFE8CD00FFF3D5007D726500FF00FF00FF00FF0069696900ADCF
      EF00A4C8EA00196BAC0065D4EC0065D4EC003AB4EE003AB4EE003797C4002D43
      4E0019191900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600F2DBCA0044606000A6D6D70047586500475865004758
      650047586500475865004758650047586500BDBDBA00FFFFFA00FFFEF100FFFD
      EE00FFFFF100BAB6AE00FFFEFF00FFFFFF00FFFFFF00796B6700FFFEE500FFEE
      D600FFECD200FFEACF00FFF5D8007D726700FF00FF00FF00FF0069696900B9D9
      F500B1D2F100A8CCEC00196BAC0065D4EC0065D4EC0024A1DC00929292005959
      59002D434E00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600F4E1D30044606000B2D8D9006D909000698F8F00668E
      8F008ED2D3000F2B2C00FFFFFF00FFFFFF00BDBDBA00FFFFFD00FFFFF300FFFE
      F100FFFFF400BBB8B000FBECFF00FFFFFF00FFFFFF007F896C00FFFFF000FFF0
      D900FFEED600FFECD200FFF7DB007D736700FF00FF00FF00FF0069696900A4B0
      BB00939BA3009099A2008E97A100196BAC0065D4EC009B9B9B009A9A9A007F7F
      7F00392E4800392E4800FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600F6E7DB0044606000DBF9F900D2F7F800C8F5F600BDF3
      F400B2F1F2000F2B2C00FFFFFF00FFFFFF00BDBDBB00FFFFFF00FFFFF600FFFF
      F300FFFFF700C4B8BD00C0C0C000C0C0C000C0C0C00080808000FFF7E600FFF5
      E300FFF0D900FFEED600FFF9DE007D746900FF00FF00FF00FF0069696900A2A7
      AB00C5C9CF00CACED400C9CDD300C9CDD300196BAC007E7E7E009F9F9F007F7F
      7F008C00E9008C00E900392E4800FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600DACFC700446060004460600044606000446060004460
      60004460600044606000FFFFFF00FFFFFF00C2C2C200FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBEB00FFF9E900FFF7
      E600FFFFEF00FFF9E100FFFFE90082796D00FF00FF00FF00FF0069696900B1BB
      C100AEB5BA00ADB5BC00ABB3BB00A9B1BA00A7B0B900196BAC00392E4800A969
      EE00A969EE008C00E9005C536E00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600DCD4CD00928A84009289830092888200D8CABF004138
      3100FFFFFF00FFFFFF00FFFFFF00FFFFFF0094918A00A39E8E00A19B8D00A19B
      8D00A19B8D00A89D930069966200B0A09B00A99F960080808000808080008080
      800080808000A69E9500B0AC9F0054524D00FF00FF00FF00FF0069696900E5F9
      FF00DFF4FF00D8EFFF00D1EAFF00CAE4FD00C1DEF900B9D8F500A59AB400C099
      F200A969EE008C00E9008E88A400FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600FCF6F200FBF4EE00FAF1EA00F9EEE600F8ECE2004138
      3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8B7B900F4F4F600EEEEF000EEEE
      F000EEEEF000EEEEF000F5EFF600EEEEF000EEEEF000EEEEF000FFF2FF00FFFF
      FF00FFFFFF00FFF8FF00BDBDBF0079797A00FF00FF00FF00FF0069696900E0EF
      F000DCECF000D7E9F000D1E5F000CBE0F000C4DBEF00BDD6ED00B8D2EA00A59A
      B400A59AB400AFA7C200FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600625B5600625B5600625B5600625B5600625B5600625B
      5600FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9FA000BEBEBF00BBBBBC00BBBB
      BC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00C2BD
      C300D5C3D500BBBBBB00A3A3A40086868700FF00FF00FF00FF00696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      690069696900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      0000006C0000006C0000006C0000000000000000000046576400122C4600122C
      4600122C4600122C4600122C4600122C46000000000000000000000000000000
      0000000000000000000000000000000000000000000046576400122C4600122C
      4600122C4600122C4600122C4600122C46000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      000073DA7E0073DA7E00006C000000000000000000004657640065A4DB005799
      D500498FCF003C86C900307DC300122C46000000000000000000000000000000
      000000000000000000000000000000000000000000004657640065A4DB005799
      D500498FCF003C86C900307DC300122C46000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      000073DA7E0073DA7E00006C000000000000000000004657640079B3E4006BA8
      DE005D9ED7004F94D100428ACC00122C46000000000000000000000000000000
      000000000000000000000000000000000000000000004657640079B3E4006BA8
      DE005D9ED7004F94D100428ACC00122C4600B918BD0083A35F00869364008692
      630086916200819D5800C00FC600727765008DA36F00697A5B00000000000000
      00008F259700859D5E00829E5900BA18BE00B919BF0084984D0082944800BD18
      C300BE13C800808E3E008A87450066773F0000000000F801FA006A287D008790
      4A0087884A0066665000B015BE000000000000A90000006C0000006C0000006C
      000073DA7E0073DA7E00006C0000006C0000006C0000006C00008EC2ED007FB7
      E60071ADE00063A2DA005598D400122C46002442CB001C49A9001C49A9001C49
      A9001C49A9001C49A9001C49A9001C49A9001C49A9001C49A9008EC2ED007FB7
      E60071ADE00063A2DA005598D400122C46009C14A400FEE7B600F5CFB100FDD3
      B300FCD1AF00FFE2AB009B08A700979D7E00FFECD0008C9E6F0000000000F500
      F9007F975F00FDD2B200FBDBA8009D15A6009C16A800FFD29400FFCA8C00821C
      95006B5B5E00FFB77A00CA9F5F008D2A9C00000000005E694F00FFCF8D00F7B9
      8900FBB68100F6B17600B8A35000B911C70000A9000073DA7E0073DA7E0073DA
      7E0073DA7E0073DA7E0073DA7E0073DA7E0073DA7E00006C0000A2D2F50094C8
      EF0085BCE90077B1E30069A7DD00122C46002442CB00728DFA00728DFA00728D
      FA00728DFA00728DFA00728DFA00728DFA00728DFA001C49A900A2D2F50094C8
      EF0085BCE90077B1E30069A7DD00122C46009F13A600F6E4B900F6D4B9008E87
      7300929072008E9C6800C008C700939A7E00FFE7D0008A9C710000000000641F
      7100FFE5BA00EBC8AB00F2D8A7009F14A8009F14A900F9D49D00FDC59B004C56
      4900FFC48F00FDBC84006562530000000000AC19B300C6B68200F8C29900C7A7
      7A007B7F5200FBB88500F7B37900755A620000A9000073DA7E0073DA7E0073DA
      7E0073DA7E0073DA7E0073DA7E0073DA7E0073DA7E00006C0000B5E0FE00A8D6
      F8009ACCF2008CC1EC007DB6E500122C46002442CB00728DFA00728DFA00728D
      FA00728DFA00728DFA00728DFA00728DFA00728DFA001C49A900B5E0FE00A8D6
      F8009ACCF2008CC1EC007DB6E500122C46009F12A500F8EAC100FCE4C100550E
      6600A503B000980AA300000000008E9F7C00FFECD700939A7D00BB00C400C5CA
      9700FCDBBF00ECCCB100F3DCAD009F13A7009E13A700FCDDA900F5C6A300C29F
      8300FBC29700807A5B009817AA000000000091199A00FFE1AA00FCD3A0006F1E
      82000000000081835600FCBA8600947A610000A9000000A9000000A9000000A9
      000073DA7E0073DA7E00006C000000A9000000A9000000A9000094B1C0006279
      89005F7688005C7486007399B600122C46002442CB002442CB002442CB002442
      CB002442CB002442CB002442CB002442CB002442CB002442CB0094B1C0006279
      89005F7688005C7486007399B600122C46009E11A400FAF0CA00F0D7C100FDE6
      C500F7E6BA00FEF7B6009808A100979D8500FFF0DD00999286006A546700FFF2
      D5008A827700F8D6BD00F4E0B2009F13A6009E12A600FFE6B600F3CBAB00FFDA
      AC00FBD29E00FFC79C00C3B16F00941EA3009E12A700FEE5B300FCDEAA009616
      9F0000000000888E5B00FEC191009379660000000000000000000000000000A9
      000073DA7E0073DA7E00006C0000435F5F009CEDEF00465764009EB8C000667C
      8900637A89006077880080A2BC00122C46000000000000000000000000000000
      000000000000615A5500EED0B800435F5F009CEDEF00465764009EB8C000667C
      8900637A89006077880080A2BC00122C46009E11A300FDF5D300F2DCCA00FFED
      CF00F9EDC500FFFEC2009707A000989F8900FFF4E300837C7800FFF6DE00D3C4
      AD0036264300FFE4C700F6E4B8009F13A6009E12A500FFEDC100FFE4BD00561B
      6700741B8600CAAF8800FFCA9F0092935E009F06AC00FFEBBE00FFE5B5009317
      9B000000000089926000FFC89D00947D6A0000000000000000000000000000A9
      000073DA7E0073DA7E00006C0000435F5F00ADF1F20046576400E8FFFF00DEFD
      FF00D3F5FF00C7EDFF00B9E3FF00122C46000000000000000000000000000000
      000000000000615A5500F0D6C000435F5F00ADF1F20046576400E8FFFF00DEFD
      FF00D3F5FF00C7EDFF00B9E3FF00122C46009E10A200FEFADB00FFF4DB00540A
      5F00A401AC0097079F000000000090A48200FFEEE000FEEADC00FFF6E000696A
      6300AA05B100F9ECC500F8E8BE009F12A5009D11A400FFF4CC00FFEEC2009B04
      A600000000007F896100FFD2AC00948C6A009E05AA00FFF2C800FFEDBF009317
      9A00000000008B956500FFD0A800957F6F0000000000000000000000000000A9
      000000A9000000A9000000A90000435F5F00A5D6D70046576400465764004657
      6400465764004657640046576400465764000000000000000000000000000000
      000000000000615A5500F2DBCA00435F5F00A5D6D70046576400465764004657
      6400465764004657640046576400465764009E10A100FFFFE100FFEEDF009292
      8400969D850093AA7D00BF05C30096A28A00FFF1E500FFEEE00087A578000000
      000096159C00FAF0CC00F9ECC5009E12A4009D10A300FFFAD600FFE7D0008E91
      770086936D00FFE1C100FFD7B400959C6B009E04A800FFF8D300FFF3CA009216
      9900000000008C996A00FFD7B300968373000000000000000000000000000000
      000000000000615A5500F4E1D300435F5F00B1D8D9006C8F8F00688E8E00658D
      8E008DD2D3000F2A2B0000000000000000000000000000000000000000000000
      000000000000615A5500F4E1D300435F5F00B1D8D9006C8F8F00688E8E00658D
      8E008DD2D3000F2A2B0000000000000000009B109E00FFFFF000FFF2E600FFFA
      EB00FFF6E800FFFFE80099039F009BA88F00FFFCF200FFFFF000681F6D000000
      000091179600FFFEDA00FFFAD4009C12A1009A109F00FFFFE500FFEDDA00FFF2
      DB00FFEDD400FFE9CA00C9CC9200931B9E009B10A000FFFFE300FFFFDC009016
      95000000000090A17000FFE9C5009A8B79000000000000000000000000000000
      000000000000615A5500F6E7DB00435F5F00DBF9F900D2F7F800C8F5F600BCF3
      F400B1F1F2000F2A2B0000000000000000000000000000000000000000000000
      000000000000615A5500F6E7DB00435F5F00DBF9F900D2F7F800C8F5F600BCF3
      F400B1F1F2000F2A2B000000000000000000B916BA008BB77F008EA783008DA6
      81008DA580008AB37900BF0CC100747D6F0093B2870064766000F700F8000000
      0000B11BB30089B1750088AF7300B916BB00B816BB008EB67A0090A57D0090A4
      7B0092A77A006A726200AE0FB50000000000B01AB2008EB679008EB37700B01A
      B300000000006C7D5F0093A671007A6E6C000000000000000000000000000000
      000000000000615A5500DACFC700435F5F00435F5F00435F5F00435F5F00435F
      5F00435F5F00435F5F0000000000000000000000000000000000000000000000
      000000000000615A5500DACFC700435F5F00435F5F00435F5F00435F5F00435F
      5F00435F5F00435F5F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A5500DCD4CD00918983009188820091878100D8CABE004037
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000615A5500DCD4CD00918983009188820091878100D8CABE004037
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A5500FCF6F200FBF4EE00FAF1EA00F9EEE600F8ECE2004037
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000615A5500FCF6F200FBF4EE00FAF1EA00F9EEE600F8ECE2004037
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A5500615A5500615A5500615A5500615A5500615A5500615A
      5500000000000000000000000000000000000000000000000000000000000000
      000000000000615A5500615A5500615A5500615A5500615A5500615A5500615A
      5500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009F20A4009F20A40000000000000000000000
      000000000000000000000000000000000000000000007D776C007D766B007D75
      6A007D74690084796C008D7F6F008C7E6D008C7D6B008C7D6D007D6F61007D6F
      61007D6F60007D6E5F0084746300443D36000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9058500FE00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000081756F00D100DA00000000007AA04D007AA04B0000000000D300DE007668
      5F0000000000000000000000000000000000C4BFB600FFFFED00FFFDE500FFFB
      E200FFFFE200CDC3B500696E720089808E0082838A007E706000FFFAD600FFEC
      C900FFEAC700FFE9C500FFF4CD00847463000000000000000000000000000000
      0000653164000723090011221100142412001325130013231200051D05005936
      5800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DD00C100B37E6500DFFFF500B32C5300000000000000
      0000000000000000000000000000000000000000000000000000000000009134
      9900F7FB9E00B0C474007F3F7D00E9DE8F00E7DA890080407D00AAB96100EBE9
      740081248D00000000000000000000000000BDB9B100FFFBE400FFF2DC00FFF0
      D900FFF4DB00BAB0A300FFFFFF0034AF3600D9EEDF0079655C00FFF0CE00FFE1
      C100FFE0BF00FFDEBD00FFE9C5007D6E5F000000000000000000000000000000
      00004D734B008D8880009E969600837E78007C7672007C7671008B827F005072
      4900000000000000000000000000000000000000000000000000000000000000
      0000F800FF00B22A6500C9EAC200C8E7FD00C0956D00DFFFEC00BF0080000000
      0000A015B100F400E600000000000000000000000000000000007F2085000000
      0000809C6800EAD9A000E4DB9600DACB9000D7C58A00D9CE8400E3CE86006C85
      4C000000000081248C000000000000000000BDBAB300FFFCE800FFF4DF00FFF2
      DC00FFF6DE00BBB2A600FCEDFF0026C12A004EC15C0081816100FFF2D900FFE3
      C300FFE1C100FFE0BF00FFEAC7007D6F60000000000000000000000000000000
      000063816200948E8B006D6A66007D777500807A7700635F5A006B6561004C67
      450000000000000000000000000000000000000000000000000000000000C700
      9600AFA17100D2FFFF00BEA38C00D57E0400E49A2000C6AB8F00E6ECAD008200
      8E004AA2FF003665B700FF00F50000000000000000008C817F00FFFFB900718D
      5C00F2E3AD00DFD29F00E2D29B00E2E19200CFCF8400AA9E7500ACA17400EBD4
      89006C854C00EBE8730075685F0000000000BDBBB300FFFEEB00FFF5E300FFF4
      DF00FFF8E100C4B2B300399F3D008FE3980028C031004AC25E00C8C29900FFEC
      D300FFE3C300FFE1C100FFECC9007D6F61000000000000000000000000000000
      0000405E3E008B878800817C7D00958D90007D787B00635D5D006C6668003552
      33000000000000000000000000000000000000000000EB00E600A4464E00CEFF
      F300C5D5E600C6730E00DE8D0900DC992D00DE9F3C00F7AB26007D76AD005999
      FF005190FF004148AB00FF00F3000000000000000000D701DD00C0D69500F1E5
      B600E3D7A900E9DBA800BDDA8500AD21BC00B023BF00C0DA7B00C7B78200A59B
      7100E3CE8600B1C26800DB06E60000000000BDBCB500FFFFEF00FFF7E600FFF5
      E300FFF4DF00FFFFF50000AD0000D0DEAA00D2DEAB0042C13C003CBB5500C9C3
      9C00FFECD300FFE3C300FFEDCB007D7061000000000000000000000000000000
      00005A7959009A9897007E7D7C007D7D7D0081807F007E7D7D008C8B8B006785
      660000000000000000000000000000000000C00B9900B1C19200D1FFFF00BF8A
      5100D4740000D98E1100D9932300DB9A3100F7B03000876776005C93FF00508A
      FF00363B9A00FF00FA000000000000000000000000000000000088498700EEEA
      B700E8DDB100B4D18100DC00E7000000000000000000DC00EA00C1DB7B009F94
      7100D3C9810081407D000000000000000000BDBDB600FFFFF100FFF9E900FFF7
      E600FFF5E300FFF7E600B8DD9E00FFF5E700FFF0DD00FFF5EF006CC5530000A5
      1800D0C6A600FFE8CD00FFF0CE007D7062000000000000000000000000000000
      0000506C4C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005D7A
      5A0000000000000000000000000000000000A1887000C8C7C000CA690000DC83
      0000E5920D00E8981700E39B2700ECA42A0083687C005997FF00508CFF003833
      B100E9FFDA00BA1B71000000000000000000A223A40085B06E00FBF8C700E8DD
      B800EDF0B20092049E0000000000000000000000000000000000AF22BF00E8E5
      9000AB9F7500EADD8B00789E49009F20A400BDBEB800FFFFF400FFFBEB00FFF9
      E900FFF7E600FFFCE800FFFFF200FFFFE700FFFDE300FFFCE200FFF2E600D0E0
      A800008A0000FFEEE000FFF0D1007D7164000000000000000000000000000000
      0000536F5100FFFFFE00F6F6F600E0DEDF00E1E0E000E5E3E300FFFFFF005774
      540000000000000000000000000000000000C0089500D78C0000E68C0000AA6A
      04006543150062431B0091641A00E3A137006065B3003D7BFF003B41C700FAC6
      6500D2A67700D9FFDA00CE00A60000000000A929AB0093BE7E00FCF9CB00EBE4
      C100F5FAC70091039A0000000000000000000000000000000000AE21BD00E1E0
      9100D9C99000E8DD8E008BB05D00A527AA00BDBDB800FFFFF800FFFDEE00FFFB
      EB00FFFFEE00BFBBB4005A5F63007A72800074747C006F695F00FFFCE200FFEE
      D900FFF2E500FFE8CD00FFF3D5007D7265000000000000000000000000000000
      0000506E4D00FFFFFF00E0DFE000FFFFFF00E2E1E100E1E0E100FFFFFF004D6A
      4A000000000000000000000000000000000000000000C73B51005F460200836A
      6C00E3B7A800E6B8AB00AB888000473B3C00F5DECA0056458200EEBB6100EFC2
      7900F3C98200C8B6A200C8D49B00ED00E90000000000000000008D4D8C00F6F5
      CB00F9F5E100B7D68900CC00D5000000000000000000CC00D800BFDB8700E1D2
      9B00E4DC96007F3F7D000000000000000000BDBDBA00FFFFFA00FFFEF100FFFD
      EE00FFFFF100BAB6AE00FFFEFF0038B03B00D7EDDC00796B6700FFFEE500FFEE
      D600FFECD200FFEACF00FFF5D8007D7267000000000000000000000000000000
      00005A785800FFFFFF00F8F8F900E6E4E500E5E3E200EDECEC00FFFFFF004866
      460000000000000000000000000000000000000000009E00AB00A08E6B00EDBF
      AC00D29F8F00D1A19100DBA99A00DBA99A0039281B00FFCD5E00EABB6F00EAC1
      7E00EEC98C00F2C68300CDD8D100C287760000000000D500D900C4DDA600F7EE
      CD00F7F2DF00FCF6E000B7D5880090039A0091049C00B5D38300E9DBA800DFD2
      9F00EAD9A000B0C47400D100DA0000000000BDBDBA00FFFFFD00FFFFF300FFFE
      F100FFFFF400BBB8B000FBECFF002CC22F0058C364007F896C00FFFFF000FFF0
      D900FFEED600FFECD200FFF7DB007D7367000000000000000000000000000000
      0000718E6E00FEFCFB00E7E4E500EAE7E800F2F0F000D9D5D500FFFFFF004966
      45000000000000000000000000000000000000000000452B3300E9B7AB00D1A0
      8B00D9AD9C00DCB4A400DAB1A200E5B4A70071575300D0A25600EDBF7400ECC3
      8200EDCA8E00F1D19B00F2DF9000BB10A100000000008A808200FFFFDF0086A3
      7800FBF1CE00F3EED800FFFDF500F3F8C100F1F5BB00E8DDB000E3D7A900F2E3
      AD00809C6800F7FB9E0080756F0000000000BDBDBB00FFFFFF00FFFFF600FFFF
      F300FFFFF700C4B8BD00399E3B0091E398002ABF30004DC05E00C9CEAB00FFFB
      EA00FFF0D900FFEED600FFF9DE007D7469000000000000000000000000000000
      000062806000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004967
      460000000000000000000000000000000000000000005C4C4300C980AC00D9AF
      9800E4C2B100E9CEBE00E6C8B900E3BCAE00A4807C0095753F00F2C57B00EDC5
      8600F0CE9200F9EEA300D1B37700E904DA0000000000000000008B2C8F000000
      000086A37900F8EFCE00F1EEBF00EFE7CC00E7DDB600EEEAB700F1E5B600718D
      5C0000000000913399000000000000000000C2C2C200FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFF0000B20000DAF4C700DBF3C7004BCD48003FBD5200CACE
      AE00FFFFEF00FFF9E100FFFFE90082796D000000000000000000000000000000
      000060816100FFF7EB00F4CFC600EFC9BE00EFC5BC00E8BAAE00F3B9A9004F72
      5200000000000000000000000000000000000000000051403900CA7DAA00C78D
      AB00EDD5BC00F4E4D400EED7C900ECC7BB00866B6700B9935300F0C37E00F2D6
      8D00E5DA7D00C3359000F700FF00000000000000000000000000000000008F31
      9300FFFFDE00C5DFA70091519000FBF8CA00FBF8C70089498800C0D69500FFFF
      B9007F20860000000000000000000000000094918A00A39E8E00A19B8D00A19B
      8D00A19B8D00A89D930069966200B0A09B00A99F9600C2A5AC002486240007AC
      1500969A8300A69E9500B0AC9F0054524D000000000000000000000000000000
      000073957400D6D2C900CEC9C200C7C0B800B8B1A800A9A19900AAA59D003D5B
      3C000000000000000000000000000000000000000000811D7A00B47A9100C782
      B000D8AFBA00F2DFCA00EAD3C500FAD1C40042322B00FECE7600F2E27B00C57D
      6D00DF00DF000000000000000000000000000000000000000000000000000000
      00008D848500D600DA000000000097C2820084AF6D0000000000D701DD008C81
      7F0000000000000000000000000000000000B8B7B900F4F4F600EEEEF000EEEE
      F000EEEEF000EEEEF000F5EFF600EEEEF000EEEEF000EEEEF000FFF2FF00C2E1
      C10000930000FFF8FF00BDBDBF0079797A000000000000000000000000000000
      00008A508A0058645900484C4A003E4140003C403E00363A39002E3B30006F3C
      7000000000000000000000000000000000000000000000000000382F2600B57E
      9400D18ABB00E9BDBD00F0D1B5004C413F00CBAF5400D6B35500CA09B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AA2BAD00AC2DAE0000000000000000000000
      0000000000000000000000000000000000009F9FA000BEBEBF00BBBBBC00BBBB
      BC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00BBBBBC00C2BD
      C300D5C3D500BBBBBB00A3A3A400868687000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000820A
      7A0065345200643451006B036B00B67D3600D3428E00F400FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006D00000000
      00000000000000000000688DB300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000AA0000006D
      000000000000688DB300436A9100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000043719E0043719E004371
      9E0035587A0035587A0035587A0035587A0035587A0035587A0035587A003558
      7A0035587A0035587A0035587A0000000000000000004D7BA90015528D001552
      8D0015528D0015528D0015528D0015528D0015528D0015528D0015528D001552
      8D0015528D0015528D0015528D00000000000000000000000000000000000000
      000000000000000000000000000000AA0000006D0000006D000074DA7F0074DA
      7F00006D00004F769C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006D91B30092BCD40092BC
      D4006AA1BF006AA1BF006AA1BF006AA1BF006AA1BF006AA1BF006AA1BF006AA1
      BF006AA1BF006AA1BF0035587A0000000000000000004D7BA9009FCAE00093C2
      DE0087B9D70079AFCF0078AFCF006DA4C70073ACCD0075ADCE0075ADCE0075AD
      CE0079B1D000528EB50015528D00000000000000000000000000000000000000
      000000000000000000000000000000AA000074DA7F0074DA7F0074DA7F0074DA
      7F0074DA7F00006D000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      000000000000000000000000000000000000000000007698B800CFE9F500CCE8
      F400CAE7F400C8E6F300C5E5F3009DC3D900C2E4F200C2E4F200C2E4F200C2E4
      F200C2E4F2006AA1BF0035587A0000000000000000004D7BA900D3F4F800D3F6
      FF00D1F6FF00D0F6FF00CDF4FF00A8D5EB00BEE8FA00C7F2FF00C5F2FF00C5F2
      FF00D0FAFF007BB3D30015528D00000000000000000000000000000000000000
      000000000000000000000000000000AA000074DA7F0074DA7F0074DA7F0074DA
      7F0074DA7F0074DA7F00006D0000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      00000000000000000000000000000000000000000000809FBD0089B8CD0089B8
      CD0089B8CD0089B8CD00C8E6F3009DC3D90089B8CD0089B8CD0089B8CD0089B8
      CD00C2E4F2006AA1BF0035587A0000000000000000004D7BA900C8EAF200B7DF
      EE00B5DEEE00B4DEEF00BBE4F600A2D0E700B3DFF100ACDAED00ABD9EC00ABD9
      EC00B6E4F30075ADCE0015528D00000000000000000000000000000000000000
      000000000000000000000000000000AA000074DA7F0074DA7F0074DA7F0074DA
      7F0074DA7F0000AA000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000089A6C10089B8CD0089B8
      CD0089B8CD0089B8CD0089B8CD009DC3D90089B8CD0089B8CD0089B8CD0089B8
      CD00C2E4F2006AA1BF0035587A0000000000000000004D7BA900D7F3F800D4F4
      FF00D1F2FF00CDF1FF00CAEFFF00A3D1E700BBE5F700C1ECFE00BEEBFD00BCEA
      FC00C5F2FF0075ADCE0015528D000000000000000000688DB300000000000000
      000000000000006D00000000000000AA000000AA000000AA000074DA7F0074DA
      7F0000AA0000547AA00000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000092ACC700D8EDF700D5EC
      F600D3EBF600D0EAF500CEE9F4009DC3D900C9E7F300C7E6F300C4E5F300C3E5
      F200C2E4F2006AA1BF0035587A0000000000000000004D7BA900DDEEF400BADF
      ED00B8DEEC00B6DDEC00BAE1F100A4D1E700B6DFF100AEDAEC00ACD8EB00AAD8
      EB00B5E2F10075ADCE0015528D000000000000000000436A9100688DB3000000
      0000006D000000AA00000000000000000000000000000000000000AA000000AA
      000000000000688DB300436A9100000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      000000000000000000000000000000000000000000009AB2CB0089B8CD0089B8
      CD0089B8CD0089B8CD0089B8CD009DC3D90089B8CD0089B8CD0089B8CD0089B8
      CD0089B8CD006AA1BF0035587A0000000000000000004D7BA900E6F3F700D6F3
      FC00D5F3FC00D2F2FC00D1F2FF00A4D1E700B9E1F200B3DDEE00B1DCEE00B8E3
      F500C3EEFB0076AECF0015528D000000000000000000000000004F769C00006D
      000074DA7F0074DA7F00006D0000006D0000006D00000000000000AA00000000
      00000000000000000000688DB300000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      99000000000000000000000000000000000000000000A2B8CF0089B8CD00DCEF
      F800D9EEF700D7EDF600D4ECF6009DC3D90089B8CD0089B8CD0089B8CD0089B8
      CD00C5E6F3006AA1BF0035587A0000000000000000004D7BA900E0EEF300C1E3
      EE00C1E4EF00BFE3EF00C4E7F300AAD5EA00C2E8F700CDF1FF00C9EFFF00C5ED
      FE00CDF4FF0078AFCF0015528D00000000000000000000000000006D000074DA
      7F0074DA7F0074DA7F0074DA7F0074DA7F00006D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      00000000000000000000000000000000000000000000A8BDD30089B8CD0089B8
      CD0089B8CD0089B8CD00D7EDF700A3C8DB00D2EBF500CFEAF500CDE9F400CAE8
      F400C8E7F3006AA1BF0035587A0000000000000000004D7BA900E7F2F600D6F1
      F800DBF5FB00D7F3FB00D7F4FC00AFD8EC00BDE2F200B7DFED00B3DCED00B2DC
      ED00C0E9F4007AB0D00015528D000000000000000000006D000074DA7F0074DA
      7F0074DA7F0074DA7F0074DA7F0074DA7F00006D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      00000000000000000000000000000000000000000000AEC1D50089B8CD00E1F1
      F900DFF1F800DDF0F800DAEEF700A3C8DB0089B8CD0089B8CD0089B8CD0089B8
      CD0089B8CD006AA1BF0035587A0000000000000000004D7BA900F1F8FA00E7FC
      FF00E5FBFF00E2FAFF00E0F9FF00AFD8EC00C8EAF700D5F5FF00D1F2FF00CDF1
      FF00D4F7FF007EB2D10015528D0000000000000000000000000000AA000074DA
      7F0074DA7F0074DA7F0074DA7F0074DA7F00006D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      00000000000000000000000000000000000000000000B3C5D80089B8CD0089B8
      CD0089B8CD0089B8CD00DDF0F800A5C9DC00D8EEF700D6ECF600D3EBF600D0EA
      F500CEE9F40092BCD40035587A0000000000000000004D7BA900F3F8FA00D4EE
      F300CCE8F000D5EFF600E2FAFE00B0D8EC00C2E5F300C2E5F100C7E9F600BDE3
      F100C0E6F10092C0DB0015528D00000000000000000000000000547AA00000AA
      000074DA7F0074DA7F0000AA000000AA000000AA000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      00000000000000000000000000000000000000000000B3C5D80089B8CD0089B8
      CD0089B8CD00E2F2F900E0F1F800A5C9DC0089B8CD0089B8CD0089B8CD0089B8
      CD0089B8CD0092BCD40035587A0000000000000000004D7BA900F5F9FB00ECFF
      FF00EBFEFF00E9FDFF00E6FCFF00B0D8EC00CCEBF700DEF8FF00DAF6FF00D6F5
      FF00DAF9FF009AC7DF0015528D000000000000000000436A9100688DB3000000
      000000AA000000AA000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3C5D800E7F4FA00E7F4
      FA00E6F4FA00E4F3F900E3F2F900B5D3E300D8EDF700DCEFF800D9EEF700D7ED
      F600D4ECF600D2EBF50043719E0000000000000000004D7BA900EEF2F700F4F8
      FB00F3F8FB00F2F8FA00F1F7FA00D0EAF600E1F5F900DDF5F800D9F4F800CFEB
      F200CDEAF100AED2E60015528D000000000000000000688DB300000000000000
      00000000000000AA000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3C5D800B3C5D800B3C5
      D800B3C5D800AFC2D600AABED300A4BAD0009DB5CD0096AFC9008EA9C40085A3
      BF007C9CBB007396B60043719E0000000000000000004D7BA9004D7BA9004D7B
      A9004D7BA9004D7BA9004D7BA9004D7BA9004D7BA9004D7BA9004D7BA9004D7B
      A9004D7BA9004D7BA9004D7BA900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900000000000000000000000000414D5700414D
      5700414D5700414D5700414D5700414D5700414D5700414D5700414D5700414D
      5700414D5700414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900D3D3D400D0D0
      D100CDCDCE00CBCBCC00C8C8C900C4C4C5009E9EA0009E9EA000BDBDBE00BBBB
      BC00B9B9BB00B8B8B90019191900000000000000000000000000414D5700525C
      660070777E00AFACA900918E8A00B5B3B300BBB9B900BCBABA00BFBCBD00BEBC
      BC00BEBCBC00414D57000000000000000000000000008B8B8B00191919001919
      1900191919001919190019191900191919001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900D8D8D800D5D5
      D500D2D2D200CFCFD000CCCCCD008A462E007F402A009E9EA000C0C0C100BEBE
      BF00BCBCBD00BABABB0019191900000000000000000000000000414D57007077
      7E00AFACA900D0CCCB0096939000BBB9B900C9C7C800CAC7C800C9C5C800C8C5
      C700C1BFBF00414D57000000000000000000000000008B8B8B00E8E8E800ECEC
      EC00EFEFEF00F2F2F200F5F5F500F8F8F8001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900DCDCDD00D9D9
      DA00D6D6D700D3D3D400D0D0D100A7593B008A462E00C7C7C800C4C4C500C1C1
      C200BFBFC000BDBDBE0019191900000000000000000000000000414D5700BCB8
      B700D0CCCB00EBE6E7009F9C9900C9C7C800CECBCD00CDCACC00CCC9CB00CBC9
      CA00C4C1C200414D57000000000000000000000000008B8B8B00E5E5E500E8E8
      E800EBEBEB00EEEEEE00F1F1F100F5F5F5001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000069696900E0E0E100E0E0
      E100DADADB00D7D7D800D4D4D500D1D1D2009C9C9D009E9EA000C8C8C900C5C5
      C700C2C2C300C0C0C10019191900000000000000000000000000414D5700C3C0
      C000C4C1C100BFBCBC00BCB9B800D3D0D100D2CFD000D1CECF00D0CDCE00CFCC
      CE00C8C4C500414D57000000000000000000000000008B8B8B00E1E1E100E4E4
      E400E7E7E700EAEAEA00EEEEEE00F1F1F1001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000069696900E4E4E500E1E1
      E200DEDEDF00DBDBDC00D8D8D900A7593B007F402A00A0A0A100CCCCCD00CACA
      CB00C7C7C800C3C3C40019191900000000000000000000000000414D5700D2D0
      D000DBD8D900D9D7D800D8D6D700D7D5D600D6D4D500D5D2D400D4D1D300D3D0
      D100CDCACB00414D57000000000000000000000000008B8B8B00DEDEDE00E1E1
      E100E4E4E400E7E7E700EAEAEA00EDEDED001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000069696900E8E8E900E5E6
      E600E3E3E300E0E0E000DCDCDD00B67F6B007F402A00A4A4A500ADADAE00CDCD
      CE00CBCBCC00C8C8C90019191900000000000000000000000000414D5700D5D3
      D400DFDDDE00DEDBDC00DDDADB00DCD9DA00DBD8D900D9D7D800D8D6D700D7D5
      D600D4D1D200414D57000000000000000000000000008B8B8B00DCDCDC00DEDE
      DE00E0E0E000E3E3E300E6E6E600E9E9E9001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000069696900ECECED00EAEA
      EA00E7E7E700E4E4E400E1E1E100DEDEDE00A7593B007F402A00B8B8B900B8B8
      B900CFCFD000CCCCCD0019191900000000000000000000000000414D5700E1DE
      DF00E4E1E200E3E0E100E1DFE000E0DEDF00DFDDDE00DEDBDC00DDDADB00DCD9
      DA00DBD8D900414D57000000000000000000000000008B8B8B00DADADA00DCDC
      DC00DEDEDE00E0E0E000E3E3E300E6E6E6001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000069696900F0F0F000EDED
      EE00EBEBEB00E8E8E800C7C7C900C7C7C900DFDFE000A35537009A6E5F00C7C7
      C900D3D3D400D0D0D10019191900000000000000000000000000414D5700E4E2
      E300E8E6E600E7E4E500E6E3E400E5E2E300E4E1E200E3E0E100E1DFE000E0DE
      DF00DFDDDE00414D57000000000000000000000000008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900F4F4F400F1F1
      F100EFEFEF00BB8570007F402A00C7C7C900E3E3E400A35537007F402A00C7C7
      C900D7D7D800D4D4D50019191900000000000000000000000000414D5700E8E6
      E600ECEAEA00EBE9E900EAE8E800E9E7E700E8E6E600E7E4E500E6E3E400E5E2
      E300E2DFE000414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900F7F7F700F5F5
      F500F2F2F200A7593B007F402A00C7C7C900C7C7C900A35537006F372500C7C7
      C900DBDBDC00D8D8D90019191900000000000000000000000000414D5700EBE9
      E900F0EDEE00EFECED00EEEBEC00EDEBEB00ECEAEA00EBE9E900EAE8E800E9E7
      E700E6E3E400414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900FAFAFA00F8F8
      F800F5F5F600BD8773007F402A007F402A007F402A00A35537009D726300E3E3
      E300C7C7C900C7C7C90019191900000000000000000000000000414D5700EEEB
      EC00F3F0F100F2EFF000F1EFEF00F0EEEF00F0EDEE00EFECED00EEEBEC00EDEB
      EB00E9E7E800414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900FCFCFC00FAFA
      FB00F8F8F900F6F6F700BE877300A7593B00A7593B00BB857100EAEAEA006969
      6900191919001919190019191900000000000000000000000000414D5700EFED
      ED00EFEDED00807E78007C7A740074716A0074716A0075726B00807E7800F0EE
      EF00F0EDEE00414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900FEFEFE00FDFD
      FD00FBFBFB00F9F9F900F7F7F700F5F5F500F3F3F300F0F0F000EDEDEE006969
      6900E8E8E800C7C7C90069696900000000000000000000000000414D5700414D
      5700414D57008C8A8600A8A7A600BDBDBD00BDBDBD00AEAEAD008C8A8600414D
      5700414D5700414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900FFFFFF00FFFF
      FF00FDFDFD00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1F1006969
      6900C7C7C9006969690000000000000000000000000000000000414D5700414D
      5700414D5700414D5700A3A29F00B5B5B400B5B5B400A8A7A600414D5700414D
      5700414D5700414D570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000069696900696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      6900696969000000000000000000000000000000000000000000000000000000
      0000000000000000000069665E00726F6800726F6800726F6800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B00191919001919
      1900191919001919190019191900191919001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B00E8E8E800ECEC
      EC00EFEFEF00F2F2F200F5F5F500F8F8F8001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B00E5E5E500E0E0
      DF00006C0000EEEEEE00F1F1F100F5F5F5001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B00E1E1E10000A9
      000073DA7E00006C0000EEEEEE00F1F1F1001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B00DEDEDE0000A9
      000073DA7E0073DA7E00006C0000EDEDED001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B00DCDCDC0000A9
      000073DA7E0073DA7E0073DA7E00006C00001919190000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C0000A9000073DA
      7E0073DA7E0073DA7E0073DA7E0073DA7E00006C000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      000000000000000000000000000000000000000000008B8B8B0000A9000073DA
      7E0000A9000000A9000000A9000073DA7E0073DA7E00006C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000A9000073DA7E0000A9
      0000000000000000000000A9000000A9000073DA7E0073DA7E00006C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000A9000000A900000000
      00000000000000000000000000000000000000A9000073DA7E0073DA7E00006C
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000A90000000000000000
      0000000000000000000000000000000000000000000000A9000000A9000073DA
      7E00006C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      000073DA7E00006C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A9000073DA7E00006C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000A9000000A90000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FC008000800000000000000040000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFE180FF80FFFFFFFFE180FF80
      FFFFFFFFE180FF80003000810000000000200080000000000020010000000000
      020001080000000000000008E000F80000000008E000F80002000808E000F800
      00100008F803F80300100008F803F80300100108F803F803FFFFFFFFF80FF80F
      FFFFFFFFF80FF80FFFFFFFFFF80FF80FFE7F8000FFFFFF3FF24F0000F00FFC3F
      E0070000F00FF013D00B0000F00FE00180010000F00F800180010000F00F0003
      C1830000F00F000303C00000F00F000103C00000F00F8000C1830000F00F8000
      80010000F00F800080010000F00F8000D00B0000F00F8001E0070000F00F8007
      F24F0000F00FC01FFE7F0000FFFFE03FFFDDFFFFFFFFFFFFFFC9FFFF80018001
      FE03FFFF80018001FE03F9FF80018001FE01F8FF80018001FE03F87F80018001
      BA03F83F8001800193C9F81F80018001C05DF80F80018001C07FF81F80018001
      807FF83F80018001C07FF87F80018001C07FF8FF8001800193FFF9FF80018001
      BBFFFFFF80018001FFFFFFFFFFFFFFFFFEFF8001C003FFFFFEFF8001C003807F
      FC7F8001C003807FFC7F8001C003807FF83F8001C003807FF83F8001C003807F
      F01F8001C003807FF01F8001C003807FE00F8001C003807FE00F8001C003FFFF
      FC7F8001C003FFFFFC7F8001C003FFFFFC7F8001C003FFFFFC7F8001C003FFFF
      FC7F8003C003FFFFFC7F8007FC3FFFFFFFFFFFFFFFFFFC7F807FFFFFFFFFFC7F
      807FFFFFFFFFFC7F807FFF3FFFFFFC7F807FFC3FFCFFFC7F807FF03FFC3FFC7F
      807FC000FC0FE00F807F00000003E00F803FC0000000F01F8C1FF03F0003F01F
      9F0FFC3FFC0FF83FBF87FF3FFC3FF83FFFE3FFFFFCFFFC7FFFF1FFFFFFFFFC7F
      FFF9FFFFFFFFFEFFFFFFFFFFFFFFFEFF}
  end
  object pmBook: TPopupMenu
    Tag = 1000
    Images = ImgList0
    OwnerDraw = True
    OnPopup = pmBookPopup
    Left = 278
    Top = 195
    object pmBookRead: TMenuItem
      Tag = 1
      Caption = #1063#1080#1090#1072#1090#1100
      ImageIndex = 11
      OnClick = miBookInfoClick
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBook2Dir1: TMenuItem
      Tag = 1
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
      ImageIndex = 14
      OnClick = miBookDir1Click
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBook2Dir2: TMenuItem
      Tag = 2
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103
      OnClick = miBookDir1Click
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmB1: TMenuItem
      Caption = '_'
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBookInfo: TMenuItem
      Tag = 2
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 5
      OnClick = miBookInfoClick
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmB2: TMenuItem
      Caption = '_'
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBookSel: TMenuItem
      Tag = 1
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 13
      OnClick = miBookSelClick
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBookSelPic: TMenuItem
      Tag = 2
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
      OnClick = miBookSelClick
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBookUnsel: TMenuItem
      Tag = 3
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1086#1090#1084#1077#1090#1082#1080
      ImageIndex = 21
      OnClick = miBookSelClick
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmB3: TMenuItem
      Caption = '_'
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBookCopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 6
      OnClick = ActCopyNFldExecute
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmB5: TMenuItem
      Caption = '_'
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
    object pmBookEdit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
      SubMenuImages = ImgList0
      ImageIndex = 22
      ShortCut = 16453
      OnClick = ActEditFldValExecute
      OnAdvancedDrawItem = miLibAdvancedDrawItem
    end
  end
  object DirDial: TRzSelDirDialog
    DriveTypes = [dtFloppy, dtFixed, dtNetwork, dtRAM]
    Prompt = 'Folder Name'
    PromptFolders = 'Folders'
    PromptDrives = 'Drives'
    Caption = 'Select a Folder'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 276
    Top = 309
  end
end
