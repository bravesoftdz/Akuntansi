unit u_daftar_akun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, sPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, sSkinProvider, StdCtrls, sLabel,
  Mask, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, Buttons,
  sBitBtn, cxCurrencyEdit, Menus, sSpeedButton, sButton,U_fungsi;

type
  Tf_daftar_akun = class(TForm)
    panel1: TsPanel;
    sSkinProvider1: TsSkinProvider;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    t_datakd_kiraan: TcxGridDBColumn;
    t_datan_kiraan: TcxGridDBColumn;
    t_datan_sub_klas: TcxGridDBColumn;
    t_datan_klas: TcxGridDBColumn;
    t_buku_besar: TcxGridDBTableView;
    t_buku_besartgl: TcxGridDBColumn;
    t_buku_besarrefr: TcxGridDBColumn;
    t_buku_besarno_refrensi: TcxGridDBColumn;
    t_buku_besarketerangan: TcxGridDBColumn;
    t_buku_besardebet: TcxGridDBColumn;
    t_buku_besarkredit: TcxGridDBColumn;
    l_data: TcxGridLevel;
    pm_akun: TPopupMenu;
    Mi_detail: TMenuItem;
    mi_baru: TMenuItem;
    mi_hapus: TMenuItem;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    b_cetak: TsButton;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure t_dataEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure Mi_detailClick(Sender: TObject);
    procedure mi_baruClick(Sender: TObject);
    procedure mi_hapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_akun: Tf_daftar_akun;
  fungsi: Tfungsi;

implementation

uses u_dm, u_utama, u_klasifikasi_akun;

{$R *.dfm}

procedure Tf_daftar_akun.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_daftar_akun.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
action:= cafree;
f_daftar_akun:=nil;
end;

procedure Tf_daftar_akun.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
b_cetakClick(Sender);
end;

procedure Tf_daftar_akun.t_dataEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
Mi_detailClick(Sender);

if key=vk_delete then
Mi_hapusClick(Sender);
end;

procedure Tf_daftar_akun.Mi_detailClick(Sender: TObject);
begin
application.CreateForm(tf_klasifikasi_akun,f_klasifikasi_akun);
f_klasifikasi_akun.p1.Visible:= false;
f_klasifikasi_akun.p2.Visible:= false;
f_klasifikasi_akun.p3.Visible:= true;
f_klasifikasi_akun.Height:= 150;
f_klasifikasi_akun.ubah;
f_klasifikasi_akun.ShowModal;
end;

procedure Tf_daftar_akun.mi_baruClick(Sender: TObject);
begin
application.CreateForm(tf_klasifikasi_akun,f_klasifikasi_akun);
f_klasifikasi_akun.p1.Visible:= false;
f_klasifikasi_akun.p2.Visible:= false;
f_klasifikasi_akun.p3.Visible:= true;
f_klasifikasi_akun.Height:= 150;
anyar:= true;
f_klasifikasi_akun.ShowModal;
end;

procedure Tf_daftar_akun.mi_hapusClick(Sender: TObject);
begin
if messagedlg('Yakin akan menghapus data ini...',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
fungsi.SQLExec(dm.Q_Exe,'delete from tb_kiraan where kd_kiraan='+dm.Q_kiraan.fieldbyname('kd_kiraan').AsString+'',false);
fungsi.SQLExec(dm.Q_kiraan,'select * from vw_perkiraan',true);
end;
end;

procedure Tf_daftar_akun.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
  fungsi.SQLExec(dm.Q_kiraan,'select * from vw_perkiraan',true);
end;

procedure Tf_daftar_akun.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_daftar_akun.sb_2Click(Sender: TObject);
begin
t_data.DataController.DataSet.Close;
t_data.DataController.DataSet.Open;
end;

procedure Tf_daftar_akun.b_cetakClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_buku_besar,'select * from vw_buku_besar where kd_perusahaan= "'+
f_utama.sb.Panels[3].Text+'" and bulan= "'+f_utama.sb.Panels[6].Text+'" and tahun="'+
f_utama.sb.Panels[7].Text+'" and kd_kiraan = '+quotedstr(dm.Q_kiraan.fieldbyname('kd_kiraan').AsString)+'',true);
dm.laporan.LoadFromFile(WPath + 'laporan\a_buku_besar.fr3');
dm.laporan.ShowReport;
end;

end.
