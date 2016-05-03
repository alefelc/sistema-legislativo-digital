class ChangeAnioColumnByYear < ActiveRecord::Migration
  def change
    remove_column :expediente_administrativos, :anio
    add_column :expediente_administrativos, :year, :integer
  end
end
