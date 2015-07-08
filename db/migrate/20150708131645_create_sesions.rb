class CreateSesions < ActiveRecord::Migration
  def change
    create_table :sesions do |t|
      t.integer :nro
      t.text :observacion
      t.string :tipo1
      t.string :tipo2

      #== la sesion tiene un diario
      t.belongs_to :diario_de_sesion, index: true

      t.timestamps null: false
    end
  end
end
