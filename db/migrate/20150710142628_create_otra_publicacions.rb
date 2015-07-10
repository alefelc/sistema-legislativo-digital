class CreateOtraPublicacions < ActiveRecord::Migration
  def change
    create_table :otra_publicacions do |t|
      t.string :nombre
      t.text :observacion
      t.date :publicacion

      t.timestamps null: false
    end
  end
end
