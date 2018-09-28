class DestroyDestinies < ActiveRecord::Migration
  def change
    drop_table :destinies
  end
end
