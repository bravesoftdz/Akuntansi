object f_daftar_hutang: Tf_daftar_hutang
  Left = 326
  Top = 116
  Width = 928
  Height = 480
  Caption = 'Daftar Hutang Usaha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 441
    Align = alRight
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sb_1: TsSpeedButton
      Left = 1
      Top = 1
      Width = 148
      Height = 90
      Cursor = crHandPoint
      Caption = 'Selesai'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_1Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 7
      Reflected = True
    end
    object sb_2: TsSpeedButton
      Left = 1
      Top = 91
      Width = 148
      Height = 90
      Cursor = crHandPoint
      Caption = 'Refresh'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_2Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 8
      Reflected = True
    end
    object p1: TsPanel
      Left = 1
      Top = 383
      Width = 148
      Height = 57
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sButton3: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 41
        Caption = '&Lihat Faktur'#13#10'Pembelian'
        TabOrder = 0
        OnClick = sButton3Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 441
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LevelTabs.Slants.Positions = [spRight]
    LevelTabs.Style = 9
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = gridActiveTabChanged
    object Table0: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_hutang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable0hutang_awal
        end
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable0dibayar
        end
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable0return_beli
        end
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable0hutang
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '[Tidak ada data yang bisa ditampilkan]'
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object tvTable0faktur: TcxGridDBColumn
        Caption = 'Kode Faktur'
        DataBinding.FieldName = 'faktur'
        Width = 120
      end
      object tvTable0tanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 66
      end
      object tvTable0jatuh_tempo: TcxGridDBColumn
        Caption = 'Jatuh Tempo'
        DataBinding.FieldName = 'jatuh_tempo'
        Width = 65
      end
      object tvTable0n_supp: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'n_supp'
        Width = 308
      end
      object tvTable0hutang_awal: TcxGridDBColumn
        Caption = 'Hutang Awal'
        DataBinding.FieldName = 'hutang_awal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 86
      end
      object tvTable0dibayar: TcxGridDBColumn
        Caption = 'diBayar'
        DataBinding.FieldName = 'dibayar'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 63
      end
      object tvTable0return_beli: TcxGridDBColumn
        Caption = 'Return'
        DataBinding.FieldName = 'return_beli'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 88
      end
      object tvTable0hutang: TcxGridDBColumn
        Caption = 'Sisa Hutang'
        DataBinding.FieldName = 'hutang'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 83
      end
      object tvTable0user: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Width = 77
      end
    end
    object Table1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_bayar_hutang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable1Column4
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object tvTable1tgl: TcxGridDBColumn
        DataBinding.FieldName = 'tgl'
        Width = 69
      end
      object tvTable1no_refrensi: TcxGridDBColumn
        Caption = 'Refrensi'
        DataBinding.FieldName = 'no_refrensi'
        Width = 77
      end
      object tvTable1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 451
      end
      object tvTable1Column4: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'debet'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        Width = 70
      end
    end
    object Table2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_return
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable2disk_rp
        end
        item
          Format = '###,###,##0.00;(###,###,##0.00);0.00'
          Kind = skSum
          Column = tvTable2nilai_faktur
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object tvTable2kd_return: TcxGridDBColumn
        Caption = 'Kode Return'
        DataBinding.FieldName = 'kd_return'
        Width = 124
      end
      object tvTable2tgl_return: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl_return'
        Width = 129
      end
      object tvTable2disk_rp: TcxGridDBColumn
        Caption = 'Diskon'
        DataBinding.FieldName = 'disk_rp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 99
      end
      object tvTable2nilai_faktur: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai_faktur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 85
      end
      object tvTable2pengguna: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
        Width = 64
      end
    end
    object Level0: TcxGridLevel
      Caption = 'Daftar Hutang'
      GridView = Table0
      Options.DetailTabsPosition = dtpTop
      Options.TabsForEmptyDetails = False
    end
    object Level1: TcxGridLevel
      Caption = 'Bayar Hutang'
      GridView = Table1
    end
    object Level2: TcxGridLevel
      Caption = 'Return Pembelian'
      GridView = Table2
    end
  end
  object sknprvdr1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 24
  end
  object ds_bayar_hutang: TDataSource
    DataSet = Q_bayar_hutang
    Left = 360
    Top = 104
  end
  object Q_bayar_hutang: TMyQuery
    Connection = dm.db_conn
    SQL.Strings = (
      'select * from vw_jurnal_rinci')
    Left = 288
    Top = 104
  end
  object ds_hutang: TDataSource
    DataSet = Q_hutang
    Left = 360
    Top = 56
  end
  object Q_hutang: TMyQuery
    Connection = dm.db_conn
    SQL.Strings = (
      'select * from vw_hutang')
    Left = 288
    Top = 56
  end
  object Q_return: TMyQuery
    Connection = dm.db_conn
    SQL.Strings = (
      'select * from tb_return_global')
    Left = 288
    Top = 160
  end
  object ds_return: TDataSource
    DataSet = Q_return
    Left = 360
    Top = 160
  end
end
