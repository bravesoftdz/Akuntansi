unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ComCtrls, sStatusBar, 
  Menus, ActnList, StdActns, XPStyleActnCtrls, ActnMan, Buttons,
  sSpeedButton, ExtCtrls, sPanel, StdCtrls, inifiles, shellapi,
  sTabControl, UFungsi, System.Actions;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  Tf_utama = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sb: TsStatusBar;
    MainMenu1: TMainMenu;
    AL: TActionList;
    ActionManager1: TActionManager;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    Windows1: TMenuItem;
    Cascade1: TMenuItem;
    Close1: TMenuItem;
    MinimizeAll1: TMenuItem;
    ileHorizontally1: TMenuItem;
    ileVertically1: TMenuItem;
    Arrange1: TMenuItem;
    ac_G_jurnal: TAction;
    ac_neraca: TAction;
    ac_bk_besar: TAction;
    ac_tBalance: TAction;
    ac_laba_rugi: TAction;
    Alatalat1: TMenuItem;
    CekJurnalyangtidakBalance1: TMenuItem;
    Pengaturan1: TMenuItem;
    AKlasifikasiAkun1: TMenuItem;
    N1: TMenuItem;
    BDaftarAkunPerkiraan1: TMenuItem;
    AkunPenting1: TMenuItem;
    SaldoAwalAkun1: TMenuItem;
    N3: TMenuItem;
    utupBuku1: TMenuItem;
    utupBukuAhirBulan1: TMenuItem;
    utupBukuAhirTahun1: TMenuItem;
    pm_Buku_besar: TPopupMenu;
    sCoolBar1: TsPanel;
    sb_penyesuaian: TsSpeedButton;
    sBitBtn1: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    Mi_JurnalUmum: TMenuItem;
    df_perkiraan: TMenuItem;
    df_harta_tetap: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    pm_penjualan: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    pm_pembelian: TPopupMenu;
    mnibayahutang: TMenuItem;
    MenuItem9: TMenuItem;
    mnitransaksibeli: TMenuItem;
    MenuItem11: TMenuItem;
    mnihutang: TMenuItem;
    MenuItem13: TMenuItem;
    mnitransaksihutang: TMenuItem;
    pm_kas: TPopupMenu;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    pm_laporan: TPopupMenu;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    DaftarTransaksiKasMasukdanKeluar1: TMenuItem;
    Neraca2: TMenuItem;
    LabaRugi2: TMenuItem;
    BukuBesar3: TMenuItem;
    DaftarAkun1: TMenuItem;
    N8: TMenuItem;
    JurnalUmum3: TMenuItem;
    JurnalKasMasuk1: TMenuItem;
    JurnalKasKeluar1: TMenuItem;
    PenJualan1: TMenuItem;
    PiutangUsaha1: TMenuItem;
    N10: TMenuItem;
    Pembelian1: TMenuItem;
    HutangUsaha1: TMenuItem;
    N11: TMenuItem;
    HartaTetap1: TMenuItem;
    df_jurnal_umum: TMenuItem;
    DaftarPiutangUsaha1: TMenuItem;
    N13: TMenuItem;
    JurnalPembayaranPiutangUsaha1: TMenuItem;
    DaftarHutangUsaha1: TMenuItem;
    N14: TMenuItem;
    JurnalPembayaranHutangUsaha1: TMenuItem;
    rialBalance2: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Ac_Jurnal_Kas: TAction;
    N2: TMenuItem;
    LogOut: TMenuItem;
    HitungUlangSaldoAhir1: TMenuItem;
    ac_kiraan_buku_besar: TAction;
    N4: TMenuItem;
    UbahSkin1: TMenuItem;
    Pertolongan1: TMenuItem;
    AccountofProfitHelp1: TMenuItem;
    tc_child: TsTabControl;
    pm1: TPopupMenu;
    utup1: TMenuItem;
    MenuItem15: TMenuItem;
    utupSemua1: TMenuItem;
    MenuItem18: TMenuItem;
    utupSemuaKecualiini1: TMenuItem;
    mniN9: TMenuItem;
    mniDaftarReturnPembelian1: TMenuItem;
    mniN10: TMenuItem;
    mniN11: TMenuItem;
    mniDaftarKirimBarang1: TMenuItem;
    mniDaftarReturnKirim1: TMenuItem;
    mniN12: TMenuItem;
    mniDaftarStockOpnameSO1: TMenuItem;
    Timer1: TTimer;
    CekUpdate1: TMenuItem;
    procedure MDIChildCreated(const childHandle: THandle);
    procedure MDIChildDestroyed(const childHandle: THandle);
    procedure ac_G_jurnalExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_neracaExecute(Sender: TObject);
    procedure ac_bk_besarExecute(Sender: TObject);
    procedure ac_tBalanceExecute(Sender: TObject);
    procedure ac_laba_rugiExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn1Click(Sender: TObject);
    procedure Ac_Jurnal_KasExecute(Sender: TObject);
    procedure LogOutClick(Sender: TObject);
    procedure AKlasifikasiAkun1Click(Sender: TObject);
    procedure AkunPenting1Click(Sender: TObject);
    procedure SaldoAwalAkun1Click(Sender: TObject);
    procedure utupBukuAhirBulan1Click(Sender: TObject);
    procedure utupBukuAhirTahun1Click(Sender: TObject);
    procedure CekJurnalyangtidakBalance1Click(Sender: TObject);
    procedure HitungUlangSaldoAhir1Click(Sender: TObject);
    procedure ac_kiraan_buku_besarExecute(Sender: TObject);
    procedure df_harta_tetapClick(Sender: TObject);
    procedure df_jurnal_umumClick(Sender: TObject);
    procedure mnibayahutangClick(Sender: TObject);
    procedure mnitransaksibeliClick(Sender: TObject);
    procedure mnihutangClick(Sender: TObject);
    procedure mnitransaksihutangClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure DaftarTransaksiKasMasukdanKeluar1Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure DaftarAkun1Click(Sender: TObject);
    procedure JurnalUmum3Click(Sender: TObject);
    procedure JurnalKasMasuk1Click(Sender: TObject);
    procedure JurnalKasKeluar1Click(Sender: TObject);
    procedure Pembelian1Click(Sender: TObject);
    procedure DaftarHutangUsaha1Click(Sender: TObject);
    procedure DaftarPiutangUsaha1Click(Sender: TObject);
    procedure PenJualan1Click(Sender: TObject);
    procedure JurnalPembayaranHutangUsaha1Click(Sender: TObject);
    procedure JurnalPembayaranPiutangUsaha1Click(Sender: TObject);
    procedure HartaTetap1Click(Sender: TObject);
    procedure UbahSkin1Click(Sender: TObject);
    procedure historical_balancing;
    procedure AccountofProfitHelp1Click(Sender: TObject);
    procedure panel_auto_width;
    procedure FormCreate(Sender: TObject);
    procedure tc_childChange(Sender: TObject);
    procedure utup1Click(Sender: TObject);
    procedure utupSemua1Click(Sender: TObject);
    procedure utupSemuaKecualiini1Click(Sender: TObject);
    procedure mniDaftarReturnPembelian1Click(Sender: TObject);
    procedure mniDaftarKirimBarang1Click(Sender: TObject);
    procedure mniDaftarReturnKirim1Click(Sender: TObject);
    procedure mniDaftarStockOpnameSO1Click(Sender: TObject);
    procedure sbDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CekUpdate1Click(Sender: TObject);
    procedure cek_update;
    procedure BuatSaldoAwalAkun;
  private
    FVersion : TVersion;
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_utama: Tf_utama;

