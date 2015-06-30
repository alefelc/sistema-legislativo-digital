class ConcejalesBloqueRelationship < ActiveRecord::Migration
  def change
    add_column :bloques, :vice, :integer
    add_column :bloques, :presidente, :integer

    ## Un concejal pertenece a un bloque
    add_reference :personas, :bloque, index: true
  end
end
