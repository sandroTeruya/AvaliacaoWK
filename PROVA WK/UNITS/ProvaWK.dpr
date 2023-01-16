program ProvaWK;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {Form1},
  uClienteModel in 'uClienteModel.pas',
  uControle in 'uControle.pas',
  uConexao in 'uConexao.pas',
  uControleCliente in 'uControleCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
