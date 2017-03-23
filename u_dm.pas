unit u_dm;

interface

uses
  SysUtils, Classes, DB, sSkinManager, dialogs, forms, ImgList,
  Controls, acAlphaImageList, frxClass, frxDBSet, inifiles, Windows, cxStyles,
  SHFolder, MemDS, DBAccess, MyAccess, cxClasses;

type
  Tdm = class(TDataModule)
    db_conn: TMyConnection;
    ds_show: TDataSource;
    Q_Exe: TMyQuery;
    Q_Show: TMyQuery;
    sm: TsSkinManager;
    Q_temp: TMyQuery;
    gambar: TsAlphaImageList;
    Q_buku_besar: TMyQuery;
    R_buku_besar: TfrxDBDataset;
    Laporan: TfrxReport;
    Q_Trial_balance1: TMyQuery;
    R_Trial_Balance1: TfrxDBDataset;
    Q_trial_balance2: TMyQuery;
    R_trial_balance2: TfrxDBDataset;
    Q_laporan: TMyQuery;
    db_Laporan: TfrxDBDataset;
    image: TsAlphaImageList;
    ds_TShow: TDataSource;
    ds_kiraan: TDataSource;
    ds_subklas: TDataSource;
    ds_klas: TDataSource;
    Q_klas: TMyQuery;
    Q_subklas: TMyQuery;
    Q_kiraan: TMyQuery;
    Q_tampil: TMyQuery;
    stl_focus: TcxStyleRepository;
    cxstyl1: TcxStyle;
    Q_koneksi: TMyQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure smAfterChange(Sender: TObject);
  private
    FPeriodeAktif, FBulan, FTahun: string;
    { Private declarations }
  public
    kd_perusahaan, kd_pengguna, Path, AppPath: string;
    metu_kabeh: boolean;
    property PeriodAktif: string read FPeriodeAktif;
    property Bulan: string read FBulan;
    property Tahun: string read FTahun;
    procedure SetPeriodeAktif(PeriodeAktif: string);
    function FRObject(FastReport: TfrxReport; ObjectName: string): TObject;
    function FRMemo(FastReport: TfrxReport; ObjectName: string): TfrxMemoView;
    { Public declarations }
  end;

var
  dm: Tdm;
  mgs: TMsg;

implementation


{$R *.dfm}

function GetAppData(Folder: Integer): string;
var
  path: array[0..MAX_PATH] of Char;
begin
  if Succeeded(SHGetFolderPath(0, Folder, 0, 0, @Path[0])) then
    Result := path + '\Gain Profit\'
  else
    Result := '';
end;

function Tdm.FRObject(FastReport: TfrxReport; ObjectName: string): TObject;
var
  i: Integer;
  AFound: Boolean;
begin
  AFound := False;
  for I := 0 to FastReport.ComponentCount - 1 do
  begin
    if LowerCase(FastReport.Components[i].Name) = LowerCase(ObjectName) then
    begin
      Result := TObject(FastReport.Components[i]);
      AFound := True;
      Break;
    end;
  end;
  if not AFound then
  begin
    Result := nil;
  end;
end;

function Tdm.FRMemo(FastReport: TfrxReport; ObjectName: string): TfrxMemoView;
begin
  Result := TfrxMemoView(FRObject(FastReport, ObjectName));
end;

function krupuk(const s: string; CryptInt: Integer): string;
var
  i: integer;
  s2: string;
begin
  if not (Length(s) = 0) then
    for i := 1 to Length(s) do
      s2 := s2 + Chr(Ord(s[i]) - cryptint);
  Result := s2;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  data, pusat, jalur1, jalur2, nama, kata: string;
  X: TextFile;
  appINI: TIniFile;
begin
  db_conn.Connected := False;

  assignfile(X, 'tools\koneksi.cbCon');
  try
    reset(X);
    readln(X, pusat);
    readln(X, data);
    readln(X, jalur2);
    readln(X, nama);
    readln(X, kata);
    closefile(X);
    db_conn.Server := krupuk(pusat, 6);
    db_conn.Database := krupuk(data, 6);
    jalur1 := krupuk(jalur2, 6);
    db_conn.Port := strtoint(jalur1);
    db_conn.Username := krupuk(nama, 6);
    db_conn.Password := krupuk(kata, 6);
  except
    on E: exception do
    begin
      showmessage('koneksi tidak berhasil '#10#13'' + e.Message);
      application.Terminate;
      exit;
    end;
  end;

  Path := ExtractFilePath(Application.ExeName);

  AppPath := GetAppData(CSIDL_COMMON_APPDATA);
  if not (DirectoryExists(AppPath)) then
    CreateDir(AppPath);
  sm.SkinDirectory := Path + 'Tools\Skins';

  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    kd_perusahaan := appINI.ReadString('akun', 'kd_perusahaan', '');
    sm.SkinName := appINI.ReadString('akun', 'nama_skin', 'Lucky');
    sm.HueOffset := appini.ReadInteger('akun', 'hue_skin', 0);
    sm.Saturation := appini.ReadInteger('akun', 'sat_skin', 0);

  finally
    appINI.Free;
  end;
end;

procedure Tdm.smAfterChange(Sender: TObject);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    appINI.WriteString('akun', 'nama_skin', dm.sm.SkinName);
    appINI.WriteInteger('akun', 'hue_skin', dm.sm.HueOffset);
    appINI.WriteInteger('akun', 'sat_skin', dm.sm.Saturation);
  finally
    appINI.Free;
  end;
end;

procedure Tdm.SetPeriodeAktif(PeriodeAktif: string);
begin
  Self.FTahun := Copy(PeriodeAktif, 1, 4);
  Self.FBulan := Copy(PeriodeAktif, 6, 2);
  Self.FPeriodeAktif := Self.FTahun + Self.FBulan;
end;

end.

