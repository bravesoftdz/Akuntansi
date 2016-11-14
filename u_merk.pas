unit u_merk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel,UFungsi;

type
  Tf_merk = class(TForm)
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    ed_kode: TsEdit;
    ed_desc: TsEdit;
    B_save: TsButton;
    B_new: TsButton;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_merk: Tf_merk;
  fungsi:tfungsi;
  merk_baru:boolean;

implementation

uses u_dm, u_cari;

{$R *.dfm}

procedure Tf_merk.baru;
begin
{fungsi.SQLExec(dm.q_temp,'select * from tb_merk',true);
ed_kode.Text:= inttostr(dm.Q_temp.recordcount+1);
}
ed_kode.Clear;
ed_kode.ReadOnly:= false;
ed_desc.Clear;
merk_baru:= true;
end;

procedure Tf_merk.ubah;
begin
ed_kode.Text:= dm.q_cari.FieldByName('kd_merk').AsString;
ed_desc.text:= dm.q_cari.FieldByName('n_merk').AsString;
merk_baru:= false;
end;

procedure Tf_merk.B_newClick(Sender: TObject);
begin
baru;
end;

procedure Tf_merk.B_saveClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
if merk_baru=true then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_merk (kd_merk,n_merk)values ("'+ed_kode.Text+'","'+ed_desc.Text+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_merk set n_merk="'+ed_desc.Text+'" where kd_merk="'+ed_kode.Text+'"',false);

showmessage('penyimpanan data sukses....');
dm.db_conn.Commit;
except
dm.db_conn.Rollback;
showmessage('penyimpanan data gagal');
end;
dm.q_cari.Close;
dm.q_cari.Open;

f_cari.db_cari.Columns[0].Title.caption:='No';
f_cari.db_cari.Columns[1].Title.caption:='Deskripsi';
close;
end;

end.
