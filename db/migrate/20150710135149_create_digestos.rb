class CreateDigestos < ActiveRecord::Migration
  def change
    create_table :digestos do |t|
      t.string :nombre
      t.text :observacion

      t.timestamps null: false
    end
  end
end
