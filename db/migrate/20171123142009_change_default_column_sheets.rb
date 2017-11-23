class ChangeDefaultColumnSheets < ActiveRecord::Migration
  def change
    change_column_default :legislative_files, :sheets, 0
  end
end
