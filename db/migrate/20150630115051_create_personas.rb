class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.integer :tipo_doc
      t.string :nro_doc
      t.string :telefono
      t.string :email
      t.string :domicilio
      t.integer :cargo

      ## Un concejal pertenece a un bloque
      t.belongs_to :bloque, index: true

      t.timestamps null: false
    end
  end
end
