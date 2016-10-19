class UpgradeRolesTable < ActiveRecord::Migration
  def change
    rename_column :roles, :rol_type, :name
    add_column :roles, :activities, :string, array: true, length: 30, using: 'gin', default: '{}'
    drop_table :rols
    drop_table :rols_usuarios
  end
end
