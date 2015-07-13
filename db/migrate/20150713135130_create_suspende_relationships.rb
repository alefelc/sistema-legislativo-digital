class CreateSuspendeRelationships < ActiveRecord::Migration
  def change
    create_table :prorroga_suspencion_relationships do |t|
      t.belongs_to :suspendida, index: true
      t.belongs_to :me_suspende, index: true

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