implementation

uses
  u_cari, u_GJurnal, u_dm, u_Jurnal_Kas, u_klasifikasi_akun, u_daftar_akun,
  u_akun_penting, usaldoawal, u_daftar_asset, u_bayar_hutang, u_bayar_piutang,
  U_Login, acselectskin, u_daftar_jurnal_umum, u_daftar_penjualan,
  u_daftar_pembelian, u_daftar_return, u_daftar_return_kirim, u_daftar_kirim,
  u_daftar_koreksi, u_daftar_bayar_hutang, u_daftar_hutang,
  u_daftar_bayar_piutang, u_daftar_kas, u_daftar_piutang;

{$R *.dfm}

procedure Tf_utama.panel_auto_width;
var
  x: integer;
  y: string;
begin
  for x := 0 to sb.Panels.Count - 1 do
  begin
    y := sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) + 30;
  end;
end;

//add a tab for an MDI child
procedure tf_utama.MDIChildCreated(const childHandle: THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption, TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;

  if f_utama.MDIChildCount > 1 then
  begin
    tc_child.Visible := True;
  end;
end;

//remove a tab for this MDI child
procedure tf_utama.MDIChildDestroyed(const childHandle: THandle);
var
  idx: Integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if f_utama.MDIChildCount = 2 then
    tc_child.Visible := False;
end;

procedure Tf_utama.WmAfterShow(var Msg: TMessage);
begin
  dm.sm.Active := true;
  application.CreateForm(Tf_login, f_login);
  f_login.sb.Panels[0].Text := dm.kd_perusahaan;
  f_login.sb.Panels[1].Text := sb.Panels[4].Text;
  F_Login.sb.Panels[2].Text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  f_login.ShowModal;
end;

procedure Tf_utama.historical_balancing;
begin
  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe, Format('call sp_historical_balancing("%s","%s")',
    [dm.kd_perusahaan, formatdatetime('yyyy-MM-dd', encodedate(strtoint(dm.Tahun),
    strtoint(dm.Bulan), 1))]), false);
    dm.db_conn.Commit;
  except
    dm.db_conn.Rollback;
  end;
