unit u_daftar_piutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, mySQLDbTables, sSkinProvider, sButton, Buttons, sSpeedButton,
  ExtCtrls, sPanel, uTerbilang, cxCustomData, cxFilter, cxData, StdCtrls;

type
  Tf_daftar_piutang = class(TForm)
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton3: TsButton;
    sknprvdr1: TsSkinProvider;
    grid: TcxGrid;
    Table0: TcxGridDBTableView;
    tvTable0faktur: TcxGridDBColumn;
    tvTable0tanggal: TcxGridDBColumn;
    tvTable0jatuh_tempo: TcxGridDBColumn;
    tvTable0n_supp: TcxGridDBColumn;
    tvTable0hutang_awal: TcxGridDBColumn;
    tvTable0dibayar: TcxGridDBColumn;
    tvTable0return_beli: TcxGridDBColumn;
    tvTable0hutang: TcxGridDBColumn;
    tvTable0user: TcxGridDBColumn;
    Table1: TcxGridDBTableView;
    tvTable1tgl: TcxGridDBColumn;
    tvTable1no_refrensi: TcxGridDBColumn;
    tvTable1keterangan: TcxGridDBColumn;
    tvTable1Column4: TcxGridDBColumn;
    Table2: TcxGridDBTableView;
    Level0: TcxGridLevel;
    Q_piutang: TmySQLQuery;
    Q_bayar_piutang: TmySQLQuery;
    Q_return: TmySQLQuery;
    ds_return: TDataSource;
    ds_bayar_hutang: TDataSource;
    ds_hutang: TDataSource;
    Q_return_kirim: TmySQLQuery;
    ds_return_kirim: TDataSource;
    Table3: TcxGridDBTableView;
    tvTable3kd_return_kirim: TcxGridDBColumn;
    tvTable3tgl_return_kirim: TcxGridDBColumn;
    tvTable3nilai_faktur: TcxGridDBColumn;
    tvTable3pengguna: TcxGridDBColumn;
    tvTable_data3kd_return_jual: TcxGridDBColumn;
    tvTable_data3nilai_faktur: TcxGridDBColumn;
    tvTable_data3pengguna: TcxGridDBColumn;
    tvTable_data3pengawas: TcxGridDBColumn;
    tvTable_data3simpan_pada: TcxGridDBColumn;
    Level1: TcxGridLevel;
    Level2: TcxGridLevel;
    Level3: TcxGridLevel;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure gridActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_piutang: Tf_daftar_piutang;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_daftar_piutang.segarkan;
begin
  fungsi.SQLExec(Q_piutang, Format('SELECT * FROM vw_piutang where kd_perusahaan = "%s" '+
    'AND status="belum lunas" order by tanggal DESC',[dm.kd_perusahaan]), true);
end;

procedure Tf_daftar_piutang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
  begin
    if Assigned(active) then
    begin
      idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
      f_utama.tc_child.Tag := -1;
      f_utama.tc_child.TabIndex := idx;
      f_utama.tc_child.Tag := 0;
    end;
  end;
end;

procedure Tf_daftar_piutang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := caFree;
  f_daftar_piutang := nil;
end;

procedure Tf_daftar_piutang.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(Self.Handle);
end;

procedure Tf_daftar_piutang.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_daftar_piutang.sb_2Click(Sender: TObject);
var
  posisi: Integer;
begin
  posisi := Table0.DataController.DataSource.DataSet.RecNo;
  segarkan;
  Table0.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_piutang.sButton3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jual_barang where no_transaksi="' + Q_piutang.fieldbyname('faktur').AsString
    + '" and kd_perusahaan=' + quotedstr(dm.kd_perusahaan) + '', true);
  if dm.Q_laporan.Eof then
  begin
    fungsi.SQLExec(dm.Q_laporan,
      'select * from vw_cetak_kirim where kd_perusahaan="' + dm.kd_perusahaan
      + '" and kd_kirim="' + Q_piutang.fieldbyname('faktur').AsString + '"', true);
    dm.laporan.LoadFromFile(dm.Path + 'laporan\gp_kirim_rinci.fr3');
    dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)
      + 'Rupiah';
    dm.laporan.ShowReport;
  end
  else
  begin
    dm.laporan.LoadFromFile(dm.Path + 'laporan/k_struk_retail.fr3');
    dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('grand_total').AsFloat)
      + 'Rupiah';
    dm.laporan.ShowReport;
  end;
end;

procedure Tf_daftar_piutang.gridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  if ALevel = Level1 then
  fungsi.SQLExec(Q_bayar_piutang, Format('SELECT a.tgl, a.no_refrensi, a.keterangan, '+
    'b.rujukan, b.kredit FROM tb_jurnal_rinci b INNER JOIN tb_jurnal_global a '+
    'ON(a.no_ix = b.ix_jurnal) AND (a.kd_perusahaan = b.kd_perusahaan) '+
    'WHERE a.kd_perusahaan = "%s" AND rujukan = "%s"',[dm.kd_perusahaan,
    Q_piutang.fieldbyname('faktur').AsString]), true)
  else
  if ALevel = Level2 then
  fungsi.SQLExec(Q_return, Format('SELECT * FROM tb_return_jual_global where '+
    'kd_perusahaan = "%s" AND kd_transaksi = "%s"',[dm.kd_perusahaan,
    Q_piutang.fieldbyname('faktur').AsString]), true)
  else
  if ALevel = Level3 then
  fungsi.SQLExec(Q_return_kirim, Format('SELECT * FROM tb_return_kirim_global '+
    'WHERE kd_perusahaan = "%s" AND kd_kirim = "%s"',[dm.kd_perusahaan,
    Q_piutang.fieldbyname('faktur').AsString]), true);
end;

end.

