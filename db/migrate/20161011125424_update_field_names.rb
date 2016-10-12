class UpdateFieldNames < ActiveRecord::Migration
  def change
    rename_column :areas_procedures, :tramite_id, :procedure_id
    rename_column :bloques_procedures, :tramite_id, :procedure_id
    rename_column :comisions_procedures, :tramite_id, :procedure_id
    rename_column :dependencias_procedures, :tramite_id, :procedure_id
    rename_column :estado_procedures, :tramite_id, :procedure_id
    rename_column :expediente_administrativos, :tramite_id, :procedure_id
    rename_column :municipal_offices_procedures, :tramite_id, :procedure_id
    rename_column :organo_de_gobiernos_procedures, :tramite_id, :procedure_id
    rename_column :people_procedures, :tramite_id, :procedure_id
    rename_column :procedures_reparticion_oficials, :tramite_id, :procedure_id
    rename_column :uploads, :tramite_id, :procedure_id
  end
end
