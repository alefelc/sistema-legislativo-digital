class AddPendienteToTramites < ActiveRecord::Migration
  def change
    add_column :tramites, :pendiente, :boolean, default: false
  end
end
