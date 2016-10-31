class UpgradeTableNameExpedienteAdministrativo < ActiveRecord::Migration
  def change
    rename_table :expediente_administrativos, :administrative_files
  end
end
