class AddSessionToLegislativeFileStates < ActiveRecord::Migration
  def change
    add_reference :legislative_file_states, :session, index: true, foreign_key: true
  end
end
