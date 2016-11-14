unit u_akun_penting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, sLabel, ExtCtrls, sPanel,
  sSkinProvider, Buttons, sBitBtn, cxDBLookupComboBox, cxCurrencyEdit,
  sSpeedButton, mySQLDbTables, sButton;

type
  Tf_akun_penting = class(TForm)
    sSkinProvider1: TsSkinProvider;
    panel1: TsPanel;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    t_datano_ix: TcxGridDBColumn;
    t_dataKeterangan: TcxGridDBColumn;
    t_datakd_akun: TcxGridDBColumn;
    t_datan_kiraan: TcxGridDBColumn;
    t_asset: TcxGridDBTableView;
    t_assetkd_asset: TcxGridDBColumn;
    t_assetNm_asset: TcxGridDBColumn;
    t_assettgl_perolehan: TcxGridDBColumn;
    t_assetjumlah_nilai: TcxGridDBColumn;
    t_assetsusut_bulan: TcxGridDBColumn;
    t_assetakum_penyusutan: TcxGridDBColumn;
    t_assetnilai_buku: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sb_1: TsSpeedButton;
    Q_akun_penting: TmySQLQuery;
    ds_akun_penting: TDataSource;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton1: TsButton;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_akun_penting: Tf_akun_penting;

implementation

uses u_dm, u_utama, u_cari;

{$R *.dfm}

procedure Tf_akun_penting.segarkan;
begin
  fungsi.SQLExec(Q_akun_penting,'select * from vw_akun_penting',true);
end;

procedure Tf_akun_penting.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_akun_penting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
action:= cafree;
f_akun_penting:=nil;
end;

procedure Tf_akun_penting.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_akun_penting.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_akun_penting.sb_2Click(Sender: TObject);
begin
segarkan;
end;

procedure Tf_akun_penting.sButton1Click(Sender: TObject);
begin
application.CreateForm(tf_cari, f_cari);
fungsi.SQLExec(dm.q_cari,'select kd_kiraan, n_kiraan from tb_kiraan',true);
f_cari.clm1.caption:='Kode';
f_cari.clm2.caption:='Deskripsi';
u_cari.tipe_cari:=66;
u_cari.asal:='f_akun_penting';
f_cari.ShowModal;
segarkan;
end;

procedure Tf_akun_penting.t_dataCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
sButton1Click(Self);
end;

end.
