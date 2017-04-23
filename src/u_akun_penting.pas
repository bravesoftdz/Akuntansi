unit u_akun_penting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, 
  ExtCtrls, sPanel, sSkinProvider, Buttons, cxDBLookupComboBox,
  cxCurrencyEdit, sSpeedButton, sButton, 
  StdCtrls, MemDS, DBAccess, MyAccess, cxCustomData, cxFilter, cxData,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

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
    Q_akun_penting: TMyQuery;
    ds_akun_penting: TDataSource;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    sButton1: TsButton;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_akun_penting: Tf_akun_penting;

implementation

uses
  u_dm, u_utama, u_cari, UFungsi;

{$R *.dfm}

procedure Tf_akun_penting.segarkan;
begin
  fungsi.SQLExec(Q_akun_penting, 'SELECT 	ka.no_ix, ka.kd_akun, ka.Keterangan, kr.n_kiraan ' +
    'FROM tb_konfig_akun ka LEFT JOIN tb_kiraan kr ON ka.kd_akun = kr.kd_kiraan', true);
end;

procedure Tf_akun_penting.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_akun_penting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  f_akun_penting := nil;
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
  with F_cari do
  try
    _SQLi := 'select kd_kiraan, n_kiraan from tb_kiraan';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    if ShowModal = mrOk then
    begin
      if MessageBox(0, 'Benarkah data akun penting ini' + #13 + #10 +
        'AKAN ANDA RUBAH...???', 'UBAH AKUN PENTING', MB_ICONQUESTION or
        MB_YESNO) = mrYes then
      begin
        fungsi.SQLExec(dm.Q_Exe, 'update tb_konfig_akun set kd_akun = ' +
          QuotedStr(TblVal[0]) + ', `update` = date(now()) where no_ix= ' +
          quotedStr(Q_akun_penting.fieldbyname('no_ix').AsString) + '', False);
        segarkan;
      end;
    end;
  finally
    close;
  end;
end;

procedure Tf_akun_penting.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  sButton1Click(Self);
end;

end.

