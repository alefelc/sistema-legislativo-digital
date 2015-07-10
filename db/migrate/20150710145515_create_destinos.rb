class CreateDestinos < ActiveRecord::Migration
  def change
    create_table :destinos do |t|
      t.integer :tipo
      t.date :fecha
      t.string :destino

      #= el destino pertenece a una norma
      t.belongs_to :norma

      t.timestamps null: false
    end
  end
end
