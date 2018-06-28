class AddDefaultColumnToSessions < ActiveRecord::Migration
  def change
    change_column :legislative_sessions, :session_type, :integer, default: 0, null: false
  end
end
