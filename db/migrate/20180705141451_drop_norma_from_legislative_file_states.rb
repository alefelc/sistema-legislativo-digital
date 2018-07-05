class DropNormaFromLegislativeFileStates < ActiveRecord::Migration
  def change
    remove_column :legislative_file_states, :norma_id, :integer
  end
end
