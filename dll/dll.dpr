library dll;
{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses Vcl.Dialogs, System.SysUtils, System.Classes;

{$R *.res}

type
  TMyClass = class
  private
    constructor Create();
  public
    FstrCaption: String;
    procedure testA(const strTip: string); virtual;
    function testB(const I, J: Integer): Integer; virtual;
  end;

{ TMyClass }

constructor TMyClass.Create;
begin
  FstrCaption := 'Test Delphi Dll Class';
end;

procedure TMyClass.testA(const strTip: string);
begin
  ShowMessage(strTip);
end;

function TMyClass.testB(const I, J: Integer): Integer;
begin
  Result := I + J;
end;

var
  myClassInstance: TMyClass = nil;

function CreateMyClassInstance: TMyClass;
begin
  myClassInstance := TMyClass.Create;
  Result          := myClassInstance;
end;

procedure FreeMyClassInstance;
begin
  myClassInstance.Free;
end;

exports CreateMyClassInstance, FreeMyClassInstance;

begin

end.
