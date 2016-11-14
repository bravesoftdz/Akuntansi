unit u_daftar_kas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, mySQLDbTables, sSkinProvider,
  Buttons, sSpeedButton, ExtCtrls, sPanel, cxImageComboBox, StdCtrls,
  sGroupBox, sButton;

type
  Tf_daftar_kas = class(TForm)
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    sknprvdr1: TsSkinProvider;
    ds_rinci_kas: TDataSource;
    Q_rinci_kas: TmySQLQuery;
    ds_kas: TDataSource;
    Q_kas: TmySQLQuery;
    grid: TcxGrid;
    t_data0: TcxGridDBTableView;
    t_data0tgl: TcxGridDBColumn;
    t_data0no_refrensi: TcxGridDBColumn;
    t_data0keterangan: TcxGridDBColumn;
    t_data0debet: TcxGridDBColumn;
    t_data2: TcxGridDBTableView;
    t_data2Column1: TcxGridDBColumn;
    t_data2Column2: TcxGridDBColumn;
    t_data2Column3: TcxGridDBColumn;
    t_data2Column4: TcxGridDBColumn;
    t_data2Column5: TcxGridDBColumn;
    l_data: TcxGridLevel;
    l_data2: TcxGridLevel;
    t_data0Column1: TcxGridDBColumn;
    rg_jenis: TsRadioGroup;
    p1: TsPanel;
    sButton3: TsButton;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE);message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure rg_jenisChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_kas: Tf_daftar_kas;
  j_trans,j_print: string;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure Tf_daftar_kas.segarkan;
begin
fungsi.SQLExec(Q_kas,'select * from tb_jurnal_global where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and '+j_trans+' and month(tgl)='''+
f_utama.sb.Panels[6].Text+''' and year(tgl)='''+f_utama.sb.Panels[7].Text+'''',true);

fungsi.SQLExec(Q_rinci_kas,'select * from _vw_jurnal_rinci  where kd_perusahaan= '''+
f_utama.sb.Panels[3].Text+''' and '+j_trans+' and bulan='''+
f_utama.sb.Panels[6].Text+''' and tahun='''+f_utama.sb.Panels[7].Text+'''',true);
end;  

procedure Tf_daftar_kas.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_kas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
Action:= caFree;
f_daftar_kas:=nil;
end;

procedure Tf_daftar_kas.FormCreate(Sender: TObject);
begin
f_utama.MDIChildCreated(Self.Handle);
end;

procedure Tf_daftar_kas.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_daftar_kas.sb_2Click(Sender: TObject);
var posisi: Integer;
begin
posisi:= t_data0.DataController.DataSource.DataSet.RecNo;
segarkan;
t_data0.DataController.DataSource.DataSet.RecNo:= posisi;
end;

procedure Tf_daftar_kas.rg_jenisChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
case NewIndex of
  0:
  begin
    j_trans:= '(refr="KD" or refr="KK")';
    Caption:= 'Daftar Transaksi Kas (Masuk Keluar)';
    j_print:= 'TRANSAKSI JURNAL KAS (KELUAR DAN MASUK)';
  end;
  1:
  begin
    j_trans:= 'refr="KK"';
    Caption:= 'Daftar Transaksi Kas (Keluar)';
    j_print:= 'TRANSAKSI JURNAL KAS (KELUAR)';
  end;
  2:
  begin
    j_trans:= 'refr="KD"';
    Caption:= 'Daftar Transaksi Kas (Masuk)';
    j_print:= 'TRANSAKSI JURNAL KAS (MASUK)';
  end;
end;
segarkan;
end;

procedure Tf_daftar_kas.FormShow(Sender: TObject);
begin
j_trans:= '(refr="KD" or refr="KK")';
j_print:= 'TRANSAKSI JURNAL KAS (KELUAR DAN MASUK)';
end;

procedure Tf_daftar_kas.sButton3Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from _vw_jurnal_rinci where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and bulan= "'+f_utama.sb.Panels[6].Text+'" and tahun="'+
f_utama.sb.Panels[7].Text+'" and '+j_trans+'',true);

dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
dm.FRMemo(dm.laporan, 'Memo2').Text := j_print;
dm.laporan.ShowReport;
end;

end.
