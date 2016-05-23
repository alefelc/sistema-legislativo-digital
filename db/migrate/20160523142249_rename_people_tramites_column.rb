class RenamePeopleTramitesColumn < ActiveRecord::Migration
  def change
    rename_column :people_tramites, :persona_id, :person_id
  end
end
