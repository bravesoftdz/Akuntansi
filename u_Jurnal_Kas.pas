unit u_Jurnal_Kas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sButton, 
  sTooledit, sEdit, Buttons, sSpeedButton, sLabel,
  cxStyles, cxCustomData, cxGraphics, 
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, sGroupBox,
  ExtCtrls, sPanel, sComboBox, cxFilter, cxData, Mask, sMaskEdit,
  sCustomComboEdit, StdCtrls;

type
  Tf_Jurnal_Kas = class(TForm)
    sLabel6: TsLabel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    Level: TcxGridLevel;
    ed_code: TsEdit;
    sb_cari: TsSpeedButton;
    gb_1: TsGroupBox;
    ed_keterangan: TsEdit;
    ed_refrensi: TsEdit;
    ed_nJurnal: TsEdit;
    sb_jurnal: TsSpeedButton;
    ed_no_jurnal: TsEdit;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    p1: TsPanel;
    b_simpan: TsButton;
    b_baru: TsButton;
    b_hapus: TsButton;
    cb_jenis: TsComboBox;
    l_ket: TsLabel;
    de_tanggal: TsDateEdit;
    l_1: TsLabel;
    l_6: TsLabel;
    l_5: TsLabel;
    procedure awal;
    procedure ubah_refrensi;
    procedure simpan;
    procedure CreateRows;
    procedure FormShow(Sender: TObject);
    procedure b_baruClick(Sender: TObject);
    procedure sb_jurnalClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_no_jurnalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure
      TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure b_hapusClick(Sender: TObject);
    procedure ed_no_jurnalChange(Sender: TObject);
    procedure cb_jenisChange(Sender: TObject);
  private
    { Private declarations }
  public
    jenis_jurnal: string;
    total_value: Real;
    { Public declarations }
  end;

var
  f_Jurnal_Kas: Tf_Jurnal_Kas;

implementation

uses
  u_dm, u_cari, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_Jurnal_Kas.ubah_refrensi;
var
  a: integer;
begin
  if cb_jenis.ItemIndex = 0 then
  begin
    l_ket.Caption := 'dari Hasil Pembayaran...';
    caption := 'Jurnal Kas (MASUK)';
    jenis_jurnal := 'KD'
  end
  else
  begin
    l_ket.Caption := 'untuk Pembayaran...';
    caption := 'Jurnal Kas (KELUAR)';
    jenis_jurnal := 'KK';
  end;
  fungsi.SQLExec(dm.Q_temp,
    'select IFNULL(count(no_ix),0) as jumlah from tb_jurnal_global where refr="' +
    jenis_jurnal + '"', true);
  a := (dm.Q_temp.fieldbyname('jumlah').AsInteger) + 1;

  if a < 10 then
    ed_refrensi.Text := jenis_jurnal + '-000000' + inttostr(a)
  else if a < 100 then
    ed_refrensi.Text := jenis_jurnal + '-00000' + inttostr(a)
  else if a < 1000 then
    ed_refrensi.Text := jenis_jurnal + '-0000' + inttostr(a)
  else if a < 10000 then
    ed_refrensi.Text := jenis_jurnal + '-000' + inttostr(a)
  else if a < 100000 then
    ed_refrensi.Text := jenis_jurnal + '-00' + inttostr(a)
  else if a < 1000000 then
    ed_refrensi.Text := jenis_jurnal + '-0' + inttostr(a);

end;

procedure Tf_Jurnal_Kas.awal;
begin
  tableview.DataController.RecordCount := 0;
  ed_keterangan.Clear;
  de_tanggal.Date := now;
end;

procedure Tf_Jurnal_Kas.FormShow(Sender: TObject);
begin
  awal;
  ubah_refrensi;
end;

procedure Tf_Jurnal_Kas.b_baruClick(Sender: TObject);
begin
  awal;
end;

procedure Tf_Jurnal_Kas.sb_jurnalClick(Sender: TObject);
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

procedure Tf_Jurnal_Kas.simpan;
var
  x, ix_jurnal: integer;
  isi_sql: string;
