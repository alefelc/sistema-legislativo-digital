class RenameColumnIdRefToEstadoExpedientes < ActiveRecord::Migration
  def change
    change_table :estado_expedientes do |t|
      t.references :ref, polymorphic: true, index: true
    end
  end
end
