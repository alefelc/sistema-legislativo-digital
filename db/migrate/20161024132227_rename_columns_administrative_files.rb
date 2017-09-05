class RenameColumnsAdministrativeFiles < ActiveRecord::Migration
  def change
    rename_column :administrative_files, :nro_exp, :number
    rename_column :administrative_files, :nro_fojas, :sheets
    rename_column :administrative_files, :tema, :topic
    rename_column :administrative_files, :expediente_id, :file_id
    rename_column :administrative_files, :letra, :letter
    remove_column :administrative_files, :observacion
  end
end
