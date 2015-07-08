class CreateSeccions < ActiveRecord::Migration
  def change
    create_table :seccions do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
