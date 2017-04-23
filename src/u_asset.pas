unit u_asset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sCurrEdit, sCurrencyEdit, Buttons, 
  sTooledit, sLabel, sEdit, sButton, sGroupBox,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBLookupComboBox, DB,
  cxLookupEdit, cxDBLookupEdit, StdCtrls, Mask, sMaskEdit,
  sCustomComboEdit, MemDS, DBAccess, MyAccess, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters;

type
  TF_asset = class(TForm)
    b_simpan: TsButton;
    sLabel3: TsLabel;
    ed_kode: TsEdit;
    sLabel1: TsLabel;
    de_tanggal: TsDateEdit;
    sLabel2: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    ce_Qty: TsCurrencyEdit;
    ce_nilai: TsCurrencyEdit;
    ce_umur: TsCurrencyEdit;
    sLabel10: TsLabel;
    sGroupBox1: TsGroupBox;
    sLabel9: TsLabel;
    l_kirAkDep: TsLabel;
    l_kirDep: TsLabel;
    l_kirAsset: TsLabel;
    sLabel8: TsLabel;
    sLabel7: TsLabel;
    ed_nama: TsEdit;
    sLabel6: TsLabel;
    cb_asset: TcxLookupComboBox;
    cb_dep: TcxLookupComboBox;
    cb_Ak_dep: TcxLookupComboBox;
    ce_res: TsCurrencyEdit;
    sLabel11: TsLabel;
    ds_kiraan: TDataSource;
    Q_kiraan: TMyQuery;
    procedure baru;
    procedure ubah;
    procedure b_simpanClick(Sender: TObject);
    procedure cb_assetPropertiesChange(Sender: TObject);
    procedure cb_depPropertiesChange(Sender: TObject);
    procedure cb_Ak_depPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    anyar: boolean;
    { Public declarations }
  end;

var
  F_asset: TF_asset;

implementation

uses
  u_dm, u_daftar_asset, UFungsi;

{$R *.dfm}

procedure TF_asset.baru;
begin
  ed_kode.Clear;
  ed_kode.Enabled := true;
  anyar := true;
end;

procedure TF_asset.ubah;
begin
  ed_kode.Text := f_daftar_asset.Q_asset.fieldbyname('kd_asset').asstring;
  ed_kode.Enabled := false;
  ed_nama.Text := f_daftar_asset.Q_asset.fieldbyname('nm_asset').asstring;
  de_tanggal.Date := f_daftar_asset.Q_asset.fieldbyname('tgl_perolehan').AsDateTime;
  ce_qty.Text := f_daftar_asset.Q_asset.fieldbyname('Q_asset').asstring;
  ce_nilai.Text := f_daftar_asset.Q_asset.fieldbyname('jumlah_nilai').asstring;
  ce_res.Text := f_daftar_asset.Q_asset.fieldbyname('nilai_residu').asstring;
  ce_umur.Text := f_daftar_asset.Q_asset.fieldbyname('umur_ekonomis').asstring;

  cb_Asset.Text := f_daftar_asset.Q_asset.fieldbyname('kiraan_asset').asstring;
  fungsi.SQLExec(dm.Q_temp, 'select n_kiraan from tb_kiraan where kd_kiraan="' +
    cb_Asset.Text + '"', true);
  l_kirAsset.Caption := dm.Q_temp.fieldbyname('n_kiraan').AsString;

  cb_Dep.Text := f_daftar_asset.Q_asset.fieldbyname('kiraan_depresiasi').asstring;
  ;
  fungsi.SQLExec(dm.Q_temp, 'select n_kiraan from tb_kiraan where kd_kiraan="' +
    cb_Dep.Text + '"', true);
  l_kirDep.Caption := dm.Q_temp.fieldbyname('n_kiraan').AsString;

  cb_Ak_Dep.Text := f_daftar_asset.Q_asset.fieldbyname('kiraan_akum_depresiasi').asstring;
  ;
  fungsi.SQLExec(dm.Q_temp, 'select n_kiraan from tb_kiraan where kd_kiraan="' +
    cb_Ak_Dep.Text + '"', true);
  l_kirAkDep.Caption := dm.Q_temp.fieldbyname('n_kiraan').AsString;
  anyar := false;
end;

procedure TF_asset.b_simpanClick(Sender: TObject);
begin
  if ed_kode.Text = '' then
  begin
    showmessage('kode asset tidak boleh kosong');
    ed_kode.SetFocus;
    exit;
  end;

  dm.db_conn.StartTransaction;
  try
    if anyar = true then
    begin
      fungsi.SQLExec(dm.Q_Exe,
        'insert into tb_asset(kd_perusahaan,kd_asset,Nm_asset, ' + 'tgl_perolehan,Q_asset,jumlah_nilai,nilai_residu,umur_ekonomis,kiraan_asset,kiraan_depresiasi, '
        + 'kiraan_akum_depresiasi, kd_user) values ("' + dm.kd_perusahaan +
        '","' + ed_kode.Text + '","' + ed_nama.Text + '","' + formatdatetime('yyyy-MM-dd',
        de_tanggal.Date) + '","' + ce_qty.Text + '","' + ce_nilai.Text + '","' +
        ce_res.Text + '","' + ce_umur.Text + '","' + cb_Asset.Text + '","' +
        cb_dep.Text + '","' + cb_Ak_Dep.Text + '", "' + dm.kd_pengguna + '")', false);
    end
    else
    begin
      fungsi.SQLExec(dm.Q_Exe, 'update tb_asset set Nm_asset="' + ed_nama.Text +
        '",tgl_perolehan="' + formatdatetime('yyyy-MM-dd', de_tanggal.Date) +
        '",Q_asset="' + ce_qty.Text + '",jumlah_nilai="' + ce_nilai.Text +
        '",nilai_residu="' + ce_res.Text + '",umur_ekonomis="' + ce_umur.Text +
        '",kiraan_asset="' + cb_Asset.Text + '",kiraan_depresiasi="' + cb_dep.Text
        + '",kiraan_akum_depresiasi="' + cb_Ak_Dep.Text + '",kd_user = "' + dm.kd_pengguna
        + '" where kd_perusahaan="' + dm.kd_perusahaan + '" and kd_asset="' +
        ed_kode.Text + '"', false);
    end;

//fungsi.SQLExec(f_daftar_asset.Q_asset,'select * from vw_asset',true);

    dm.db_conn.Commit;
    baru;
    showmessage('Penyimpanan data Asset berhasil...');
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
end;

procedure TF_asset.cb_assetPropertiesChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_kiraan where kd_kiraan="' +
    cb_asset.Text + '"', true);
  l_kirAsset.Caption := dm.Q_temp.fieldbyname('n_kiraan').AsString;
end;

procedure TF_asset.cb_depPropertiesChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_kiraan where kd_kiraan="' + cb_dep.Text
    + '"', true);
  l_kirDep.Caption := dm.Q_temp.fieldbyname('n_kiraan').AsString;
end;

procedure TF_asset.cb_Ak_depPropertiesChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_kiraan where kd_kiraan="' +
    cb_ak_dep.Text + '"', true);
  l_kirAkDep.Caption := dm.Q_temp.fieldbyname('n_kiraan').AsString;
end;

procedure TF_asset.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//if key=vk_escape then close;
end;

procedure TF_asset.FormCreate(Sender: TObject);
begin
  fungsi.SQLExec(Q_kiraan, 'select kd_kiraan, n_kiraan from tb_kiraan', True);
end;

end.

