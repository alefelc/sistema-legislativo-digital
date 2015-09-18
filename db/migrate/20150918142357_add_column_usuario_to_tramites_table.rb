class AddColumnUsuarioToTramitesTable < ActiveRecord::Migration
  def change
    add_column :tramites, :usuario, :string
  end
end
