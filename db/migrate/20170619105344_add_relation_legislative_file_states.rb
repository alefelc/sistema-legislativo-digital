class AddRelationLegislativeFileStates < ActiveRecord::Migration
  def change
    add_belongs_to :legislative_file_states, :legislative_file, index: true, foreign_key: true
  end
end
