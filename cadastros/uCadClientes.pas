unit uCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, JvDataSource, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, Vcl.ComCtrls,
  JvgPage, Vcl.DBCtrls, JvDBControls, Vcl.Buttons, JvExButtons, JvBitBtn,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvExControls, JvLabel;

type
  TfrmCadClientes = class(TfrmHeranca)
    edtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    JvLabel1: TJvLabel;
    edtDataNascimento: TJvDateEdit;
    JvLabel2: TJvLabel;
    edtTelefone: TJvMaskEdit;
    JvLabel3: TJvLabel;
    edtEstado: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    JvMaskEdit1: TJvMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

end.
