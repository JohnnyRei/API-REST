unit Controllers.View;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

interface

procedure Registry;

implementation

uses Horse, Horse.jhonson, Dataset.Serialize // horse
  , uni, SQLServerUniProvider //Unidac
  , ActiveX;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  Connection: TUniConnection;
  Query: TUniQuery;
begin
  try
    CoInitialize(nil);
    Connection := TUniConnection.Create(nil);
    Connection.ProviderName := 'SQL Server';
    Connection.Port := 1433;
    Connection.Server := '192.168.1.10';
    Connection.Username := 'UBI';
    Connection.Password := 'SBI';
    Connection.Database := 'DBBI';
    Connection.Open;


    Query := TUniQuery.Create(nil);
    Query.Connection := Connection;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM avfvAprovOvoGraInc_BI');
    Query.Open;

    Res.Send(Query.ToJSONArrayString);
  finally
    Query.Free;
    Query := nil;
    Connection.Free;
    Connection := nil;
    CoUninitialize;
  end;
end;


procedure Registry;
begin
  THorse.Get('/view', DoList);
end;


end.
