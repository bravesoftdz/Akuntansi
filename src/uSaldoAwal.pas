unit uSaldoAwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Forms, Dialogs, DB, 
  StdCtrls, ComCtrls, Controls, Buttons, Classes, ExtCtrls,
  sEdit, cxStyles, cxGraphics, 
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, sCurrEdit, sCurrencyEdit,
  sSpeedButton, sSkinProvider, sPanel, 
  Mask, sMaskEdit, sCustomComboEdit, MemDS,
  DBAccess, MyAccess, cxCustomData, cxFilter, cxData, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, cxCurrencyEdit;

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
    ZqNeraca: TMyQuery;
    ZqLabaRugi: TMyQuery;
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
    procedure ubahData(nilai: Currency; neraca: Boolean);
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
    procedure SegarkanNeraca;
    procedure SegarkanLabaRugi;
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
  LValue: Currency;
begin
  kode := edUbahLabaRugi.Text;

  if key = #43 then // tanda + (debet)
  begin
    delete(kode, pos('/', kode), 1);
    edUbahLabaRugi.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    try
      LValue := StrToCurr(kode);
      ubahData(LValue, False);
    except on E: Exception do
      ShowMessage(e.Message);
    end;
  end;

  if key = #45 then // tanda - (kredit)
  begin
    delete(kode, pos('*', kode), 1);
    edUbahLabaRugi.Clear;
    key := #0;

    if Length(kode) = 0 then
      Exit;

    try
      LValue := StrToCurr('-' + kode);
      ubahData(LValue, False);
    except on E: Exception do
      ShowMessage(e.Message);
    end;
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

procedure TFSaldoAwal.ubahData(nilai: Currency; neraca: Boolean);
var
  LSql, LKdKiraan: string;
begin
  if neraca then
    LKdKiraan := ZqNeraca.FieldByName('kd_kiraan').AsString else
    LKdKiraan := ZqLabaRugi.FieldByName('kd_kiraan').AsString;

  LSql := Format('UPDATE tb_jurnal_history SET saldo_awal = %g ' +
                 'WHERE kd_perusahaan = "%s" AND ' +
                 'kd_kiraan = "%s" AND tahun = %d AND bulan = %d',
                 [ nilai, dm.kd_perusahaan, LKdKiraan, StrToInt(dm.Tahun),
                 StrToInt(dm.Bulan) ]);
  fungsi.SQLExec(dm.Q_Exe, LSql, False);
  F_Utama.historical_balancing;
  if neraca then
    SegarkanNeraca else
    SegarkanLabaRugi;
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
  LValue: Currency;
begin
  kode := edUbahNeraca.Text;

  if key = #43 then // tanda + (debet)
  begin
    delete(kode, pos('/', kode), 1);
    edUbahNeraca.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    try
      LValue := StrToCurr(kode);
      ubahData(LValue, True);
    except on E: Exception do
      ShowMessage(e.Message);
    end;
  end;

  if key = #45 then // tanda - (kredit)
  begin
    delete(kode, pos('*', kode), 1);
    edUbahNeraca.Clear;
    key := #0;

    if Length(kode) = 0 then
      Exit;

    try
      LValue := StrToCurr('-' + kode);
      ubahData(LValue, True);
    except on E: Exception do
      ShowMessage(e.Message);
    end;
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
  I: Integer;
  LIn, LOut: Currency;
begin
//laba rugi
  LIn := 0;
  LOut := 0;

  ZqLabaRugi.First;
  for I := 0 to ZqLabaRugi.RecordCount - 1 do
  begin
    if (LeftStr(ZqLabaRugi.FieldByName('kd_kiraan').AsString, 1) = '4') or (LeftStr
      (ZqLabaRugi.FieldByName('kd_kiraan').AsString, 1) = '8') then
      LIn := LIn + ZqLabaRugi.FieldByName('saldo_awal').AsCurrency
    else
      LOut := LOut + ZqLabaRugi.FieldByName('saldo_awal').AsCurrency;

    ZqLabaRugi.Next;
  end;

  edMasuk.Value := LIn;
  edKeluar.Value := LOut;
  edLabaRugi.Value := LIn + LOut;
end;

procedure TFSaldoAwal.HitungNeraca;
var
  I: Integer;
  LAktiva, LPasiva: Currency;
begin
//hitung neraca
  LAktiva := 0;
  LPasiva := 0;

  ZqNeraca.First;
  for I := 0 to ZqNeraca.RecordCount - 1 do
  begin
    if LeftStr(ZqNeraca.FieldByName('kd_kiraan').AsString, 1) = '1' then
      LAktiva := LAktiva + ZqNeraca.FieldByName('saldo_awal').AsCurrency
    else
      LPasiva := LPasiva + ZqNeraca.FieldByName('saldo_awal').AsCurrency;

    ZqNeraca.Next;
  end;
  edAKtiva.Value := LAktiva;
  edPasiva.Value := LPasiva;
  edBalance.Value := LAktiva + LPasiva;

  if edBalance.Value <> 0 then
    lblNotBalance.Visible := True
  else
    lblNotBalance.Visible := false;
end;

procedure TFSaldoAwal.segarkan;
begin
  SegarkanNeraca;
  SegarkanLabaRugi;
end;

procedure TFSaldoAwal.SegarkanLabaRugi;
var
  LPosisi: Integer;
begin
  LPosisi := ZqLabaRugi.RecNo;

  fungsi.SQLExec(ZqLabaRugi,
    'select * from vw_saldo_awal_akun where kd_perusahaan="' + 
    dm.Kd_perusahaan + '" and bulan=' + dm.Bulan + ' and tahun=' +
    dm.Tahun + ' and kd_kiraan >=40000', true);
  HitungLabaRugi;

  ZqLabaRugi.RecNo := LPosisi;
end;

procedure TFSaldoAwal.SegarkanNeraca;
var
  LPosisi: Integer;
begin
  LPosisi := ZqNeraca.RecNo;

  fungsi.SQLExec(zqNeraca,
    'select * from vw_saldo_awal_akun where kd_perusahaan="' + 
    dm.kd_perusahaan + '" and bulan=' + dm.Bulan + ' and tahun=' +
    dm.Tahun + ' and kd_kiraan <40000 and kd_kiraan <>32999', true);
  HitungNeraca;

  ZqNeraca.RecNo := LPosisi;
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

