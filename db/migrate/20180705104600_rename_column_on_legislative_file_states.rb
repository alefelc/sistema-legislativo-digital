class RenameColumnOnLegislativeFileStates < ActiveRecord::Migration
  def change
    rename_column :legislative_file_states, :session_id, :legislative_session_id
  end
end
