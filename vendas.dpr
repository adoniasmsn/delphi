program vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uconexaodb in 'uconexaodb.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'heranca\uTelaHeranca.pas' {frmHeranca},
  uCadCategoria in 'cadastros\uCadCategoria.pas' {frmCadCategoria},
  uEnum in 'heranca\uEnum.pas',
  cCadCategoria in 'classe\cCadCategoria.pas',
  uCadClientes in 'cadastros\uCadClientes.pas' {frmCadClientes},
  cCadCliente in 'classe\cCadCliente.pas',
  uCadProdutos in 'cadastros\uCadProdutos.pas' {frmCadProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.Run;
end.
