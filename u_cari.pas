unit u_cari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, sEdit, sButton, ExtCtrls,
  DBCtrls, sSkinProvider, sLabel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  NewControl = class(TControl);
  Tf_cari = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_cari: TsEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    clm1: TcxGridDBColumn;
    clm2: TcxGridDBColumn;
    clm3: TcxGridDBColumn;
    clm4: TcxGridDBColumn;
    l_data: TcxGridLevel;
    procedure Ed_cariChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure t_dataDblClick(Sender: TObject);
    procedure Ed_cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure t_dataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
  end;

var
  F_cari:TF_cari;
  sumber:TForm;
  tipe_cari: integer;
  asal,kondisi: string;
  
implementation

uses u_dm, u_utama, u_bayar_piutang, u_bayar_hutang, u_GJurnal,
  u_Jurnal_Kas, U_Login, u_akun_penting, UFungsi;

{$R *.dfm}

function cari_tabel(sql:string):string;
var  nPos,npos2,npos3   : integer;
begin
  nPos:= Pos( 'from', sql );
  delete(sql,1,npos+4);

  npos2:= pos(' ',sql);
  npos3:= length(sql);
  delete(sql,npos2,npos3);

  result:= sql;
end;

function cari_kondisi(sql:string):string;
var  nPos   : integer;
begin
  nPos:= Pos('where', sql );
  if nPos<> 0 then
  delete(sql,1,npos+5) else
  sql:='';
  
  result:= sql;
end;

procedure Tf_cari.Ed_cariChange(Sender: TObject);
var nm_tabel: string;
begin
nm_tabel:= cari_tabel(dm.q_cari.SQL.Text);

