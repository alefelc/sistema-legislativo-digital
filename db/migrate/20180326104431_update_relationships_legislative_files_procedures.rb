class UpdateRelationshipsLegislativeFilesProcedures < ActiveRecord::Migration
  def up
    create_table :loops_procedures do |t|
      t.integer "loop_id", index: true
      t.integer "procedure_id", index: true
    end
    #remove_column :legislative_files, :origin_procedure_id, :integer, index: true
  end

  def down
    drop_table :loops_procedures
    #add_column :legislative_files, :origin_procedure_id, :integer, index: true
  end
end
