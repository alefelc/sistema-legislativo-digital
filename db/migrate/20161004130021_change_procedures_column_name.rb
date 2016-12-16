class ChangeProceduresColumnName < ActiveRecord::Migration
  def change
    rename_column :procedures, :nro_fojas, :sheets
    rename_column :procedures, :asunto, :topic
    rename_column :procedures, :observaciones, :observations

    # Unused columns
    remove_column :procedures, :responsable
    # remove_column :procedures, :fecha
    remove_column :procedures, :tipo_contribucion
    remove_column :procedures, :condicion_contribuyente
    remove_column :procedures, :pendiente
  end
end
