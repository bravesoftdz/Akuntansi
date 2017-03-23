unit u_daftar_return_kirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxImageComboBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, sButton, Buttons, sSpeedButton,
  ExtCtrls, sPanel, sSkinProvider, 
  StdCtrls, MemDS, DBAccess, MyAccess, cxCustomData, cxFilter, cxData,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

type
  Tf_daftar_return_kirim = class(TForm)
    sknprvdr1: TsSkinProvider;
    ds_rinci_return_kirim: TDataSource;
    Q_rinci_return_kirim: TMyQuery;
    ds_return_kirim: TDataSource;
    Q_return_kirim: TMyQuery;
    ds_daftar_return_kirim: TDataSource;
    Q_daftar_return_kirim: TMyQuery;
    panel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton1: TsButton;
    sButton3: TsButton;
    p2: TsPanel;
    sButton2: TsButton;
    grid: TcxGrid;
    t_data1: TcxGridDBTableView;
    t_datatgl: TcxGridDBColumn;
    t_datano_refrensi: TcxGridDBColumn;
    t_dataketerangan: TcxGridDBColumn;
    t_datadebet: TcxGridDBColumn;
    t_data2: TcxGridDBTableView;
    t_data2Column1: TcxGridDBColumn;
    t_data2Column2: TcxGridDBColumn;
    t_data2Column3: TcxGridDBColumn;
    t_data2Column4: TcxGridDBColumn;
    t_data2Column5: TcxGridDBColumn;
    t_data0: TcxGridDBTableView;
    t_data0ix_setor: TcxGridDBColumn;
    l_data0: TcxGridLevel;
    l_data1: TcxGridLevel;
    l_data2: TcxGridLevel;
    t_data0kd_return_kirim: TcxGridDBColumn;
    t_data0tgl_return_kirim: TcxGridDBColumn;
    t_data0nilai_faktur: TcxGridDBColumn;
    t_data0pengguna: TcxGridDBColumn;
    t_data0n_pelanggan: TcxGridDBColumn;
    t_data0kd_kirim: TcxGridDBColumn;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure t_data0FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_return_kirim: Tf_daftar_return_kirim;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_daftar_return_kirim.segarkan;
begin
  fungsi.SQLExec(Q_return_kirim,
    'select *,IF(IFNULL(ix_return_kirim,0)=0,0,1) as posted from vw_list_return_kirim where kd_perusahaan= "' +
    dm.kd_perusahaan + '" and month(tgl_return_kirim)="' + 
    dm.Bulan + '" and year(tgl_return_kirim)="' + dm.Tahun +
    '" order by tgl_return_kirim DESC', true);

  fungsi.SQLExec(Q_daftar_return_kirim,
    'select * from tb_jurnal_global where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and no_ix="' + Q_return_kirim.fieldbyname('ix_return_kirim').AsString +
    '"', true);

  fungsi.SQLExec(Q_rinci_return_kirim,
    'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from vw_jurnal_rinci  where kd_perusahaan= ''' +
    dm.kd_perusahaan + ''' and ix_jurnal = "' + Q_return_kirim.fieldbyname
    ('ix_return_kirim').AsString + '"', true);

  t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_return_kirim.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_return_kirim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(self.Handle);
  action := cafree;
  f_daftar_return_kirim := nil;
end;

procedure Tf_daftar_return_kirim.sb_1Click(Sender: TObject);
begin
  Close;
end;

procedure Tf_daftar_return_kirim.sb_2Click(Sender: TObject);
var
  posisi: Integer;
begin
  posisi := t_data0.DataController.DataSource.DataSet.RecNo;
  segarkan;
  t_data0.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_return_kirim.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_daftar_return_kirim.gridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  if ALevel = l_data1 then
  begin
    p1.Visible := True;
    p2.Visible := False;
  end
  else
  begin
    p1.Visible := False;
    p2.Visible := True;
  end;
end;

procedure Tf_daftar_return_kirim.t_data0FocusedRecordChanged(Sender:
  TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
  TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  fungsi.SQLExec(Q_daftar_return_kirim,
    'select * from tb_jurnal_global where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and no_ix="' + Q_return_kirim.fieldbyname('ix_return_kirim').AsString +
    '"', true);

  fungsi.SQLExec(Q_rinci_return_kirim,
    'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from vw_jurnal_rinci  where kd_perusahaan= ''' +
    dm.kd_perusahaan + ''' and ix_jurnal = "' + Q_return_kirim.fieldbyname
    ('ix_return_kirim').AsString + '"', true);

  t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_return_kirim.sButton1Click(Sender: TObject);
begin
  fungsi.SQLExec(Q_daftar_return_kirim,
    'select * from tb_jurnal_global where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and refr="RK" and month(tgl)="' + dm.Bulan +
    '" and year(tgl)="' + dm.Tahun + '" order by tgl DESC', true);

  fungsi.SQLExec(Q_rinci_return_kirim,
    'select * from vw_jurnal_rinci  where kd_perusahaan= ''' + 
    dm.kd_perusahaan + ''' and refr="RK" and bulan=''' + dm.Bulan +
    ''' and tahun=''' + dm.Tahun + '''', true);
end;

procedure Tf_daftar_return_kirim.sButton2Click(Sender: TObject);
begin
  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe, 'call sp_jurnal_return_kirim("' + 
      dm.kd_perusahaan + '","' + Q_return_kirim.fieldbyname('kd_return_kirim').AsString
      + '")', False);
    dm.db_conn.commit;
    ShowMessage('Proses Posting jurnal Return kirim Pembelian Berhasil....');

    sb_2Click(Self);
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('Proses Posting Gagal... '#10#13'' + e.Message);
    end;
  end;
end;

procedure Tf_daftar_return_kirim.sButton3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_rinci where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + 
    dm.Tahun + '" and refr="RK"', true);

  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
  dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL RETURN KIRIM';
  dm.laporan.ShowReport;
end;

end.

