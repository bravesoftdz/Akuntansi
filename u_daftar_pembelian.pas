unit u_daftar_pembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxImageComboBox,
  sSkinProvider, mySQLDbTables, StdCtrls, sButton, Buttons, sSpeedButton,
  ExtCtrls, sPanel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  Tf_daftar_pembelian = class(TForm)
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
    panel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton1: TsButton;
    sButton3: TsButton;
    p2: TsPanel;
    sButton2: TsButton;
    Q_daftar_beli: TmySQLQuery;
    ds_daftar_beli: TDataSource;
    ds_rinci_beli: TDataSource;
    Q_rinci_beli: TmySQLQuery;
    ds_beli: TDataSource;
    Q_beli: TmySQLQuery;
    sknprvdr1: TsSkinProvider;
    t_data0kd_receipt: TcxGridDBColumn;
    t_data0tgl_receipt: TcxGridDBColumn;
    t_data0nilai_faktur: TcxGridDBColumn;
    t_data0n_supp: TcxGridDBColumn;
    t_data0tunai: TcxGridDBColumn;
    t_data0jatuh_tempo: TcxGridDBColumn;
    t_data0PPN: TcxGridDBColumn;
    t_data0disk_Rp: TcxGridDBColumn;
    t_data0pengguna: TcxGridDBColumn;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE);message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure t_data0FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure sButton1Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure gridActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure sButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_pembelian: Tf_daftar_pembelian;

implementation

uses u_utama, u_dm;

{$R *.dfm}

procedure Tf_daftar_pembelian.segarkan;
begin
fungsi.SQLExec(Q_beli,'select *,IF(IFNULL(ix_receipt,0)=0,0,1) as posted from vw_list_receipt where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and month(tgl_receipt)="'+f_utama.sb.Panels[6].Text+'" and year(tgl_receipt)="'+
f_utama.sb.Panels[7].Text+'" order by tgl_receipt DESC',true);

fungsi.SQLExec(Q_daftar_beli,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_beli.fieldbyname('ix_receipt').AsString+'"',true);

fungsi.SQLExec(Q_rinci_beli,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_beli.fieldbyname('ix_receipt').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_pembelian.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_pembelian.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(self.Handle);
action:= cafree;
f_daftar_pembelian:=nil;
end;

procedure Tf_daftar_pembelian.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_daftar_pembelian.sb_2Click(Sender: TObject);
var posisi: Integer;
begin
posisi:= t_data0.DataController.DataSource.DataSet.RecNo;
segarkan;
t_data0.DataController.DataSource.DataSet.RecNo:= posisi;
end;

procedure Tf_daftar_pembelian.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_daftar_pembelian.t_data0FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
fungsi.SQLExec(Q_daftar_beli,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_beli.fieldbyname('ix_receipt').AsString+'"',true);

fungsi.SQLExec(Q_rinci_beli,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_beli.fieldbyname('ix_receipt').AsString+'"',true);

t_data1.ViewData.Expand(True);

end;

procedure Tf_daftar_pembelian.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(Q_daftar_beli,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and refr="RJ" and month(tgl)="'+
f_utama.sb.Panels[6].Text+'" and year(tgl)="'+f_utama.sb.Panels[7].Text+'" order by tgl DESC',true);

fungsi.SQLExec(Q_rinci_beli,'select * from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and refr=''RJ'' and bulan='''+
f_utama.sb.Panels[6].Text+''' and tahun='''+f_utama.sb.Panels[7].Text+'''',true);

end;

procedure Tf_daftar_pembelian.sButton3Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from _vw_jurnal_rinci where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and bulan= "'+f_utama.sb.Panels[6].Text+'" and tahun="'+
f_utama.sb.Panels[7].Text+'" and refr="RJ"',true);

dm.laporan.LoadFromFile(WPath + 'laporan\a_jurnal_global.fr3');
dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL PEMBELIAN';
dm.laporan.ShowReport;
end;

procedure Tf_daftar_pembelian.gridActiveTabChanged(Sender: TcxCustomGrid;
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

procedure Tf_daftar_pembelian.sButton2Click(Sender: TObject);
begin
dm.My_conn.StartTransaction;
try
  fungsi.SQLExec(dm.Q_Exe,'call sp_jurnal_receipt("'+f_utama.sb.Panels[3].Text+'","'+
  Q_beli.fieldbyname('kd_receipt').AsString+'")',False);
  dm.My_conn.commit;
  ShowMessage('Proses Posting jurnal Pembelian Berhasil....');

  sb_2Click(Self);
except on e:exception do
  begin
    dm.My_conn.Rollback;
    showmessage('Proses Posting Gagal... '#10#13'' +e.Message);
  end;
end;
end;

end.
