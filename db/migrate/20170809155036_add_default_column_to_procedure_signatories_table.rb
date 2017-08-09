class AddDefaultColumnToProcedureSignatoriesTable < ActiveRecord::Migration
  def change
    add_column :procedure_signatories, :default, :bool, default: false
  end
end
