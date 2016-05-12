class RenameColumnRolsUsers < ActiveRecord::Migration
  def change
    rename_column :rols_users, :usuario_id, :user_id
  end
end
