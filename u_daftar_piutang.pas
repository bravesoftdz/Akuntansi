unit u_daftar_piutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, mySQLDbTables, sSkinProvider,
  StdCtrls, sButton, Buttons, sSpeedButton, ExtCtrls, sPanel,uTerbilang;

type
  Tf_daftar_piutang = class(TForm)
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton3: TsButton;
    sknprvdr1: TsSkinProvider;
    grid: TcxGrid;
    t_data0: TcxGridDBTableView;
    t_data0faktur: TcxGridDBColumn;
    t_data0tanggal: TcxGridDBColumn;
    t_data0jatuh_tempo: TcxGridDBColumn;
    t_data0n_supp: TcxGridDBColumn;
    t_data0hutang_awal: TcxGridDBColumn;
    t_data0dibayar: TcxGridDBColumn;
    t_data0return_beli: TcxGridDBColumn;
    t_data0hutang: TcxGridDBColumn;
    t_data0user: TcxGridDBColumn;
    t_data2: TcxGridDBTableView;
    t_data2tgl: TcxGridDBColumn;
    t_data2no_refrensi: TcxGridDBColumn;
    t_data2keterangan: TcxGridDBColumn;
    t_data2Column4: TcxGridDBColumn;
    t_data3: TcxGridDBTableView;
    l_data0: TcxGridLevel;
    l_data2: TcxGridLevel;
    l_data3: TcxGridLevel;
    Q_piutang: TmySQLQuery;
    Q_bayar_piutang: TmySQLQuery;
    Q_return: TmySQLQuery;
    ds_return: TDataSource;
    ds_bayar_hutang: TDataSource;
    ds_hutang: TDataSource;
    Q_return_kirim: TmySQLQuery;
    ds_return_kirim: TDataSource;
    l_data4: TcxGridLevel;
    t_data4: TcxGridDBTableView;
    t_data4kd_return_kirim: TcxGridDBColumn;
    t_data4tgl_return_kirim: TcxGridDBColumn;
    t_data4nilai_faktur: TcxGridDBColumn;
    t_data4pengguna: TcxGridDBColumn;
    t_data3kd_return_jual: TcxGridDBColumn;
    t_data3nilai_faktur: TcxGridDBColumn;
    t_data3pengguna: TcxGridDBColumn;
    t_data3pengawas: TcxGridDBColumn;
    t_data3simpan_pada: TcxGridDBColumn;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE);message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_piutang: Tf_daftar_piutang;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure Tf_daftar_piutang.segarkan;
begin

fungsi.SQLExec(Q_piutang,'select * from _vw_piutang where kd_perusahaan='+
quotedstr(f_utama.sb.Panels[3].Text)+' and status=''belum lunas'' order by tanggal DESC',true);

fungsi.SQLExec(Q_bayar_piutang,'select * from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and refr=''PP'' and rujukan IS NOT NULL',true);

fungsi.SQLExec(Q_return,'SELECT A1.* FROM tb_return_jual_global A1 INNER JOIN '+
'_vw_piutang A2 ON A2.kd_perusahaan = A1.kd_perusahaan AND A2.faktur = A1.kd_transaksi',true);

fungsi.SQLExec(Q_return_kirim,'SELECT A1.* FROM tb_return_kirim_global A1 INNER JOIN '+
'_vw_piutang A2 ON A2.kd_perusahaan = A1.kd_perusahaan AND A2.faktur = A1.kd_kirim',true);
end;

procedure Tf_daftar_piutang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(metu_kabeh) then
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

procedure Tf_daftar_piutang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
Action:= caFree;
f_daftar_piutang:=nil;
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
var posisi: Integer;
begin
posisi:= t_data0.DataController.DataSource.DataSet.RecNo;
segarkan;
t_data0.DataController.DataSource.DataSet.RecNo:= posisi;
end;


procedure Tf_daftar_piutang.sButton3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,'select * from vw_jual_barang where no_transaksi="'+
  Q_piutang.fieldbyname('faktur').AsString+'" and kd_perusahaan='+quotedstr(f_utama.sb.Panels[3].Text)+'',true);
  if dm.Q_laporan.Eof then
  begin
    fungsi.SQLExec(dm.Q_laporan,'select * from vw_cetak_kirim where kd_perusahaan="'+
    f_utama.sb.Panels[3].Text+'" and kd_kirim="'+Q_piutang.fieldbyname('faktur').AsString+'"',true);
    dm.laporan.LoadFromFile(WPath + 'laporan\gp_kirim_rinci.fr3');
    dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)+'Rupiah';
    dm.laporan.ShowReport;
  end else
  begin
    dm.laporan.LoadFromFile(WPath + 'laporan/k_struk_retail.fr3');
    dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('grand_total').AsFloat)+'Rupiah';
    dm.laporan.ShowReport;
  end;
end;

end.
