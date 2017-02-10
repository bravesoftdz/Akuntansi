unit u_daftar_hutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, sSkinProvider, sButton, Buttons, sSpeedButton,
  ExtCtrls, sPanel, uTerbilang, 
  StdCtrls, MemDS, DBAccess, MyAccess, cxCustomData, cxFilter, cxData;

type
  Tf_daftar_hutang = class(TForm)
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton3: TsButton;
    sknprvdr1: TsSkinProvider;
    ds_bayar_hutang: TDataSource;
    Q_bayar_hutang: TMyQuery;
    ds_hutang: TDataSource;
    Q_hutang: TMyQuery;
    grid: TcxGrid;
    Table0: TcxGridDBTableView;
    Table1: TcxGridDBTableView;
    tvTable1Column4: TcxGridDBColumn;
    Level0: TcxGridLevel;
    tvTable0faktur: TcxGridDBColumn;
    tvTable0tanggal: TcxGridDBColumn;
    tvTable0hutang_awal: TcxGridDBColumn;
    tvTable0dibayar: TcxGridDBColumn;
    tvTable0return_beli: TcxGridDBColumn;
    tvTable0hutang: TcxGridDBColumn;
    tvTable0n_supp: TcxGridDBColumn;
    tvTable0jatuh_tempo: TcxGridDBColumn;
    tvTable0user: TcxGridDBColumn;
    tvTable1tgl: TcxGridDBColumn;
    tvTable1keterangan: TcxGridDBColumn;
    tvTable1no_refrensi: TcxGridDBColumn;
    Q_return: TMyQuery;
    ds_return: TDataSource;
    Table2: TcxGridDBTableView;
    tvTable2kd_return: TcxGridDBColumn;
    tvTable2tgl_return: TcxGridDBColumn;
    tvTable2disk_rp: TcxGridDBColumn;
    tvTable2nilai_faktur: TcxGridDBColumn;
    tvTable2pengguna: TcxGridDBColumn;
    Level1: TcxGridLevel;
    Level2: TcxGridLevel;
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
  f_daftar_hutang: Tf_daftar_hutang;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_daftar_hutang.segarkan;
begin
  fungsi.SQLExec(Q_hutang, Format('SELECT * FROM vw_hutang where kd_perusahaan = "%s" '+
  'AND status="belum lunas" order by tanggal DESC', [dm.kd_perusahaan]), true);
end;

procedure Tf_daftar_hutang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_hutang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := caFree;
  f_daftar_hutang := nil;
end;

procedure Tf_daftar_hutang.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(Self.Handle);
end;

procedure Tf_daftar_hutang.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_daftar_hutang.sb_2Click(Sender: TObject);
var
  posisi: Integer;
begin
  posisi := Table0.DataController.DataSource.DataSet.RecNo;
  segarkan;
  Table0.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_hutang.sButton3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_cetak_receipt where kd_perusahaan="' + dm.kd_perusahaan
    + '" and kd_receipt="' + Q_hutang.fieldbyname('faktur').AsString + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\gp_receipt_rinci.fr3');
  dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)
    + 'Rupiah';
  dm.laporan.ShowReport;
end;

procedure Tf_daftar_hutang.gridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  if ALevel = Level1 then
  fungsi.SQLExec(Q_bayar_hutang, Format('SELECT a.tgl, a.no_refrensi, a.keterangan, '+
    'b.rujukan, b.debet FROM tb_jurnal_rinci b INNER JOIN tb_jurnal_global a '+
    'ON(a.no_ix = b.ix_jurnal) AND (a.kd_perusahaan = b.kd_perusahaan) '+
    'WHERE a.kd_perusahaan = "%s" AND rujukan = "%s"',[dm.kd_perusahaan,
    Q_hutang.fieldbyname('faktur').AsString]), true)
  else
  if ALevel = Level2 then
  fungsi.SQLExec(Q_return, Format('SELECT * FROM tb_return_global WHERE '+
    'kd_perusahaan = "%s" AND faktur_receipt = "%s"',[dm.kd_perusahaan,
    Q_hutang.fieldbyname('faktur').AsString]), true);
end;

end.

