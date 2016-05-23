class RenameComisionsPersonasTable < ActiveRecord::Migration
  def change
    rename_table :comisions_personas, :comisions_people
  end
end
