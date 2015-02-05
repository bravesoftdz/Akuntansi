object f_utama: Tf_utama
  Left = 62
  Top = 148
  Width = 830
  Height = 500
  Caption = 'Account Of Profit'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 830
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sb: TsStatusBar
    Left = 0
    Top = 416
    Width = 814
    Height = 25
    Hint = 'Double Klick Untuk Mengganti Periode Akun'
    Panels = <
      item
        Alignment = taCenter
        Text = 'USER'
        Width = 50
      end
      item
        Alignment = taCenter
        Text = 'NAMA USER'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'profit@localhost'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'KDTK'
        Width = 50
      end
      item
        Alignment = taCenter
        Text = 'NAMA TOKO'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = 'Periode :'
        Width = 60
      end
      item
        Alignment = taCenter
        Text = '04'
        Width = 30
      end
      item
        Alignment = taCenter
        Text = '2013'
        Width = 45
      end
      item
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = True
    OnDblClick = sbDblClick
    SkinData.SkinSection = 'STATUSBAR'
  end
  object sCoolBar1: TsPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 81
    Align = alTop
    BorderWidth = 5
    ParentBackground = True
    ParentColor = True
    TabOrder = 1
    SkinData.SkinSection = 'TOOLBAR'
    object sb_penyesuaian: TsSpeedButton
      Left = 526
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Laporan'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_laporan
      ImageIndex = 4
      Images = dm.image
      Reflected = True
    end
    object sBitBtn1: TsSpeedButton
      Left = 662
      Top = 6
      Width = 146
      Height = 69
      Cursor = crHandPoint
      Caption = 'Keluar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sBitBtn1Click
      Align = alRight
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 6
      Images = dm.image
      Reflected = True
    end
    object sSpeedButton1: TsSpeedButton
      Left = 6
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Jurnal Umum'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_Buku_besar
      ImageIndex = 5
      Images = dm.image
      Reflected = True
    end
    object sSpeedButton2: TsSpeedButton
      Left = 266
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Penjualan'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_penjualan
      ImageIndex = 0
      Images = dm.image
      Reflected = True
    end
    object sSpeedButton3: TsSpeedButton
      Left = 136
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Pembelian'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_pembelian
      ImageIndex = 1
      Images = dm.image
      Reflected = True
    end
    object sSpeedButton4: TsSpeedButton
      Left = 396
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Kas dan Bank'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_kas
      ImageIndex = 3
      Images = dm.image
      Reflected = True
    end
  end
  object tc_child: TsTabControl
    Left = 0
    Top = 81
    Width = 814
    Height = 24
    Cursor = crHandPoint
    Align = alTop
    HotTrack = True
    PopupMenu = pm1
    TabOrder = 2
    Visible = False
    OnChange = tc_childChange
    SkinData.SkinSection = 'PAGECONTROL'
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 88
    object Pengaturan1: TMenuItem
      Caption = 'Pengaturan'
      object AKlasifikasiAkun1: TMenuItem
        Caption = 'Klasifikasi Akun'
        OnClick = AKlasifikasiAkun1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object BDaftarAkunPerkiraan1: TMenuItem
        Action = ac_kiraan_buku_besar
      end
      object AkunPenting1: TMenuItem
        Caption = 'Akun Penting'
        OnClick = AkunPenting1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SaldoAwalAkun1: TMenuItem
        Caption = 'Saldo Awal Akun'
        OnClick = SaldoAwalAkun1Click
      end
      object HitungUlangSaldoAhir1: TMenuItem
        Caption = 'Hitung Ulang Historical Balance'
        OnClick = HitungUlangSaldoAhir1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object DefaultPerusahaan1: TMenuItem
        Caption = 'Default Perusahaan'
        OnClick = DefaultPerusahaan1Click
      end
    end
    object utupBuku1: TMenuItem
      Caption = 'Tutup Buku'
      object utupBukuAhirBulan1: TMenuItem
        Caption = 'Tutup Buku Ahir Bulan'
        OnClick = utupBukuAhirBulan1Click
      end
      object utupBukuAhirTahun1: TMenuItem
        Caption = 'Tutup Buku Ahir Tahun'
        OnClick = utupBukuAhirTahun1Click
      end
    end
    object Alatalat1: TMenuItem
      Caption = 'Alat-alat'
      object CekJurnalyangtidakBalance1: TMenuItem
        Caption = 'Cek Jurnal yang tidak Balance'
        OnClick = CekJurnalyangtidakBalance1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object UbahSkin1: TMenuItem
        Caption = 'Ubah Skin'
        OnClick = UbahSkin1Click
      end
    end
    object Windows1: TMenuItem
      Caption = 'Windows'
      object Cascade1: TMenuItem
        Action = WindowCascade1
      end
      object Close1: TMenuItem
        Action = WindowClose1
      end
      object MinimizeAll1: TMenuItem
        Action = WindowMinimizeAll1
      end
      object ileHorizontally1: TMenuItem
        Action = WindowTileHorizontal1
      end
      object ileVertically1: TMenuItem
        Action = WindowTileVertical1
      end
      object Arrange1: TMenuItem
        Action = WindowArrange1
      end
    end
    object Pertolongan1: TMenuItem
      Caption = 'Pertolongan'
      object AccountofProfitHelp1: TMenuItem
        Caption = 'Account of Profit Help'
        ShortCut = 112
        OnClick = AccountofProfitHelp1Click
      end
      object CekUpdate1: TMenuItem
        Caption = 'Cek Update'
        OnClick = CekUpdate1Click
      end
    end
  end
  object AL: TActionList
    Left = 40
    Top = 88
    object ac_G_jurnal: TAction
      Caption = 'Jurnal Umum'
      OnExecute = ac_G_jurnalExecute
    end
    object ac_neraca: TAction
      Caption = 'Neraca'
      OnExecute = ac_neracaExecute
    end
    object ac_bk_besar: TAction
      Caption = 'Buku Besar'
      OnExecute = ac_bk_besarExecute
    end
    object ac_tBalance: TAction
      Caption = 'Trial Balance'
      OnExecute = ac_tBalanceExecute
    end
    object ac_laba_rugi: TAction
      Caption = 'Laba Rugi'
      OnExecute = ac_laba_rugiExecute
    end
    object Ac_Jurnal_Kas: TAction
      Caption = 'Jurnal Kas (Keluar Masuk)'
      OnExecute = Ac_Jurnal_KasExecute
    end
    object ac_kiraan_buku_besar: TAction
      Caption = 'Daftar Akun (Perkiraan) dan Buku Besar'
      OnExecute = ac_kiraan_buku_besarExecute
    end
  end
  object ActionManager1: TActionManager
    Left = 104
    Top = 88
    StyleName = 'XP Style'
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Enabled = False
      Hint = 'Close'
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      Enabled = False
      Hint = 'Cascade'
      ImageIndex = 17
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      Enabled = False
      Hint = 'Tile Horizontal'
      ImageIndex = 15
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = '&Tile Vertically'
      Enabled = False
      Hint = 'Tile Vertical'
      ImageIndex = 16
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimize All'
      Enabled = False
      Hint = 'Minimize All'
    end
    object WindowArrange1: TWindowArrange
      Category = 'Window'
      Caption = '&Arrange'
      Enabled = False
    end
  end
  object pm_Buku_besar: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 8
    Top = 8
    object Mi_JurnalUmum: TMenuItem
      Action = ac_G_jurnal
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object df_perkiraan: TMenuItem
      Action = ac_kiraan_buku_besar
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object df_harta_tetap: TMenuItem
      Caption = 'Daftar Harta Tetap'
      OnClick = df_harta_tetapClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object df_jurnal_umum: TMenuItem
      Caption = 'Daftar Transaksi Jurnal Umum'
      OnClick = df_jurnal_umumClick
    end
    object mniN12: TMenuItem
      Caption = '-'
    end
    object mniDaftarStockOpnameSO1: TMenuItem
      Caption = 'Daftar Stock Opname (SO)'
      OnClick = mniDaftarStockOpnameSO1Click
    end
  end
  object pm_penjualan: TPopupMenu
    Left = 272
    Top = 8
    object MenuItem1: TMenuItem
      Caption = 'Pembayaran Piutang Usaha'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Caption = 'Daftar Transaksi Penjualan'
      OnClick = MenuItem3Click
    end
    object mniN10: TMenuItem
      Caption = '-'
    end
    object mniDaftarKirimBarang1: TMenuItem
      Caption = 'Daftar Transaksi Kirim Barang'
      OnClick = mniDaftarKirimBarang1Click
    end
    object mniN11: TMenuItem
      Caption = '-'
    end
    object mniDaftarReturnKirim1: TMenuItem
      Caption = 'Daftar Transaksi Return Kirim'
      OnClick = mniDaftarReturnKirim1Click
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object MenuItem5: TMenuItem
      Caption = 'Daftar Piutang Usaha'
      OnClick = MenuItem5Click
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Caption = 'Daftar Transaksi Pembayaran Piutang Usaha'
      OnClick = MenuItem7Click
    end
  end
  object pm_pembelian: TPopupMenu
    Left = 136
    Top = 8
    object mnibayahutang: TMenuItem
      Caption = 'Pembayaran Hutang Usaha'
      OnClick = mnibayahutangClick
    end
    object MenuItem9: TMenuItem
      Caption = '-'
    end
    object mnitransaksibeli: TMenuItem
      Caption = 'Daftar Transaksi Pembelian'
      OnClick = mnitransaksibeliClick
    end
    object mniN9: TMenuItem
      Caption = '-'
    end
    object mniDaftarReturnPembelian1: TMenuItem
      Caption = 'Daftar Transaksi Return Pembelian'
      OnClick = mniDaftarReturnPembelian1Click
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object mnihutang: TMenuItem
      Caption = 'Daftar Hutang Usaha'
      OnClick = mnihutangClick
    end
    object MenuItem13: TMenuItem
      Caption = '-'
    end
    object mnitransaksihutang: TMenuItem
      Caption = 'Daftar Transaksi Pembayaran Hutang Usaha'
      OnClick = mnitransaksihutangClick
    end
  end
  object pm_kas: TPopupMenu
    Left = 400
    Top = 8
    object MenuItem17: TMenuItem
      Action = Ac_Jurnal_Kas
    end
    object MenuItem16: TMenuItem
      Caption = '-'
    end
    object DaftarTransaksiKasMasukdanKeluar1: TMenuItem
      Caption = 'Daftar Transaksi Kas (Keluar Masuk)'
      OnClick = DaftarTransaksiKasMasukdanKeluar1Click
    end
  end
  object pm_laporan: TPopupMenu
    Left = 528
    Top = 8
    object MenuItem22: TMenuItem
      Caption = 'Laporan Keuangan'
      object rialBalance2: TMenuItem
        Action = ac_tBalance
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Neraca2: TMenuItem
        Action = ac_neraca
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object LabaRugi2: TMenuItem
        Action = ac_laba_rugi
      end
    end
    object MenuItem23: TMenuItem
      Caption = '-'
    end
    object MenuItem24: TMenuItem
      Caption = 'Transaksi Jurnal'
      OnClick = MenuItem24Click
    end
    object MenuItem25: TMenuItem
      Caption = '-'
    end
    object MenuItem26: TMenuItem
      Caption = 'Buku Besar'
      object BukuBesar3: TMenuItem
        Action = ac_bk_besar
      end
      object DaftarAkun1: TMenuItem
        Caption = 'Daftar Akun'
        OnClick = DaftarAkun1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object JurnalUmum3: TMenuItem
        Caption = 'Jurnal Umum'
        OnClick = JurnalUmum3Click
      end
    end
    object MenuItem27: TMenuItem
      Caption = 'Kas dan Bank'
      object JurnalKasMasuk1: TMenuItem
        Caption = 'Jurnal Kas Masuk'
        OnClick = JurnalKasMasuk1Click
      end
      object JurnalKasKeluar1: TMenuItem
        Caption = 'Jurnal Kas Keluar'
        OnClick = JurnalKasKeluar1Click
      end
    end
    object MenuItem28: TMenuItem
      Caption = '-'
    end
    object Pembelian1: TMenuItem
      Caption = 'Jurnal Pembelian'
      OnClick = Pembelian1Click
    end
    object HutangUsaha1: TMenuItem
      Caption = 'Hutang Usaha'
      object DaftarHutangUsaha1: TMenuItem
        Caption = 'Daftar Hutang Usaha'
        OnClick = DaftarHutangUsaha1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object JurnalPembayaranHutangUsaha1: TMenuItem
        Caption = 'Jurnal Pembayaran Hutang Usaha'
        OnClick = JurnalPembayaranHutangUsaha1Click
      end
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object PenJualan1: TMenuItem
      Caption = 'Jurnal Penjualan'
      OnClick = PenJualan1Click
    end
    object PiutangUsaha1: TMenuItem
      Caption = 'Piutang Usaha'
      object DaftarPiutangUsaha1: TMenuItem
        Caption = 'Daftar Piutang Usaha'
        OnClick = DaftarPiutangUsaha1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object JurnalPembayaranPiutangUsaha1: TMenuItem
        Caption = 'Jurnal Pembayaran Piutang Usaha'
        OnClick = JurnalPembayaranPiutangUsaha1Click
      end
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object HartaTetap1: TMenuItem
      Caption = 'Daftar Harta Tetap'
      OnClick = HartaTetap1Click
    end
  end
  object pm1: TPopupMenu
    Left = 864
    Top = 88
    object utup1: TMenuItem
      Caption = 'Tutup'
      OnClick = utup1Click
    end
    object MenuItem15: TMenuItem
      Caption = '-'
    end
    object utupSemua1: TMenuItem
      Caption = 'Tutup Semua'
      OnClick = utupSemua1Click
    end
    object MenuItem18: TMenuItem
      Caption = '-'
    end
    object utupSemuaKecualiini1: TMenuItem
      Caption = 'Tutup Semua Kecuali ini'
      OnClick = utupSemuaKecualiini1Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 80
    Top = 192
  end
end
