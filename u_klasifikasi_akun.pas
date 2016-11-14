unit u_klasifikasi_akun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, sLabel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, sButton, ExtCtrls,
  sPanel, sComboBox, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxDBLookupComboBox, cxNavigator, cxDBNavigator, cxDBEdit, cxCurrencyEdit;

type
  Tf_klasifikasi_akun = class(TForm)
    p1: TsPanel;
    p2: TsPanel;
    sLabel1: TsLabel;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    t_datano_klas: TcxGridDBColumn;
    t_datan_klas: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sButton1: TsButton;
    sButton2: TsButton;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    grid_sub_klas: TcxGrid;
    t_sub_klas: TcxGridDBTableView;
    l_subklas: TcxGridLevel;
    sButton3: TsButton;
    sButton4: TsButton;
    sButton5: TsButton;
    t_sub_klasno_sub_klas: TcxGridDBColumn;
    t_sub_klasno_klas: TcxGridDBColumn;
    t_sub_klasn_sub_klas: TcxGridDBColumn;
    cxDBNavigator1: TcxDBNavigator;
    p3: TsPanel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sButton6: TsButton;
    sButton7: TsButton;
    sButton8: TsButton;
    ce_kiraan: TcxTextEdit;
    ed_kiraan: TcxTextEdit;
    cb_subklas: TcxLookupComboBox;
    procedure sButton2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sButton8Click(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure ubah;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_klasifikasi_akun: Tf_klasifikasi_akun;
  anyar:boolean;

implementation

uses u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_klasifikasi_akun.sButton2Click(Sender: TObject);
begin
close;
end;

procedure Tf_klasifikasi_akun.sButton1Click(Sender: TObject);
begin
p1.Visible:= false;
p2.Visible:= true;
{dm.T_show.Close;
dm.T_show.TableName:='tb_sub_klas';
dm.T_show.Open;
}end;

procedure Tf_klasifikasi_akun.sButton5Click(Sender: TObject);
begin
p1.Visible:= true;
p2.Visible:= false;
{dm.T_show.Close;
dm.T_show.TableName:='tb_klas';
dm.T_show.Open;
}end;

procedure Tf_klasifikasi_akun.sButton3Click(Sender: TObject);
begin
if messagedlg('Apakah anda akan membuka Akun Perkiraan???',mtconfirmation,[mbYes,mbNo],0)=mrYes then
f_utama.ac_kiraan_buku_besarExecute(Sender);
close;
end;

procedure Tf_klasifikasi_akun.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close;
end;

procedure Tf_klasifikasi_akun.sButton8Click(Sender: TObject);
begin
anyar:= true;
ce_kiraan.Enabled:= true;
ce_kiraan.Clear;
cb_subklas.Clear;
ed_kiraan.Clear;
end;

procedure Tf_klasifikasi_akun.ubah;
begin
//kjhg
anyar:= false;
ce_kiraan.Enabled:= false;
ce_kiraan.Text:= dm.Q_kiraan.fieldbyname('kd_kiraan').AsString;
cb_subklas.Text:= dm.Q_kiraan.fieldbyname('no_sub_klas').AsString;
ed_kiraan.Text:= dm.Q_kiraan.fieldbyname('n_kiraan').AsString;
end;

procedure Tf_klasifikasi_akun.sButton6Click(Sender: TObject);
begin
if messagedlg('Yakin akan menghapus data ini...',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
fungsi.SQLExec(dm.Q_Exe,'delete from tb_kiraan where kd_kiraan='+ce_kiraan.Text+'',false);
fungsi.SQLExec(dm.Q_kiraan,'select * from vw_perkiraan',true);
close;
end;
end;

procedure Tf_klasifikasi_akun.sButton7Click(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
if anyar=true then
begin
fungsi.SQLExec(dm.Q_Exe,'insert into tb_kiraan(kd_kiraan,no_sub_klas,n_kiraan)values("'+
ce_kiraan.Text+'","'+cb_subklas.Text+'","'+ed_kiraan.Text+'")',false);
end else
begin
fungsi.SQLExec(dm.Q_Exe,'update tb_kiraan set no_sub_klas='+cb_subklas.Text+',n_kiraan="'+
ed_kiraan.Text+'" where kd_kiraan='+ce_kiraan.Text+'',false);
end;

fungsi.SQLExec(dm.Q_kiraan,'select * from vw_perkiraan',true);

dm.db_conn.Commit;
showmessage('Penyimpanan data berhasil...');
close;
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;

// buat saldo awal akun ketika akun ditambah atau diubah...
f_utama.BuatSaldoAwalAkun;
end;

procedure Tf_klasifikasi_akun.FormShow(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_klas,'select * from tb_klas',true);
fungsi.SQLExec(dm.Q_subklas,'select * from tb_sub_klas',true);
fungsi.SQLExec(dm.Q_kiraan,'select * from vw_perkiraan',true);
end;

end.
