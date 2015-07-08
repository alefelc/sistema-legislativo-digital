class CreateCircuitoOrdens < ActiveRecord::Migration
  def change
    create_table :circuito_ordens do |t|
      t.integer :seccion_id
      t.integer :sub_seccion_id
      t.string :destino

      #= asociaicon con circuito y orden del dia
      t.belongs_to :circuito, index: true
      t.belongs_to :orden_del_dia, index: true

      t.timestamps null: false
    end
  end
end
