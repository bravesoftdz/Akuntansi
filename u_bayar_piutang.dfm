object f_bayar_piutang: Tf_bayar_piutang
  Left = 300
  Top = 59
  BorderStyle = bsDialog
  Caption = 'Bayar'
  ClientHeight = 464
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sb_cari: TsSpeedButton
    Tag = 8
    Left = 496
    Top = 168
    Width = 24
    Height = 21
    OnClick = sb_cariClick
    SkinData.SkinSection = 'SPEEDBUTTON'
    Images = dm.gambar
    ImageIndex = 0
  end
  object Lbl6: TsLabel
    Left = 8
    Top = 400
    Width = 16
    Height = 13
    Caption = 'Ket'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Lbl7: TsLabel
    Left = 32
    Top = 400
    Width = 153
    Height = 13
    Caption = 'untuk diBayar -> angka/ (2000/)'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 49
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sSpeedButton1: TsSpeedButton
      Tag = 8
      Left = 208
      Top = 12
      Width = 24
      Height = 21
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      Images = dm.gambar
      ImageIndex = 0
    end
    object Lbl1: TsLabel
      Left = 8
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Jurnal Kas'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object ed_nJurnal: TsEdit
      Left = 240
      Top = 12
      Width = 273
      Height = 21
      Color = 16513526
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
    end
    object ed_no_jurnal: TsEdit
      Left = 80
      Top = 12
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = ed_no_jurnalKeyDown
      SkinData.SkinSection = 'EDIT'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 423
    Width = 529
    Height = 41
    Align = alBottom
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    object b_simpan: TsButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = b_simpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object b_baru: TsButton
      Left = 367
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Baru'
      TabOrder = 1
      OnClick = b_baruClick
      SkinData.SkinSection = 'BUTTON'
    end
    object b_hapus: TsButton
      Left = 8
      Top = 8
      Width = 122
      Height = 25
      Caption = '&Hapus Baris'
      TabOrder = 2
      OnClick = b_hapusClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Grid: TcxGrid
    Left = 8
    Top = 192
    Width = 513
    Height = 201
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object tableview: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Append.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total'
          Kind = skCount
          Column = ableViewColumn1
          DisplayText = 'Total'
        end
        item
          Format = '0 Transaksi'
          Kind = skCount
          Column = ableViewColumn2
        end
        item
          Format = '###,###,##0.000;(###,###,##0.000);0.000'
          Kind = skSum
          Column = t_view_Qty
        end
        item
          Format = '###,###,##0.000;(###,###,##0.000);0.000'
          Kind = skSum
          OnGetText = tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
          Column = view_TableViewColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '<Belum ada Data>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object ableViewColumn1: TcxGridColumn
        Caption = 'Refrensi'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 184
      end
      object ableViewColumn2: TcxGridColumn
        Caption = 'Tanggal'
        DataBinding.ValueType = 'DateTime'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 120
      end
      object t_view_Qty: TcxGridColumn
        Caption = 'Saldo'
        DataBinding.ValueType = 'Currency'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '###,###,##0.000;(###,###,##0.000);0.000'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Options.IncSearch = False
        Width = 97
      end
      object view_TableViewColumn1: TcxGridColumn
        Caption = 'di Bayar'
        DataBinding.ValueType = 'Currency'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '###,###,##0.000;(###,###,##0.000);0.000'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Width = 100
      end
    end
    object Level: TcxGridLevel
      GridView = tableview
    end
  end
  object ed_code: TsEdit
    Left = 8
    Top = 168
    Width = 481
    Height = 21
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyDown = ed_codeKeyDown
    OnKeyPress = ed_codeKeyPress
    SkinData.SkinSection = 'EDIT'
  end
  object gb_1: TsGroupBox
    Left = 8
    Top = 56
    Width = 513
    Height = 105
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object Lbl2: TsLabel
      Left = 8
      Top = 16
      Width = 29
      Height = 13
      Caption = 'Untuk'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sb_1: TsSpeedButton
      Tag = 9
      Left = 320
      Top = 16
      Width = 24
      Height = 21
      OnClick = sb_1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      Images = dm.gambar
      ImageIndex = 0
    end
    object Lbl4: TsLabel
      Left = 328
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Refrensi'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbl5: TsLabel
      Left = 328
      Top = 72
      Width = 39
      Height = 13
      Caption = 'Tanggal'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbl3: TsLabel
      Left = 8
      Top = 48
      Width = 29
      Height = 13
      Caption = 'Memo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object ed_pihak_lain: TsEdit
      Left = 56
      Top = 16
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = ed_pihak_lainKeyDown
      SkinData.SkinSection = 'EDIT'
    end
    object ed_refrensi: TsEdit
      Left = 384
      Top = 48
      Width = 121
      Height = 21
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
    end
    object de_tanggal: TsDateEdit
      Left = 384
      Top = 72
      Width = 121
      Height = 21
      AutoSize = False
      Color = 16513526
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object ed_keterangan: TsEdit
      Left = 56
      Top = 48
      Width = 257
      Height = 21
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      SkinData.SkinSection = 'EDIT'
    end
    object ed_ket2: TsEdit
      Left = 56
      Top = 72
      Width = 257
      Height = 21
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      SkinData.SkinSection = 'EDIT'
    end
  end
end
