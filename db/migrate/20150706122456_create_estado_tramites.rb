class CreateEstadoTramites < ActiveRecord::Migration
  def change
    create_table :estado_tramites do |t|
      t.string :nombre
      t.text :especificacion

      ## Relación del estado actual
      t.string :tipo

      ## Tramite tiene muchos estados
      t.belongs_to :tramite, index: true

      t.timestamps null: false
    end
  end
end
