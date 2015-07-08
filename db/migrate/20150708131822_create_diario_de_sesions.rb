class CreateDiarioDeSesions < ActiveRecord::Migration
  def change
    create_table :diario_de_sesions do |t|

      t.timestamps null: false
    end
  end
end
