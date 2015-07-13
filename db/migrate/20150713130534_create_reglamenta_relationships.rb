class CreateReglamentaRelationships < ActiveRecord::Migration
  def change
    create_table :reglamenta_relationships do |t|
      t.belongs_to :reglamenta, index: true
      t.belongs_to :me_reglamenta, index: true

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
