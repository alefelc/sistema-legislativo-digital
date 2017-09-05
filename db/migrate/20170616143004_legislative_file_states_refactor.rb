class LegislativeFileStatesRefactor < ActiveRecord::Migration
  def change
    remove_column :procedures, :legislative_file_state_id
    add_belongs_to :legislative_file_states, :procedure, index: true, foreign_key: true

    add_column :legislative_file_states, :state_type, :integer, default: 0
    add_column :legislative_file_states, :name, :integer, default: 0
    add_column :legislative_file_states, :date_at, :date

    create_table :comisions_legislative_file_states, id: false do |t|
      t.belongs_to :comision, index: { name: 'index_coms_leg_file_states_on_comision_id' }
      t.belongs_to :legislative_file_state, index: { name: 'index_coms_leg_file_states_on_state_id' }
    end

    create_table :legislative_file_states_loops, id: false do |t|
      t.belongs_to :legislative_file_state, index: { name: 'index_leg_file_states_loops_on_state_id' }
      t.belongs_to :loop, index: { name: 'index_leg_file_states_loops_on_loop_id' }
    end
  end
end
