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
    procedure SaveConfigWithInterval(configPath:string;Interval:Cardinal);
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

procedure TForm3.SaveConfigWithInterval(configPath:string;Interval:Cardinal);
var
  config : ISuperObject;
begin
  config := SO();
  config.I['Interval'] := Interval;
  config.I['Max'] := FMax;
  config.I['Min']:= FMin;
  config.SaveTo(configPath);
end;

function TForm3.loadInit():Cardinal;
var
  config:ISuperObject;
  path : string;
begin
  Result := 1000;
  FMax := 1800;
  FMin := 10;
  Fcenter := 0;
  try
    path := ExtractFilePath(ParamStr(0))+'config.json';
    if FileExists(path) then
    begin
      config := TSuperObject.ParseFile(path,True);
      try
        Result := config.I['Interval'];
        FMax   := config.I['Max'];
        FMin   := config.I['Min'];
      except
      end;
    end
    else
      SaveConfigWithInterval(path,Result);
  except
  end;
  Fii:= FMax;
  FMin := -1 * FMin;
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
