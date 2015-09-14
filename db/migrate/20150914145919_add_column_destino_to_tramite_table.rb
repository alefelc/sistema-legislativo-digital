class AddColumnDestinoToTramiteTable < ActiveRecord::Migration
  def change
    add_column :tramites, :destino, :string
  end
end
