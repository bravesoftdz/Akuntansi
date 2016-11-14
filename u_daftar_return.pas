unit u_daftar_return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxImageComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, sButton,
  Buttons, sSpeedButton, ExtCtrls, sPanel, mySQLDbTables, sSkinProvider;

type
  Tf_daftar_return = class(TForm)
    sknprvdr1: TsSkinProvider;
    ds_return: TDataSource;
    Q_return: TmySQLQuery;
    ds_rinci_return: TDataSource;
    Q_rinci_return: TmySQLQuery;
    ds_daftar_return: TDataSource;
    Q_daftar_return: TmySQLQuery;
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
    t_data0kd_return: TcxGridDBColumn;
    t_data0tgl_return: TcxGridDBColumn;
    t_data0nilai_faktur: TcxGridDBColumn;
    t_data0n_supp: TcxGridDBColumn;
    t_data0disk_rp: TcxGridDBColumn;
    t_data0pengguna: TcxGridDBColumn;
    t_data0faktur_receipt: TcxGridDBColumn;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE);message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
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
  f_daftar_return: Tf_daftar_return;

implementation

uses u_utama, u_dm;

{$R *.dfm}

procedure Tf_daftar_return.segarkan;
begin
fungsi.SQLExec(Q_return,'select *,IF(IFNULL(ix_return,0)=0,0,1) as posted from vw_list_return where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and month(tgl_return)="'+f_utama.sb.Panels[6].Text+'" and year(tgl_return)="'+
f_utama.sb.Panels[7].Text+'" order by tgl_return DESC',true);

fungsi.SQLExec(Q_daftar_return,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_return.fieldbyname('ix_return').AsString+'"',true);

fungsi.SQLExec(Q_rinci_return,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_return.fieldbyname('ix_return').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_return.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_return.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(self.Handle);
action:= cafree;
f_daftar_return:=nil;
end;

procedure Tf_daftar_return.sb_1Click(Sender: TObject);
begin
Close;
end;

procedure Tf_daftar_return.sb_2Click(Sender: TObject);
var posisi: Integer;
begin
posisi:= t_data0.DataController.DataSource.DataSet.RecNo;
segarkan;
t_data0.DataController.DataSource.DataSet.RecNo:= posisi;
end;

procedure Tf_daftar_return.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_daftar_return.gridActiveTabChanged(Sender: TcxCustomGrid;
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

procedure Tf_daftar_return.t_data0FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
fungsi.SQLExec(Q_daftar_return,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_return.fieldbyname('ix_return').AsString+'"',true);

fungsi.SQLExec(Q_rinci_return,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_return.fieldbyname('ix_return').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_return.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(Q_daftar_return,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and refr="KJ" and month(tgl)="'+
f_utama.sb.Panels[6].Text+'" and year(tgl)="'+f_utama.sb.Panels[7].Text+'" order by tgl DESC',true);

fungsi.SQLExec(Q_rinci_return,'select * from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and refr="KJ" and bulan='''+
f_utama.sb.Panels[6].Text+''' and tahun='''+f_utama.sb.Panels[7].Text+'''',true);
end;

procedure Tf_daftar_return.sButton2Click(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
  fungsi.SQLExec(dm.Q_Exe,'call sp_jurnal_return("'+f_utama.sb.Panels[3].Text+'","'+
  Q_return.fieldbyname('kd_return').AsString+'")',False);
  dm.db_conn.commit;
  ShowMessage('Proses Posting jurnal Return Pembelian Berhasil....');

  sb_2Click(Self);
except on e:exception do
  begin
    dm.db_conn.Rollback;
    showmessage('Proses Posting Gagal... '#10#13'' +e.Message);
  end;
end;
end;

procedure Tf_daftar_return.sButton3Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from _vw_jurnal_rinci where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and bulan= "'+f_utama.sb.Panels[6].Text+'" and tahun="'+
f_utama.sb.Panels[7].Text+'" and refr="KJ"',true);

dm.laporan.LoadFromFile(WPath + 'laporan\a_jurnal_global.fr3');
dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL RETURN PEMBELIAN';
dm.laporan.ShowReport;
end;

end.
