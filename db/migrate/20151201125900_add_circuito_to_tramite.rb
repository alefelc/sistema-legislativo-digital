class AddCircuitoToTramite < ActiveRecord::Migration
  def change
    add_reference :tramites, :circuito, index: true
  end
end