end;

procedure Tf_utama.ac_G_jurnalExecute(Sender: TObject);
begin
  application.CreateForm(tf_GJurnal, f_GJurnal);
  f_GJurnal.ShowModal;
end;

procedure Tf_utama.FormShow(Sender: TObject);
begin
  sb.Panels[8].Text := 'Versi: ' + FVersion.AsString;

  sb.Panels[2].Text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  sb.Panels[3].Text := dm.kd_perusahaan;
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_company where kd_perusahaan = "' +
    dm.kd_perusahaan + '"', true);
  sb.Panels[4].Text := dm.Q_temp.fieldbyname('n_perusahaan').AsString;
  caption := 'Account Of Profit (' + sb.Panels[4].Text + '  )';

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure Tf_utama.ac_neracaExecute(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_Trial_balance1,
    'select * from vw_trial_balance where kd_kiraan like ''1%'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' +
    dm.Tahun + '" order by kd_kiraan', true);

  fungsi.SQLExec(dm.Q_trial_balance2,
    'select * from vw_trial_balance_kredit where (kd_kiraan like "' + '2' +
    '%" or kd_kiraan like "' + '3' + '%") and kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun
    + '" order by kd_kiraan', true);

  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_neraca.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.ac_bk_besarExecute(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_buku_besar,
    'select * from vw_buku_besar where kd_perusahaan= "' + dm.kd_perusahaan +
    '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_buku_besar.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.ac_tBalanceExecute(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_Trial_balance1,
    'select * from vw_trial_balance where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun
    + '" order by kd_kiraan', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_trial_balance.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.ac_laba_rugiExecute(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_Trial_balance1,
    'select * from vw_laba_rugi_kredit where (kd_kiraan like "' + '4' +
    '%" or kd_kiraan like "' + '8' + '%") and kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun
    + '" order by kd_kiraan', true);

  fungsi.SQLExec(dm.Q_trial_balance2,
    'select * from vw_laba_rugi where (kd_kiraan like "' + '5' +
    '%" or kd_kiraan like "' + '6' + '%" or kd_kiraan like "' + '7' +
    '%" or kd_kiraan like "' + '9' + '%") and kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun
    + '" order by kd_kiraan', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_laba_rugi.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.FormClose(Sender: TObject; var Action: TCloseAction);
var
  appINI: TIniFile;
begin
  FVersion.Free;
  dm.metu_kabeh := True;
  appINI := TIniFile.Create(dm.AppPath + 'gain.ini');
  try
    appINI.WriteString('akun', 'kd_perusahaan', dm.kd_perusahaan);
  finally
    appINI.Free;
  end;

  action := cafree;
  f_utama := nil;
end;

procedure Tf_utama.sBitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_utama.Ac_Jurnal_KasExecute(Sender: TObject);
begin
  application.CreateForm(tf_jurnal_kas, f_jurnal_kas);
  f_jurnal_kas.ShowModal;
end;

procedure Tf_utama.LogOutClick(Sender: TObject);
begin
  if f_utama.MDIChildCount <> 0 then
  begin
    showmessage('tutup dulu semua windows...');
    exit;
  end;

  application.CreateForm(Tf_login, f_login);
  f_login.sb.Panels[0].Text := dm.kd_perusahaan;
  f_login.sb.Panels[1].Text := sb.Panels[4].Text;
  F_Login.sb.Panels[2].Text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  f_login.ShowModal;
end;

procedure Tf_utama.AKlasifikasiAkun1Click(Sender: TObject);
begin
  application.CreateForm(tf_klasifikasi_akun, f_klasifikasi_akun);
  f_klasifikasi_akun.ShowModal;
end;

procedure Tf_utama.AkunPenting1Click(Sender: TObject);
begin
  if f_akun_penting <> nil then
    f_akun_penting.Show
  else
  begin
    application.CreateForm(tf_akun_penting, f_akun_penting);
    f_akun_penting.segarkan;
    f_akun_penting.Show;
  end;
end;

procedure Tf_utama.SaldoAwalAkun1Click(Sender: TObject);
begin
  if FSaldoAwal = nil then
  begin
    Application.CreateForm(TFSaldoAwal, FsaldoAwal);
    BuatSaldoAwalAkun;
  end;

  FSaldoAwal.Show;
end;

procedure Tf_utama.utupBukuAhirBulan1Click(Sender: TObject);
begin
  if dm.Bulan = '12' then
  begin
    showmessage('sekarang sudah ahir tahun pilih proses tutup buku ahir tahun');
    exit;
  end;

  if messagedlg('Tutup Buku Periode ke-' + dm.Bulan + ' Tahun ' + dm.Bulan + ' '#10#13''#10#13'' +
    'proses tutup buku bulanan adalah proses merubah periode akuntansi '#10#13'' +
    'dan membuat saldo awal tiap perkiraan serta'#10#13'' +
    'membuat jurnal penyesuaian dengan memindahkan saldo '#10#13'' +
    'akun historical balancing ke akun laba tahun berjalan....'#10#13''#10#13'' +
    'proses ini akan menutup aplikasi ini , Yakin???....', mtconfirmation, [mbYes,
    mbNo], 0) = mrYes then
  begin
    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe, 'call sp_tutup_buku_bulan("' + dm.kd_perusahaan
        + '",' + dm.Bulan + ',' + dm.Tahun +')', false);

      dm.db_conn.Commit;
      showmessage('proses tutup buku bulanan berhasil');
      close;
    except
      on e: exception do
      begin
        dm.db_conn.Rollback;
        showmessage('pembuatan saldo awal akun gagal '#10#13'' + e.Message);
      end;
    end;
  end;
end;

procedure Tf_utama.utupBukuAhirTahun1Click(Sender: TObject);
begin
  if dm.Bulan <> '12' then
  begin
    showmessage('sekarang Bukan ahir tahun pilih proses tutup buku ahir Bulan');
    exit;
  end;

  if messagedlg('Tutup Buku Tahun ' + dm.Tahun + ' '#10#13''#10#13'' +
    'proses tutup buku tahunan adalah proses merubah periode akuntansi '#10#13'' +
    'dan membuat saldo awal tiap perkiraan serta'#10#13'' +
    'membuat jurnal penyesuaian dengan memindahkan saldo '#10#13'' +
    'akun historical balancing + akun laba Tahun Berjalan ke Akun Laba ditahan....'#10#13''#10#13'' +
    'proses ini akan menutup aplikasi ini , Yakin???....', mtconfirmation, [mbYes,
    mbNo], 0) = mrYes then
  begin
    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe, 'call sp_tutup_buku_tahun("' + dm.kd_perusahaan
        + '",' + dm.Bulan + ',' + dm.Tahun +
        ')', false);

      dm.db_conn.Commit;
      showmessage('proses tutup buku Tahunan Berhasil berhasil');
      close;
    except
      on e: exception do
      begin
        dm.db_conn.Rollback;
        showmessage('pembuatan saldo awal akun gagal '#10#13'' + e.Message);
      end;
    end;
  end;
end;

procedure Tf_utama.CekJurnalyangtidakBalance1Click(Sender: TObject);
var
  ENT, cetak: string;
  i: integer;
begin
  ent := ''#10#13'';

  fungsi.SQLExec(dm.Q_temp, 'SELECT no_refrensi, tgl, keterangan from tb_jurnal_global '
    +'WHERE no_ix IN (SELECT ix_jurnal FROM tb_jurnal_rinci GROUP BY kd_perusahaan, '+
    'ix_jurnal HAVING SUM(debet)<> SUM(kredit))', true);
  if dm.Q_temp.Eof then
    showmessage('Semua Jurnal Telah Balance...')
  else
  begin
    dm.Q_temp.First;
    for i := 1 to dm.Q_temp.RecordCount do
    begin
      cetak := cetak + inttostr(i) + '. ' + dm.Q_temp.fieldbyname('no_refrensi').AsString
        + ' --> ' + ' (' + dm.Q_temp.fieldbyname('tgl').AsString + ')' + dm.Q_temp.fieldbyname
        ('keterangan').AsString + ent;
      dm.Q_temp.Next;
      dm.Q_temp.Next;
    end;
    showmessage('DAFTAR JURNAL YANG BELUM BALANCE' + ent + ent + cetak);
  end;
end;

procedure Tf_utama.HitungUlangSaldoAhir1Click(Sender: TObject);
begin
  historical_balancing;
end;

procedure Tf_utama.ac_kiraan_buku_besarExecute(Sender: TObject);
begin
  if f_daftar_akun = nil then
    application.CreateForm(tf_daftar_akun, f_daftar_akun);

  f_daftar_akun.Show;
end;

procedure Tf_utama.df_harta_tetapClick(Sender: TObject);
begin
  if f_daftar_asset <> nil then
    f_daftar_asset.Show
  else
  begin
    application.CreateForm(tf_daftar_asset, f_daftar_asset);
    f_daftar_asset.segarkan;
    f_daftar_asset.Show;
  end;
end;

procedure Tf_utama.mnibayahutangClick(Sender: TObject);
begin
  application.CreateForm(tf_bayar_hutang, f_bayar_hutang);
  f_bayar_hutang.jenis := 'hutang';
  f_bayar_hutang.ShowModal;
end;

procedure Tf_utama.mnihutangClick(Sender: TObject);
begin
  if (f_daftar_hutang <> nil) then
  begin
    f_daftar_hutang.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_hutang, f_daftar_hutang);
    f_daftar_hutang.segarkan;
    f_daftar_hutang.Show;
  end;
end;

procedure Tf_utama.MenuItem5Click(Sender: TObject);
begin
  if (f_daftar_piutang <> nil) then
  begin
    f_daftar_piutang.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_piutang, f_daftar_piutang);
    f_daftar_piutang.segarkan;
    f_daftar_piutang.Show;
  end;
