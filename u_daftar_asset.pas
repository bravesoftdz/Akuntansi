unit u_daftar_asset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCalendar, cxCurrencyEdit, sButton, Buttons,
  sSpeedButton, ExtCtrls, sPanel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, sSkinProvider, mySQLDbTables, cxCustomData, cxFilter, cxData,
  StdCtrls;

type
  Tf_daftar_asset = class(TForm)
    grid: TcxGrid;
    t_data1: TcxGridDBTableView;
    t_datakd_asset: TcxGridDBColumn;
    t_dataNm_asset: TcxGridDBColumn;
    t_datatgl_perolehan: TcxGridDBColumn;
    t_datajumlah_nilai: TcxGridDBColumn;
    t_datasusut_bulan: TcxGridDBColumn;
    t_dataakum_penyusutan: TcxGridDBColumn;
    t_dataresidu: TcxGridDBColumn;
    t_datanilai_buku: TcxGridDBColumn;
    t_data2: TcxGridDBTableView;
    t_data2Column1: TcxGridDBColumn;
    t_data2Column2: TcxGridDBColumn;
    t_data2Column3: TcxGridDBColumn;
    t_data2Column4: TcxGridDBColumn;
    t_data2Column5: TcxGridDBColumn;
    l_data: TcxGridLevel;
    panel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    sknprvdr1: TsSkinProvider;
    ds_asset: TDataSource;
    Q_asset: TmySQLQuery;
    p2: TsPanel;
    sButton4: TsButton;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure t_data1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_asset: Tf_daftar_asset;

implementation

uses
  u_dm, u_utama, u_asset, UFungsi;

{$R *.dfm}

procedure Tf_daftar_asset.segarkan;
begin
{  fungsi.SQLExec(Q_asset,'select * from vw_asset where kd_perusahaan= '''+
  dm.kd_perusahaan+'''',true);
}
  fungsi.SQLExec(Q_asset, 'call sp_asset("' + dm.kd_perusahaan + '","'
    + formatdatetime('yyyy-MM-dd', encodedate(strtoint(f_utama.sb.Panels[7].Text),
    strtoint(f_utama.sb.Panels[6].Text), 1)) + '")', true);
end;

procedure Tf_daftar_asset.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_asset.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_daftar_asset.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

procedure Tf_daftar_asset.sButton1Click(Sender: TObject);
var
  posisi: Integer;
begin
  application.CreateForm(tf_asset, f_asset);
  f_asset.baru;
  f_asset.ShowModal;
  posisi := t_data1.DataController.DataSource.DataSet.RecNo;
  segarkan;
  t_data1.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_asset.sButton2Click(Sender: TObject);
var
  posisi: Integer;
begin
  application.CreateForm(tf_asset, f_asset);
  f_asset.ubah;
  f_asset.ShowModal;

  posisi := t_data1.DataController.DataSource.DataSet.RecNo;
  segarkan;
  t_data1.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_asset.sButton3Click(Sender: TObject);
begin
  if MessageBox(0, 'Benarkah' + #13 + #10 + 'Anda akan menghapus data ini???',
    'Hapus data Asset', MB_ICONQUESTION or MB_YESNO) = mrYes then
  begin
    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe, 'delete from tb_asset where kd_perusahaan="' +
        Q_asset.fieldbyname('kd_perusahaan').AsString + '" and kd_asset="' +
        Q_asset.fieldbyname('kd_asset').AsString + '"', false);
      dm.db_conn.Commit;
      segarkan;
    except
      on e: exception do
      begin
        dm.db_conn.Rollback;
        showmessage('penghapusan data gagal '#10#13'' + e.Message);
      end;
    end;
  end;
end;

procedure Tf_daftar_asset.t_data1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  sbutton2Click(sender);
end;

procedure Tf_daftar_asset.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(self.Handle);
  action := cafree;
  f_daftar_asset := nil;
end;

procedure Tf_daftar_asset.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_daftar_asset.sButton4Click(Sender: TObject);
begin
  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe, 'call sp_penyusutan("' + dm.kd_perusahaan
      + '","' + formatdatetime('yyyy-MM-dd', encodedate(strtoint(f_utama.sb.Panels
      [7].Text), strtoint(f_utama.sb.Panels[6].Text), 1)) + '")', false);
    dm.db_conn.Commit;
    showmessage('proses Posting Daftar Harta Tetap kedalam Jurnal berhasil.....');

  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('Proses Posting Gagal, ahir gagal '#10#13'' + e.Message);
    end;
  end;
end;

end.

