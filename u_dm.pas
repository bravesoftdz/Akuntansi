unit u_dm;

interface

uses
  SysUtils, Classes, mySQLDbTables, DB, sSkinManager, dialogs, forms, ImgList,
  Controls, acAlphaImageList, frxClass, frxDBSet, inifiles, Windows, cxStyles,
  SHFolder;

type
  Tdm = class(TDataModule)
    db_conn: TmySQLDatabase;
    ds_show: TDataSource;
    Q_Exe: TmySQLQuery;
    Q_Show: TmySQLQuery;
    sm: TsSkinManager;
    Q_temp: TmySQLQuery;
    gambar: TsAlphaImageList;
    q_cari: TmySQLQuery;
    ds_cari: TDataSource;
    Q_buku_besar: TmySQLQuery;
    R_buku_besar: TfrxDBDataset;
    Laporan: TfrxReport;
    Q_Trial_balance1: TmySQLQuery;
    R_Trial_Balance1: TfrxDBDataset;
    Q_trial_balance2: TmySQLQuery;
    R_trial_balance2: TfrxDBDataset;
    Q_laporan: TmySQLQuery;
    db_Laporan: TfrxDBDataset;
    image: TsAlphaImageList;
    ds_TShow: TDataSource;
    ds_kiraan: TDataSource;
    ds_subklas: TDataSource;
    ds_klas: TDataSource;
    Q_klas: TmySQLQuery;
    Q_subklas: TmySQLQuery;
    Q_kiraan: TmySQLQuery;
    Q_tampil: TmySQLQuery;
    stl_focus: TcxStyleRepository;
    cxstyl1: TcxStyle;
    Q_koneksi: TmySQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure smAfterChange(Sender: TObject);
  private
    { Private declarations }
  public
    kd_comp: string;
    Path, AppPath: string;
    metu_kabeh: boolean;
    PeriodAktif: string;
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
    db_conn.Host := krupuk(pusat, 6);
    db_conn.DatabaseName := krupuk(data, 6);
    jalur1 := krupuk(jalur2, 6);
    db_conn.Port := strtoint(jalur1);
    db_conn.UserName := krupuk(nama, 6);
    db_conn.UserPassword := krupuk(kata, 6);
    db_conn.Connected := true;

  except
    on E: exception do
    begin
      showmessage('koneksi tidak berhasil '#10#13'' + e.Message);
      application.Terminate;
      exit;
    end;
  end;

  dm.Path := ExtractFilePath(Application.ExeName);

  AppPath := GetAppData(CSIDL_COMMON_APPDATA);
  if not (DirectoryExists(AppPath)) then
    CreateDir(AppPath);
  sm.SkinDirectory := AppPath + 'skins';

  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    kd_comp := appINI.ReadString('akun', 'kd_perusahaan', '');
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

end.

