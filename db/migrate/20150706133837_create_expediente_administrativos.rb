class CreateExpedienteAdministrativos < ActiveRecord::Migration
  def change
    create_table :expediente_administrativos do |t|
      t.string :nro_exp
      t.integer :nro_fojas
      t.integer :bis
      t.text :tema
      t.text :observacion

      ## ExpAdministrativo tiene un expediente
      t.belongs_to :expediente, index: true

      t.timestamps null: false
    end
  end
end
