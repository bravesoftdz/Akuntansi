object f_daftar_akun: Tf_daftar_akun
  Left = 192
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Daftar Akun'
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
      Caption = '&Selesai'
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
      Caption = '&Refresh'
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
      Top = 399
      Width = 148
      Height = 41
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object b_cetak: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = '&Cetak Buku Besar'
        TabOrder = 0
        OnClick = b_cetakClick
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
    TabOrder = 0
    LevelTabs.Slants.Positions = [spRight]
    LevelTabs.Style = 6
    LookAndFeel.Kind = lfOffice11
    object t_data: TcxGridDBTableView
      PopupMenu = pm_akun
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = t_dataCellDblClick
      OnEditKeyDown = t_dataEditKeyDown
      DataController.DataSource = dm.ds_kiraan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object t_datakd_kiraan: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kd_kiraan'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#-###0'
        HeaderAlignmentHorz = taCenter
      end
      object t_datan_kiraan: TcxGridDBColumn
        Caption = 'Nama Akun'
        DataBinding.FieldName = 'n_kiraan'
      end
      object t_datan_sub_klas: TcxGridDBColumn
        Caption = 'Sub Klasifikasi'
        DataBinding.FieldName = 'n_sub_klas'
      end
      object t_datan_klas: TcxGridDBColumn
        Caption = 'Klasifikasi'
        DataBinding.FieldName = 'n_klas'
      end
    end
    object t_buku_besar: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0'
          Kind = skSum
          FieldName = 'debet'
          Column = t_buku_besardebet
        end
        item
          Format = '###,###,##0'
          Kind = skSum
          FieldName = 'kredit'
          Column = t_buku_besarkredit
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.GroupByBox = False
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object t_buku_besartgl: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl'
        Width = 70
      end
      object t_buku_besarrefr: TcxGridDBColumn
        Caption = 'Tp.'
        DataBinding.FieldName = 'refr'
        Width = 39
      end
      object t_buku_besarno_refrensi: TcxGridDBColumn
        Caption = 'Refrensi'
        DataBinding.FieldName = 'no_refrensi'
      end
      object t_buku_besarketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
      end
      object t_buku_besardebet: TcxGridDBColumn
        Caption = 'Debet'
        DataBinding.FieldName = 'debet'
      end
      object t_buku_besarkredit: TcxGridDBColumn
        Caption = 'Kredit'
        DataBinding.FieldName = 'kredit'
      end
    end
    object l_data: TcxGridLevel
      Caption = 'Daftar Akun Perkiraan'
      GridView = t_data
    end
  end
  object sSkinProvider1: TsSkinProvider
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
  object pm_akun: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 32
    Top = 120
    object Mi_detail: TMenuItem
      Caption = 'Detail'
      OnClick = Mi_detailClick
    end
    object mi_baru: TMenuItem
      Caption = 'Baru'
      OnClick = mi_baruClick
    end
    object mi_hapus: TMenuItem
      Caption = 'Hapus'
      OnClick = mi_hapusClick
    end
  end
end
