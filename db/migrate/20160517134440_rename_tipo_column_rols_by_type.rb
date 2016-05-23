class RenameTipoColumnRolsByType < ActiveRecord::Migration
  def change
    rename_column :rols, :tipo, :rol_type
  end
end
