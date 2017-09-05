class CreateProcedureDerivations < ActiveRecord::Migration
  def change
    create_table :procedure_derivations do |t|
      t.belongs_to :procedure, index: true, foreign_key: true
      t.belongs_to :area, index: true, foreign_key: true

      t.datetime :derived_at
      t.datetime :received_at
      t.integer :derived_by, index: true
      t.integer :received_by, index: true

      t.timestamps null: false
    end

    remove_column :areas, :denominacion
    remove_column :areas, :codigo
    add_column :areas, :name, :string
  end
end
