unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, JvDataSource, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, JvDBControls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvBitBtn,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvgPage;

type
  TfrmCadCategoria = class(TfrmHeranca)
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtNomeCategoria: TLabeledEdit;
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin
  if (edtNomeCategoria.Text= EmptyStr) then begin
    ShowMessage('O nome da categoria é um campo obrigatorio!');
    edtNomeCategoria.SetFocus;
    abort;
  end;
   if (edtDescricao.Text= EmptyStr) then begin
    ShowMessage('A descrição é um campo obrigatorio!');
    edtDescricao.SetFocus;
    abort;
    end;
  inherited;

end;

end.
