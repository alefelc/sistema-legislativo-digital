class CreateTitulos < ActiveRecord::Migration
  def change
    create_table :titulos do |t|
      t.string :nombre
      t.belongs_to :libro

      t.timestamps null: false
    end
  end
end
