class AddAssociationLegislativeFileStatesAndLaws < ActiveRecord::Migration
  def change
    create_table :laws_legislative_file_states, id: false do |t|
      t.belongs_to :law, index: true
      t.belongs_to :legislative_file_state, index: true
    end
  end
end
