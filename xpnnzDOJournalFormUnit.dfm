inherited xpnnzDOJournalForm: TxpnnzDOJournalForm
  Left = 487
  Top = 160
  ActiveControl = RefreshButton
  Caption = #1050#1083#1072#1089#1089#1085#1099#1081' '#1078#1091#1088#1085#1072#1083
  ClientHeight = 449
  ClientWidth = 1008
  Constraints.MinHeight = 400
  Constraints.MinWidth = 850
  OldCreateOrder = True
  ShowHint = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  ExplicitWidth = 1024
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1008
    Height = 395
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Grid: TxpTreeList
      Left = 0
      Top = 105
      Width = 602
      Height = 290
      Align = alClient
      Bands = <
        item
          Caption.GlyphAlignHorz = taCenter
          Caption.GlyphAlignVert = vaCenter
          FixedKind = tlbfLeft
          Styles.Header = BandStyle
        end
        item
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1048#1090#1086#1075#1080
          FixedKind = tlbfRight
        end>
      DefaultRowHeight = 20
      LookAndFeel.NativeStyle = False
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.ExpandOnDblClick = False
      OptionsBehavior.Sorting = False
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.BandHorzSizing = False
      OptionsCustomizing.BandMoving = False
      OptionsCustomizing.BandVertSizing = False
      OptionsCustomizing.ColumnCustomizing = False
      OptionsCustomizing.ColumnHorzSizing = False
      OptionsCustomizing.ColumnMoving = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsView.BandLineHeight = 38
      OptionsView.Bands = True
      OptionsView.FixedSeparatorWidth = 1
      OptionsView.GridLines = tlglBoth
      OptionsView.Indicator = True
      OptionsView.ShowRoot = False
      TabOrder = 1
      OnClick = GridClick
      OnCustomDrawDataCell = GridCustomDrawDataCell
      OnCustomDrawHeaderCell = GridCustomDrawHeaderCell
      OnDblClick = GridDblClick
      OnDeletion = GridDeletion
      OnEdited = GridEdited
      OnEditing = GridEditing
      OnEditValueChanged = GridEditValueChanged
      OnFocusedColumnChanged = GridFocusedColumnChanged
      OnInitEdit = GridInitEdit
      OnKeyDown = GridKeyDown
      OnMouseMove = GridMouseMove
      OnMouseUp = GridMouseUp
      object NumColumn: TcxTreeListColumn
        Caption.Text = #8470' '#1087'/'#1087
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 40
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object ClassNameColumn: TcxTreeListColumn
        Visible = False
        Caption.Text = #1050#1083#1072#1089#1089
        DataBinding.ValueType = 'String'
        Width = 40
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object StudentColumn: TcxTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.MultiLine = True
        Caption.Text = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Options.Moving = False
        Width = 250
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object AVGColumn: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.Text = #1057#1088'. '#1073#1072#1083#1083
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 50
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Trimestr1Column: TcxTreeListColumn
        Tag = -7
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = 'I'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Exam1Column: TcxTreeListColumn
        Tag = -9
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1069#1082#1079'. I'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Itog1Column: TcxTreeListColumn
        Tag = -8
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1048#1090#1086#1075' I'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Trimestr2Column: TcxTreeListColumn
        Tag = -7
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = 'II'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Exam2Column: TcxTreeListColumn
        Tag = -9
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1069#1082#1079'. II'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Itog2Column: TcxTreeListColumn
        Tag = -8
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1048#1090#1086#1075' II'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Trimestr3Column: TcxTreeListColumn
        Tag = -7
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = 'III'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Exam3Column: TcxTreeListColumn
        Tag = -9
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1069#1082#1079'. III'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Itog3Column: TcxTreeListColumn
        Tag = -8
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1048#1090#1086#1075' III'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Trimestr4Column: TcxTreeListColumn
        Tag = -7
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = 'IV'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 10
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Exam4Column: TcxTreeListColumn
        Tag = -9
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1069#1082#1079'. IV'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 11
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object Itog4Column: TcxTreeListColumn
        Tag = -8
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1048#1090#1086#1075' IV'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 12
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object YearColumn: TcxTreeListColumn
        Tag = -1
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1043#1086#1076
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 13
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object YearExamColumn: TcxTreeListColumn
        Tag = -2
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1069#1082#1079'.'
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 14
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object YearTotalColumn: TcxTreeListColumn
        Tag = -3
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = #1048#1090#1086#1075
        DataBinding.ValueType = 'String'
        Width = 45
        Position.ColIndex = 15
        Position.RowIndex = 0
        Position.BandIndex = 1
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        1008
        105)
      object TeacherLabel: TLabel
        Left = 304
        Top = 56
        Width = 3
        Height = 13
      end
      object lblPrepod: TLabel
        Left = 500
        Top = 5
        Width = 406
        Height = 94
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100':'
        ParentShowHint = False
        ShowHint = False
      end
      object RefreshButton: TAdvGlowButton
        Left = 912
        Top = 2
        Width = 90
        Height = 28
        Anchors = [akRight, akBottom]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 3
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          424D360500000000000036040000280000001000000010000000010008000000
          000000010000220B0000220B0000000100000001000000840000088C0800108C
          080018941000219410001894180029941800219C2100299C210029A52900E78C
          31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C5200A563
          5A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A5736B00BD84
          6B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD73009CBD
          7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD7B00DEBD
          7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6840084CE
          8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE9400D6CE
          9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6A500BDD6
          A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6B500F7DE
          B500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEFDE00DEF7
          DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7F700F7FF
          F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C1818181818181818
          18181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E22080D04040B
          202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D030003230E
          000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F382F212245
          402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D244154260000
          01454043185C5C5C1C5D32002541050002494640185C5C5C1C5D570900000000
          024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D5D52525B
          360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C2957575757575757
          4C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
        TabOrder = 0
        OnClick = RefreshButtonClick
        Appearance.BorderColor = clGray
        Appearance.Color = clSilver
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = clSilver
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object Panel4: TPanel
        Left = 6
        Top = 8
        Width = 491
        Height = 97
        BevelOuter = bvNone
        TabOrder = 1
        object Label19: TLabel
          Left = 19
          Top = 52
          Width = 44
          Height = 13
          Caption = #1055#1088#1077#1076#1084#1077#1090
        end
        object ClassNameEdit: TcxComboBox
          Left = 82
          Top = 72
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = ClassNameEditPropertiesChange
          TabOrder = 6
          Width = 224
        end
        object PredmetEdit: TcxComboBox
          Left = 82
          Top = 48
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = PredmetEditPropertiesChange
          TabOrder = 5
          Width = 224
        end
        object TrimestrEdit: TcxComboBox
          Left = 82
          Top = 25
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = TrimestrEditPropertiesChange
          TabOrder = 3
          Width = 287
        end
        object BegDateEdit: TcxDateEdit
          Left = 87
          Top = -2
          Properties.OnChange = BegDateEditPropertiesChange
          TabOrder = 1
          Width = 119
        end
        object YearEdit: TcxComboBox
          Left = 380
          Top = 25
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = YearEditPropertiesChange
          TabOrder = 4
          Width = 95
        end
        object JournalRadioButton2: TRadioButton
          Left = 4
          Top = 25
          Width = 77
          Height = 18
          Caption = #1059#1095'. '#1087#1077#1088#1080#1086#1076
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = True
        end
        object JournalOnDate: TRadioButton
          Left = 4
          Top = 4
          Width = 61
          Height = 18
          Caption = #1053#1072' '#1076#1072#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cxLabel2: TcxLabel
          Left = 18
          Top = 74
          Caption = #1043#1088#1091#1087#1087#1072
        end
      end
      object chkVisibleItog: TcxCheckComboBox
        Left = 902
        Top = 78
        Anchors = [akRight, akBottom]
        Properties.ShowEmptyText = False
        Properties.Items = <>
        Properties.OnClickCheck = chkVisibleItogPropertiesClickCheck
        TabOrder = 2
        Width = 100
      end
      object cxLabel1: TcxLabel
        Left = 902
        Top = 58
        Anchors = [akRight, akBottom]
        Caption = #1042#1080#1076#1080#1084#1099#1077' '#1080#1090#1086#1075#1080
      end
    end
    object pnlShModFact: TPanel
      Left = 606
      Top = 105
      Width = 402
      Height = 290
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object cxGridRightPart: TxpTreeList
        Left = 0
        Top = 0
        Width = 402
        Height = 290
        Align = alClient
        Bands = <
          item
          end>
        OptionsBehavior.ConfirmDelete = False
        OptionsBehavior.Sorting = False
        OptionsCustomizing.BandVertSizing = False
        OptionsData.Deleting = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.InvertSelect = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 0
        OnCustomDrawDataCell = cxGridRightPartCustomDrawDataCell
        OnDblClick = cxGridRightPartDblClick
        OnDeletion = cxGridRightPartDeletion
        OnEditing = cxGridRightPartEditing
        OnEditValueChanged = cxGridRightPartEditValueChanged
        OnMouseMove = cxGridRightPartMouseMove
        object PassedColumn: TcxTreeListColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.OnChange = PassedColumnPropertiesChange
          Caption.AlignHorz = taCenter
          Caption.Text = #1055#1088#1086#1074#1077#1076#1105#1085
          DataBinding.ValueType = 'Boolean'
          Width = 61
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object GrpFactColumn: TcxTreeListColumn
          Visible = False
          Caption.GlyphAlignHorz = taCenter
          Caption.Text = #1043#1088#1091#1087#1087#1072
          DataBinding.ValueType = 'String'
          Width = 47
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object EvTypeColumn: TcxTreeListColumn
          PropertiesClassName = 'TcxImageProperties'
          Properties.ReadOnly = True
          Caption.AlignHorz = taCenter
          Caption.Text = #1058#1080#1087
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 29
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object EvDateColumn: TcxTreeListColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Caption.AlignHorz = taCenter
          Caption.Text = #1044#1072#1090#1072
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Options.Sorting = False
          Width = 70
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object ShModFactColumn: TcxTreeListColumn
          PropertiesClassName = 'TcxLabelProperties'
          Caption.AlignHorz = taCenter
          Caption.Text = #1055#1088#1086#1081#1076#1077#1085#1086
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 100
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object HWColumn: TcxTreeListColumn
          PropertiesClassName = 'TcxLabelProperties'
          Caption.AlignHorz = taCenter
          Caption.Text = #1044#1047
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 85
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object TeacherCommentColumn: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Caption.AlignHorz = taCenter
          Caption.Text = #1047#1072#1084#1077#1090#1082#1080
          DataBinding.ValueType = 'String'
          Options.VertSizing = False
          Width = 87
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 602
      Top = 105
      Width = 4
      Height = 290
      AlignSplitter = salRight
      MinSize = 200
      Control = pnlShModFact
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 414
    Width = 1008
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1008
      35)
    object CancelButton: TAdvGlowButton
      Left = 912
      Top = 4
      Width = 90
      Height = 28
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 3
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        424D420200000000000042000000280000001000000010000000010010000300
        000000020000120B0000120B00000000000000000000007C0000E00300001F00
        00001D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C
        1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C
        1D7C1D7C6B2D6B2D6B2D6B2D6B2D6B2D6B2D4A294A29734E20541D7C1D7C1D7C
        1D7C1D7C6B2DFF7FFF7FFF7FFF7FFF7FDE7BDE7BDE7B734E406C20401D7C1D7C
        1D7C1D7C6B2DFF7F841084108410841084108410DE7B734E406C287D20541D7C
        1D7C1D7C6B2DFF7FFF7FDE7BDE7BDE7BDE7BBD77BD77406C827C827C287D2040
        1D7C1D7C6B2DFF7F841084108410841031463146287D287D287D827C827C287D
        20541D7C4A29DE7BDE7BDE7BBD77BD77DE7B7276287D287D287D287D827C287D
        1D7C1D7C4A29DE7B84108410841084103146287D287D3967287D947E287D1D7C
        1D7C1D7C4A29DE7BBD77BD779C739C73BD77287D5A6B734E287D287D1D7C1D7C
        1D7C1D7C4A29BD7784108410841084103146287D9C73734E287D1D7C1D7C1D7C
        1D7C1D7C4A29BD77BD779C737B6F5A6B9C73287D7B6F734E1D7C1D7C1D7C1D7C
        1D7C1D7C4A29BD7784108410841084103146287D5A6B6B2D1D7C1D7C1D7C1D7C
        1D7C1D7C4A29BD779C737B6F5A6B3967F75ED65AB5566B2D1D7C1D7C1D7C1D7C
        1D7C1D7C6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D1D7C1D7C1D7C1D7C
        1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C
        1D7C}
      TabOrder = 5
      OnClick = CancelButtonClick
      Appearance.BorderColor = clGray
      Appearance.Color = clSilver
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = clSilver
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object PrintButton: TAdvGlowButton
      Left = 432
      Top = 4
      Width = 90
      Height = 28
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 3
      Images = ImageList
      DisabledImages = ImageList
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 3
      OnClick = PrintButtonClick
      Appearance.BorderColor = clGray
      Appearance.Color = clSilver
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = clSilver
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Enabled = False
    end
    object OkButton: TAdvGlowButton
      Left = 819
      Top = 4
      Width = 90
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 3
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        424D420200000000000042000000280000001000000010000000010010000300
        000000020000120B0000120B00000000000000000000007C0000E00300001F00
        00001D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C
        1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C
        1D7C1D7C1D7C0000000000000000000000000000000000000000000000001D7C
        1D7C1D7C0000CF6ACF6A00001042000000001042104210420000CF6A00001D7C
        1D7C1D7C0000CF6ACF6A00001042000000001042104210420000CF6A00001D7C
        1D7C1D7C0000CF6ACF6A00001042104210421042104210420000CF6A00001D7C
        1D7C1D7C0000AF6AAF6A00000000000000000000000000000000AF6A00001D7C
        1D7C1D7C0000AF66AF66AF6AAF66AF66AF66AF66AF66AF66AF66AF6600001D7C
        1D7C1D7C0000AE66AE6663416341634163416341634163418E628E6200001D7C
        1D7C1D7C00008E5E6341FF7FFF7FFF7FFF7FFF7FFF7FFF7F63418E5E00001D7C
        1D7C1D7C00006E5A6341FF7F00000000000000000000FF7F63416E5A00001D7C
        1D7C1D7C00004D566341FF7FFF7FFF7FFF7FFF7FFF7FFF7F63414D5600001D7C
        1D7C1D7C00004D526341FF7F00000000000000000000FF7F63414D5200001D7C
        1D7C1D7C00002D526341FF7FFF7FFF7FFF7FFF7FFF7FFF7F63412D5200001D7C
        1D7C1D7C00000000000000000000000000000000000000000000000000001D7C
        1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C1D7C
        1D7C}
      TabOrder = 4
      Visible = False
      Appearance.BorderColor = clGray
      Appearance.Color = clSilver
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = clSilver
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Enabled = False
    end
    object AdvGlowButton1: TAdvGlowButton
      Left = 118
      Top = 4
      Width = 151
      Height = 28
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1086#1094#1077#1085#1082#1080' '#1080' '#1082#1086#1084#1084#1077#1085#1072#1090#1088#1080#1080' '#1079#1072' '#1079#1072#1085#1103#1090#1080#1077
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1094#1077#1085#1082#1080' '#1085#1072' '#1076#1072#1090#1091
      ImageIndex = 3
      Images = ImageList
      DisabledImages = ImageList
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        47494638396110001000E67500CCC6C6D1C0C1CDC8C8D3B9B9CCC6C7CCC7C7D2
        B8B8FF777AF75D60D2B8B9D19F9FF85F62CCC8C8EA2F31D2B7B8EB3436D19E9F
        F85E61F6585AFF7779F04648FF7E81DB9293D1B7B7EC3D3FFB6C6FFF7C7EFD74
        77FB6D6FF65B5ED0B1B1D4A9AAF54E50FF6768FF5B5EFF6C6ED4A7A7D5ACADFA
        6265FF6E70FF797DED4143FA6163EE4345D3BBBCFF878AF9686AFF797BFA6366
        FF7174F65558F64A4CE62C2EFD7174CBCACAFF7E80F75557E92D2FD4BCBDEE42
        44FF7073FF7A7DEF4649FF7274FE7275F75B5DFF5457FE7A7DF6595BF86467FA
        6467FF7679F55658F13F41F44D50FF585BCFAEAFF86264ED3F41FB6D70FF6263
        CFAFB0EE3D3FFD797CF4484AF75F61FF8286DE9A9BEF4447FA6A6DFF5659FF79
        7CFE7E81EF474AFB696CD5AFAFCDC7C7FF7476D0B2B3F86164F24C4FE57B7DF2
        4547F6585BF0484BF65A5CFE7679F75C5EFC7376FF7072FF7B7EF65659E42426
        D3BABBFF7071E93437FA6C6ECBCBCB0000000000000000000000000000000000
        0000000000000000000000000021F90401000075002C00000000100010000007
        8380758283848586875786076A86632E658407155C35840B1C1A0B8440432D53
        5E8211743D556885191B566C4D08592F085D87454F376E5B136B3E87821D2822
        4B6158BB8241475A426D14C369463F3C2723385287443031122B184A21200F85
        6726726F3B82736650543984482A3229843449330D0A831F644E86700DC38610
        FDC30201003B}
      TabOrder = 1
      OnClick = AdvGlowButton1Click
      Appearance.BorderColor = clGray
      Appearance.Color = clSilver
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = clSilver
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object AdvGlowButton2: TAdvGlowButton
      Left = 3
      Top = 4
      Width = 113
      Height = 28
      Anchors = [akLeft, akBottom]
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 3
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        424D360300000000000036000000280000001000000010000000010018000000
        000000030000130B0000130B00000000000000000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF318431318431318431318431318431318431318431
        318431318431FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF318431FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF318431FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF318431FFFFFF318431318431FFFFFF429C52318431
        318431318431FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF318431FFFF
        FF429C52318431318431318431318431FFFFFF318431FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF318431FFFFFFFFFFFF429C52318431318431FFFFFF
        FFFFFF318431FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF318431FFFF
        FF429C52318431318431318431318431FFFFFF31843144B1E4107FAD107FAD10
        7FAD107FAD107FAD107FAD318431FFFFFF318431318431FFFFFF429C52318431
        31843131843144B1E4FEFEFDFBFBFAF5F5F4EEEEEDE8E8E7D2D2D2318431FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31843144B1E4FEFEFDFEFEFD00
        21ADF5F5F4EEEEEDEBEBEA318431318431318431318431318431318431318431
        075D0F31843144B1E4FEFEFD0021AD2152E70021ADF8F8F7F1F1F0107FADFF00
        FF098311FF00FFFF00FFFF00FF0983110F951CFF00FF44B1E41839DE6373E721
        52E72152E70021ADF8F8F7107FAD0983110F951CFF00FFFF00FF09831110A51B
        0F951CFF00FF44B1E4FEFEFD1839DE6373E70021ADFEFEFDFEFEFD0983110983
        110F951C09831109831110A51B0F951CFF00FFFF00FF44B1E4FEFEFDFEFEFD18
        39DEFEFEFDFEFEFD09831117C76210A51B10A51B10A51B0F951C0F951CFF00FF
        FF00FFFF00FF44B1E4FEFEFDFEFEFDFEFEFDFEFEFD107FAD107FAD09831117C7
        6210A51B0F951CFF00FFFF00FFFF00FFFF00FFFF00FF44B1E4FEFEFDFEFEFDFE
        FEFDFEFEFD107FAD209FDAFF00FF098311098311FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF44B1E444B1E444B1E444B1E444B1E4107FADFF00FFFF00FFFF00
        FF098311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 0
      OnClick = AdvGlowButton2Click
      Appearance.BorderColor = clGray
      Appearance.Color = clSilver
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = clSilver
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object PenEditButton: TAdvGlowButton
      Left = 271
      Top = 4
      Width = 159
      Height = 28
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Anchors = [akLeft, akBottom]
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1086#1094#1077#1085#1082#1077
      ImageIndex = 4
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        424D380300000000000036000000280000001000000010000000010018000000
        000000000000120B0000120B00000000000000000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9F4E1C9E4
        CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B78183FF00FF
        FF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BFA889D0B4
        8DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EBF9EBDAB0
        A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B78183FF00FF
        FF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F956D6F7959
        539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFDFBF4ECFA
        EFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A87779FF00FF
        FF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DAA6A6C38E
        8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFFFFFEFDFD
        F8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F6769FF00FF
        FF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E7473E8B5
        B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFF
        FFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F5D585C60
        FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FDF6ECDAC5
        BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCAF400A4E6
        021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4D4
        D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4FCF7F3FB
        F6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077DCD4860F1
        204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA8
        87B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF0000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = PenEditButtonClick
      Appearance.BorderColor = clGray
      Appearance.Color = clSilver
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = clSilver
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 395
    Width = 1008
    ExplicitTop = 395
    ExplicitWidth = 1008
  end
  inherited DesignAgent: TxpDesignAgent
    Left = 723
    Top = 49
  end
  object ImageList: TImageList
    Left = 619
    Top = 6
    Bitmap = {
      494C010105008801F80110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE5A29009C4A29009442210094422100944221009442
      21008C3921000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE5A
      2900CE5A2900CE5A2900CE5A3100CE5A3100C6522900C64A2100BD4A1800BD42
      1800A53918000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE5A
      2900E7735200DE6B4200D6633900CE5A3100C66B4A00C6846B00C6522100AD4A
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE5A
      2900E7734A00DE734A00CE633100BD9C9400BDC6D600BDD6EF00A5736B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE5A2900B5847300ADCEE700B5D6EF00B5D6EF007B94B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000424A4A007B94AD00B5CEEF00A5BDDE007B94B5007B94B5007B94
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000212121004A5A6B00A5C6DE00ADCEE700ADCEE700ADC6E700A5BD
      D6007B94B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003139390018182100212121005A6B7B00ADCEEF00ADCEEF00ADCEE700ADC6
      E7007B94B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      52002121290021292900424A5200A5C6DE00B5D6EF00B5D6EF00B5CEEF00ADCE
      E7007B94B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      290029293100293131007B8CA500B5DEF700B5DEF700B5D6F700B5D6EF00B5CE
      EF0094B5D6007B94B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      3100313131003139390039394200849CAD00A5C6DE00B5DEF700A5B5C6008C9C
      9C007B94B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002931
      3100313939003939420042424A004A4A4A005A636B00ADCEE700B5D6E700A5BD
      CE007B94B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      39003939420042424A0052525A005A5A63005A5A630063636B00A5C6D600B5D6
      EF007B94B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      7300394242004A4A52005A6363006B6B6B006B6B730063636300636B6B006B73
      7B005A636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525A5A004A52520063636B0073737300737373006B6B6B0052525A007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000737373005A5A63006B6B6B006B6B6B0073737300737373000000
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
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000848484008484
      84008C8C8C0000000000000000000000000000000000000000006B2900006B29
      00005A210000522100004A1800004A1800004A1800004A1800004A1800004A18
      00004A18000042180000000000000000000000000000000000006B2900006B29
      00005A210000522100004A1800004A1800004A1800004A1800004A1800004A18
      00004A1800004218000000000000000000000000000000000000A5636B00FFEF
      C600C6CE9400D6CE9400EFCE9C00E7CE9400EFC68400EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      00009C9C9C009C9C9C00D6CECE009494940039393900525252009C949400C6C6
      C600D6D6D6008484840000000000000000000000000094390000BD4A0000B542
      0000AD420000A53900009C39000094390000943900009C3900009C3900009439
      00009C3900007B31000042180000000000000000000094390000BD4A0000B542
      0000AD420000A53900009C39000094390000943900009C3900009C3900009439
      00009C3900007B31000042180000000000000000000000000000A5636B00FFEF
      CE009CBD7300299C21006BAD4A0021941000219410005AA53900CEB57300EFBD
      7B00EFBD7B00EFC68400A5636B000000000000000000000000009C9C9C009C9C
      9C00F7F7F700FFFFFF00D6D6D6009C9C9C004242420021182100211821003131
      310063636300848484008C8C8C000000000000000000BD4A0000E75A0000D652
      0000CE520000C64A0000BD4A0000B5420000AD420000AD420000AD420000AD42
      0000B54200009C3900004A1800000000000000000000BD4A0000E75A0000D652
      0000CE520000C64A0000BD4A0000B5420000AD420000AD420000AD420000AD42
      0000B54200009C3900004A180000000000000000000000000000A5635A00FFEF
      DE00BDCE9C00108C08000084000000840000008400000084000029941800DEBD
      7B00EFBD7B00EFC68400A5636B0000000000948C8C009C9C9C00EFEFEF00FFFF
      FF00EFE7E700C6C6C6009C9C9C008C8C8C009494940084848400636363003939
      39001821210021182100737373000000000000000000C64A0000F75A0000E75A
      0000D6520000C64A0000C64A0000B5420000FFFFFF00FFFFFF00A5420000A542
      0000AD4200009C390000521800000000000000000000C64A0000F75A0000E75A
      0000D6520000C64A0000FFFFFF00FFFFFF00AD420000AD420000A5420000A542
      0000AD4200009C39000052180000000000000000000000000000A5635A00FFF7
      E700BDCE9C00189410000084000018941000ADBD730073AD4A000084000073AD
      4A00EFBD8400EFC68400A5636B00000000009C9C9C00E7E7E700E7E7E700BDBD
      BD00A5A5A500B5ADAD00C6BDBD00A5A5A50094949400948C8C00949494009C94
      94008C8C8C006B6B6B00848484000000000000000000CE4A0000FF6B0000F763
      0000E75A0000D6520000CE4A0000FFFFFF00FFFFFF00FFFFFF00AD420000A542
      0000AD4200009C3900004A1800000000000000000000CE4A0000FF6B0000F763
      0000E75A0000D6520000FFFFFF00FFFFFF00FFFFFF00B5420000AD420000A542
      0000AD4200009C3900004A180000000000000000000000000000A5736B00FFF7
      EF00BDD6A500088C0800008400000084000084B55A00EFCEA500A5B56B006BAD
      4A00EFC68C00EFC68400A5636B000000000094949400ADADAD00A5A5A500ADAD
      AD00C6C6C600D6D6D600EFEFEF00EFEFEF00DEDEDE00C6C6C600ADADAD009C9C
      9C00948C8C00949494008C8C8C000000000000000000CE4A0000FF7B1000FF6B
      0000F7630000E75A0000FFFFFF00FFFFFF00FFFFFF00BD4A0000B5420000AD42
      0000AD4200009C3900004A1800000000000000000000CE4A0000FF7B1000FF6B
      0000F7630000E75A0000D6520000FFFFFF00FFFFFF00FFFFFF00B5420000AD42
      0000AD4200009C3900004A180000000000000000000000000000A5736B00FFFF
      FF00E7E7D600A5CE94009CC6840094BD73009CBD7300EFD6AD00EFCEA5009CC6
      7B00EFC69400EFC68C00A5636B0000000000948C8C00ADADAD00C6C6C600CECE
      CE00C6C6C600DEDEDE00CECECE00A5ADA500BDBDBD00CECECE00D6D6D600D6D6
      D600C6C6C600B5B5B500949494000000000000000000CE4A0000FF943100FF73
      0800FF630000FFFFFF00FFFFFF00FFFFFF00D6520000CE4A0000C64A0000BD4A
      0000B54200009C390000521800000000000000000000CE4A0000FF943100FF73
      0800FF630000F7630000E75A0000DE520000FFFFFF00FFFFFF00FFFFFF00BD4A
      0000B54200009C39000052180000000000000000000000000000BD846B00FFFF
      FF00A5DEA500FFEFE700F7EFD6009CC6840094BD730094BD73009CBD7300EFCE
      A500EFCE9C00F7CE9400A5636B0000000000000000009C9C9C00CECECE00CECE
      CE00DEDEDE00C6C6C600B5B5B500A5D6A500BDC6BD00C6A5A500ADA5A500A5A5
      A500B5B5B500C6BDBD00A5A5A5000000000000000000CE4A0000FF9C4A00FF7B
      1800FF6B0000FFFFFF00FFFFFF00FFFFFF00DE520000D6520000CE520000C64A
      0000C64A0000A54200005A2100000000000000000000CE4A0000FF9C4A00FF7B
      1800FF6B0000FF630000EF5A0000E75A0000FFFFFF00FFFFFF00FFFFFF00C64A
      0000C64A0000A54200005A210000000000000000000000000000BD846B00FFFF
      FF0073C67300ADD6A500FFEFE70084C673000084000000840000088C0800EFD6
      AD00EFCEA500F7D6A500A5636B000000000000000000000000009C9C9C00BDBD
      BD00ADADAD00ADADAD00E7E7E700F7EFEF00EFEFEF00EFE7DE00D6D6D600CECE
      CE00B5B5B50094949400000000000000000000000000CE4A0000FFA55A00FF84
      2100FF6B0800FF630000FFFFFF00FFFFFF00FFFFFF00E75A0000DE520000CE52
      0000CE520000B54200006B2900000000000000000000CE4A0000FFA55A00FF84
      2100FF6B0800FF630000F75A0000FFFFFF00FFFFFF00FFFFFF00DE520000CE52
      0000CE520000B54200006B290000000000000000000000000000D6946B00FFFF
      FF0084CE8400008400007BC67300ADD6A5001894180000840000108C0800F7D6
      B500F7D6AD00EFCEA500A5636B00000000000000000000000000000000009C9C
      9C00D6D6D600CECECE009C9C9C00BDBDBD00D6D6D600D6D6D600D6D6D600C6C6
      C600ADADAD0000000000000000000000000000000000CE4A0000FFAD6300FF8C
      2900FF7B1000FF730800FF6B0000FFFFFF00FFFFFF00FFFFFF00E75A0000DE52
      0000DE520000BD4A00007B2900000000000000000000CE4A0000FFAD6300FF8C
      2900FF7B1000FF730800FFFFFF00FFFFFF00FFFFFF00EF5A0000E75A0000DE52
      0000DE520000BD4A00007B290000000000000000000000000000D6946B00FFFF
      FF00F7F7EF0029A5290000840000008400000084000000840000108C0800FFEF
      CE00DECEB500B5AD9400A5636B00000000000000000000000000000000000000
      0000FFE7E700FFDECE00E7C6BD00E7C6BD00E7CEC600DED6CE00CECECE009494
      94000000000000000000000000000000000000000000CE4A0000FFB57300FF94
      4200FF7B1800FF7B1000FF730800FF6B0000FFFFFF00FFFFFF00F75A0000EF5A
      0000E75A0000C64A0000843100000000000000000000CE4A0000FFB57300FF94
      4200FF7B1800FF7B1000FFFFFF00FFFFFF00FF6B0000FF630000F75A0000EF5A
      0000E75A0000C64A000084310000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00DEF7DE0063BD6300219C2100219C210073BD6B00299C2100946B
      5200A56B5A00A56B5A00A5636B00000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500FFAD9C00000000000000
      00000000000000000000000000000000000000000000CE4A0000FFBD7B00FFB5
      7300FFA55200FF9C4200FF943100FF842100FF7B1000FF6B0000FF630000F75A
      0000F75A0000DE5200009C3900000000000000000000CE4A0000FFBD7B00FFB5
      7300FFA55200FF9C4200FF943100FF842100FF7B1000FF6B0000FF630000F75A
      0000F75A0000DE5200009C390000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEF7DE00DEF7DE00FFFFF700ADB594008C6B
      5200E79C5200E78C3100B56B4A00000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9400000000000000
      00000000000000000000000000000000000000000000CE4A0000FFA55A00FFBD
      7B00FFBD8400FFB57300FFAD6300FF9C4A00FF842900FF730800FF630000FF63
      0000FF630000E75A0000A54200000000000000000000CE4A0000FFA55A00FFBD
      7B00FFBD8400FFB57300FFAD6300FF9C4A00FF842900FF730800FF630000FF63
      0000FF630000E75A0000A5420000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A0000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000EF5A0000FF73
      0800FF730800FF730800FF6B0000FF630000EF5A0000DE520000D6520000CE52
      0000CE520000BD4A000000000000000000000000000000000000EF5A0000FF73
      0800FF730800FF730800FF6B0000FF630000EF5A0000DE520000D6520000CE52
      0000CE520000BD4A000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00DEC6C600A56B
      5A00BD846B00000000000000000000000000000000000000000000000000CE9C
      9C00FFE7D600FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A0000000000000000000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00F7AD9C00F7AD9C0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FC07000000000000E007000000000000
      E00F000000000000E01F000000000000F03F000000000000F80F000000000000
      F807000000000000F007000000000000E007000000000000E003000000000000
      E007000000000000E007000000000000E007000000000000E007000000000000
      F00F000000000000F81F000000000000FFFFFFFFC001FDC7C003C003C001F003
      80018001C001C00180018001C001000180018001C001000180018001C0010001
      80018001C001000180018001C001800180018001C001C00380018001C001E007
      80018001C001F00F80018001C001F03F80018001C001F03F80018001C003F03F
      C003C003C007E03FFFFFFFFFC00FE07F00000000000000000000000000000000
      000000000000}
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 495
    Top = 52
    PixelsPerInch = 96
    object cxDZStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnFace
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBtnFace
    end
    object BandStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnFace
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBtnFace
    end
  end
  object SaveDialog: TSaveDialog
    Left = 657
    Top = 49
  end
  object PopupMenu1: TPopupMenu
    Left = 590
    Top = 52
  end
end