end;

procedure Tf_utama.df_jurnal_umumClick(Sender: TObject);
begin
  if (f_daftar_jurnal_umum <> nil) then
  begin
    f_daftar_jurnal_umum.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_jurnal_umum, f_daftar_jurnal_umum);
    f_daftar_jurnal_umum.segarkan;
    f_daftar_jurnal_umum.Show;
  end;
end;

procedure Tf_utama.mnitransaksihutangClick(Sender: TObject);
begin
  if (f_daftar_bayar_hutang <> nil) then
  begin
    f_daftar_bayar_hutang.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_bayar_hutang, f_daftar_bayar_hutang);
    f_daftar_bayar_hutang.segarkan;
    f_daftar_bayar_hutang.Show;
  end;
end;

procedure Tf_utama.MenuItem7Click(Sender: TObject);
begin
  if (f_daftar_bayar_piutang <> nil) then
  begin
    f_daftar_bayar_piutang.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_bayar_piutang, f_daftar_bayar_piutang);
    f_daftar_bayar_piutang.segarkan;
    f_daftar_bayar_piutang.Show;
  end;
end;

procedure Tf_utama.MenuItem3Click(Sender: TObject);
begin
  if (f_daftar_penjualan <> nil) then
  begin
    f_daftar_penjualan.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_penjualan, f_daftar_penjualan);
    f_daftar_penjualan.segarkan;
    f_daftar_penjualan.Show;
  end;
