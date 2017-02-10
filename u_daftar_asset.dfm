object f_daftar_asset: Tf_daftar_asset
  Left = 326
  Top = 116
  Width = 928
  Height = 480
  Caption = 'Daftar Asset'
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
    Height = 441
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object t_data1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = t_data1CellDblClick
      DataController.DataSource = ds_asset
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0.00'
          Kind = skSum
          Column = t_datajumlah_nilai
        end
        item
          Format = '###,###,##0.00'
          Kind = skSum
          Column = t_datanilai_buku
        end
        item
          Format = '###,###,##0.00'
          Kind = skSum
          Column = t_datasusut_bulan
        end
        item
          Format = '###,###,##0.00'
          Kind = skSum
          Column = t_dataakum_penyusutan
        end
        item
          Format = '###,###,##0.00'
          Kind = skSum
          Column = t_dataresidu
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
      object t_datakd_asset: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kd_asset'
        Width = 45
      end
      object t_dataNm_asset: TcxGridDBColumn
        Caption = 'Nama Asset'
        DataBinding.FieldName = 'Nm_asset'
        Width = 149
      end
      object t_datatgl_perolehan: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl_perolehan'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object t_datajumlah_nilai: TcxGridDBColumn
        Caption = 'Nilai Asset'
        DataBinding.FieldName = 'jumlah_nilai'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '###,###,##0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 101
      end
      object t_datasusut_bulan: TcxGridDBColumn
        Caption = 'Peny. Bulan ini'
        DataBinding.FieldName = 'susut_bulan'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '###,###,##0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 84
      end
      object t_dataakum_penyusutan: TcxGridDBColumn
        Caption = 'Akum. Penyusutan'
        DataBinding.FieldName = 'akum_penyusutan'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '###,###,##0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 108
      end
      object t_dataresidu: TcxGridDBColumn
        Caption = 'Nilai Residu'
        DataBinding.FieldName = 'nilai_residu'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '###,###,##0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object t_datanilai_buku: TcxGridDBColumn
        Caption = 'Nilai Buku'
        DataBinding.FieldName = 'nilai_buku'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '###,###,##0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 111
      end
    end
    object t_data2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
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
      GridView = t_data1
    end
  end
  object panel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 441
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
      Top = 343
      Width = 148
      Height = 97
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sButton1: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = '&Baru'
        TabOrder = 0
        OnClick = sButton1Click
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton2: TsButton
        Left = 8
        Top = 36
        Width = 129
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = sButton2Click
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton3: TsButton
        Left = 8
        Top = 64
        Width = 129
        Height = 25
        Caption = '&Hapus'
        TabOrder = 2
        OnClick = sButton3Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object p2: TsPanel
      Left = 1
      Top = 295
      Width = 148
      Height = 48
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sButton4: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = '&Posting Asset'
        TabOrder = 0
        OnClick = sButton4Click
        SkinData.SkinSection = 'BUTTON'
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
    Left = 352
    Top = 96
  end
  object ds_asset: TDataSource
    DataSet = Q_asset
    Left = 488
    Top = 112
  end
  object Q_asset: TMyQuery
    Connection = dm.db_conn
    Left = 528
    Top = 112
  end
end
