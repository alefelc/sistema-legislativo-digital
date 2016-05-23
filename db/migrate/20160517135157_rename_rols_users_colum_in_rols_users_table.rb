class RenameRolsUsersColumInRolsUsersTable < ActiveRecord::Migration
  def change
    rename_table :rols_users, :roles_users
  end
end
