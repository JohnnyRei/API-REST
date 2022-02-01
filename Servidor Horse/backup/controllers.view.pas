unit Controllers.View;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}
interface

procedure Registry;

implementation

uses SysUtils
  , Horse, Horse.jhonson, Dataset.Serialize // horse
  , uni, SQLServerUniProvider, uDM //Unidac
  , ActiveX;

var
  DM : TDM;
procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  try
    DM := TDM.Create(Nil);
    with DM do
    begin
      Query.Close;
      Query.Open;
      Res.Send(Query.ToJSONArrayString);
    end;
  finally
  FreeAndNil(DM);
  end;
end;


procedure Registry;
begin
  THorse.Get('/view', DoList);
end;


end.
