unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sLabel, sEdit, Buttons, sBitBtn, sButton, 
  ComCtrls, 
  sStatusBar, StdCtrls;

type
  TF_Login = class(TForm)
    sBitBtn2: TsBitBtn;
    sButton1: TsButton;
    Ed_Kd_User: TsEdit;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    Ed_N_User: TsEdit;
    sLabel6: TsLabel;
    Ed_Password: TsEdit;
    sb: TsStatusBar;
    l_1: TsLabel;
    procedure Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ed_N_UserEnter(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ed_Kd_UserChange(Sender: TObject);
    procedure sbClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    userPassword, userRealName: string;
    sop: Boolean;
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

uses
  u_dm, u_utama, u_cari, UFungsi;


{$R *.dfm}

procedure TF_Login.Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sql: string;
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sql := Format('SELECT tb_user.n_user, tb_user.`password` FROM tb_user ' +
      'INNER JOIN tb_user_company ON tb_user.kd_user = tb_user_company.kd_user ' +
      'WHERE tb_user.kd_user="%s" AND tb_user_company.akun="Y" ' +
      'AND tb_user_company.kd_perusahaan="%s"', [ed_kd_user.Text, dm.kd_perusahaan]);

    fungsi.SQLExec(DM.Q_Show, sql, true);
    if dm.Q_show.Eof then
    begin
      messagedlg('Kode ini tidak terdaftar...', mtError, [mbOk], 0);
      ed_kd_user.SetFocus;
    end
    else
    begin
      userRealName := dm.Q_show.FieldByName('n_user').AsString;
      userPassword := dm.Q_show.FieldByName('password').AsString;

      sql := 'SELECT `nilai` FROM `tb_settings` WHERE `parameter`="checkin"';
      fungsi.SQLExec(DM.Q_Show, sql, true);
      if dm.Q_show.FieldByName('nilai').AsBoolean then
      begin
        sql := Format('SELECT user_id FROM tb_checkinout WHERE ISNULL(checkout_time) '
          + 'AND user_id="%s"', [ed_kd_user.Text]);
        fungsi.SQLExec(DM.Q_Show, sql, true);
        if dm.Q_show.Eof then
        begin
          messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',
            mtError, [mbOk], 0);
          ed_kd_user.SetFocus;
          Exit;
        end;
      end;

      ed_password.Enabled := true;
      Ed_Password.SetFocus;
      Ed_N_User.Text := userRealName;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TF_Login.sButton1Click(Sender: TObject);
var
  passs, sql: string;
begin
  if ed_n_user.Text <> '' then
  begin
    sql := Format('select md5("%s")as passs, RIGHT(periode_akun,2) as bulan, ' +
      'left(periode_akun,4) as tahun from tb_company where kd_perusahaan="%s"',
      [ed_password.Text, dm.kd_perusahaan]);
      
    fungsi.SQLExec(dm.Q_temp, sql, true);
    passs := dm.Q_temp.fieldbyname('passs').AsString;

    if compareText(userPassword, passs) <> 0 then
    begin
      messagedlg('Password salah..', mtError, [mbOk], 0);
      ed_password.Clear;
      ed_password.SetFocus;
    end
    else
    begin
      dm.kd_pengguna := Ed_Kd_User.Text;
      F_utama.Sb.Panels[0].Text := dm.kd_pengguna;
      F_utama.Sb.Panels[1].Text := ed_N_User.Text;

      dm.kd_perusahaan := sb.Panels[0].Text;
      F_utama.sb.Panels[3].Text := dm.kd_perusahaan;
      F_utama.sb.Panels[4].Text := sb.Panels[1].Text;
      F_utama.caption := 'Account Of Profit (' + sb.Panels[1].Text + ')';

      fungsi.SQLExec(dm.Q_temp, 'SELECT IFNULL(MAX(CONCAT(tahun,"-",LPAD(bulan,2,0))), '+
      'DATE_FORMAT(NOW(),"%Y-%m")) AS periode FROM tb_jurnal_history '+
      'WHERE kd_perusahaan = "'+ dm.kd_perusahaan +'"', true);

      dm.SetPeriodeAktif(dm.Q_temp.fieldbyname('periode').AsString);

      f_utama.sb.Panels[6].Text := dm.Bulan;
      f_utama.sb.Panels[7].Text := dm.Tahun;
      
      f_utama.panel_auto_width;
      sop := false;
      close;
    end;
  end;
end;

procedure TF_Login.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    close;
  if key = vk_f2 then
    sbClick(self);
end;

procedure TF_Login.Ed_N_UserEnter(Sender: TObject);
begin
  ed_kd_user.SetFocus;
end;

procedure TF_Login.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if sop = true then
    application.Terminate
  else
    action := cafree;
end;

procedure TF_Login.Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sButton1Click(Sender);
  end;
end;

procedure TF_Login.Ed_Kd_UserChange(Sender: TObject);
begin
  Ed_N_User.Clear;
  Ed_Password.Clear;
end;

procedure TF_Login.sbClick(Sender: TObject);
begin
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_perusahaan, n_perusahaan from tb_company';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    if ShowModal = mrOk then
    begin
      sb.Panels[0].Text := TblVal[0];
      sb.Panels[1].Text := TblVal[1];
      Ed_Kd_User.Clear;
      Ed_Kd_User.SetFocus;
      Ed_Password.Enabled := False;
    end;
  finally
    close;
  end;
end;

procedure TF_Login.FormShow(Sender: TObject);
begin
  sop := True;
  f_utama.sb.Panels[0].Text := 'USER';
  f_utama.sb.Panels[1].Text := 'NAMA USER';
end;

end.

