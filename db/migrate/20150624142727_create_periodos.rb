class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.date :desde
      t.date :hasta

      t.timestamps null: false
    end
  end
end
