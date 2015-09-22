class AddColumnDateToTramites < ActiveRecord::Migration
  def change
    add_column :tramites, :fecha, :date
  end
end
