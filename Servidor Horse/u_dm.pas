unit u_dm;

{$if defined(FPC)}
  {$mode delphi} {$h+}
{$ENDIF}

interface


uses
  SysUtils, Classes, data_acces_intf, DBAccess, Uni, Horse.Jhonson,
  UniProvider, SQLServerUniProvider, ActiveX;

type
  TDataModule1 = class(TDataModule)
    Connection: TUniConnection;
    qryView: TUniQuery;
    SQLServerUniProvider: TSQLServerUniProvider;
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure ConnectionBeforeDisconnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function ListALL: TUniQuery;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

procedure TDataModule1.ConnectionBeforeConnect(Sender: TObject);
begin
  CoInitialize(0)
end;

procedure TDataModule1.ConnectionBeforeDisconnect(Sender: TObject);
begin
  CoUninitialize;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin

end;

function TDataModule1.ListALL: TUniQuery;
  begin
    qryView.Open();
    result := qryView;
  end;

end.
