class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :denominacion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
