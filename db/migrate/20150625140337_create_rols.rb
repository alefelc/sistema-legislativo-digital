class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|
      t.string :tipo

      t.timestamps null: false
    end
  end
end
