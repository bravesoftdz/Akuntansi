program accounting;

uses
  Vcl.Forms,
  UTerbilang in '..\..\tools\pascal\UTerbilang.pas',
  u_akun_penting in '..\src\u_akun_penting.pas' {f_akun_penting},
  u_asset in '..\src\u_asset.pas' {F_asset},
  u_bayar_hutang in '..\src\u_bayar_hutang.pas' {f_bayar_hutang},
  u_bayar_piutang in '..\src\u_bayar_piutang.pas' {f_bayar_piutang},
  u_cari in '..\src\u_cari.pas' {f_cari},
  u_daftar_akun in '..\src\u_daftar_akun.pas' {f_daftar_akun},
  u_daftar_asset in '..\src\u_daftar_asset.pas' {f_daftar_asset},
  u_daftar_bayar_hutang in '..\src\u_daftar_bayar_hutang.pas' {f_daftar_bayar_hutang},
  u_daftar_bayar_piutang in '..\src\u_daftar_bayar_piutang.pas' {f_daftar_bayar_piutang},
  u_daftar_hutang in '..\src\u_daftar_hutang.pas' {f_daftar_hutang},
  u_daftar_jurnal_umum in '..\src\u_daftar_jurnal_umum.pas' {f_daftar_jurnal_umum},
  u_daftar_kas in '..\src\u_daftar_kas.pas' {f_daftar_kas},
  u_daftar_kirim in '..\src\u_daftar_kirim.pas' {f_daftar_kirim},
  u_daftar_koreksi in '..\src\u_daftar_koreksi.pas' {f_daftar_koreksi},
  u_daftar_pembelian in '..\src\u_daftar_pembelian.pas' {f_daftar_pembelian},
  u_daftar_penjualan in '..\src\u_daftar_penjualan.pas' {f_daftar_penjualan},
  u_daftar_piutang in '..\src\u_daftar_piutang.pas' {f_daftar_piutang},
  u_daftar_return in '..\src\u_daftar_return.pas' {f_daftar_return},
  u_daftar_return_kirim in '..\src\u_daftar_return_kirim.pas' {f_daftar_return_kirim},
  u_dm in '..\src\u_dm.pas' {dm: TDataModule},
  u_GJurnal in '..\src\u_GJurnal.pas' {F_GJurnal},
  u_Jurnal_Kas in '..\src\u_Jurnal_Kas.pas' {f_Jurnal_Kas},
  u_klasifikasi_akun in '..\src\u_klasifikasi_akun.pas' {f_klasifikasi_akun},
  U_Login in '..\src\U_Login.pas' {F_Login},
  u_utama in '..\src\u_utama.pas' {f_utama},
  uSaldoAwal in '..\src\uSaldoAwal.pas' {FSaldoAwal},
  UFungsi in '..\..\tools\pascal\UFungsi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tf_utama, f_utama);
  Application.Run;
end.
