object f_akun_penting: Tf_akun_penting
  Left = 192
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Daftar Akun-Akun Penting'
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
      Top = 399
      Width = 148
      Height = 41
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sButton1: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = '&Ubah Akun'
        TabOrder = 0
        OnClick = sButton1Click
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
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = ds_akun_penting
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      object t_datano_ix: TcxGridDBColumn
        Caption = 'No'
        DataBinding.FieldName = 'no_ix'
        Options.Editing = False
      end
      object t_dataKeterangan: TcxGridDBColumn
        DataBinding.FieldName = 'Keterangan'
        Options.Editing = False
      end
      object t_datakd_akun: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kd_akun'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#-###0'
        Properties.EditFormat = '#-###0'
        Options.Editing = False
      end
      object t_datan_kiraan: TcxGridDBColumn
        Caption = 'Nama Akun'
        DataBinding.FieldName = 'n_kiraan'
        Options.Editing = False
      end
    end
    object t_asset: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0'
          Kind = skSum
          Column = t_assetjumlah_nilai
        end
        item
          Format = '###,###,##0'
          Kind = skSum
          Column = t_assetsusut_bulan
        end
        item
          Format = '###,###,##0'
          Kind = skSum
          Column = t_assetakum_penyusutan
        end
        item
          Format = '###,###,##0'
          Kind = skSum
          Column = t_assetnilai_buku
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object t_assetkd_asset: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kd_asset'
        Width = 40
      end
      object t_assetNm_asset: TcxGridDBColumn
        Caption = 'Nama Asset'
        DataBinding.FieldName = 'Nm_asset'
        Width = 202
      end
      object t_assettgl_perolehan: TcxGridDBColumn
        Caption = 'Tgl Perolehan'
        DataBinding.FieldName = 'tgl_perolehan'
        Width = 98
      end
      object t_assetjumlah_nilai: TcxGridDBColumn
        Caption = 'Nilai Asset'
        DataBinding.FieldName = 'jumlah_nilai'
        Width = 84
      end
      object t_assetsusut_bulan: TcxGridDBColumn
        Caption = 'Beban Per Bulan'
        DataBinding.FieldName = 'susut_bulan'
        Width = 84
      end
      object t_assetakum_penyusutan: TcxGridDBColumn
        Caption = 'Akum. Beban'
        DataBinding.FieldName = 'akum_penyusutan'
        Width = 91
      end
      object t_assetnilai_buku: TcxGridDBColumn
        Caption = 'Nilai Buku'
        DataBinding.FieldName = 'nilai_buku'
        Width = 85
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 352
    Top = 96
  end
  object Q_akun_penting: TMyQuery
    Connection = dm.db_conn
    Left = 520
    Top = 64
  end
  object ds_akun_penting: TDataSource
    DataSet = Q_akun_penting
    Left = 488
    Top = 64
  end
end
