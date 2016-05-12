class RenameRolsUsuariosTable < ActiveRecord::Migration
  def change
    rename_table :rols_usuarios, :rols_users
  end
end
