program ConsultaPais;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  UnitServicoPais in 'UnitServicoPais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
