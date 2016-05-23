class RenameColumnUsersTable < ActiveRecord::Migration
  def change
    rename_column :users, :persona_id, :person_id
  end
end
