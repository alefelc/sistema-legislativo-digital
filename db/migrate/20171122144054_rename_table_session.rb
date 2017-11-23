class RenameTableSession < ActiveRecord::Migration
  def change
    rename_table :sessions, :legislative_sessions
  end
end
