class CreateOrganoDeGobiernos < ActiveRecord::Migration
  def change
    create_table :organo_de_gobiernos do |t|
      t.string :denominacion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
