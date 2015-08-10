class AddColumnIndiceToNormas < ActiveRecord::Migration
  def change
    add_column :normas, :indice, :bigint
  end
end
