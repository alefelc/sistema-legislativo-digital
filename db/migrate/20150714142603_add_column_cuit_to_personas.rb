class AddColumnCuitToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :cuit, :integer
  end
end