begin
  if FormatDateTime('yyyyMM', de_tanggal.Date) <> dm.PeriodAktif then
  begin
    showmessage('Tidak dapat menyimpan transaksi, '#10#13'Tanggal tidak sesuai dengan Periode akuntansi...');
    de_tanggal.SetFocus;
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

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_global(kd_perusahaan,no_ix,tgl,keterangan, ' +
      'no_refrensi,refr,nilai, kd_user) values ("' + dm.kd_perusahaan + '","' +
      inttostr(ix_jurnal) + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date)
      + '","' + ed_keterangan.Text + '","' + ed_refrensi.Text + '","' +
      jenis_jurnal + '","' + floattostr(total_value) + '", "' + dm.kd_pengguna +
      '")', false);

    if cb_jenis.ItemIndex = 0 then
    begin
      fungsi.SQLExec(dm.Q_exe,
        'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
        'debet) values ("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal) +
        '",1,"' + ed_no_jurnal.Text + '","' + floattostr(total_value) + '")', false);

      for x := 0 to tableview.DataController.RecordCount - 1 do
      begin
        isi_sql := isi_sql + '("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal)
          + '","' + inttostr(x + 2) + '","' + TableView.DataController.GetDisplayText
          (x, 0) + '","' + floattostr(TableView.DataController.GetValue(x, 2)) + '"),';
      end;
      delete(isi_sql, length(isi_sql), 1);

      fungsi.SQLExec(dm.Q_exe,
        'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
        'kredit) values ' + isi_sql, false);

    end
    else
    begin
      for x := 0 to tableview.DataController.RecordCount - 1 do
      begin
        isi_sql := isi_sql + '("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal)
          + '","' + inttostr(x + 1) + '","' + TableView.DataController.GetDisplayText
          (x, 0) + '","' + floattostr(TableView.DataController.GetValue(x, 2)) + '"),';
      end;
      delete(isi_sql, length(isi_sql), 1);

      fungsi.SQLExec(dm.Q_exe,
        'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
        'debet) values ' + isi_sql, false);

      fungsi.SQLExec(dm.Q_exe,
        'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
        'kredit) values ("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal) +
        '","' + inttostr(tableview.DataController.RecordCount + 1) + '","' +
        ed_no_jurnal.Text + '","' + floattostr(total_value) + '")', false);
    end;

    fungsi.SQLExec(dm.Q_exe, 'call sp_historical_balancing("' + dm.kd_perusahaan
    + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date) + '")', false);

    dm.db_conn.Commit;

    showmessage('Penyimpanan Data Sukses...'#10#13'Tekan Enter Untuk Melakukan Transaksi Baru...');
    AWAL;
    ubah_refrensi;
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
end;

procedure Tf_Jurnal_Kas.b_simpanClick(Sender: TObject);
begin
  simpan;
end;

procedure Tf_Jurnal_Kas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    ed_code.setfocus;
end;

procedure Tf_Jurnal_Kas.ed_no_jurnalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    sb_jurnalClick(sender);
end;

procedure Tf_Jurnal_Kas.CreateRows;
var
  baris_baru: integer;
  f: integer;
begin
  if tableview.DataController.RecordCount <> 0 then
  begin
    for f := 0 to tableview.DataController.RecordCount - 1 do
    begin
      if CompareStr(dm.Q_temp.fieldbyname('kd_kiraan').AsString, TableView.DataController.GetValue
        (f, 0)) = 0 then
      begin
        tableview.DataController.ChangeFocusedRecordIndex(f);
        exit;
      end;
    end;
  end;

  baris_baru := tableview.DataController.RecordCount + 1;
  tableview.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0, dm.Q_temp.fieldbyname('kd_kiraan').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1, dm.Q_temp.fieldbyname('n_kiraan').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, 0);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
end;

procedure Tf_Jurnal_Kas.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;

    if ed_no_jurnal.Text = '' then
    begin
      ShowMessage('jurnal kas harus di isi terlebih dahulu...');
      ed_no_jurnal.SetFocus;
      Exit;
    end;

    if ed_no_jurnal.Text = ed_code.Text then
    begin
      ShowMessage('kode ini sudah masuk dalam jurnal kas...');
      Exit;
    end;

    fungsi.sqlExec(dm.Q_temp,
      'select kd_kiraan, n_kiraan from tb_kiraan where kd_kiraan =' + quotedstr(ed_code.Text)
      + '', true);
    if dm.Q_temp.RecordCount <> 0 then
      createrows
    else
    begin
      showmessage('no kiraan tidak dapat ditemukan...');
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
      TableView.DataController.DeleteFocused;
end;

procedure Tf_Jurnal_Kas.sb_cariClick(Sender: TObject);
begin
  if ed_no_jurnal.Text = '' then
  begin
    ShowMessage('jurnal kas harus di isi terlebih dahulu...');
    ed_no_jurnal.SetFocus;
    Exit;
  end;

  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_kiraan, n_kiraan from tb_kiraan where kd_kiraan <> "' +
      ed_no_jurnal.Text + '"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    if ShowModal = mrOk then
    begin
      ed_code.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure Tf_Jurnal_Kas.ed_codeKeyPress(Sender: TObject; var Key: Char);
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

    TableView.DataController.SetValue(b, 2, StrToIntDef(kode, 0)); //nilai
  end;
end;

procedure Tf_Jurnal_Kas.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if AText <> '' then
    total_value := AValue;
end;

procedure Tf_Jurnal_Kas.b_hapusClick(Sender: TObject);
begin
  if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes) then
    TableView.DataController.DeleteFocused;
end;

procedure Tf_Jurnal_Kas.ed_no_jurnalChange(Sender: TObject);
var
  f: integer;
begin
//untuk menangggulangi kesamaan kas...
  if tableview.DataController.RecordCount <> 0 then
  begin
    for f := 0 to tableview.DataController.RecordCount - 1 do
    begin
      if CompareStr(ed_no_jurnal.Text, TableView.DataController.GetValue(f, 0)) = 0 then
      begin
        ShowMessage('no jurnal ini sudah ada dalam tabel....');
        ed_no_jurnal.Clear;
        ed_nJurnal.Clear;
      end;
    end;
  end;
end;

procedure Tf_Jurnal_Kas.cb_jenisChange(Sender: TObject);
begin
  ubah_refrensi;
end;

end.

