program Accounting;

uses
  fastMM4,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  u_cari in 'u_cari.pas' {f_cari},
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_fungsi in 'U_fungsi.pas',
  u_GJurnal in 'u_GJurnal.pas' {F_GJurnal},
  u_Jurnal_Kas in 'u_Jurnal_Kas.pas' {f_Jurnal_Kas},
  u_utama in 'u_utama.pas' {f_utama},
  u_klasifikasi_akun in 'u_klasifikasi_akun.pas' {f_klasifikasi_akun},
  u_daftar_akun in 'u_daftar_akun.pas' {f_daftar_akun},
  u_bayar_hutang in 'u_bayar_hutang.pas' {f_bayar_hutang},
  u_bayar_piutang in 'u_bayar_piutang.pas' {f_bayar_piutang},
  U_Login in 'U_Login.pas' {F_Login},
  u_asset in 'u_asset.pas' {F_asset},
  u_akun_penting in 'u_akun_penting.pas' {f_akun_penting},
  u_daftar_asset in 'u_daftar_asset.pas' {f_daftar_asset},
  u_daftar_jurnal_umum in 'u_daftar_jurnal_umum.pas' {f_daftar_jurnal_umum},
  u_daftar_penjualan in 'u_daftar_penjualan.pas' {f_daftar_penjualan},
  u_daftar_pembelian in 'u_daftar_pembelian.pas' {f_daftar_pembelian},
  u_daftar_return in 'u_daftar_return.pas' {f_daftar_return},
  u_daftar_return_kirim in 'u_daftar_return_kirim.pas' {f_daftar_return_kirim},
  u_daftar_kirim in 'u_daftar_kirim.pas' {f_daftar_kirim},
  u_daftar_koreksi in 'u_daftar_koreksi.pas' {f_daftar_koreksi},
  u_daftar_hutang in 'u_daftar_hutang.pas' {f_daftar_hutang},
  u_daftar_bayar_hutang in 'u_daftar_bayar_hutang.pas' {f_daftar_bayar_hutang},
  u_daftar_bayar_piutang in 'u_daftar_bayar_piutang.pas' {f_daftar_bayar_piutang},
  u_daftar_kas in 'u_daftar_kas.pas' {f_daftar_kas},
  u_daftar_piutang in 'u_daftar_piutang.pas' {f_daftar_piutang},
  uSaldoAwal in 'uSaldoAwal.pas' {FSaldoAwal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Account of Profit 2.0';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tf_utama, f_utama);
  Application.Run;
end.
