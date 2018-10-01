class DropBoletinOficials < ActiveRecord::Migration
  def change
    drop_table :boletin_oficials
    drop_table :boletin_oficials_normas
  end
end
