class RenameColumnObservacionSessions < ActiveRecord::Migration
  def change
    rename_column :sessions, :observacion, :observation
  end
end
