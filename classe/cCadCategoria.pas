unit cCadCategoria;

interface

uses System.classes, vcl.controls, vcl.extctrls, vcl.dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
	TCategoria = class

  private
    conexaoDB:TFDConnection;
   F_id_categoria: integer;
   F_nome_categoria: string;
   F_descricao_categoria:string;
    function getdescricaocategoria: string;
    function getidcategoria: integer;
    function getnomecategoria: string;
    procedure setdescricaocategoria(const Value: string);
    procedure setidcategoria(const Value: integer);
    procedure setnomecategoria(const Value: string);
  public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;
    function Gravar:Boolean;
    function Apagar:Boolean;
    function Atualizar:Boolean;
    function Selecionar(id:integer):Boolean;
  published
    property id_categoria: integer   read getidcategoria write setidcategoria;
    property nome_categoria :string  read getnomecategoria write setnomecategoria;
    property descricao_categoria : string read getdescricaocategoria write setdescricaocategoria;
  end;

implementation

{ TCategoria }

function TCategoria.Apagar: Boolean;
begin

end;

function TCategoria.Atualizar: Boolean;
begin

end;

function TCategoria.Gravar: Boolean;
begin

end;

function TCategoria.Selecionar(id: integer): Boolean;
begin

end;

constructor TCategoria.Create(aConexao:TFDConnection);
begin
    conexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
   ShowMessage('Tela destruida');
end;

function TCategoria.getdescricaocategoria: string;
begin
  result:= self.F_descricao_categoria;
end;

function TCategoria.getidcategoria: integer;
begin
    result:=self.F_id_categoria;
end;

function TCategoria.getnomecategoria: string;
begin
    result:=self.F_nome_categoria;
end;

procedure TCategoria.setdescricaocategoria(const Value: string);
begin
     self.F_descricao_categoria := value;
end;

procedure TCategoria.setidcategoria(const Value: integer);
begin
      self.F_id_categoria:=value;
end;

procedure TCategoria.setnomecategoria(const Value: string);
begin
     self.F_nome_categoria:=value;
end;

end.
