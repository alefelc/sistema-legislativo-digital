class ChangePersonaTableName < ActiveRecord::Migration
  def change
    rename_table :personas, :persons
  end
end
