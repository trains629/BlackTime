unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,superobject;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Fii,FMax,FMin,Fcenter : Integer;
    procedure setShow(cmdShow: Integer);
    function loadInit:Cardinal;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.setShow(cmdShow:Integer);
begin
  ShowWindow(Self.Handle,cmdShow);
end;

function TForm3.loadInit():Cardinal;
var
  t1 :ISuperObject;
  path : string;
begin
  Result := 1000;
  FMax := 30;
  FMin := -20;
  Fcenter := 0;
  path := ExtractFilePath(ParamStr(0))+'config.json';
  if FileExists(path) then
  begin
    t1 := TSuperObject.ParseFile(path,True);
    try
    Result := t1.I['Interval'];
    FMax   := t1.I['Max'];
    FMin   := t1.I['Min'];
    except
    end;
  end;
  Fii:= FMax;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Timer1.Interval := Self.loadInit;
  Self.Width := Screen.Width;
  Self.Height := Screen.Height;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  Dec(Fii);
  if (Fii < Fcenter) and (Fii >= Fmin) then
  begin
    Show;
    ShowCursor(False);
  end
  else
  begin
    if Fii < FMin then
    begin
      Fii := FMax;
      Hide;
      ShowCursor(True);
    end;
  end
end;

end.
