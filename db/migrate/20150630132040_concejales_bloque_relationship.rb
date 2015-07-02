class ConcejalesBloqueRelationship < ActiveRecord::Migration
  def change
    add_column :bloques, :vice, :integer
    add_column :bloques, :presidente, :integer
  end
end
