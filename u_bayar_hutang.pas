unit u_bayar_hutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sEdit, Buttons, sSpeedButton, sButton, sCurrEdit,
  sCurrencyEdit, Grids, Mask, sMaskEdit, sCustomComboEdit, sTooledit, ExtCtrls,
  sPanel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxCurrencyEdit, sGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  Tf_bayar_hutang = class(TForm)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    ed_nJurnal: TsEdit;
    sSpeedButton1: TsSpeedButton;
    ed_no_jurnal: TsEdit;
    Lbl1: TsLabel;
    b_simpan: TsButton;
    b_baru: TsButton;
    b_hapus: TsButton;
    Grid: TcxGrid;
    tableview: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    view_TableViewColumn1: TcxGridColumn;
    Level: TcxGridLevel;
    ed_code: TsEdit;
    sb_cari: TsSpeedButton;
    gb_1: TsGroupBox;
    Lbl2: TsLabel;
    sb_1: TsSpeedButton;
    Lbl4: TsLabel;
    Lbl5: TsLabel;
    Lbl3: TsLabel;
    ed_pihak_lain: TsEdit;
    ed_refrensi: TsEdit;
    de_tanggal: TsDateEdit;
    ed_keterangan: TsEdit;
    ed_ket2: TsEdit;
    Lbl6: TsLabel;
    Lbl7: TsLabel;
    procedure awal;
    procedure simpan;
    procedure createrows;
    procedure update_ket2;
    procedure sb_1Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b_hapusClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_baruClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure ed_no_jurnalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure
      tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure ed_pihak_lainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    dibayar: Real;
    { Private declarations }
  public
    jenis: string;
    { Public declarations }
  end;

var
  f_bayar_hutang: Tf_bayar_hutang;

implementation

uses
  u_dm, u_cari, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_bayar_hutang.awal;
var
  a: integer;
begin
  if jenis = 'hutang' then
    Caption := 'Pembayaran Hutang'
  else
    Caption := 'Pembayaran Piutang';

  fungsi.SQLExec(dm.Q_temp,
    'select IFNULL(count(no_ix),0) as jumlah from tb_jurnal_global where refr=''PH''',
    true);
  a := (dm.Q_temp.fieldbyname('jumlah').AsInteger) + 1;

  if a < 10 then
    ed_refrensi.Text := 'PH-000000' + inttostr(a)
  else if a < 100 then
    ed_refrensi.Text := 'PH-00000' + inttostr(a)
  else if a < 1000 then
    ed_refrensi.Text := 'PH-0000' + inttostr(a)
  else if a < 10000 then
    ed_refrensi.Text := 'PH-000' + inttostr(a)
  else if a < 100000 then
    ed_refrensi.Text := 'PH-00' + inttostr(a)
  else if a < 1000000 then
    ed_refrensi.Text := 'PH-0' + inttostr(a);

  ed_keterangan.Clear;
  ed_ket2.Clear;
  ed_pihak_lain.Clear;

  de_tanggal.Date := now;
  tableview.DataController.RecordCount := 0;
end;

procedure Tf_bayar_hutang.sb_1Click(Sender: TObject);
begin
  ed_pihak_lain.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kode,n_supp from tb_supp ' + 'where kd_perusahaan="' + dm.kd_perusahaan
      + '"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    if ShowModal = mrOk then
    begin
      ed_pihak_lain.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure Tf_bayar_hutang.sSpeedButton1Click(Sender: TObject);
begin
  ed_no_jurnal.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_kiraan, n_kiraan from tb_kiraan where kd_kiraan like "11%"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    if ShowModal = mrOk then
    begin
      ed_no_jurnal.Text := TblVal[0];
      ed_nJurnal.Text := TblVal[1];
    end;
  finally
    close;
  end;
end;

procedure Tf_bayar_hutang.FormShow(Sender: TObject);
begin
  awal;
