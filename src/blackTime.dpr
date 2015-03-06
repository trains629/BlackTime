program blackTime;

uses
  Forms,
  main in 'main.pas' {Form3},
  superobject in 'superobject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm := False;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
