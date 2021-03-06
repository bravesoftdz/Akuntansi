unit u_daftar_jurnal_umum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, Buttons, sSpeedButton, ExtCtrls, sPanel,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, sSkinProvider, 
  sButton, StdCtrls, MemDS, DBAccess,
  MyAccess, cxCustomData, cxFilter, cxData, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator;

type
  Tf_daftar_jurnal_umum = class(TForm)
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
    l_data0: TcxGridLevel;
    l_data2: TcxGridLevel;
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    sknprvdr1: TsSkinProvider;
    ds_jurnal_umum: TDataSource;
    Q_jurnal_umum: TMyQuery;
    ds_rinci: TDataSource;
    Q_rinci: TMyQuery;
    p1: TsPanel;
    sButton3: TsButton;
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
  f_daftar_jurnal_umum: Tf_daftar_jurnal_umum;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_daftar_jurnal_umum.segarkan;
begin
  fungsi.SQLExec(Q_jurnal_umum,
    'select * from tb_jurnal_global where kd_perusahaan= ''' + 
    dm.kd_perusahaan + ''' and refr=''GJ'' and month(tgl)=''' + dm.Bulan
    + ''' and year(tgl)=''' + dm.Tahun + '''', true);

  fungsi.SQLExec(Q_rinci,
    'select * from vw_jurnal_rinci  where kd_perusahaan= ''' + 
    dm.kd_perusahaan + ''' and refr=''GJ'' and bulan=''' + dm.Bulan +
    ''' and tahun=''' + dm.Tahun + '''', true);
end;

procedure Tf_daftar_jurnal_umum.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_jurnal_umum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := caFree;
  f_daftar_jurnal_umum := nil;
end;

procedure Tf_daftar_jurnal_umum.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(Self.Handle);
end;

procedure Tf_daftar_jurnal_umum.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_daftar_jurnal_umum.sb_2Click(Sender: TObject);
var
  posisi: Integer;
begin
  posisi := t_data0.DataController.DataSource.DataSet.RecNo;
  segarkan;
  t_data0.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_jurnal_umum.sButton3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_rinci where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + 
    dm.Tahun + '" and refr="GJ"', true);

  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
  dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL UMUM';
  dm.laporan.ShowReport;
end;

end.

