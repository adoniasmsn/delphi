unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, JvMenus, Vcl.StdCtrls,
  JvExForms, JvScrollBox;

type
  TfrmPrincipal = class(TForm)
    menPrincipal: TJVMainMenu;
    CADASTRO2: TMenuItem;
    CLIENTE3: TMenuItem;
    N5: TMenuItem;
    CATEGORIA2: TMenuItem;
    PRODUTO3: TMenuItem;
    MOVIMENTAO2: TMenuItem;
    VENDA2: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE4: TMenuItem;
    N7: TMenuItem;
    PRODUTO4: TMenuItem;
    N8: TMenuItem;
    VENDAPORDATA2: TMenuItem;
    FECHAR1: TMenuItem;
    procedure FECHAR1Click(Sender: TObject);
    procedure CATEGORIA2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uconexaodb;



procedure TfrmPrincipal.CATEGORIA2Click(Sender: TObject);
begin
  if not Assigned(dtmPrincipal) then
    dtmPrincipal := TdtmPrincipal.Create(Application);

  if not dtmPrincipal.ConexaoDB.Connected then
    dtmPrincipal.ConexaoDB.Connected := True;

  frmCadCategoria:= TfrmCadCategoria.Create(Self);
frmCadCategoria.ShowModal;
frmCadCategoria.Release;
end;

procedure TfrmPrincipal.FECHAR1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Application.Terminate;
end;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
if not Assigned(dtmPrincipal) then
  dtmPrincipal := TdtmPrincipal.Create(Application);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
if Assigned(dtmPrincipal) then
  FreeAndNil(dtmPrincipal);

end;

end.

