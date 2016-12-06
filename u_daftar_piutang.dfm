object f_daftar_piutang: Tf_daftar_piutang
  Left = 338
  Top = 225
  Width = 928
  Height = 480
  Caption = 'Daftar Piutang Usaha'
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
      DisabledGlyphKind = []
      ImageIndex = 7
      Images = dm.image
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
      DisabledGlyphKind = []
      ImageIndex = 8
      Images = dm.image
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
        Caption = '&Print Preview'#13#10'Faktur_Penjualan'
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
    LevelTabs.Style = 10
    LookAndFeel.Kind = lfOffice11
    object Table0: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_hutang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvTable0hutang_awal
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvTable0dibayar
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvTable0return_beli
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
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
        Caption = 'Pelanggan'
        DataBinding.FieldName = 'n_pelanggan'
        Width = 308
      end
      object tvTable0hutang_awal: TcxGridDBColumn
        Caption = 'Hutang Awal'
        DataBinding.FieldName = 'piutang_awal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        Width = 86
      end
      object tvTable0dibayar: TcxGridDBColumn
        Caption = 'diBayar'
        DataBinding.FieldName = 'dibayar'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        Width = 63
      end
      object tvTable0return_beli: TcxGridDBColumn
        Caption = 'Return'
        DataBinding.FieldName = 'return_jual'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        Width = 88
      end
      object tvTable0hutang: TcxGridDBColumn
        Caption = 'Sisa Hutang'
        DataBinding.FieldName = 'piutang'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
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
      DataController.DetailKeyFieldNames = 'rujukan'
      DataController.KeyFieldNames = 'rujukan'
      DataController.MasterKeyFieldNames = 'faktur'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
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
        DataBinding.FieldName = 'kredit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 70
      end
    end
    object Table2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_return
      DataController.DetailKeyFieldNames = 'kd_transaksi'
      DataController.KeyFieldNames = 'kd_transaksi'
      DataController.MasterKeyFieldNames = 'faktur'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvTable_data3nilai_faktur
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
      object tvTable_data3kd_return_jual: TcxGridDBColumn
        Caption = 'Kode Return'
        DataBinding.FieldName = 'kd_return_jual'
        Width = 112
      end
      object tvTable_data3nilai_faktur: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'nilai_faktur'
        Width = 77
      end
      object tvTable_data3pengguna: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
        Width = 85
      end
      object tvTable_data3pengawas: TcxGridDBColumn
        Caption = 'MD'
        DataBinding.FieldName = 'pengawas'
        Width = 96
      end
      object tvTable_data3simpan_pada: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'simpan_pada'
        Width = 130
      end
    end
    object Table3: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_return_kirim
      DataController.DetailKeyFieldNames = 'kd_kirim'
      DataController.KeyFieldNames = 'kd_kirim'
      DataController.MasterKeyFieldNames = 'faktur'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvTable3nilai_faktur
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
      object tvTable3kd_return_kirim: TcxGridDBColumn
        Caption = 'Kode Return'
        DataBinding.FieldName = 'kd_return_kirim'
        Width = 122
      end
      object tvTable3tgl_return_kirim: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl_return_kirim'
        Width = 145
      end
      object tvTable3nilai_faktur: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai_faktur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        Width = 122
      end
      object tvTable3pengguna: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
        Width = 186
      end
    end
    object Level0: TcxGridLevel
      Caption = 'Daftar Piutang'
      GridView = Table0
      Options.DetailTabsPosition = dtpTop
      Options.TabsForEmptyDetails = False
    end
    object Level1: TcxGridLevel
      GridView = Table1
    end
    object Level2: TcxGridLevel
      GridView = Table2
    end
    object Level3: TcxGridLevel
      GridView = Table3
    end
  end
  object sknprvdr1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 24
  end
  object Q_piutang: TmySQLQuery
    Database = dm.db_conn
    SQL.Strings = (
      'select * from vw_piutang')
    Left = 288
    Top = 56
  end
  object Q_bayar_piutang: TmySQLQuery
    Database = dm.db_conn
    SQL.Strings = (
      'select * from vw_jurnal_rinci')
    Left = 288
    Top = 104
  end
  object Q_return: TmySQLQuery
    Database = dm.db_conn
    SQL.Strings = (
      'select * from tb_return_jual_global')
    Left = 288
    Top = 160
  end
  object ds_return: TDataSource
    DataSet = Q_return
    Left = 360
    Top = 160
  end
  object ds_bayar_hutang: TDataSource
    DataSet = Q_bayar_piutang
    Left = 360
    Top = 104
  end
  object ds_hutang: TDataSource
    DataSet = Q_piutang
    Left = 360
    Top = 56
  end
  object Q_return_kirim: TmySQLQuery
    Database = dm.db_conn
    SQL.Strings = (
      'SELECT * FROM tb_return_kirim_global')
    Left = 288
    Top = 208
  end
  object ds_return_kirim: TDataSource
    DataSet = Q_return_kirim
    Left = 360
    Top = 208
  end
end