case dm.q_cari.FieldCount of
  2:
  begin
    fungsi.SQLExec(dm.q_cari,'select '+clm1.DataBinding.FieldName+','+clm2.DataBinding.FieldName
    +' from '+nm_tabel+' where '+kondisi+'('+clm1.DataBinding.FieldName+' like "%'+
    ed_cari.Text+'%" or '+clm2.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%") limit 0,100',true);
  end;
  3:
  begin
    fungsi.SQLExec(dm.q_cari,'select '+clm1.DataBinding.FieldName+','+clm2.DataBinding.FieldName
    +','+clm3.DataBinding.FieldName+' from '+nm_tabel+' where '+kondisi+'('+clm1.DataBinding.FieldName+' like "%'+
    ed_cari.Text+'%" or '+clm2.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%"  or '+
    clm3.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%") limit 0,100',true);
  end;
  4:
  begin
    fungsi.SQLExec(dm.q_cari,'select '+clm1.DataBinding.FieldName+','+clm2.DataBinding.FieldName
    +','+clm3.DataBinding.FieldName+' from '+nm_tabel+' where '+kondisi+'('+clm1.DataBinding.FieldName+' like "%'+
    ed_cari.Text+'%" or '+clm2.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%"  or '+
    clm3.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%") limit 0,100',true);
  end;
end;
end;

procedure Tf_cari.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close;

if key=vk_f2 then ed_cari.SetFocus;
end;

procedure Tf_cari.FormShow(Sender: TObject);
begin
  if cari_kondisi(dm.q_cari.SQL.Text)<>'' then
    kondisi:= cari_kondisi(dm.q_cari.SQL.Text)+ ' AND ' else
    kondisi:='';

case dm.q_cari.FieldCount of
  2:
  begin
    clm1.DataBinding.FieldName:= dm.q_cari.Fields[0].FieldName;
    clm2.DataBinding.FieldName:= dm.q_cari.Fields[1].FieldName;
    clm3.Visible:=false;
    clm4.Visible:=false;
  end;
  3:
  begin
    clm1.DataBinding.FieldName:= dm.q_cari.Fields[0].FieldName;
    clm2.DataBinding.FieldName:= dm.q_cari.Fields[1].FieldName;
    clm3.DataBinding.FieldName:= dm.q_cari.Fields[2].FieldName;
    clm4.Visible:=false;
  end;
  4:
  begin
    clm1.DataBinding.FieldName:= dm.q_cari.Fields[0].FieldName;
    clm2.DataBinding.FieldName:= dm.q_cari.Fields[1].FieldName;
    clm3.DataBinding.FieldName:= dm.q_cari.Fields[2].FieldName;
    clm4.DataBinding.FieldName:= dm.q_cari.Fields[3].FieldName;
  end;
end;
end;

procedure Tf_cari.t_dataDblClick(Sender: TObject);
begin
try
   case tipe_cari of
      8 : //perusahaan barang_det
      begin
      if asal='f_utama' then
      begin
      if f_utama.sb.Panels[3].Text <> dm.q_cari.fieldbyname('kd_Perusahaan').AsString then
        begin
          application.CreateForm(Tf_login, f_login);
          F_Login.sb.Panels[0].Text:= dm.q_cari.fieldbyname('kd_Perusahaan').AsString;
          F_Login.sb.Panels[1].Text:= dm.q_cari.fieldbyname('n_Perusahaan').AsString;
          f_utama.caption:= 'Account Of Profit ('+f_utama.sb.Panels[4].Text+')';
          f_cari.hide;
          f_login.ShowModal;
        end;
      end;
      if asal='f_login' then
      begin
      F_Login.sb.Panels[0].Text:= dm.q_cari.fieldbyname('kd_Perusahaan').AsString;
      F_Login.sb.Panels[1].Text:= dm.q_cari.fieldbyname('n_Perusahaan').AsString;
      f_utama.caption:= 'Account Of Profit ('+f_utama.sb.Panels[4].Text+')';
      end;
      end;
      9 : //supplier/pelanggan
      begin
      if asal='f_bayar_piutang' then
      begin
      u_bayar_piutang.kd_pelanggan:= dm.q_cari.fieldbyname('kd_pelanggan').AsString;
      f_bayar_piutang.ed_pelanggan.text:=dm.q_cari.fieldbyname('n_pelanggan').AsString;
      f_bayar_piutang.ed_keterangan.Text:= 'Pembayaran Piutang oleh '+f_bayar_piutang.ed_pelanggan.text;
      end else
      if asal='f_bayar_hutang' then
      begin
      u_bayar_hutang.kd_supp:= dm.q_cari.fieldbyname('kode').AsString;
      f_bayar_hutang.ed_supp.text:=dm.q_cari.fieldbyname('n_supp').AsString;
      f_bayar_hutang.ed_keterangan.Text:= 'Pembayaran Hutang pada '+f_bayar_hutang.ed_supp.text;
      end;
      end;
      10 : //kode Barang
      begin
      end;
      11 : //daftar hutang/piutang
      begin
      if asal='f_bayar_piutang' then
      begin
      f_bayar_piutang.ed_code.text:= dm.q_cari.fieldbyname('faktur').AsString;
      end else
      if asal='f_bayar_hutang' then
      begin
        f_bayar_hutang.ed_code.Text := dm.q_cari.fieldbyname('faktur').AsString;
      end;
      end;
      66: //global jurnal
      begin
      if asal='f_bayar_piutang' then
      begin
      f_bayar_piutang.ed_no_jurnal.Text:= dm.q_cari.fieldbyname('kd_kiraan').AsString;
      f_bayar_piutang.ed_nJurnal.Text:= dm.q_cari.fieldbyname('n_kiraan').AsString;
      end else
      if asal='f_bayar_hutang' then
      begin
      f_bayar_hutang.ed_no_jurnal.Text:= dm.q_cari.fieldbyname('kd_kiraan').AsString;
      f_bayar_hutang.ed_nJurnal.Text:= dm.q_cari.fieldbyname('n_kiraan').AsString;
      end else
      if asal='f_jglobal' then
      begin
      f_gjurnal.ed_code.Text:= dm.q_cari.fieldbyname('kd_kiraan').AsString;
      end else
      if asal='f_jurnal_kas1' then
      begin
      f_jurnal_kas.ed_no_jurnal.Text:= dm.q_cari.fieldbyname('kd_kiraan').AsString;
      f_jurnal_kas.ed_nJurnal.Text:= dm.q_cari.fieldbyname('n_kiraan').AsString;
      end else
      if asal='f_jurnal_kas2' then
      begin
      f_Jurnal_Kas.ed_code.Text:= dm.q_cari.fieldbyname('kd_kiraan').AsString;
      end;
      if asal='f_akun_penting' then
      begin
        if MessageBox(0, 'Benarkah data akun penting ini'+#13+#10+'AKAN ANDA RUBAH...???', 'UBAH AKUN PENTING',
        MB_ICONQUESTION or MB_YESNO)=mrYes then
        begin
          fungsi.SQLExec(dm.Q_Exe, 'update tb_konfig_akun set kd_akun = '+
          QuotedStr(dm.q_cari.fieldbyname('kd_kiraan').AsString)+', `update` = date(now()) where no_ix= '+
          quotedStr(f_akun_penting.Q_akun_penting.fieldbyname('no_ix').AsString)+'', False);
        end else
        exit;
      end;
      end;
   end;
close;
except
end;

end;

procedure Tf_cari.Ed_cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_up then
begin
  if t_data.DataController.FocusedRecordIndex >=1 then
     t_data.DataController.FocusedRecordIndex:= t_data.DataController.FocusedRecordIndex-1;
key:=VK_NONAME;
end;

if key= vk_down then
t_data.DataController.FocusedRowIndex:= t_data.DataController.FocusedRowIndex+1;

if key= vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
t_dataDblClick(Sender);
end;
end;

procedure Tf_cari.t_dataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_return then
t_dataDblClick(Sender);
end;

end.
