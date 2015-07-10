class CreateCapitulos < ActiveRecord::Migration
  def change
    create_table :capitulos do |t|
      t.string :nombre
      t.belongs_to :titulo

      t.timestamps null: false
    end
  end
end
