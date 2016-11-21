unit u_bayar_piutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sCurrEdit, sCurrencyEdit, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, Grids, sLabel, Buttons, sSpeedButton,
  ExtCtrls, sPanel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, sGroupBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  Tf_bayar_piutang = class(TForm)
    sPanel1: TsPanel;
    ed_nJurnal: TsEdit;
    sSpeedButton1: TsSpeedButton;
    ed_no_jurnal: TsEdit;
    sLabel5: TsLabel;
    sPanel2: TsPanel;
    b_hapus: TsButton;
    b_baru: TsButton;
    b_simpan: TsButton;
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
    sb_1: TsSpeedButton;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    l_5: TsLabel;
    ed_pelanggan: TsEdit;
    ed_refrensi: TsEdit;
    ed_keterangan: TsEdit;
    ed_ket2: TsEdit;
    de_tanggal: TsDateEdit;
    l_1: TsLabel;
    l_6: TsLabel;
    procedure awal;
    procedure simpan;
    procedure createrows;
    procedure update_ket2;
    procedure sSpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_jurnalSelectCell(Sender: TObject; ACol, ARow: Integer; var
      CanSelect: Boolean);
    procedure sg_jurnalDblClick(Sender: TObject);
    procedure b_hapusClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_baruClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_1Click(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_no_jurnalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure
      tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure ed_pelangganKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    kd_pelanggan: string;
    dibayar: Real;
    { Public declarations }
  end;

var
  f_bayar_piutang: Tf_bayar_piutang;

implementation

uses
  u_dm, u_cari, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_bayar_piutang.awal;
var
  a: integer;
begin
  fungsi.SQLExec(dm.Q_temp,
    'select IFNULL(count(no_ix),0) as jumlah from tb_jurnal_global where refr=''PP''',
    true);
  a := (dm.Q_temp.fieldbyname('jumlah').AsInteger) + 1;

  if a < 10 then
    ed_refrensi.Text := 'PP-000000' + inttostr(a)
  else if a < 100 then
    ed_refrensi.Text := 'PP-00000' + inttostr(a)
  else if a < 1000 then
    ed_refrensi.Text := 'PP-0000' + inttostr(a)
  else if a < 10000 then
    ed_refrensi.Text := 'PP-000' + inttostr(a)
  else if a < 100000 then
    ed_refrensi.Text := 'PP-00' + inttostr(a)
  else if a < 1000000 then
    ed_refrensi.Text := 'PP-0' + inttostr(a);

  ed_keterangan.Clear;
  ed_ket2.Clear;
  ed_pelanggan.Clear;

  de_tanggal.Date := now;
  tableview.DataController.RecordCount := 0;
end;

procedure Tf_bayar_piutang.sSpeedButton1Click(Sender: TObject);
begin
  ed_no_jurnal.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  fungsi.SQLExec(dm.q_cari,
    'select kd_kiraan, n_kiraan from tb_kiraan where kd_kiraan like ''11%''', true);
  f_cari.clm1.caption := 'Kode';
  f_cari.clm2.caption := 'Deskripsi';
  u_cari.tipe_cari := 66;
  u_cari.asal := 'f_bayar_piutang';
  f_cari.ShowModal;
end;

procedure Tf_bayar_piutang.FormShow(Sender: TObject);
begin
  awal;
end;

procedure Tf_bayar_piutang.sg_jurnalSelectCell(Sender: TObject; ACol, ARow:
  Integer; var CanSelect: Boolean);
begin
  if acol < 3 then
    canselect := false
  else
    canselect := true;
end;

procedure Tf_bayar_piutang.sg_jurnalDblClick(Sender: TObject);
begin
  if (ed_pelanggan.Text = '') then
  begin
    showmessage('pelanggan harus diisi terlebih dahulu');
    exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  fungsi.SQLExec(dm.q_cari,
    'select tanggal, faktur, piutang from _vw_piutang where kd_perusahaan="' +
    dm.kd_perusahaan + '" and pelanggan="' + kd_pelanggan +
    '" and status=''belum lunas''', true);
  f_cari.clm1.caption := 'Tanggal';
  f_cari.clm2.caption := 'Faktur';
  f_cari.clm3.caption := 'Saldo Piutang';
  u_cari.tipe_cari := 11;
  u_cari.asal := 'f_bayar_piutang';
  f_cari.ShowModal;
end;

procedure Tf_bayar_piutang.update_ket2;
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

procedure Tf_bayar_piutang.b_hapusClick(Sender: TObject);
var
  p: integer;
begin
  if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes) then
  begin
    TableView.DataController.DeleteFocused;
    update_ket2;
  end;
