unit u_GJurnal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls, sEdit, sLabel,
  Grids, sCurrEdit, sCurrencyEdit, sButton, Buttons, sSpeedButton, sGroupBox,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, sPanel;

type
  TF_GJurnal = class(TForm)
    sLabel5: TsLabel;
    ce_balance: TsCurrencyEdit;
    gb_1: TsGroupBox;
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    ed_refrensi: TsEdit;
    de_tanggal: TsDateEdit;
    ed_keterangan: TsEdit;
    ed_code: TsEdit;
    sb_cari: TsSpeedButton;
    Grid: TcxGrid;
    tableview: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    Level: TcxGridLevel;
    view_TableViewColumn1: TcxGridColumn;
    p1: TsPanel;
    sButton1: TsButton;
    sButton2: TsButton;
    b_hapus: TsButton;
    l_4: TsLabel;
    l_5: TsLabel;
    l_6: TsLabel;
    procedure CreateRows;
    procedure awal;
    procedure FormShow(Sender: TObject);
    procedure b_hapusClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure simpan;
    procedure sButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_cariClick(Sender: TObject);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure
      tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure
      tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
  private
    { Private declarations }
  public
    tot_debet, tot_kredit: Real;
    { Public declarations }
  end;

var
  F_GJurnal: TF_GJurnal;

implementation

uses
  u_cari, u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure TF_GJurnal.awal;
var
  a: integer;
begin
  fungsi.SQLExec(dm.Q_temp,
    'select IFNULL(count(no_ix),0) as jumlah from tb_jurnal_global where refr=''GJ''',
    true);
  a := (dm.Q_temp.fieldbyname('jumlah').AsInteger) + 1;

  if a < 10 then
    ed_refrensi.Text := 'GJ-000000' + inttostr(a)
  else if a < 100 then
    ed_refrensi.Text := 'GJ-00000' + inttostr(a)
  else if a < 1000 then
    ed_refrensi.Text := 'GJ-0000' + inttostr(a)
  else if a < 10000 then
    ed_refrensi.Text := 'GJ-000' + inttostr(a)
  else if a < 100000 then
    ed_refrensi.Text := 'GJ-00' + inttostr(a)
  else if a < 1000000 then
    ed_refrensi.Text := 'GJ-0' + inttostr(a);

  ed_keterangan.Clear;

  de_tanggal.Date := now;
  ce_balance.Clear;
  tableview.DataController.RecordCount := 0;
end;

procedure TF_GJurnal.FormShow(Sender: TObject);
begin
  awal;
end;

procedure TF_GJurnal.b_hapusClick(Sender: TObject);
var
  p: integer;
begin
  if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes) then
    TableView.DataController.DeleteFocused;
end;

procedure TF_GJurnal.sButton1Click(Sender: TObject);
begin
  simpan;
end;

procedure TF_GJurnal.simpan;
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

  if ce_balance.Value <> 0 then
  begin
    showmessage('Jurnal belum Balance, '#10#13'Sebelum menyimpan Pastikan Jurnal Balance!!!');
    exit;
  end;

  if tableview.DataController.RecordCount < 2 then
  begin
    showmessage('tidak dapat menyimpan data '#10#13'karena minimal ada 2 akun dalam tabel...');
    exit;
  end;

  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_temp,
      'select IFNULL(max(no_ix),1) as jumlah from tb_jurnal_global', true);
    ix_jurnal := (dm.Q_temp.fieldbyname('jumlah').AsInteger) + 1;

    for x := 0 to tableview.DataController.RecordCount - 1 do
    begin
      isi_sql := isi_sql + '("' + dm.kd_perusahaan + '","' + inttostr(ix_jurnal)
        + '","' + inttostr(x + 1) + '","' + TableView.DataController.GetDisplayText
        (x, 0) + '","' + floattostr(TableView.DataController.GetValue(x, 2)) +
        '","' + floattostr(TableView.DataController.GetValue(x, 3)) + '"),';
    end;
    delete(isi_sql, length(isi_sql), 1);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_global(kd_perusahaan,no_ix,tgl,keterangan, ' +
      'no_refrensi,refr,nilai) values ("' + dm.kd_perusahaan + '","' +
      inttostr(ix_jurnal) + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date)
      + '","' + ed_keterangan.Text + '","' + ed_refrensi.Text + '","GJ","' +
      floattostr(tot_debet) + '")', false);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_jurnal_rinci(kd_perusahaan,ix_jurnal,no_urut,kd_akun, ' +
      'debet,kredit) values ' + isi_sql, false);

    fungsi.SQLExec(dm.Q_exe, 'call sp_historical_balancing("' + f_utama.sb.Panels
      [3].Text + '","' + formatdatetime('yyyy-MM-dd', de_tanggal.Date) + '")', false);
    dm.db_conn.Commit;
    showmessage('Penyimpanan Data Sukses...'#10#13'Tekan Enter Untuk Melakukan Transaksi Baru...');
    AWAL;
    ed_keterangan.SetFocus;
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
end;

procedure TF_GJurnal.sButton2Click(Sender: TObject);
begin
  awal;
end;

procedure TF_GJurnal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    ed_code.setfocus;
end;

procedure TF_GJurnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  f_gjurnal := nil;
end;

procedure TF_GJurnal.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_kiraan, n_kiraan from tb_kiraan';
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

procedure TF_GJurnal.CreateRows;
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
  TableView.DataController.SetValue(baris_baru - 1, 3, 0);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
end;

function LeftStr(const Str: string; Size: Word): string;
begin
  LeftStr := Copy(Str, 1, Size)
end;

procedure TF_GJurnal.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;

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

procedure TF_GJurnal.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
  b: Integer;
begin
  if TableView.DataController.RecordCount = 0 then
    Exit;

  kode := Ed_Code.Text;
  b := TableView.DataController.GetFocusedRecordIndex;

  if key = #47 then // tanda / (debet)
  begin
    delete(kode, pos('/', kode), 1);
    ed_code.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 2, StrToIntDef(kode, 0)); //nilai
  end;

  if key = #42 then // tanda * (kredit)
  begin
    delete(kode, pos('*', kode), 1);
    ed_code.Clear;
    key := #0;

    if Length(kode) = 0 then
      Exit;

    TableView.DataController.SetValue(b, 3, StrToIntDef(kode, 0)); //nilai
  end;

end;

procedure TF_GJurnal.tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if AText <> '' then
  begin
    tot_debet := AValue;
    ce_balance.Value := tot_debet - tot_kredit;
  end;
end;

procedure TF_GJurnal.tableviewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if AText <> '' then
  begin
    tot_kredit := AValue;
    ce_balance.Value := tot_debet - tot_kredit;
  end;
end;

end.

