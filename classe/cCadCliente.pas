unit cCadCliente;

interface

uses System.classes, vcl.controls, vcl.extctrls, vcl.dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, system.SysUtils, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
	TCliente = class

  private
    conexaoDB:TFDConnection;
   F_id_cliente: integer;
   F_nome: string;
    F_email:string;
    F_telefone:string;
   F_endereco:string;
    F_cidade:string;
    F_bairro:string;
    F_cep:string;
    F_dataNascimento= tdateTime;
    F_estado:string;
   public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;
    function Gravar:Boolean;
    function Apagar:Boolean;
    function Atualizar:Boolean;
    function Selecionar(id:integer):Boolean;

  end;
implementation

end.
