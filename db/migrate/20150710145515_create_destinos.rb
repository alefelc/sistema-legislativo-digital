class CreateDestinos < ActiveRecord::Migration
  def change
    create_table :destinos do |t|
      # tipo 0: comunicacion 1: notificacion
      t.integer :tipo
      t.date :fecha
      t.string :destino

      #= el destino pertenece a una norma
      t.belongs_to :norma

      t.timestamps null: false
    end
  end
end
