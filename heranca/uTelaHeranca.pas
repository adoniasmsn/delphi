unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, JvDBControls,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons,
  JvExButtons, JvBitBtn, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit,
  Vcl.ComCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvgPage, uconexaodb,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, JvDataSource, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEnum, cCadCategoria;

type
  TfrmHeranca = class(TForm)
    pnlRodape: TJvPanel;
    btnNovo: TJvBitBtn;
    btnAlterar: TJvBitBtn;
    btnCancelar: TJvBitBtn;
    btnApagar: TJvBitBtn;
    btnFechar: TJvBitBtn;
    btnNavegation: TJvDBNavigator;
    btnGravar: TJvBitBtn;
    qryListagem: TFDQuery;
    dtsListagem: TJvDataSource;
    pgcPrincipal: TJvgPageControl;
    tablistagem: TTabSheet;
    tabManutencao: TTabSheet;
    JvPanel1: TJvPanel;
    JvPanel2: TJvPanel;
    mskPesquisa: TJvMaskEdit;
    btnPesquisar: TJvBitBtn;
    grdListagem: TJvDBGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure grdListagemDblClick(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject); virtual;
  private
    procedure desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar :TJvBitBtn;
          btnNavegation: TJvDBNavigator; pgcPrincipal: TJvgPageControl; Flag:boolean);
    procedure controlindice(pgcPrincipal: TJvgPageControl; indice: integer);
    function CampoObrigatorio: boolean;
    procedure DesabilitareditPK;
    procedure LimparEdit;
  public
    IndiceAtual :string;
    EstadoCadastro: TEstadoCadastro;
    function Apagar: boolean; virtual;
    function Gravar(EstadoCadastro:TEstadoCadastro): boolean; virtual;
  end;

var
  frmHeranca: TfrmHeranca;

implementation

{$R *.dfm}

procedure TfrmHeranca.btnNovoClick(Sender: TObject);
begin
  desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar,
               btnNavegation, pgcPrincipal, false);
  EstadoCadastro := ecNovo;
  LimparEdit;
end;

procedure TfrmHeranca.desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar: TJvBitBtn;
  btnNavegation: TJvDBNavigator; pgcPrincipal: TJvgPageControl; Flag: boolean);
begin
  btnNovo.Enabled := Flag;
  btnAlterar.Enabled := Flag;
  btnApagar.Enabled := Flag;
  btnNavegation.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
  btnCancelar.Enabled := not Flag;
  btnGravar.Enabled := not Flag;
end;

procedure TfrmHeranca.controlindice(pgcPrincipal: TJvgPageControl; indice: integer);
begin
  if (pgcPrincipal.Pages[indice].TabVisible) then
    pgcPrincipal.TabIndex := indice;
end;

procedure TfrmHeranca.btnAlterarClick(Sender: TObject);
begin
  desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar,
               btnNavegation, pgcPrincipal, false);
  EstadoCadastro := ecAlterar;
end;

procedure TfrmHeranca.btnApagarClick(Sender: TObject);
begin
  if Apagar then
  begin
    desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar,
                 btnNavegation, pgcPrincipal, true);
    controlindice(pgcPrincipal, 0);
    EstadoCadastro := ecNada;
    LimparEdit;
    qrylistagem.Refresh;
  end;
end;

procedure TfrmHeranca.btnCancelarClick(Sender: TObject);
begin
  desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar,
               btnNavegation, pgcPrincipal, true);
  controlindice(pgcPrincipal, 0);
  EstadoCadastro := ecNada;
  LimparEdit;
end;

procedure TfrmHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHeranca.btnGravarClick(Sender: TObject);
begin
  if CampoObrigatorio then
    Exit;

  try
    if Gravar(EstadoCadastro) then
    begin
      desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar,
                   btnNavegation, pgcPrincipal, true);
      controlindice(pgcPrincipal, 0);
      LimparEdit;
      qrylistagem.Refresh;
    end;
  finally
    EstadoCadastro := ecNada;
  end;
end;

procedure TfrmHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfrmHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection := dtmPrincipal.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
  grdListagem.DataSource := dtsListagem;
  btnNavegation.DataSource := dtsListagem;
end;

procedure TfrmHeranca.FormShow(Sender: TObject);
begin
  if (qryListagem.SQL.Text <> EmptyStr) then
    qryListagem.Open;

  DesabilitareditPK;
  desativarbtn(btnNovo, btnAlterar, btnCancelar, btnApagar, btnGravar,
               btnNavegation, pgcPrincipal, true);
  pgcPrincipal.TabIndex := 0;
end;

function TfrmHeranca.CampoObrigatorio: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 2) and
         (TLabeledEdit(Components[i]).Text = EmptyStr) then
      begin
        MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatorio!',
                   mtInformation, [mbOK], 0);
        TLabeledEdit(Components[i]).SetFocus;
        Result := True;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmHeranca.DesabilitareditPK;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 1) then
        TLabeledEdit(Components[i]).Enabled := false;
    end;
  end;
end;

procedure TfrmHeranca.LimparEdit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text := ''
    else if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := '';
  end;
end;

function TfrmHeranca.Gravar(EstadoCadastro: TEstadoCadastro): boolean;
begin
  if (EstadoCadastro = ecNovo) then
    ShowMessage('Cadastro realizado')
  else if (EstadoCadastro = ecAlterar) then
    ShowMessage('Alteração realizada');
  Result := true;
end;

function TfrmHeranca.Apagar: boolean;
begin
  ShowMessage('Deletado');
  Result := true;
end;

procedure TfrmHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  qryListagem.IndexFieldNames := IndiceAtual;
end;

procedure TfrmHeranca.pgcPrincipalChange(Sender: TObject);
begin
  // reservado para herdar
end;

procedure TfrmHeranca.btnPesquisarClick(Sender: TObject);
begin
  // reservado para herdar
end;

end.

