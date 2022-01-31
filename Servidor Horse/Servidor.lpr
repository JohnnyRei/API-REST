program Servidor;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

uses

  Horse,
  Horse.Jhonson,
  SysUtils,
  unidac10, msprovider10,
  Controllers.View, uDM;



{$R *.res}

var dm1 : TDM;

begin
    THorse
    .Use(Jhonson);
    Controllers.View.Registry;
    THorse.Listen(9096);
  end.

