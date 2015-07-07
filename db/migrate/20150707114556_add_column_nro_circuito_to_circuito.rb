class AddColumnNroCircuitoToCircuito < ActiveRecord::Migration
  def change
  	add_column :circuitos, :nro, :integer
  end
end
