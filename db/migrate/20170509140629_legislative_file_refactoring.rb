class LegislativeFileRefactoring < ActiveRecord::Migration
  def change
    rename_column :legislative_files, :nro_exp, :number
    rename_column :legislative_files, :nro_fojas, :sheets
    rename_column :legislative_files, :tema, :topic
    rename_column :legislative_files, :observacion, :observations
    rename_column :legislative_files, :anio, :date

    add_column :legislative_files, :year, :integer, index: true
  end
end
