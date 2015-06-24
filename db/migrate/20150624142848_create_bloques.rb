class CreateBloques < ActiveRecord::Migration
  def change
    create_table :bloques do |t|
      t.text :denominacion
      t.text :codigo

      t.timestamps null: false
    end
  end
end
