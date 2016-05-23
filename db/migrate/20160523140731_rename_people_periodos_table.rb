class RenamePeoplePeriodosTable < ActiveRecord::Migration
  def change
    rename_table :periodos_personas, :people_periodos
  end
end
