class CreateBloquePeriodos < ActiveRecord::Migration
  def change
    change_table :bloques_periodos do |t|
      t.integer :id , index: true
      t.integer :vice_id, index: true
      t.integer :presidente_id, index: true
      t.timestamps null: false
    end

    rename_table :bloques_periodos, :bloque_periodos

    change_table :bloques  do |b|
      b.remove :vice
      b.remove :presidente
    end  
  end
end