end;

procedure Tf_utama.mnitransaksibeliClick(Sender: TObject);
begin
  if f_daftar_pembelian <> nil then
    f_daftar_pembelian.Show
  else
  begin
    application.CreateForm(tf_daftar_pembelian, f_daftar_pembelian);
    f_daftar_pembelian.segarkan;
    f_daftar_pembelian.Show;
  end;
end;

procedure Tf_utama.DaftarTransaksiKasMasukdanKeluar1Click(Sender: TObject);
begin
  if (f_daftar_kas <> nil) then
  begin
    f_daftar_kas.Show;
  end
  else
  begin
    application.CreateForm(tf_daftar_kas, f_daftar_kas);
    f_daftar_kas.segarkan;
    f_daftar_kas.Show;
  end;
end;

procedure Tf_utama.MenuItem1Click(Sender: TObject);
begin
  application.CreateForm(tf_bayar_piutang, f_bayar_piutang);
  f_bayar_piutang.jenis := 'piutang';
  f_bayar_piutang.ShowModal;
end;

procedure Tf_utama.MenuItem24Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_rinci where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun
    + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
  dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL GLOBAL';
  dm.laporan.ShowReport;
end;

procedure Tf_utama.DaftarAkun1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan, 'select * from vw_perkiraan', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_daftar_akun.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.JurnalUmum3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_global where refr=''GJ'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_umum.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.JurnalKasMasuk1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_global where refr=''KD'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_kas_masuk.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.JurnalKasKeluar1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_global where refr=''KK'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_kas_keluar.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.Pembelian1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_pembelian where kd_perusahaan= "' + dm.kd_perusahaan +
    '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun +
    '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_pembelian.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.DaftarHutangUsaha1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan, 'select * from vw_hutang where kd_perusahaan="' +
    dm.kd_perusahaan +
    '" and status=''belum lunas'' order by tanggal DESC', true);

  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_hutang.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.DaftarPiutangUsaha1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan, 'select * from vw_piutang where kd_perusahaan='
    + quotedstr(dm.kd_perusahaan) +
    ' and status=''belum lunas'' order by tanggal DESC', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_piutang.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.PenJualan1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_global where refr=''TJ'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_penjualan.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.JurnalPembayaranHutangUsaha1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_global where refr=''PH'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_pembayaran_hutang.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.JurnalPembayaranPiutangUsaha1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_global where refr=''PP'' and kd_perusahaan= "' +
    dm.kd_perusahaan + '" and bulan= "' + dm.Bulan + '" and tahun="' + dm.Tahun + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_pembayaran_piutang.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.HartaTetap1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan, 'call sp_asset("' + dm.kd_perusahaan +
    '","' + formatdatetime('yyyy-MM-dd', encodedate(strtoint(dm.Tahun),
    strtoint(dm.Bulan), 1)) + '")', true);

  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_asset.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_utama.UbahSkin1Click(Sender: TObject);
