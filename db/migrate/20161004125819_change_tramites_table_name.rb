class ChangeTramitesTableName < ActiveRecord::Migration
  def change
    rename_table :tramites, :procedures
  end
end
