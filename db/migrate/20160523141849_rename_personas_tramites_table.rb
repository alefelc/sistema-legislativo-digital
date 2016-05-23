class RenamePersonasTramitesTable < ActiveRecord::Migration
  def change
    rename_table :personas_tramites, :people_tramites
  end
end
