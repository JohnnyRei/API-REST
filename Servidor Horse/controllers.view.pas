unit Controllers.View;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

interface

procedure Registry;

implementation

uses Horse, Horse.jhonson, Dataset.Serialize // horse
  , uni, SQLServerUniProvider, uDM //Unidac
  , ActiveX;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  dm : TDM;
begin
  try
    dm := TDM.Create(Nil);
    with dm do
    begin
    Query.Close;
    Query.Open;
    Res.Send(Query.ToJSONArrayString);
    end;

  finally
  dm.Free;
  end;
end;


procedure Registry;
begin
  THorse.Get('/view', DoList);
end;


end.
