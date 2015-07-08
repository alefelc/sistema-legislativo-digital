class CreateSubSeccions < ActiveRecord::Migration
  def change
    create_table :sub_seccions do |t|
      t.string :nombre
      #== una subseccion tiene una seccion
      t.belongs_to :seccion, index:true

      t.timestamps null: false
    end
  end
end
