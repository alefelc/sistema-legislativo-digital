class RenameColumnInRolesUsersTable < ActiveRecord::Migration
  def change
    rename_column :roles_users, :rol_id, :role_id
  end
end
