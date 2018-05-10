class UpdateSheetsColumnLegislativeFile < ActiveRecord::Migration
  def up
    change_column :legislative_files, :sheets, :integer, default: 0, null: false
    change_column :loops, :sheets, :integer, default: 0, null: false
  end

  def down
    # do nothing....
  end
end
