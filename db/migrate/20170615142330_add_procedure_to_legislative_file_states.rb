class AddProcedureToLegislativeFileStates < ActiveRecord::Migration
  def change
    remove_column :legislative_file_states, :ref_id
    remove_column :legislative_file_states, :ref_type

    add_belongs_to :procedures, :legislative_file_state, index: true, foreign_key: true
  end
end
