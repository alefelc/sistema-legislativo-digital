class CreateComisions < ActiveRecord::Migration
  def change
    create_table :comisions do |t|
      t.string :denominacion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
