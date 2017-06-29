class ChangeBisValueOnLegislativeFiles < ActiveRecord::Migration
  def change
    change_column_default :legislative_files, :bis, 0
  end
end
