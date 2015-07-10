class AddColumnExpedienteIdToNorma < ActiveRecord::Migration
  def change
    add_column :normas, :expediente_id, :integer
    add_index :normas, :expediente_id
  end
end
