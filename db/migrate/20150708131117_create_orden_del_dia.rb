class CreateOrdenDelDia < ActiveRecord::Migration
  def change
    create_table :orden_del_dia do |t|
      t.integer :nro
      t.date :fecha
      t.text :observacion
      #== el orden del dia tiene una sesion
      t.belongs_to :sesion, index: true

      t.timestamps null: false
    end
  end
end
