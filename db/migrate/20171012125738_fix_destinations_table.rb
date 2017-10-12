class FixDestinationsTable < ActiveRecord::Migration
  def change
    rename_table :destinations, :destinies
  end
end
