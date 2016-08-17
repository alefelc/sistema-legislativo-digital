class RenameTableDependenciaMunicipal < ActiveRecord::Migration
  def change
    rename_table :dependencia_municipals, :municipal_offices
    rename_column :dependencias_tramites, :dependencia_municipal_id, :municipal_office_id
  end
end
