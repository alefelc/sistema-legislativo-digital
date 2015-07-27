class AddColumnFechaToEstadoExpedientes < ActiveRecord::Migration
  def change
    add_column :estado_expedientes, :fecha, :date
  end
end
