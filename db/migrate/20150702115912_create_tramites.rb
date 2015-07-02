class CreateTramites < ActiveRecord::Migration
  def change
    create_table :tramites do |t|
      t.integer :nro_fojas
      t.text :asunto
      t.integer :responsable
      t.integer :tipo_contribucion
      t.integer :condicion_contribuyente
      t.text :observaciones
      t.string :type

      t.timestamps null: false
    end
  end
end
