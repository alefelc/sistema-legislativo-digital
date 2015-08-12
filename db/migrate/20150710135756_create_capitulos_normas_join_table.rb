class CreateCapitulosNormasJoinTable < ActiveRecord::Migration
  def change
    create_table :capitulos_normas do |t|
      t.integer :orden

      t.belongs_to :capitulo, index: true
      t.belongs_to :norma, index: true

      t.timestamps null: false
    end
  end
end
