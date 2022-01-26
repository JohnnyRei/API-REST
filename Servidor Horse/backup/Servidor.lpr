program Servidor;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

uses

  Horse,
  Horse.Jhonson,
  SysUtils,
  unidac10,
  Controllers.View;



begin
    coInitialize(nil);
    THorse
    .Use(Jhonson);
    Controllers.View.Registry;
    THorse.Listen(9096);
  end.

