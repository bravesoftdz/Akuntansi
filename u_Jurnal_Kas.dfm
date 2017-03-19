object f_Jurnal_Kas: Tf_Jurnal_Kas
  Left = 309
  Top = 94
  BorderStyle = bsDialog
  Caption = 'Jurnal Kas'
  ClientHeight = 425
  ClientWidth = 486
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
  object sLabel6: TsLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Macam Jurnal'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sb_cari: TsSpeedButton
    Tag = 8
    Left = 448
    Top = 160
    Width = 24
    Height = 21
    OnClick = sb_cariClick
    SkinData.SkinSection = 'SPEEDBUTTON'
    ImageIndex = 0
    Images = dm.gambar
  end
  object l_ket: TsLabel
    Left = 8
    Top = 184
    Width = 114
    Height = 13
    Caption = 'dari Hasil Pembayaran...'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object l_1: TsLabel
    Left = 264
    Top = 8
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
  object l_6: TsLabel
    Left = 8
    Top = 368
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
  object l_5: TsLabel
    Left = 32
    Top = 368
    Width = 138
    Height = 13
    Caption = 'untuk Nilai -> angka/ (2000/)'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Grid: TcxGrid
    Left = 8
    Top = 200
    Width = 465
    Height = 164
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object TableView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Append.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total'
          Kind = skCount
          Column = ableViewColumn1
          DisplayText = 'Total'
        end
        item
          Format = '0 Akun'
          Kind = skCount
          Column = ableViewColumn2
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          OnGetText = TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
          Column = t_view_Qty
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
        Caption = 'Kode'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 73
      end
      object ableViewColumn2: TcxGridColumn
        Caption = 'Nama Akun'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 259
      end
      object t_view_Qty: TcxGridColumn
        Caption = 'Nilai'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        Properties.MinValue = 1.000000000000000000
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Options.IncSearch = False
        Width = 105
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object ed_code: TsEdit
    Left = 8
    Top = 160
    Width = 433
    Height = 21
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyDown = ed_codeKeyDown
    OnKeyPress = ed_codeKeyPress
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
  end
  object gb_1: TsGroupBox
    Left = 8
    Top = 32
    Width = 465
    Height = 113
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object sb_jurnal: TsSpeedButton
      Tag = 8
      Left = 168
      Top = 16
      Width = 24
      Height = 21
      OnClick = sb_jurnalClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 0
      Images = dm.gambar
    end
    object l_2: TsLabel
      Left = 8
      Top = 16
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
    object l_3: TsLabel
      Left = 8
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
    object l_4: TsLabel
      Left = 8
      Top = 80
      Width = 55
      Height = 13
      Caption = 'Keterangan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object ed_keterangan: TsEdit
      Left = 80
      Top = 80
      Width = 377
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
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object ed_refrensi: TsEdit
      Left = 80
      Top = 48
      Width = 145
      Height = 21
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object ed_nJurnal: TsEdit
      Left = 200
      Top = 16
      Width = 257
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
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object ed_no_jurnal: TsEdit
      Left = 80
      Top = 16
      Width = 81
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
      OnChange = ed_no_jurnalChange
      OnKeyDown = ed_no_jurnalKeyDown
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object p1: TsPanel
    Left = 0
    Top = 384
    Width = 486
    Height = 41
    Align = alBottom
    TabOrder = 5
    SkinData.SkinSection = 'PANEL'
    object b_simpan: TsButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = b_simpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object b_baru: TsButton
      Left = 303
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
  object cb_jenis: TsComboBox
    Left = 88
    Top = 8
    Width = 129
    Height = 22
    Alignment = taLeftJustify
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    Style = csDropDownList
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 0
    Text = 'Kas Masuk'
    OnChange = cb_jenisChange
    Items.Strings = (
      'Kas Masuk'
      'Kas Keluar')
  end
  object de_tanggal: TsDateEdit
    Left = 320
    Top = 8
    Width = 153
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
    TabOrder = 1
    Text = '  /  /    '
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    GlyphMode.Blend = 0
    GlyphMode.Grayed = False
  end
end
