class CreateEstadoExpedientes < ActiveRecord::Migration
  def change
    create_table :estado_expedientes do |t|
      t.string :nombre
      t.text :especificacion1
      t.text :especificacion2
      t.integer :id_ref
      t.string :tipo

      ## EstadoExp tiene un circuito
      t.belongs_to :circuito, index: true

      t.timestamps null: false
    end
  end
end
