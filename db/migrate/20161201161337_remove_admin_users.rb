class RemoveAdminUsers < ActiveRecord::Migration
  def change
    drop_table :admin_users if ActiveRecord::Base.connection.table_exists? 'admin_users'
  end
end
