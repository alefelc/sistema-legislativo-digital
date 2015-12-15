class CreateCircuitosAndDespachos < ActiveRecord::Migration
  def change
    create_table :circuitos_despachos do |t|
      t.belongs_to :circuito, index: true
      t.belongs_to :despacho, index: true
    end
    drop_table :expedientes_despachos
  end
end
