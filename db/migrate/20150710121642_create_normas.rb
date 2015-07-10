class CreateNormas < ActiveRecord::Migration
  def change
    create_table :normas do |t|
      t.string :letra
      t.integer :nro
      t.integer :bis
      t.text :sumario
      t.text :observaciones
      t.date :sancion
      t.date :entrada_vigencia
      t.date :finaliza_vigencia
      t.integer :plazo_dia
      t.integer :plazo_mes
      t.integer :plazo_anio
      t.string :organismo_origen
      t.string :type

      t.timestamps null: false
    end
  end
end
