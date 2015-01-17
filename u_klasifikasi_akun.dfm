object f_klasifikasi_akun: Tf_klasifikasi_akun
  Left = 494
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Klasifikasi Akun'
  ClientHeight = 314
  ClientWidth = 339
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
  object p2: TsPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 314
    Align = alClient
    TabOrder = 1
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sLabel3: TsLabel
      Left = 8
      Top = 8
      Width = 209
      Height = 31
      Caption = 'Hirarki Akun (Level 2)'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 5786691
      Font.Height = -27
      Font.Name = 'Arial Narrow'
      Font.Style = []
    end
    object sLabel4: TsLabel
      Left = 8
      Top = 48
      Width = 194
      Height = 28
      Caption = 
        'Dari Hirarki akun (no klas) pada Level 1, '#13#10'tentukan pos-pos pad' +
        'a level 2'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object grid_sub_klas: TcxGrid
      Left = 8
      Top = 80
      Width = 321
      Height = 185
      TabOrder = 0
      object t_sub_klas: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dm.ds_subklas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        object t_sub_klasno_klas: TcxGridDBColumn
          DataBinding.FieldName = 'no_klas'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownRows = 9
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'no_klas'
          Properties.ListColumns = <
            item
              Caption = 'No'
              FieldName = 'no_klas'
            end
            item
              Caption = 'Klas'
              FieldName = 'n_klas'
            end>
          Properties.ListSource = dm.ds_klas
        end
        object t_sub_klasno_sub_klas: TcxGridDBColumn
          DataBinding.FieldName = 'no_sub_klas'
        end
        object t_sub_klasn_sub_klas: TcxGridDBColumn
          DataBinding.FieldName = 'n_sub_klas'
        end
      end
      object l_subklas: TcxGridLevel
        GridView = t_sub_klas
      end
    end
    object sButton3: TsButton
      Left = 184
      Top = 272
      Width = 67
      Height = 25
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = sButton3Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton4: TsButton
      Left = 256
      Top = 272
      Width = 67
      Height = 25
      Caption = 'Batal'
      TabOrder = 2
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton5: TsButton
      Left = 104
      Top = 272
      Width = 67
      Height = 25
      Caption = '< Kembali'
      TabOrder = 3
      OnClick = sButton5Click
      SkinData.SkinSection = 'BUTTON'
    end
    object cxDBNavigator1: TcxDBNavigator
      Left = 8
      Top = 272
      Width = 88
      Height = 25
      Buttons.First.Visible = False
      Buttons.PriorPage.Visible = False
      Buttons.Prior.Visible = False
      Buttons.Next.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.Last.Visible = False
      Buttons.Insert.Visible = True
      Buttons.Append.Visible = False
      Buttons.Delete.Visible = True
      Buttons.Edit.Visible = False
      Buttons.Refresh.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = dm.ds_subklas
      TabOrder = 4
    end
  end
  object p3: TsPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 314
    Align = alClient
    TabOrder = 2
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sLabel5: TsLabel
      Left = 8
      Top = 32
      Width = 42
      Height = 13
      Caption = 'Sub Klas'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel6: TsLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Kode Akun'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel7: TsLabel
      Left = 8
      Top = 56
      Width = 56
      Height = 13
      Caption = 'Nama Akun'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sButton6: TsButton
      Left = 264
      Top = 88
      Width = 67
      Height = 25
      Caption = 'Hapus'
      TabOrder = 5
      OnClick = sButton6Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton7: TsButton
      Left = 192
      Top = 88
      Width = 67
      Height = 25
      Caption = 'Simpan'
      TabOrder = 3
      OnClick = sButton7Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton8: TsButton
      Left = 120
      Top = 88
      Width = 67
      Height = 25
      Caption = 'Baru'
      TabOrder = 4
      OnClick = sButton8Click
      SkinData.SkinSection = 'BUTTON'
    end
    object ce_kiraan: TcxTextEdit
      Left = 72
      Top = 8
      TabOrder = 0
      Width = 121
    end
    object ed_kiraan: TcxTextEdit
      Left = 72
      Top = 56
      TabOrder = 2
      Width = 257
    end
    object cb_subklas: TcxLookupComboBox
      Left = 72
      Top = 32
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'no_sub_klas'
      Properties.ListColumns = <
        item
          Caption = 'No'
          FieldName = 'no_sub_klas'
        end
        item
          Caption = 'Nama Sub Klas'
          FieldName = 'n_sub_klas'
        end>
      Properties.ListSource = dm.ds_subklas
      TabOrder = 1
      Width = 257
    end
  end
  object p1: TsPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 314
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 8
      Top = 8
      Width = 209
      Height = 31
      Caption = 'Hirarki Akun (Level 1)'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 5786691
      Font.Height = -27
      Font.Name = 'Arial Narrow'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 48
      Width = 304
      Height = 28
      Caption = 
        'Program telah menentukan secara baku pos-pos pada Level 1, '#13#10'and' +
        'a dapat melakukan penyesuaian nama'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object grid: TcxGrid
      Left = 8
      Top = 88
      Width = 321
      Height = 169
      TabOrder = 0
      object t_data: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dm.ds_klas
        DataController.KeyFieldNames = 'no_klas'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        object t_datano_klas: TcxGridDBColumn
          DataBinding.FieldName = 'no_klas'
          Options.Editing = False
          Width = 83
        end
        object t_datan_klas: TcxGridDBColumn
          DataBinding.FieldName = 'n_klas'
          Width = 601
        end
      end
      object l_data: TcxGridLevel
        GridView = t_data
      end
    end
    object sButton1: TsButton
      Left = 152
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Lanjutkan >'
      TabOrder = 1
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 248
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 2
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
