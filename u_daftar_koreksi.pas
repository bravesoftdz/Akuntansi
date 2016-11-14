unit u_daftar_koreksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxImageComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, sButton,
  Buttons, sSpeedButton, ExtCtrls, sPanel, mySQLDbTables, sSkinProvider;

type
  Tf_daftar_koreksi = class(TForm)
    sknprvdr1: TsSkinProvider;
    ds_rinci_koreksi: TDataSource;
    Q_rinci_koreksi: TmySQLQuery;
    ds_koreksi: TDataSource;
    Q_koreksi: TmySQLQuery;
    ds_daftar_koreksi: TDataSource;
    Q_daftar_koreksi: TmySQLQuery;
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
    t_data0kd_koreksi: TcxGridDBColumn;
    t_data0tgl_koreksi: TcxGridDBColumn;
    t_data0qty_selisih: TcxGridDBColumn;
    t_data0harga_pokok: TcxGridDBColumn;
    t_data0user: TcxGridDBColumn;
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
  f_daftar_koreksi: Tf_daftar_koreksi;

implementation

uses u_utama, u_dm, U_fungsi;

{$R *.dfm}

procedure Tf_daftar_koreksi.segarkan;
begin
fungsi.SQLExec(Q_koreksi,'select *,IF(IFNULL(ix_koreksi,0)=0,0,1) as posted from tb_koreksi_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and month(tgl_koreksi)="'+f_utama.sb.Panels[6].Text+'" and year(tgl_koreksi)="'+
f_utama.sb.Panels[7].Text+'" order by tgl_koreksi DESC',true);

fungsi.SQLExec(Q_daftar_koreksi,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_koreksi.fieldbyname('ix_koreksi').AsString+'"',true);

fungsi.SQLExec(Q_rinci_koreksi,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_koreksi.fieldbyname('ix_koreksi').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_koreksi.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_koreksi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(self.Handle);
action:= cafree;
f_daftar_koreksi:=nil;
end;

procedure Tf_daftar_koreksi.sb_1Click(Sender: TObject);
begin
Close;
end;

procedure Tf_daftar_koreksi.sb_2Click(Sender: TObject);
var posisi: Integer;
begin
posisi:= t_data0.DataController.DataSource.DataSet.RecNo;
segarkan;
t_data0.DataController.DataSource.DataSet.RecNo:= posisi;
end;

procedure Tf_daftar_koreksi.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_daftar_koreksi.gridActiveTabChanged(Sender: TcxCustomGrid;
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

procedure Tf_daftar_koreksi.t_data0FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
fungsi.SQLExec(Q_daftar_koreksi,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and no_ix="'+Q_koreksi.fieldbyname('ix_koreksi').AsString+'"',true);

fungsi.SQLExec(Q_rinci_koreksi,'select ix_jurnal,no_urut,kd_akun,n_kiraan,debet,kredit from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and ix_jurnal = "'+Q_koreksi.fieldbyname('ix_koreksi').AsString+'"',true);

t_data1.ViewData.Expand(True);
end;

procedure Tf_daftar_koreksi.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(Q_daftar_koreksi,'select * from tb_jurnal_global where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and refr="OJ" and month(tgl)="'+
f_utama.sb.Panels[6].Text+'" and year(tgl)="'+f_utama.sb.Panels[7].Text+'" order by tgl DESC',true);

fungsi.SQLExec(Q_rinci_koreksi,'select * from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and refr="OJ" and bulan='''+
f_utama.sb.Panels[6].Text+''' and tahun='''+f_utama.sb.Panels[7].Text+'''',true);
end;

procedure Tf_daftar_koreksi.sButton2Click(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
  fungsi.SQLExec(dm.Q_Exe,'call sp_jurnal_koreksi("'+f_utama.sb.Panels[3].Text+'","'+
  Q_koreksi.fieldbyname('kd_koreksi').AsString+'")',False);
  dm.db_conn.commit;
  ShowMessage('Proses Posting jurnal Stock Opname Berhasil....');

  sb_2Click(Self);
except on e:exception do
  begin
    dm.db_conn.Rollback;
    showmessage('Proses Posting Gagal... '#10#13'' +e.Message);
  end;
end;
end;

procedure Tf_daftar_koreksi.sButton3Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from _vw_jurnal_rinci where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and bulan= "'+f_utama.sb.Panels[6].Text+'" and tahun="'+
f_utama.sb.Panels[7].Text+'" and refr="OJ"',true);

dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL STOCK OPNAME';
dm.laporan.ShowReport;
end;

end.
