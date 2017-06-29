class AddProcedureOriginToLoop < ActiveRecord::Migration
  def change
    add_column :loops, :origin_procedure_id, :integer, index: true
  end
end
