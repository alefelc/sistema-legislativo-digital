class AddColumnDestinoToTramiteTable < ActiveRecord::Migration
  def change
    add_column :tramites, :destino, :text
  end
end
