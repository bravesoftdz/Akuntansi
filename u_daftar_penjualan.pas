unit u_daftar_penjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, sSkinManager, StdCtrls, Buttons,
  sBitBtn, ExtCtrls, sPanel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxMaskEdit, cxCurrencyEdit,
  sSpeedButton, mySQLDbTables, sSkinProvider, cxImageComboBox, sButton;

type
  Tf_daftar_penjualan = class(TForm)
    grid: TcxGrid;
    t_data1: TcxGridDBTableView;
    l_data1: TcxGridLevel;
    panel1: TsPanel;
    l_data2: TcxGridLevel;
    t_data2: TcxGridDBTableView;
    t_data2Column1: TcxGridDBColumn;
    t_data2Column2: TcxGridDBColumn;
    t_data2Column3: TcxGridDBColumn;
    t_data2Column4: TcxGridDBColumn;
    t_data2Column5: TcxGridDBColumn;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    ds_daftar_jual: TDataSource;
    Q_daftar_jual: TmySQLQuery;
    Q_rinci_jual: TmySQLQuery;
    ds_rinci_jual: TDataSource;
    sknprvdr1: TsSkinProvider;
    l_data0: TcxGridLevel;
    t_data0: TcxGridDBTableView;
    ds_setor: TDataSource;
    Q_setor: TmySQLQuery;
    t_data0user: TcxGridDBColumn;
    t_data0kd_jaga: TcxGridDBColumn;
    t_data0tanggal: TcxGridDBColumn;
    t_data0status: TcxGridDBColumn;
    t_data0return_jual: TcxGridDBColumn;
    t_data0discount: TcxGridDBColumn;
    t_data0kredit: TcxGridDBColumn;
    t_data0price_oh: TcxGridDBColumn;
    t_data0jumlah_setor_oh: TcxGridDBColumn;
    t_data0jumlah_setor_real: TcxGridDBColumn;
    t_data0selisih: TcxGridDBColumn;
    t_data0ix_setor: TcxGridDBColumn;
    p1: TsPanel;
    sButton1: TsButton;
    p2: TsPanel;
    sButton2: TsButton;
    sButton3: TsButton;
    tv_data0debit: TcxGridDBColumn;
    tv_data0CashOut: TcxGridDBColumn;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE);message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure t_data0FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure gridActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_penjualan: Tf_daftar_penjualan;

implementation

uses u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure tf_daftar_penjualan.segarkan;
begin
fungsi.SQLExec(Q_setor,'select *,IF(IFNULL(ix_setor,0)=0,0,1) as posted from tb_login_kasir where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and month(tanggal)="'+f_utama.sb.Panels[6].Text+'" and year(tanggal)="'+
f_utama.sb.Panels[7].Text+'" order by tanggal DESC',true);

fungsi.SQLExec(Q_daftar_jual,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_setor.fieldbyname('ix_setor').AsString+'"',true);

fungsi.SQLExec(Q_rinci_jual,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_setor.fieldbyname('ix_setor').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_penjualan.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(dm.metu_kabeh) then
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

procedure Tf_daftar_penjualan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(self.Handle);
action:= cafree;
f_daftar_penjualan:=nil;
end;

procedure Tf_daftar_penjualan.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_daftar_penjualan.sb_2Click(Sender: TObject);
var posisi: Integer;
begin
posisi:= t_data0.DataController.DataSource.DataSet.RecNo;
segarkan;
t_data0.DataController.DataSource.DataSet.RecNo:= posisi;
end;

procedure Tf_daftar_penjualan.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_daftar_penjualan.t_data0FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
fungsi.SQLExec(Q_daftar_jual,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_setor.fieldbyname('ix_setor').AsString+'"',true);

fungsi.SQLExec(Q_rinci_jual,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_setor.fieldbyname('ix_setor').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_penjualan.gridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
if ALevel = l_data1 then
begin
p1.Visible:= True;
p2.Visible:= False;
end else
begin
p1.Visible:= False;
p2.Visible:= True;
end;
end;

procedure Tf_daftar_penjualan.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(Q_daftar_jual,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and refr="TJ" and month(tgl)="'+
f_utama.sb.Panels[6].Text+'" and year(tgl)="'+f_utama.sb.Panels[7].Text+'" order by tgl DESC',true);

fungsi.SQLExec(Q_rinci_jual,'select * from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and refr=''TJ'' and bulan='''+
f_utama.sb.Panels[6].Text+''' and tahun='''+f_utama.sb.Panels[7].Text+'''',true);
end;

procedure Tf_daftar_penjualan.sButton2Click(Sender: TObject);
begin
if Q_setor.FieldByName('status').AsString = 'online' then
begin
ShowMessage('data ini tidak dapat di posting '#10#13'Karena masih dalam keadaan online...');
Exit;
end;

dm.db_conn.StartTransaction;
try
  fungsi.SQLExec(dm.Q_Exe,'call sp_setor_kasir_jurnal("'+f_utama.sb.Panels[3].Text+'","'+
  Q_setor.fieldbyname('user').AsString+'","'+Q_setor.fieldbyname('kd_jaga').AsString+'","'+
  formatdatetime('yyyy-MM-dd hh:mm:ss',Q_setor.fieldbyname('tanggal').AsDateTime)+'")',False);
  dm.db_conn.commit;
  ShowMessage('Proses Posting jurnal Penjualan Berhasil....');

  sb_2Click(Self);
except on e:exception do
  begin
    dm.db_conn.Rollback;
    showmessage('Proses Posting Gagal... '#10#13'' +e.Message);
  end;
end;
end;

procedure Tf_daftar_penjualan.sButton3Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from _vw_jurnal_rinci where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and bulan= "'+f_utama.sb.Panels[6].Text+'" and tahun="'+
f_utama.sb.Panels[7].Text+'" and refr="TJ"',true);

dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL PENJUALAN';
dm.laporan.ShowReport;
end;

end.
