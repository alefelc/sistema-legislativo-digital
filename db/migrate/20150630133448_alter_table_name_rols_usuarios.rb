class AlterTableNameRolsUsuarios < ActiveRecord::Migration
  def change
    rename_table :usuarios_rols, :rols_usuarios
  end
end
