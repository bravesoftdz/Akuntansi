object F_asset: TF_asset
  Left = 457
  Top = 225
  BorderStyle = bsDialog
  Caption = 'Asset Perusahaan'
  ClientHeight = 261
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel3: TsLabel
    Left = 8
    Top = 56
    Width = 45
    Height = 13
    Caption = 'Qty Asset'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel1: TsLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Kode Asset'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel2: TsLabel
    Left = 216
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Tgl. Perolehan'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel4: TsLabel
    Left = 216
    Top = 56
    Width = 47
    Height = 13
    Caption = 'Total Nilai'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel5: TsLabel
    Left = 8
    Top = 80
    Width = 74
    Height = 13
    Caption = 'Umur Ekonomis'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel10: TsLabel
    Left = 150
    Top = 84
    Width = 37
    Height = 13
    Caption = 'Tahun'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object sLabel6: TsLabel
    Left = 8
    Top = 32
    Width = 57
    Height = 13
    Caption = 'Nama Asset'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel11: TsLabel
    Left = 216
    Top = 80
    Width = 56
    Height = 13
    Caption = 'Nilai Residu'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object b_simpan: TsButton
    Left = 328
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 8
    OnClick = b_simpanClick
    SkinData.SkinSection = 'BUTTON'
  end
  object ed_kode: TsEdit
    Left = 96
    Top = 8
    Width = 113
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
  object de_tanggal: TsDateEdit
    Left = 288
    Top = 8
    Width = 121
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
  end
  object ce_Qty: TsCurrencyEdit
    Left = 96
    Top = 56
    Width = 97
    Height = 21
    AutoSize = False
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
    DisplayFormat = '###,###,##0;-###,###,##0;0'
  end
  object ce_nilai: TsCurrencyEdit
    Left = 288
    Top = 56
    Width = 121
    Height = 21
    AutoSize = False
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
    DisplayFormat = '###,###,##0;-###,###,##0;0'
  end
  object ce_umur: TsCurrencyEdit
    Left = 96
    Top = 80
    Width = 49
    Height = 21
    AutoSize = False
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
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
    DisplayFormat = '###,###,##0;-###,###,##0;0'
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 112
    Width = 401
    Height = 97
    Caption = 'Kode Akun'
    TabOrder = 7
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel9: TsLabel
      Left = 8
      Top = 64
      Width = 86
      Height = 13
      Caption = 'Kiraan Akum. Dep'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object l_kirAkDep: TsLabel
      Left = 192
      Top = 68
      Width = 201
      Height = 13
      AutoSize = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object l_kirDep: TsLabel
      Left = 192
      Top = 44
      Width = 201
      Height = 13
      AutoSize = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object l_kirAsset: TsLabel
      Left = 192
      Top = 20
      Width = 201
      Height = 13
      AutoSize = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object sLabel8: TsLabel
      Left = 8
      Top = 40
      Width = 82
      Height = 13
      Caption = 'Kiraan Depresiasi'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel7: TsLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Kiraan Asset'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5786691
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cb_asset: TcxLookupComboBox
      Left = 96
      Top = 16
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'kd_kiraan'
      Properties.ListColumns = <
        item
          Caption = 'Kode'
          FieldName = 'kd_kiraan'
        end
        item
          Caption = 'Nama'
          FieldName = 'n_kiraan'
        end>
      Properties.ListSource = ds_kiraan
      Properties.OnChange = cb_assetPropertiesChange
      TabOrder = 0
      Width = 89
    end
    object cb_dep: TcxLookupComboBox
      Left = 96
      Top = 40
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'kd_kiraan'
      Properties.ListColumns = <
        item
          Caption = 'Kode'
          FieldName = 'kd_kiraan'
        end
        item
          Caption = 'Nama'
          FieldName = 'n_kiraan'
        end>
      Properties.ListSource = ds_kiraan
      Properties.OnChange = cb_depPropertiesChange
      TabOrder = 1
      Width = 89
    end
    object cb_Ak_dep: TcxLookupComboBox
      Left = 96
      Top = 64
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'kd_kiraan'
      Properties.ListColumns = <
        item
          Caption = 'Kode'
          FieldName = 'kd_kiraan'
        end
        item
          Caption = 'Nama'
          FieldName = 'n_kiraan'
        end>
      Properties.ListSource = ds_kiraan
      Properties.OnChange = cb_Ak_depPropertiesChange
      TabOrder = 2
      Width = 89
    end
  end
  object ed_nama: TsEdit
    Left = 96
    Top = 32
    Width = 313
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
  object ce_res: TsCurrencyEdit
    Left = 288
    Top = 80
    Width = 121
    Height = 21
    AutoSize = False
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    DisplayFormat = '###,###,##0;-###,###,##0;0'
  end
  object ds_kiraan: TDataSource
    DataSet = Q_kiraan
    Left = 40
    Top = 224
  end
  object Q_kiraan: TMyQuery
    Connection = dm.db_conn
    Left = 8
    Top = 224
  end
end
