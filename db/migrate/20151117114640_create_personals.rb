class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :nombre
      t.string :apellido
      t.string :nro_doc
      t.string :telefono
      t.string :email
      t.string :domicilio

      t.timestamps null: false
    end
    change_table :usuarios do |t|
      t.belongs_to :personal, index: true
    end
  end
end
