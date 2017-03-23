object F_GJurnal: TF_GJurnal
  Left = 201
  Top = 99
  BorderStyle = bsDialog
  Caption = 'Jurnal Umum'
  ClientHeight = 408
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel5: TsLabel
    Left = 264
    Top = 336
    Width = 55
    Height = 13
    Caption = 'BALANCE :'
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
    Top = 104
    Width = 24
    Height = 21
    OnClick = sb_cariClick
    SkinData.SkinSection = 'SPEEDBUTTON'
    Images = dm.gambar
    ImageIndex = 0
  end
  object l_4: TsLabel
    Left = 8
    Top = 330
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
    Top = 330
    Width = 147
    Height = 13
    Caption = 'untuk Debet -> angka/ (2000/)'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object l_6: TsLabel
    Left = 32
    Top = 346
    Width = 143
    Height = 13
    Caption = 'untuk Kredit -> angka* (2000*)'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ce_balance: TsCurrencyEdit
    Left = 336
    Top = 336
    Width = 137
    Height = 21
    AutoSize = False
    Color = 16513526
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    SkinData.SkinSection = 'EDIT'
    GlyphMode.Blend = 0
    GlyphMode.Grayed = False
  end
  object gb_1: TsGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 81
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object l_1: TsLabel
      Left = 8
      Top = 16
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
    object l_2: TsLabel
      Left = 248
      Top = 16
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
    object l_3: TsLabel
      Left = 8
      Top = 48
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
    object ed_refrensi: TsEdit
      Left = 80
      Top = 16
      Width = 153
      Height = 21
      Color = 16513526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
    end
    object de_tanggal: TsDateEdit
      Left = 304
      Top = 16
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
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object ed_keterangan: TsEdit
      Left = 80
      Top = 48
      Width = 377
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
    end
  end
  object ed_code: TsEdit
    Left = 8
    Top = 104
    Width = 433
    Height = 21
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = ed_codeKeyDown
    OnKeyPress = ed_codeKeyPress
    SkinData.SkinSection = 'EDIT'
  end
  object Grid: TcxGrid
    Left = 8
    Top = 128
    Width = 465
    Height = 201
    TabOrder = 3
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
          Format = '0 Akun'
          Kind = skCount
          Column = ableViewColumn2
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          OnGetText = tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
          Column = t_view_Qty
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
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
        Caption = 'Kode'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 66
      end
      object ableViewColumn2: TcxGridColumn
        Caption = 'Nama Akun'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 230
      end
      object t_view_Qty: TcxGridColumn
        Caption = 'Debet'
        DataBinding.ValueType = 'Currency'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Options.IncSearch = False
        Width = 78
      end
      object view_TableViewColumn1: TcxGridColumn
        Caption = 'Kredit'
        DataBinding.ValueType = 'Currency'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Width = 79
      end
    end
    object Level: TcxGridLevel
      GridView = tableview
    end
  end
  object p1: TsPanel
    Left = 0
    Top = 367
    Width = 484
    Height = 41
    Align = alBottom
    TabOrder = 4
    SkinData.SkinSection = 'PANEL'
    object sButton1: TsButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 319
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Baru'
      TabOrder = 1
      OnClick = sButton2Click
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
end
