class AddColumnAnioToNormas < ActiveRecord::Migration
  def change
    add_column :normas, :anio, :integer
  end
end
