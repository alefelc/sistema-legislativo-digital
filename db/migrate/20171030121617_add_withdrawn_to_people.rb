class AddWithdrawnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :withdrawn, :datetime
  end
end
