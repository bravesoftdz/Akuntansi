unit u_daftar_hutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, mySQLDbTables, sSkinProvider, sButton, Buttons, sSpeedButton,
  ExtCtrls, sPanel, uTerbilang, cxCustomData, cxFilter, cxData,
  StdCtrls;

type
  Tf_daftar_hutang = class(TForm)
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton3: TsButton;
    sknprvdr1: TsSkinProvider;
    ds_bayar_hutang: TDataSource;
    Q_bayar_hutang: TmySQLQuery;
    ds_hutang: TDataSource;
    Q_hutang: TmySQLQuery;
    grid: TcxGrid;
    t_data0: TcxGridDBTableView;
    t_data2: TcxGridDBTableView;
    t_data2Column4: TcxGridDBColumn;
    l_data0: TcxGridLevel;
    l_data2: TcxGridLevel;
    t_data0faktur: TcxGridDBColumn;
    t_data0tanggal: TcxGridDBColumn;
    t_data0hutang_awal: TcxGridDBColumn;
    t_data0dibayar: TcxGridDBColumn;
    t_data0return_beli: TcxGridDBColumn;
    t_data0hutang: TcxGridDBColumn;
    t_data0n_supp: TcxGridDBColumn;
    t_data0jatuh_tempo: TcxGridDBColumn;
    t_data0user: TcxGridDBColumn;
    t_data2tgl: TcxGridDBColumn;
    t_data2keterangan: TcxGridDBColumn;
    t_data2no_refrensi: TcxGridDBColumn;
    Q_return: TmySQLQuery;
    ds_return: TDataSource;
    l_data3: TcxGridLevel;
    t_data3: TcxGridDBTableView;
    t_data3kd_return: TcxGridDBColumn;
    t_data3tgl_return: TcxGridDBColumn;
    t_data3disk_rp: TcxGridDBColumn;
    t_data3nilai_faktur: TcxGridDBColumn;
    t_data3pengguna: TcxGridDBColumn;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
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
  f_daftar_hutang: Tf_daftar_hutang;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_daftar_hutang.segarkan;
begin

  fungsi.SQLExec(Q_hutang, 'select * from vw_hutang where kd_perusahaan="' +
    dm.kd_perusahaan +
    '" and status=''belum lunas'' order by tanggal DESC', true);
{
fungsi.SQLExec(Q_hutang,'select * from vw_hutang where kd_perusahaan="'+
dm.kd_perusahaan+'" order by tanggal DESC',true);
}
  fungsi.SQLExec(Q_bayar_hutang,
    'select * from vw_jurnal_rinci  where kd_perusahaan= ''' + f_utama.sb.Panels
    [3].Text + ''' and (refr=''PH'' or refr=''KJ'') and rujukan IS NOT NULL', true);

  fungsi.SQLExec(Q_return, 'SELECT A1.* FROM tb_return_global A1 INNER JOIN ' +
    'vw_hutang A2 ON A2.kd_perusahaan = A1.kd_perusahaan AND A2.faktur = A1.faktur_receipt',
    true);
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
  posisi := t_data0.DataController.DataSource.DataSet.RecNo;
  segarkan;
  t_data0.DataController.DataSource.DataSet.RecNo := posisi;
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

end.

