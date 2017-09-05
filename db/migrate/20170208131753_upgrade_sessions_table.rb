class UpgradeSessionsTable < ActiveRecord::Migration
  def change
    rename_table :sesions, :sessions
    rename_column :sessions, :nro, :number
    remove_column :sessions, :tipo1
    remove_column :sessions, :tipo2
    add_column :sessions, :session_type, :integer
    add_column :sessions, :place, :string
    add_column :sessions, :secret, :boolean
    add_column :sessions, :started_at, :datetime
    add_column :sessions, :finished_at, :datetime
  end
end
