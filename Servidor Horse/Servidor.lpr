program Servidor;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

uses
  SysUtils,
  Horse, Horse.Jhonson,Horse.BasicAuthentication, // horse
  Controllers.View;



{$R *.res}

procedure OnListen(Horse: THorse);
begin
  Writeln(Format('Server is runing on port %d', [Horse.Port]));
  Writeln('API - Horse Avecom Sistema Ltda');
end;

function DoLogin(const AUsername, APassword: string): Boolean;
begin
  Result := AUsername.Equals('admin') and APassword.Equals('password');
end;

begin
    THorse
    .Use(Jhonson);
     THorse.Use(HorseBasicAuthentication(DoLogin));
    Controllers.View.Registry;
    THorse.Listen(8082,OnListen);
  end.

