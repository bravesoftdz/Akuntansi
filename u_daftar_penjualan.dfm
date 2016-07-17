object f_daftar_penjualan: Tf_daftar_penjualan
  Left = 54
  Top = 123
  Width = 928
  Height = 480
  Caption = 'Daftar Transaksi penjualan'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 442
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LevelTabs.Slants.Positions = [spRight]
    LevelTabs.Style = 9
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = gridActiveTabChanged
    object t_data1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_daftar_jual
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_datadebet
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '[Tidak ada data yang bisa ditampilkan]'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object t_datatgl: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl'
        Width = 60
      end
      object t_datano_refrensi: TcxGridDBColumn
        Caption = 'Refrensi'
        DataBinding.FieldName = 'no_refrensi'
        Width = 107
      end
      object t_dataketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 251
      end
      object t_datadebet: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        Width = 87
      end
    end
    object t_data2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_rinci_jual
      DataController.DetailKeyFieldNames = 'ix_jurnal'
      DataController.KeyFieldNames = 'ix_jurnal'
      DataController.MasterKeyFieldNames = 'no_ix'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data2Column4
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data2Column5
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object t_data2Column1: TcxGridDBColumn
        Caption = 'No'
        DataBinding.FieldName = 'no_urut'
        Width = 33
      end
      object t_data2Column2: TcxGridDBColumn
        Caption = 'Akun'
        DataBinding.FieldName = 'kd_akun'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#-###0'
        Width = 86
      end
      object t_data2Column3: TcxGridDBColumn
        Caption = 'Deskripsi Akun'
        DataBinding.FieldName = 'n_kiraan'
        Width = 275
      end
      object t_data2Column4: TcxGridDBColumn
        Caption = 'Debet'
        DataBinding.FieldName = 'debet'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 81
      end
      object t_data2Column5: TcxGridDBColumn
        Caption = 'Kredit'
        DataBinding.FieldName = 'kredit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 86
      end
    end
    object t_data0: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = t_data0FocusedRecordChanged
      DataController.DataSource = ds_setor
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0return_jual
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0discount
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0kredit
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0price_oh
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0jumlah_setor_oh
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0jumlah_setor_real
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0selisih
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tv_data0debit
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tv_data0CashOut
        end>
      DataController.Summary.SummaryGroups = <>
      DateTimeHandling.MonthFormat = 'MM'
      DateTimeHandling.YearFormat = 'yyyy'
      DateTimeHandling.DateFormat = 'dd/MM/yyyy'
      DateTimeHandling.HourFormat = 'hh:mm:ss'
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object t_data0kd_jaga: TcxGridDBColumn
        Caption = 'MD'
        DataBinding.FieldName = 'kd_jaga'
        Width = 47
      end
      object t_data0user: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Width = 61
      end
      object t_data0tanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 114
      end
      object t_data0selisih: TcxGridDBColumn
        Caption = 'Selisih'
        DataBinding.FieldName = 'selisih'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 47
      end
      object t_data0jumlah_setor_real: TcxGridDBColumn
        Caption = 'Setor Real'
        DataBinding.FieldName = 'jumlah_setor_real'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 47
      end
      object t_data0jumlah_setor_oh: TcxGridDBColumn
        Caption = 'Setor OH'
        DataBinding.FieldName = 'jumlah_setor_oh'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Visible = False
        Width = 47
      end
      object t_data0price_oh: TcxGridDBColumn
        Caption = 'Tunai'
        DataBinding.FieldName = 'price_oh'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 47
      end
      object t_data0kredit: TcxGridDBColumn
        Caption = 'Kredit'
        DataBinding.FieldName = 'kredit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 48
      end
      object tv_data0debit: TcxGridDBColumn
        Caption = 'Debit'
        DataBinding.FieldName = 'debit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 47
      end
      object tv_data0CashOut: TcxGridDBColumn
        Caption = 'Cash Out'
        DataBinding.FieldName = 'cash_out'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Width = 47
      end
      object t_data0return_jual: TcxGridDBColumn
        Caption = 'Return'
        DataBinding.FieldName = 'return_jual'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Visible = False
        Width = 46
      end
      object t_data0discount: TcxGridDBColumn
        Caption = 'Diskon'
        DataBinding.FieldName = 'discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Visible = False
        Width = 48
      end
      object t_data0status: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        Width = 34
      end
      object t_data0ix_setor: TcxGridDBColumn
        Caption = 'Posted'
        DataBinding.FieldName = 'posted'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = dm.gambar
        Properties.Items = <
          item
            Description = 'Belum di Posting'
            ImageIndex = 2
            Value = '0'
          end
          item
            Description = 'Sudah di Posting'
            ImageIndex = 1
            Value = '1'
          end>
        Properties.ShowDescriptions = False
        Width = 68
      end
    end
    object l_data0: TcxGridLevel
      Caption = 'Daftar Setor Kasir'
      GridView = t_data0
    end
    object l_data1: TcxGridLevel
      Tag = 1
      Caption = 'Jurnal Setor Kasir'
      GridView = t_data1
      object l_data2: TcxGridLevel
        GridView = t_data2
      end
    end
  end
  object panel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 442
    Align = alRight
    TabOrder = 1
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
      Top = 336
      Width = 148
      Height = 105
      Align = alBottom
      TabOrder = 0
      Visible = False
      SkinData.SkinSection = 'PANEL'
      object sButton1: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 41
        Caption = '&Tampilkan Seluruh'#13#10'Jurnal Penjualan'
        TabOrder = 0
        OnClick = sButton1Click
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton3: TsButton
        Left = 8
        Top = 56
        Width = 129
        Height = 41
        Caption = '&Print Preview'#13#10'Jurnal Penjualan'
        TabOrder = 1
        OnClick = sButton3Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object p2: TsPanel
      Left = 1
      Top = 279
      Width = 148
      Height = 57
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sButton2: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 41
        Caption = 'Posting / &Reposting'
        TabOrder = 0
        OnClick = sButton2Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object ds_daftar_jual: TDataSource
    DataSet = Q_daftar_jual
    Left = 560
    Top = 56
  end
  object Q_daftar_jual: TmySQLQuery
    Database = dm.My_conn
    SQL.Strings = (
      'select * from tb_jurnal_global')
    Left = 512
    Top = 56
  end
  object Q_rinci_jual: TmySQLQuery
    Database = dm.My_conn
    SQL.Strings = (
      'select * from _vw_jurnal_rinci')
    Left = 512
    Top = 96
  end
  object ds_rinci_jual: TDataSource
    DataSet = Q_rinci_jual
    Left = 560
    Top = 96
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
    Top = 32
  end
  object ds_setor: TDataSource
    DataSet = Q_setor
    Left = 408
    Top = 64
  end
  object Q_setor: TmySQLQuery
    Database = dm.My_conn
    SQL.Strings = (
      
        'select *, IF(IFNULL(ix_setor,0)=0,0,1) as posted from tb_login_k' +
        'asir')
    Left = 360
    Top = 64
  end
end
