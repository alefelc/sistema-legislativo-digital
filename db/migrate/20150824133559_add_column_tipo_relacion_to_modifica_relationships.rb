class AddColumnTipoRelacionToModificaRelationships < ActiveRecord::Migration
  def change
    add_column :modifica_relationships, :tipo_relacion, :string
  end
end
