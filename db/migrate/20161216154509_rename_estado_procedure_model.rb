class RenameEstadoProcedureModel < ActiveRecord::Migration
  def change
    rename_table :estado_procedures, :procedure_states
    rename_table :legislative_files_status, :legislative_file_states
  end
end
