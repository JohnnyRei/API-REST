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
      Res.ContentType('application/json').Send(Query.ToJSONArrayString);
    end;
  finally
  FreeAndNil(DM);
  end;
end;

procedure OnStatus(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  html : String;
begin
  html := '';
  html := '  <div style="display: flex;text-align: center;"> '+
          '    <img style="padding-left: 180px;" height="180px" src="https://media2.giphy.com/media/12DbQh5NOrhtN6/giphy.gif?cid=ecf05e47dtjto70529vw5rmb0421j8syr06lmpfrt9jlwzay&rid=giphy.gif&ct=g" /> '+
          '    <h1 style="text-align: center; font-size: 60px; padding-left: 180px;">Servidor Ativo...</h1>'+
          '  </div> '+
          '  <h2 style=" font-size: 30px;padding-left: 190px;"> API - Horse </h2> ';




  // mostrando que o servidor esta ativo
  Res.ContentType('text/html')
     .Send(html);
end;

procedure Registry;
begin

  THorse.Get('/view', DoList);
  THorse.Get('/',   OnStatus);
end;


end.
