class AddColumnsToCircuitoTable < ActiveRecord::Migration
  def change
    add_column :circuitos, :tema, :string
    add_column :circuitos, :anio, :date
    add_column :circuitos, :fojas, :integer
  end
end
