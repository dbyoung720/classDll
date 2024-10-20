unit uDllClass;

interface

type
  TMyClass = class
  public
    FstrCaption: String;
    procedure testA(const strTip: string); virtual; abstract;
    function testB(const I, J: Integer): Integer; virtual; abstract;
  end;

var
  FmyClassInstance: TMyClass = nil;

implementation

function CreateMyClassInstance: TMyClass; external 'dll.dll';
procedure FreeMyClassInstance; external 'dll.dll';

initialization
  FmyClassInstance := CreateMyClassInstance;

finalization
  FreeMyClassInstance;

end.
