class CreateModificaRelationships < ActiveRecord::Migration
  def change
    create_table :modifica_relationships do |t|
      t.belongs_to :modifica, index: true
      t.belongs_to :me_modifica, index: true

      t.date :desde
      t.date :hasta

      t.integer :dia
      t.integer :mes
      t.integer :anio

      # 0 - No aclarado
      # 1 - dia habil
      # 2 - dia corrido
      t.integer :dia_habil

      t.text :observacion

      t.timestamps null: false
    end
  end
end
