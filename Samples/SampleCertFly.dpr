program SampleCertFly;

uses
  Vcl.Forms,
  ExemploCertFly in 'ExemploCertFly.pas' {Form2},
  Certfly_TLB in 'Certfly_TLB.pas',
  Certfly in 'Certfly.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
