unit Controllers.View;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

interface

procedure Registry;

implementation

uses Horse, Horse.jhonson, u_dm, Dataset.Serialize;

procedure DoList (Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TDataModule1;
begin
  LService := TDataModule1.Create(nil);
  try
    Res.Send(Lservice.ListALL.ToJSONArray);
  finally
    LService.Free;
  end;
end;


procedure Registry;
begin
  THorse.Get('/view', DoList);
end;

end.
