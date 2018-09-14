class AddColumnLeaveDateToProcedureSignatoriesTable < ActiveRecord::Migration
  def change
    add_column :procedure_signatories, :leave_date, :date
  end
end
