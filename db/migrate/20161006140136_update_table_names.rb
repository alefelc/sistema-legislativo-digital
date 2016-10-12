class UpdateTableNames < ActiveRecord::Migration
  def change
    drop_table :personas_tramites

    rename_table :areas_tramites, :areas_procedures
    rename_table :bloques_tramites, :bloques_procedures
    rename_table :comisions_tramites, :comisions_procedures
    rename_table :dependencias_tramites, :dependencias_procedures
    rename_table :estado_tramites, :estado_procedures
    rename_table :municipal_offices_tramites, :municipal_offices_procedures
    rename_table :organo_de_gobiernos_tramites, :organo_de_gobiernos_procedures
    rename_table :people_tramites, :people_procedures
    rename_table :reparticion_oficials_tramites, :procedures_reparticion_oficials
  end
end
