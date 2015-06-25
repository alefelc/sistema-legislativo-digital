class CreateReparticionOficials < ActiveRecord::Migration
  def change
    create_table :reparticion_oficials do |t|
      t.string :denominacion

      t.timestamps null: false
    end
  end
end
