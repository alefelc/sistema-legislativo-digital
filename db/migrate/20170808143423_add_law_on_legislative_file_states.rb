class AddLawOnLegislativeFileStates < ActiveRecord::Migration
  def change
    add_reference :legislative_file_states, :norma, index: true
  end
end
