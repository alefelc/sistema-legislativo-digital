class RenameExpedienteTable < ActiveRecord::Migration
  def change
    rename_table :expedientes, :legislative_files
    rename_table :estado_expedientes, :legislative_files_status
    rename_table :expedientes_despachos, :legislative_files_procedures
    rename_table :expedientes_tags, :legislative_files_tags

    rename_column :legislative_files_tags, :expediente_id, :legislative_file_id
    rename_column :normas, :expediente_id, :legislative_file_id
    rename_column :circuitos, :expediente_id, :legislative_file_id
    rename_column :legislative_files_procedures, :expediente_id, :legislative_file_id
  end
end
