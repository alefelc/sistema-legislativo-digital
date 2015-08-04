class AddColumnTipoToPromulgaRelationships < ActiveRecord::Migration
  def change
    # tipos: 0 = expresa, 1 = tacita, 2 = parcial
    add_column :promulga_relationships, :tipo, :integer
  end
end
