unit uSaldoAwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Forms, Dialogs, DB, 
  StdCtrls, ComCtrls, Controls, Buttons, Classes, ExtCtrls,
  mySQLDbTables, sEdit, cxStyles, cxGraphics, 
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, sCurrEdit, sCurrencyEdit,
  sSpeedButton, sSkinProvider, sPanel, 
  Mask, sMaskEdit, sCustomComboEdit, cxCustomData, cxFilter, cxData;

type
  TFSaldoAwal = class(TForm)
    pnlatas: TPanel;
    pgAwalAkun: TPageControl;
    ABNeraca: TTabSheet;
    ABLabaRugi: TTabSheet;
    pnlNeraca: TPanel;
    dsNeraca: TDataSource;
    dsLabaRugi: TDataSource;
    pnlLabaRugi: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblNotBalance: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    ZqNeraca: TmySQLQuery;
    ZqLabaRugi: TmySQLQuery;
    edUbahNeraca: TsEdit;
    edUbahLabaRugi: TsEdit;
    GridLabaRugi: TcxGrid;
    TvLabaRugi: TcxGridDBTableView;
    tTvLabaRugikd_kiraan: TcxGridDBColumn;
    tTvLabaRugin_kiraan: TcxGridDBColumn;
    tTvLabaRugisaldo_awal: TcxGridDBColumn;
    LvLabaRugi: TcxGridLevel;
    GridNeraca: TcxGrid;
    TvNeraca: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    LvNeraca: TcxGridLevel;
    edBalance: TsCurrencyEdit;
    edPasiva: TsCurrencyEdit;
    edAktiva: TsCurrencyEdit;
    edMasuk: TsCurrencyEdit;
    edKeluar: TsCurrencyEdit;
    edLabaRugi: TsCurrencyEdit;
    sknprvdr1: TsSkinProvider;
    panel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    procedure ubahData(nilai: Integer; neraca: Boolean);
    procedure segarkan;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HitungNeraca;
    procedure HitungLabaRugi;
    procedure FormActivate(Sender: TObject);
    procedure edUbahNeracaKeyPress(Sender: TObject; var Key: Char);
    procedure edUbahNeracaEnter(Sender: TObject);
    procedure edUbahNeracaExit(Sender: TObject);
    procedure edUbahLabaRugiKeyPress(Sender: TObject; var Key: Char);
    procedure edUbahNeracaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_2Click(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaldoAwal: TFSaldoAwal;

implementation

{$R *.dfm}

uses
  u_dm, u_utama, UFungsi;

procedure TFSaldoAwal.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFSaldoAwal.edUbahLabaRugiKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
begin
  if not (Key in [#8, '0'..'9', #13, #43, #45]) then
    Key := #0;

  kode := edUbahLabaRugi.Text;

  if key = #43 then // tanda + (debet)
  begin
    delete(kode, pos('/', kode), 1);
    edUbahLabaRugi.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    ubahData(StrToIntDef(kode, 0), False);
  end;

  if key = #45 then // tanda - (kredit)
  begin
    delete(kode, pos('*', kode), 1);
    edUbahLabaRugi.Clear;
    key := #0;

    if Length(kode) = 0 then
      Exit;

    ubahData(StrToIntDef('-' + kode, 0), False);
  end;
end;

procedure TFSaldoAwal.edUbahNeracaEnter(Sender: TObject);
begin
  if TEdit(Sender).Text =
    'Masukkan Angka Kemudian tekan + atau - untuk merubah Nilai Saldo' then
    TEdit(Sender).Clear;
end;

procedure TFSaldoAwal.edUbahNeracaExit(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text :=
      'Masukkan Angka Kemudian tekan + atau - untuk merubah Nilai Saldo';
end;

procedure TFSaldoAwal.ubahData(nilai: Integer; neraca: Boolean);
begin
  if neraca then
  begin
    ZqNeraca.Edit;
    ZqNeraca.FieldByName('saldo_awal').AsFloat := nilai;
    ZqNeraca.Post;
    HitungNeraca;
  end
  else
  begin
    ZqLabaRugi.Edit;
    ZqLabaRugi.FieldByName('saldo_awal').AsFloat := nilai;
    ZqLabaRugi.Post;
    HitungLabaRugi;
  end;
  F_Utama.historical_balancing;
end;

procedure TFSaldoAwal.edUbahNeracaKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_up then
  begin
    if TEdit(Sender).Name = 'edUbahNeraca' then
      ZqNeraca.Prior
    else
      ZqLabaRugi.Prior;

    key := VK_NONAME;
  end;

  if key = vk_down then
    if TEdit(Sender).Name = 'edUbahNeraca' then
      ZqNeraca.Next
    else
      ZqLabaRugi.Next;
end;

procedure TFSaldoAwal.edUbahNeracaKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
begin
  if not (Key in [#8, '0'..'9', #13, #43, #45]) then
    Key := #0;

  kode := edUbahNeraca.Text;

  if key = #43 then // tanda + (debet)
  begin
    delete(kode, pos('/', kode), 1);
    edUbahNeraca.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    ubahData(StrToIntDef(kode, 0), True);
  end;

  if key = #45 then // tanda - (kredit)
  begin
    delete(kode, pos('*', kode), 1);
    edUbahNeraca.Clear;
    key := #0;

    if Length(kode) = 0 then
      Exit;

    ubahData(StrToIntDef('-' + kode, 0), True);
  end;
end;

procedure TFSaldoAwal.FormActivate(Sender: TObject);
var
  idx: Integer;
begin
  if not (dm.metu_kabeh) then
  begin
    idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(Self.Handle));
    f_utama.tc_child.Tag := -1;
    f_utama.tc_child.TabIndex := idx;
    f_utama.tc_child.Tag := 0;
  end;
end;

procedure TFSaldoAwal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := caFree;
  FSaldoAwal := nil;
end;

procedure TFSaldoAwal.FormCreate(Sender: TObject);
begin
  pgAwalAkun.ActivePage := ABNeraca;

  f_utama.MDIChildCreated(Self.Handle);

  segarkan;
end;

procedure TFSaldoAwal.FormShow(Sender: TObject);
var
  bl, dy: integer;
begin
  if dm.Bulan = '01' then
    bl := 12
  else
    bl := strtoint(dm.Bulan) - 1;
  dy := MonthDays[IsLeapYear(strtoint(dm.Tahun)), bl];

  pnlatas.Caption := 'Saldo Awal Akun ' + f_utama.sb.Panels[4].Text +
    ' per Tanggal ' + formatdatetime('dd mmmm YYYY', EncodeDate(strtoint(
    dm.Tahun), bl, dy));
  FSaldoAwal.WindowState := wsMaximized;
end;

function LeftStr(const Str: string; Size: Word): string;
begin
  Result := Copy(Str, 1, Size)
end;

procedure TFSaldoAwal.HitungLabaRugi;
var
  I, posisi, masuk, keluar: Integer;
begin
//laba rugi
  posisi := ZqLabaRugi.RecNo;
  masuk := 0;
  keluar := 0;

  ZqLabaRugi.First;
  for I := 0 to ZqLabaRugi.RecordCount - 1 do
  begin
    if (LeftStr(ZqLabaRugi.FieldByName('kd_kiraan').AsString, 1) = '4') or (LeftStr
      (ZqLabaRugi.FieldByName('kd_kiraan').AsString, 1) = '8') then
      masuk := masuk + ZqLabaRugi.FieldByName('saldo_awal').AsInteger
    else
      keluar := keluar + ZqLabaRugi.FieldByName('saldo_awal').AsInteger;

    ZqLabaRugi.Next;
  end;

  edMasuk.Value := masuk;
  edKeluar.Value := keluar;
  edLabaRugi.Value := masuk + keluar;
{
  edMasuk.Text:= FormatFloat('#,###,###;(#,###,###);0',masuk);
  edKeluar.Text:= FormatFloat('(#,###,###);#,###,###;0',keluar);
  edLabaRugi.Text:= FormatFloat('#,###,###;(#,###,###);0',masuk + keluar);
}
  ZqLabaRugi.RecNo := posisi;
end;

procedure TFSaldoAwal.HitungNeraca;
var
  I, posisi, aktiv, pasiv: Integer;
begin
//hitung neraca
  posisi := ZqNeraca.RecNo;
  aktiv := 0;
  pasiv := 0;

  ZqNeraca.First;
  for I := 0 to ZqNeraca.RecordCount - 1 do
  begin
    if LeftStr(ZqNeraca.FieldByName('kd_kiraan').AsString, 1) = '1' then
      aktiv := aktiv + ZqNeraca.FieldByName('saldo_awal').AsInteger
    else
      pasiv := pasiv + ZqNeraca.FieldByName('saldo_awal').AsInteger;

    ZqNeraca.Next;
  end;
  edAKtiva.Value := aktiv;
  edPasiva.Value := pasiv;
  edBalance.Value := aktiv + pasiv;
{
  edAKtiva.Text:= FormatFloat('#,###,###;(#,###,###);0',aktiv);
  edPasiva.Text:= FormatFloat('(#,###,###);#,###,###;0',pasiv);
  edBalance.Text:= FormatFloat('#,###,###;(#,###,###);0',aktiv + pasiv);
}
  if edBalance.Text <> '0' then
    lblNotBalance.Visible := True
  else
    lblNotBalance.Visible := false;

  ZqNeraca.RecNo := posisi;
end;

procedure TFSaldoAwal.segarkan;
begin
  fungsi.SQLExec(zqNeraca,
    'select * from vw_saldo_awal_akun where kd_perusahaan="' + 
    dm.kd_perusahaan + '" and bulan=' + dm.Bulan + ' and tahun=' +
    dm.Tahun + ' and kd_kiraan <40000 and kd_kiraan <>32999', true);

  fungsi.SQLExec(ZqLabaRugi,
    'select * from vw_saldo_awal_akun where kd_perusahaan="' + 
    dm.Kd_perusahaan + '" and bulan=' + dm.Bulan + ' and tahun=' +
    dm.Tahun + ' and kd_kiraan >=40000', true);

  HitungNeraca;
  HitungLabaRugi;

  TFloatField(ZqLabaRugi.fieldbyname('saldo_awal')).DisplayFormat := '#,#0;(#,#0);#,#0';
  TFloatField(ZqNeraca.fieldbyname('saldo_awal')).DisplayFormat := '#,#0;(#,#0);#,#0';
end;

procedure TFSaldoAwal.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

procedure TFSaldoAwal.sb_1Click(Sender: TObject);
begin
  close;
end;

end.

