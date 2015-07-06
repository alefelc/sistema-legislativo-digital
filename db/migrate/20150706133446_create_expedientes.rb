class CreateExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes do |t|
      t.string :nro_exp
      t.integer :nro_fojas
      t.integer :bis
      t.text :tema
      t.text :observacion

      t.timestamps null: false
    end
  end
end