end;

procedure Tf_bayar_piutang.b_simpanClick(Sender: TObject);
begin
  simpan;
end;

procedure Tf_bayar_piutang.simpan;
var
  x, ix_jurnal: integer;
  jurnal_piutang, isi_sql: string;
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

    fungsi.SQLExec(dm.Q_temp, 'select kd_akun from tb_konfig_akun where no_ix=2', true);
    jurnal_piutang := dm.Q_temp.fieldbyname('kd_akun').asstring;

    for x := 0 to tableview.DataController.RecordCount - 1 do
    begin
      isi_sql := isi_sql + '("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal)
        + '","' + inttostr(x + 2) + '","' + jurnal_piutang + '","' + floattostr(TableView.DataController.GetValue
        (x, 3)) + '","' + TableView.DataController.GetDisplayText(x, 0) + '"),';

      fungsi.SQLExec(dm.Q_exe, 'update tb_piutang set dibayar=dibayar+' +
        floattostr(TableView.DataController.GetValue(x, 3)) +
        ',`update`=date(now()) where faktur="' + TableView.DataController.GetDisplayText
        (x, 0) + '"', false);
    end;
    delete(isi_sql, length(isi_sql), 1);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_global(kd_perusahaan,no_ix,tgl,keterangan, ' +
      'no_refrensi,refr,nilai) values ("' + dm.kd_perusahaan + '","' +
      inttostr(ix_jurnal) + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date)
      + '","' + ed_keterangan.Text + ' untuk ' + ed_ket2.Text + '","' +
      ed_refrensi.Text + '","PP","' + floattostr(dibayar) + '")', false);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
      'debet) values ("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal)
      + '",1,"' + ed_no_jurnal.Text + '","' + floattostr(dibayar) + '")', false);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
      'kredit,rujukan) values ' + isi_sql, false);

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

procedure Tf_bayar_piutang.b_baruClick(Sender: TObject);
begin
  awal;
end;

procedure Tf_bayar_piutang.FormKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_f2 then
    ed_code.setfocus;
end;

procedure Tf_bayar_piutang.sb_1Click(Sender: TObject);
begin
  ed_pelanggan.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  fungsi.SQLExec(dm.q_cari, 'select kd_pelanggan,n_pelanggan from tb_pelanggan', true);
  f_cari.clm1.caption := 'Kode';
  f_cari.clm2.caption := 'Nama pelanggan';
  u_cari.tipe_cari := 9;
  u_cari.asal := 'f_bayar_piutang';
  f_cari.ShowModal;
end;

procedure Tf_bayar_piutang.sb_cariClick(Sender: TObject);
begin
  if (ed_pelanggan.Text = '') then
  begin
    showmessage('pelanggan harus diisi terlebih dahulu');
    ed_pelanggan.SetFocus;
    exit;
  end;

  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  fungsi.SQLExec(dm.q_cari,
    'select tanggal, faktur, piutang from _vw_piutang where kd_perusahaan="' +
    dm.kd_perusahaan + '" and pelanggan="' + kd_pelanggan +
    '" and status=''belum lunas''', true);
  f_cari.clm1.caption := 'Tanggal';
  f_cari.clm2.caption := 'Faktur';
  f_cari.clm3.caption := 'Saldo Piutang';
  u_cari.tipe_cari := 11;
  u_cari.asal := 'f_bayar_piutang';
  f_cari.ShowModal;
end;

procedure Tf_bayar_piutang.createrows;
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
  TableView.DataController.SetValue(baris_baru - 1, 2, dm.Q_temp.fieldbyname('piutang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 3, 0);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  update_ket2;
end;

procedure Tf_bayar_piutang.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;

    fungsi.sqlExec(dm.Q_temp,
      'select tanggal, faktur, piutang from _vw_piutang where kd_perusahaan="' +
      dm.kd_perusahaan + '" and pelanggan="' + kd_pelanggan +
      '" and status=''belum lunas'' and faktur =' + quotedstr(ed_code.Text) + '', true);
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
    begin
      TableView.DataController.DeleteFocused;
      update_ket2;
    end;
end;

procedure Tf_bayar_piutang.ed_no_jurnalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    sSpeedButton1Click(Sender);
end;

procedure Tf_bayar_piutang.ed_codeKeyPress(Sender: TObject; var Key: Char);
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

procedure Tf_bayar_piutang.tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if AText <> '' then
    dibayar := AValue;
end;

procedure Tf_bayar_piutang.ed_pelangganKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    sb_1Click(Sender);
end;

end.

