class AddDestinyTypeToDestinies < ActiveRecord::Migration
  def change
    remove_column :destinies, :destiny, :integer, index: true
    add_column :destinies, :type_of_destiny, :integer, index: true
  end
end
