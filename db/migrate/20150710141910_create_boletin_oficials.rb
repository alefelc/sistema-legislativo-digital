class CreateBoletinOficials < ActiveRecord::Migration
  def change
    create_table :boletin_oficials do |t|
      t.integer :nro
      t.date :publicacion

      t.timestamps null: false
    end
  end
end
