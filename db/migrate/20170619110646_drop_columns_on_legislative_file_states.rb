class DropColumnsOnLegislativeFileStates < ActiveRecord::Migration
  def change
    remove_column :legislative_file_states, :fecha
    remove_column :legislative_file_states, :tipo
    remove_column :legislative_file_states, :nombre
  end
end
