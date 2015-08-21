class RefactorizeAllRecursiveRelationshipsInNorma < ActiveRecord::Migration
  def change
    drop_table :aclara_relationships
    drop_table :delega_relationships
    drop_table :deroga_relationships
    drop_table :reglamenta_relationships
    drop_table :prorroga_vigencia_relationships
    drop_table :prorroga_suspension_relationships
    drop_table :restituye_vigencia_relationships
    drop_table :suspende_vigencia_relationships
    drop_table :promulga_relationships
    drop_table :ad_referendum_relationships
    drop_table :veto_parcial_relationships
    drop_table :veto_total_relationships

    add_column :modifica_relationships, :type, :string
    add_column :modifica_relationships, :tipo, :string
  end
end
