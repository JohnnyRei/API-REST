program Servidor;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

uses

  Horse,
  Horse.Jhonson,
  System.SysUtils,
  u_dm,
  unidac10,
  Controllers.View;

begin
    THorse
    .Use(Jhonson)
    .Use(HandleException);
    Controllers.View.Registry;
    THorse.Listen(9096);
  end.

procedure List (Req: THorseRequest; Res: THorseResponse; Next: TProc);
