unit U_fungsi;

interface

uses
mySQLDbTables,Windows,SysUtils;

  type
  Tfungsi = class (TObject)//kita membuat object baru dengan nama TProsedur
  private
    {private declaration}
  public
     function program_versi:string;
     procedure SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
  end;
var
  fungsi: Tfungsi;
  
implementation

function Tfungsi.program_versi:string;
var V1, V2, V3, V4: Word;
   VerInfoSize, VerValueSize, Dummy : DWORD;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
With VerValue^ do
begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
end;
FreeMem(VerInfo, VerInfoSize);

Result := IntToStr(V1) + '.' 
            + IntToStr(V2) + '.' 
            + IntToStr(V3) + '.' 
            + IntToStr(V4);
end;

  procedure Tfungsi.SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
	 begin
	  with aQuery  do
	   begin
	    Close;
      sql.Clear;
	    SQL.Text := _SQL;
	    if isSearch then
	     Open
	    else
	     ExecSQL;
	   end;
	 end;
   

end.