end;

procedure Tf_bayar_hutang.update_ket2;
var
  y: integer;
  keterangan: string;
begin
  for y := 0 to tableview.DataController.RecordCount - 1 do
  begin
    keterangan := keterangan + TableView.DataController.GetDisplayText(y, 0) + ',';
  end;
  delete(keterangan, length(keterangan), 1);

  ed_ket2.Text := keterangan;
end;

procedure Tf_bayar_hutang.b_hapusClick(Sender: TObject);
begin
  if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes) then
  begin
    TableView.DataController.DeleteFocused;
    update_ket2;
  end;
end;

procedure Tf_bayar_hutang.b_simpanClick(Sender: TObject);
begin
  simpan;
end;

procedure Tf_bayar_hutang.simpan;
var
  x, ix_jurnal: integer;
  jurnal_hutang, isi_sql: string;
begin

  if FormatDateTime('yyyyMM', de_tanggal.Date) <> dm.PeriodAktif then
  begin
    showmessage('Tidak dapat menyimpan transaksi, '#10#13'Tanggal tidak sesuai dengan Periode akuntansi...');
    de_tanggal.SetFocus;
    exit;
  end;

  if ed_no_jurnal.Text = '' then
  begin
    showmessage('Jurnal Kas Harus diisi terlebih dahulu!!!');
    exit;
  end;

  if tableview.DataController.RecordCount = 0 then
  begin
    showmessage('tidak dapat menyimpan data '#10#13'karena tabel masih kosong...');
    exit;
  end;

  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_temp,
      'select IFNULL(max(no_ix),1) as jumlah from tb_jurnal_global', true);
    ix_jurnal := (dm.Q_temp.fieldbyname('jumlah').AsInteger) + 1;

    fungsi.SQLExec(dm.Q_temp, 'select kd_akun from tb_konfig_akun where no_ix=4', true);
    jurnal_hutang := dm.Q_temp.fieldbyname('kd_akun').asstring;

    for x := 0 to tableview.DataController.RecordCount - 1 do
    begin
      isi_sql := isi_sql + '("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal)
        + '","' + inttostr(x + 1) + '","' + jurnal_hutang + '","' + floattostr(TableView.DataController.GetValue
        (x, 3)) + '","' + TableView.DataController.GetDisplayText(x, 0) + '"),';

      fungsi.SQLExec(dm.Q_exe, 'update tb_hutang set dibayar=dibayar+' +
        floattostr(TableView.DataController.GetValue(x, 3)) +
        ',`update`=date(now()) where faktur="' + TableView.DataController.GetDisplayText
        (x, 0) + '"', false);
    end;
    delete(isi_sql, length(isi_sql), 1);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_global(kd_perusahaan,no_ix,tgl,keterangan, ' +
      'no_refrensi,refr,nilai,kd_user) values ("' + dm.kd_perusahaan + '","' +
      inttostr(ix_jurnal) + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date)
      + '","' + ed_keterangan.Text + ' untuk ' + ed_ket2.Text + '","' +
      ed_refrensi.Text + '","PH","' + floattostr(dibayar) + '", "' + dm.kd_pengguna
      + '")', false);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
      'debet,rujukan) values ' + isi_sql, False);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
      'kredit) values ("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal) +
      '","' + inttostr(tableview.DataController.RecordCount + 1) + '","' +
      ed_no_jurnal.Text + '","' + floattostr(dibayar) + '")', false);

    fungsi.SQLExec(dm.Q_exe, 'call sp_historical_balancing("' + f_utama.sb.Panels
      [3].Text + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date) + '")', false);
    dm.db_conn.Commit;

    showmessage('Penyimpanan Data Sukses...'#10#13'Tekan Enter Untuk Melakukan Transaksi Baru...');
    AWAL;
    ed_refrensi.SetFocus;
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
end;

procedure Tf_bayar_hutang.b_baruClick(Sender: TObject);
begin
  awal;
end;

procedure Tf_bayar_hutang.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    ed_code.setfocus;
end;

procedure Tf_bayar_hutang.sb_cariClick(Sender: TObject);
begin
  if (ed_pihak_lain.Text = '') then
  begin
    showmessage('supplier harus diisi terlebih dahulu');
    ed_pihak_lain.SetFocus;
    exit;
  end;

  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi :=
      'select tanggal, faktur, hutang from vw_hutang where kd_perusahaan="' + dm.kd_perusahaan +
      '" and supplier="' + ed_pihak_lain.Text + '" and status="belum lunas"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    tblCap[2] := 'Hutang';
    if ShowModal = mrOk then
    begin
      ed_code.Text := TblVal[1];
    end;
  finally
    close;
  end;
end;

procedure Tf_bayar_hutang.ed_no_jurnalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    sSpeedButton1Click(Sender);
end;

procedure Tf_bayar_hutang.CreateRows;
var
  baris_baru: integer;
  f: integer;
begin
  if tableview.DataController.RecordCount <> 0 then
  begin
    for f := 0 to tableview.DataController.RecordCount - 1 do
    begin
      if CompareStr(dm.Q_temp.fieldbyname('faktur').AsString, TableView.DataController.GetValue
        (f, 0)) = 0 then
      begin
        tableview.DataController.ChangeFocusedRecordIndex(f);
        exit;
      end;
    end;
  end;

  baris_baru := tableview.DataController.RecordCount + 1;
  tableview.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0, dm.Q_temp.fieldbyname('faktur').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1, dm.Q_temp.fieldbyname('tanggal').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, dm.Q_temp.fieldbyname('hutang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 3, 0);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  update_ket2;
end;

procedure Tf_bayar_hutang.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;

    fungsi.sqlExec(dm.Q_temp,
      'select tanggal, faktur, hutang from vw_hutang where kd_perusahaan="' + dm.kd_perusahaan
      + '" and supplier="' + ed_pihak_lain.Text +
      '" and status=''belum lunas'' and faktur =' + quotedstr(ed_code.Text) + '', true);
    if dm.Q_temp.RecordCount <> 0 then
      createrows
    else
    begin
      showmessage('no Faktur tidak dapat ditemukan...');
      Exit;
    end;
    ed_code.Clear
  end;

  if (key = vk_f2) then
    sb_cariClick(Sender);

  if key = vk_up then
  begin
    if tableview.DataController.FocusedRecordIndex >= 1 then
      tableview.DataController.FocusedRecordIndex := tableview.DataController.FocusedRecordIndex
        - 1;
    key := VK_NONAME;
  end;

  if key = vk_down then
    tableview.DataController.FocusedRowIndex := tableview.DataController.FocusedRowIndex
      + 1;

  if (Shift = [ssCtrl]) and (Key = vk_delete) then
    if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
    begin
      TableView.DataController.DeleteFocused;
      update_ket2;
    end;
end;

procedure Tf_bayar_hutang.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
  b: Integer;
begin
  if TableView.DataController.RecordCount = 0 then
    Exit;

  kode := Ed_Code.Text;
  b := TableView.DataController.GetFocusedRecordIndex;

  if key = #47 then // tanda / (nilai)
  begin
    delete(kode, pos('/', kode), 1);
    ed_code.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;
    if strtoint(kode) > TableView.DataController.GetValue(b, 2) then
    begin
      TableView.DataController.SetValue(b, 3, TableView.DataController.GetValue(b,
        2)); //nilai
      Exit;
    end;

    TableView.DataController.SetValue(b, 3, StrToIntDef(kode, 0)); //nilai
  end;
end;

procedure Tf_bayar_hutang.tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if AText <> '' then
    dibayar := AValue;
end;

procedure Tf_bayar_hutang.ed_pihak_lainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    sb_1Click(Sender);
end;

end.

