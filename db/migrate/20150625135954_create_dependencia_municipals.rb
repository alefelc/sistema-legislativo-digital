class CreateDependenciaMunicipals < ActiveRecord::Migration
  def change
    create_table :dependencia_municipals do |t|
      t.string :denominacion

      t.timestamps null: false
    end
  end
end
