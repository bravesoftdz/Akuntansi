object FSaldoAwal: TFSaldoAwal
  Left = 359
  Top = 205
  Width = 786
  Height = 488
  Caption = 'Saldo Awal Akun'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlatas: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 33
    Align = alTop
    Caption = 'Saldo Awal Akun'
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16053492
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pgAwalAkun: TPageControl
    Left = 0
    Top = 33
    Width = 620
    Height = 416
    ActivePage = ABLabaRugi
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object ABNeraca: TTabSheet
      Caption = 'NERACA'
      object pnlNeraca: TPanel
        Left = 0
        Top = 355
        Width = 612
        Height = 33
        Align = alBottom
        Color = 15456965
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16053492
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 8
          Top = 6
          Width = 30
          Height = 13
          Caption = 'Aktiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 191
          Top = 6
          Width = 31
          Height = 13
          Caption = 'Pasiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 376
          Top = 6
          Width = 37
          Height = 13
          Caption = 'Balance'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNotBalance: TLabel
          Left = 591
          Top = 6
          Width = 135
          Height = 24
          Caption = 'TIDAK IMBANG'
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object edBalance: TsCurrencyEdit
          Left = 424
          Top = 4
          Width = 120
          Height = 21
          AutoSize = False
          Color = 16513526
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
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
          DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object edPasiva: TsCurrencyEdit
          Left = 232
          Top = 4
          Width = 120
          Height = 21
          AutoSize = False
          Color = 16513526
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
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
          DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object edAktiva: TsCurrencyEdit
          Left = 48
          Top = 4
          Width = 120
          Height = 21
          AutoSize = False
          Color = 16513526
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
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
          DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
      end
      object edUbahNeraca: TsEdit
        Left = 0
        Top = 0
        Width = 612
        Height = 21
        Color = 16513526
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Masukkan Angka Kemudian tekan + atau - untuk merubah Nilai Saldo'
        OnEnter = edUbahNeracaEnter
        OnExit = edUbahNeracaExit
        OnKeyDown = edUbahNeracaKeyDown
        OnKeyPress = edUbahNeracaKeyPress
        Align = alTop
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
      object GridNeraca: TcxGrid
        Left = 0
        Top = 21
        Width = 612
        Height = 334
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object TvNeraca: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsNeraca
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          Styles.Inactive = dm.cxstyl1
          Styles.Selection = dm.cxstyl1
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'kd_kiraan'
            Options.Editing = False
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Nama Akun'
            DataBinding.FieldName = 'n_kiraan'
            Options.Editing = False
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Saldo Awal'
            DataBinding.FieldName = 'saldo_awal'
            Options.Editing = False
          end
        end
        object LvNeraca: TcxGridLevel
          GridView = TvNeraca
        end
      end
    end
    object ABLabaRugi: TTabSheet
      Caption = 'LABA-RUGI'
      ImageIndex = 1
      object pnlLabaRugi: TPanel
        Left = 0
        Top = 355
        Width = 612
        Height = 33
        Align = alBottom
        Color = 15456965
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16053492
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object lbl4: TLabel
          Left = 368
          Top = 6
          Width = 54
          Height = 13
          Caption = 'Laba / Rugi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 8
          Top = 6
          Width = 58
          Height = 13
          Caption = 'Pendapatan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 199
          Top = 6
          Width = 26
          Height = 13
          Caption = 'Biaya'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edMasuk: TsCurrencyEdit
          Left = 80
          Top = 4
          Width = 113
          Height = 21
          AutoSize = False
          Color = 16513526
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
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
          DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object edKeluar: TsCurrencyEdit
          Left = 232
          Top = 4
          Width = 120
          Height = 21
          AutoSize = False
          Color = 16513526
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
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
          DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object edLabaRugi: TsCurrencyEdit
          Left = 441
          Top = 4
          Width = 120
          Height = 20
          AutoSize = False
          Color = 16513526
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
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
          DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
      end
      object edUbahLabaRugi: TsEdit
        Left = 0
        Top = 0
        Width = 612
        Height = 21
        Color = 16513526
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Masukkan Angka Kemudian tekan + atau - untuk merubah Nilai Saldo'
        OnEnter = edUbahNeracaEnter
        OnExit = edUbahNeracaExit
        OnKeyDown = edUbahNeracaKeyDown
        OnKeyPress = edUbahLabaRugiKeyPress
        Align = alTop
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
      object GridLabaRugi: TcxGrid
        Left = 0
        Top = 21
        Width = 612
        Height = 334
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object TvLabaRugi: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsLabaRugi
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          Styles.Inactive = dm.cxstyl1
          Styles.Selection = dm.cxstyl1
          object tTvLabaRugikd_kiraan: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'kd_kiraan'
            Options.Editing = False
          end
          object tTvLabaRugin_kiraan: TcxGridDBColumn
            Caption = 'Nama Akun'
            DataBinding.FieldName = 'n_kiraan'
            Options.Editing = False
          end
          object tTvLabaRugisaldo_awal: TcxGridDBColumn
            Caption = 'Saldo Awal'
            DataBinding.FieldName = 'saldo_awal'
          end
        end
        object LvLabaRugi: TcxGridLevel
          GridView = TvLabaRugi
        end
      end
    end
  end
  object panel1: TsPanel
    Left = 620
    Top = 33
    Width = 150
    Height = 416
    Align = alRight
    TabOrder = 2
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
  end
  object dsNeraca: TDataSource
    DataSet = ZqNeraca
    Left = 32
    Top = 208
  end
  object dsLabaRugi: TDataSource
    DataSet = ZqLabaRugi
    Left = 208
    Top = 200
  end
  object ZqNeraca: TMyQuery
    Connection = dm.db_conn
    Left = 84
    Top = 145
  end
  object ZqLabaRugi: TMyQuery
    Connection = dm.db_conn
    Left = 204
    Top = 137
  end
  object sknprvdr1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 80
    Top = 16
  end
end
