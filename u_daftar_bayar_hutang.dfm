object f_daftar_bayar_hutang: Tf_daftar_bayar_hutang
  Left = 326
  Top = 116
  Width = 928
  Height = 480
  Caption = 'Daftar Transaksi Bayar Hutang'
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
        Caption = '&Print Preview'#13#10'Jurnal Bayar Hutang'
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
    LookAndFeel.Kind = lfOffice11
    object t_data0: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_bayar_hutang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_data0debet
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
      object t_data0tgl: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl'
        Width = 60
      end
      object t_data0no_refrensi: TcxGridDBColumn
        Caption = 'Refrensi'
        DataBinding.FieldName = 'no_refrensi'
        Width = 107
      end
      object t_data0keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 251
      end
      object t_data0debet: TcxGridDBColumn
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
      DataController.DataSource = ds_rinci_bayar_hutang
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
    object l_data: TcxGridLevel
      GridView = t_data0
      object l_data2: TcxGridLevel
        GridView = t_data2
      end
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
  object ds_rinci_bayar_hutang: TDataSource
    DataSet = Q_rinci_bayar_hutang
    Left = 360
    Top = 104
  end
  object Q_rinci_bayar_hutang: TMyQuery
    Connection = dm.db_conn
    Left = 288
    Top = 104
  end
  object ds_bayar_hutang: TDataSource
    DataSet = Q_bayar_hutang
    Left = 360
    Top = 56
  end
  object Q_bayar_hutang: TMyQuery
    Connection = dm.db_conn
    Left = 288
    Top = 56
  end
end
