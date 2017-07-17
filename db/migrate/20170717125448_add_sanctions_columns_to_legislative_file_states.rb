class AddSanctionsColumnsToLegislativeFileStates < ActiveRecord::Migration
  def change
    add_column :legislative_file_states, :sanction_specified, :text
    add_column :legislative_file_states, :sanction_type, :text
  end
end
