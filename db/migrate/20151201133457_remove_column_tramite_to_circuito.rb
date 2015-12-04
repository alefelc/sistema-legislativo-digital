class RemoveColumnTramiteToCircuito < ActiveRecord::Migration
  def change
    remove_column :circuitos, :tramite_id, :integer
  end
end
