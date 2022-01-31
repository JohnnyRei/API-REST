unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controllers.View, Uni, SQLServerUniProvider, ActiveX;

type

  { TDM }

  TDM = class(TDataModule)
    SQLServerUniProvider: TSQLServerUniProvider;
    UniConnection: TUniConnection;
    Query: TUniQuery;
    procedure UniConnectionAfterDisconnect(Sender: TObject);
    procedure UniConnectionBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.UniConnectionBeforeConnect(Sender: TObject);
begin
  CoInitialize(nil);
end;

procedure TDM.UniConnectionAfterDisconnect(Sender: TObject);
begin
 CoUninitialize;
end;

end.

