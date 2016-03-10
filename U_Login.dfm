object F_Login: TF_Login
  Left = 351
  Top = 226
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 275
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel4: TsLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 19
    Caption = 'Kode User'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
  end
  object sLabel5: TsLabel
    Left = 8
    Top = 64
    Width = 82
    Height = 19
    Caption = 'Nama User'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
  end
  object sLabel6: TsLabel
    Left = 8
    Top = 120
    Width = 70
    Height = 19
    Caption = 'Password'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5786691
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
  end
  object l_1: TsLabel
    Left = 8
    Top = 232
    Width = 216
    Height = 16
    Caption = 'Tekan F2 untuk merubah Perusahaan'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sBitBtn2: TsBitBtn
    Left = 304
    Top = 192
    Width = 81
    Height = 33
    Cursor = crHandPoint
    Caption = '&Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
    OnClick = sBitBtn2Click
    NumGlyphs = 2
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton1: TsButton
    Left = 200
    Top = 192
    Width = 75
    Height = 33
    Caption = '&Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Ed_Kd_User: TsEdit
    Left = 32
    Top = 32
    Width = 353
    Height = 27
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Ed_Kd_UserChange
    OnKeyDown = Ed_Kd_UserKeyDown
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
  object Ed_N_User: TsEdit
    Left = 32
    Top = 88
    Width = 353
    Height = 27
    Color = 16513526
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnEnter = Ed_N_UserEnter
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
  object Ed_Password: TsEdit
    Left = 32
    Top = 144
    Width = 353
    Height = 27
    Color = 16513526
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    PasswordChar = '@'
    TabOrder = 2
    OnKeyDown = Ed_PasswordKeyDown
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
  object sb: TsStatusBar
    Left = 0
    Top = 254
    Width = 394
    Height = 21
    Cursor = crHandPoint
    Hint = 'Klick Untuk Mengganti Perusahaan'
    Panels = <
      item
        Alignment = taCenter
        Width = 75
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = True
    OnClick = sbClick
    SkinData.SkinSection = 'STATUSBAR'
  end
end
