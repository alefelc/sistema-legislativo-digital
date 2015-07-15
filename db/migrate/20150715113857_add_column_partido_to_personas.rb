class AddColumnPartidoToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :partido, :string
  end
end
