class AddColumnTypeToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :type, :string
  end
end