begin
  selectskin(dm.sm);
end;

procedure Tf_utama.AccountofProfitHelp1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('hh.exe'), PChar(dm.Path +
    'tools/bantuan.chm::/Account_of_profit.htm'), nil, SW_SHOW);
end;

procedure Tf_utama.FormCreate(Sender: TObject);
begin
  {$IFDEF VER150}
    DecimalSeparator := '.';
    ThousandSeparator := ',';
    ShortDateFormat := 'dd/mm/yyyy';
    ShortTimeFormat := 'hh:nn:ss';
  {$ELSE}
    FormatSettings.DecimalSeparator := '.';
    FormatSettings.ThousandSeparator := ',';
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    FormatSettings.ShortTimeFormat := 'hh:nn:ss';
  {$ENDIF}
  FVersion := TAppVersion.Create(Application.ExeName);
  cek_update;
end;

procedure Tf_utama.tc_childChange(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Show;
      Break;
    end;
  end;
end;

procedure Tf_utama.utup1Click(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Close;
      Break;
    end;
  end;
end;

procedure Tf_utama.utupSemua1Click(Sender: TObject);
var
  h: Integer;
begin
  for h := 0 to f_utama.MDIChildCount - 1 do
  begin
    f_utama.MDIChildren[h].Close;
  end;
  tc_child.Visible := False;
end;

procedure Tf_utama.utupSemuaKecualiini1Click(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle <> cHandle then
    begin
      MDIChildren[k].Close;
    end;
  end;
  tc_child.Visible := False;
end;

procedure Tf_utama.mniDaftarReturnPembelian1Click(Sender: TObject);
begin
  if f_daftar_return <> nil then
    f_daftar_return.Show
  else
  begin
    application.CreateForm(tf_daftar_return, f_daftar_return);
    f_daftar_return.segarkan;
    f_daftar_return.Show;
  end;
end;

procedure Tf_utama.mniDaftarKirimBarang1Click(Sender: TObject);
begin
  if f_daftar_kirim <> nil then
    f_daftar_kirim.Show
  else
  begin
    application.CreateForm(tf_daftar_kirim, f_daftar_kirim);
    f_daftar_kirim.segarkan;
    f_daftar_kirim.Show;
  end;
end;

procedure Tf_utama.mniDaftarReturnKirim1Click(Sender: TObject);
begin
  if f_daftar_return_kirim <> nil then
    f_daftar_return_kirim.Show
  else
  begin
    application.CreateForm(tf_daftar_return_kirim, f_daftar_return_kirim);
    f_daftar_return_kirim.segarkan;
    f_daftar_return_kirim.Show;
  end;
end;

procedure Tf_utama.mniDaftarStockOpnameSO1Click(Sender: TObject);
begin
  if f_daftar_koreksi <> nil then
    f_daftar_koreksi.Show
  else
  begin
    application.CreateForm(tf_daftar_koreksi, f_daftar_koreksi);
    f_daftar_koreksi.segarkan;
    f_daftar_koreksi.Show;
  end;
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do
    Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do
    Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

function InputPeriode(const ACaption, APrompt, aslinya: string; periode:
  Tstrings): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TComboBox;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := aslinya;
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      Caption := APrompt;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
      WordWrap := True;
    end;
    Edit := TComboBox.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := Prompt.Top + Prompt.Height + 5;
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      Style := csOwnerDrawFixed;
      Items := periode;
      ItemIndex := 0;
      SelectAll;
    end;
    ButtonTop := Edit.Top + Edit.Height + 15;
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
        ButtonWidth, ButtonHeight);
      Form.ClientHeight := Top + Height + 13;
    end;
    if ShowModal = mrOk then
    begin
      Result := Edit.Text;
    end;
  finally
    Form.Free;
  end;
end;

procedure Tf_utama.sbDblClick(Sender: TObject);
var
  periode, asli: string;
  isi_periode: TStrings;
  x: Integer;
begin
  if f_utama.MDIChildCount <> 0 then
  begin
    showmessage('untuk merubah periode akuntansi, Tutup dulu semua windows...');
    exit;
  end;

  asli := dm.Tahun + '-' + dm.Bulan;

  isi_periode := TStringList.Create;
  fungsi.SQLExec(dm.Q_temp,Format('SELECT DISTINCT CONCAT(tahun,"-",LPAD(bulan,2,0)) '+
  'AS Periode FROM tb_jurnal_history WHERE kd_perusahaan = "%s" ORDER BY tahun DESC, '+
  'bulan DESC',[dm.kd_perusahaan]),True);
  
  for x := 1 to dm.Q_temp.RecordCount do
  begin
    isi_periode.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;
  periode := InputPeriode('Periode Akuntansi', 'Masukkan Periode Akuntansi',
    asli, isi_periode);

  dm.SetPeriodeAktif(periode);

  sb.Panels[6].Text := dm.Bulan;
  sb.Panels[7].Text := dm.Tahun;
  
  isi_periode.Free;
end;

procedure Tf_utama.Timer1Timer(Sender: TObject);
begin
  try
    fungsi.SQLExec(dm.Q_koneksi, 'select date(now()) as sekarang', True);

  except
    Timer1.Enabled := False;
    if (MessageDlg('KONEKSI TERPUTUS DENGAN SERVER...' + #13 + #10 + 'coba ' +
      'hubungkan kembali??????', mtWarning, [mbOK], 0) = mrOk) then
    begin
      Timer1.Enabled := True;
    end;
  end;

end;

procedure Tf_utama.CekUpdate1Click(Sender: TObject);
begin
  cek_update;
end;

procedure Tf_utama.cek_update;
var
  LVersiDB, LVersiAPP: TVersion;
  LSql :string;
begin
  LVersiAPP := FVersion;
  LSql := 'SELECT versi_terbaru FROM app_versi WHERE kode="accounting.exe"';
  fungsi.SQLExec(dm.Q_Show, LSql, true);
  LVersiDB := TVersion.Create(dm.Q_Show.FieldByName('versi_terbaru').AsString);

  if CompareVersion(LVersiDB, LVersiAPP) = vHigher then
  begin
    ShowMessage('APLIKASI AKUNTANSI TIDAK DAPAT DIJALANKAN' + #13#10 +
      'aplikasi terbaru dengan versi : ' + LVersiDB.AsString + #13#10 + 'SUDAH DIRILIS...');

    Application.Terminate;
  end;
  LVersiDB.Free;
end;

procedure Tf_utama.BuatSaldoAwalAkun;
begin
  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe, 'call sp_saldo_awal_akun("' + dm.kd_perusahaan
      + '","' + formatdatetime('yyyy-MM-dd', encodedate(strtoint(dm.Tahun),
      strtoint(dm.Bulan), 1)) + '")', false);

    dm.db_conn.Commit;
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('pembuatan saldo awal akun gagal '#10#13'' + e.Message);
    end;
  end;
end;

end.

