class UpdateHabtmProceduresLegislativeFiles < ActiveRecord::Migration
  def change
    rename_column :legislative_files_procedures, :despacho_id, :procedure_id
  end
end
