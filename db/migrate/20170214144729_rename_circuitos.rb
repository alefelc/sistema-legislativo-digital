class RenameCircuitos < ActiveRecord::Migration
  def change
    rename_table :circuitos, :loops

    rename_table :circuitos_despachos, :loops_despachos
    rename_column :loops_despachos, :circuito_id, :loop_id

    rename_table :circuitos_normas, :loops_normas
    rename_column :loops_normas, :circuito_id, :loop_id

    rename_column :legislative_file_states, :circuito_id, :loop_id

    rename_column :procedures, :circuito_id, :loop_id

    rename_table :circuito_ordens, :loop_ordens
    rename_column :loop_ordens, :circuito_id, :loop_id
  end
end
