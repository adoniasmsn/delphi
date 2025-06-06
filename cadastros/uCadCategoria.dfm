inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TJvPanel
    inherited btnNavegation: TJvDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TJvgPageControl
    inherited tablistagem: TTabSheet
      inherited JvPanel2: TJvPanel
        inherited mskPesquisa: TJvMaskEdit
          Top = 14
          HintColor = clBackground
          Color = clBtnFace
          ParentFlat = False
          ExplicitTop = 14
        end
      end
      inherited grdListagem: TJvDBGrid
        DrawingStyle = gdsClassic
        ParentCtl3D = False
        Columns = <
          item
            Expanded = False
            FieldName = 'id_categoria'
            Title.Caption = 'C'#243'digo da categoria'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_categoria'
            Title.Caption = 'Categoria'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao_categoria'
            Title.Caption = 'Descri'#231#227'o da categoria'
            Width = 314
            Visible = True
          end>
      end
    end
  end
  inherited qryListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from Categoria')
    Left = 552
  end
  inherited dtsListagem: TJvDataSource
    Left = 616
  end
end
