class AddColumnsToExpedienteAdministrativo < ActiveRecord::Migration
  def change
    add_column :expediente_administrativos, :sub_indice, :string
    add_column :expediente_administrativos, :letra, :string
    add_column :expediente_administrativos, :anio, :date
  end
end
