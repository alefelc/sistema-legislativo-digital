class LoopsRefactoring < ActiveRecord::Migration
  def change
    rename_column :loops, :nro, :number
    rename_column :loops, :tema, :topic
    rename_column :loops, :anio, :year
    rename_column :loops, :fojas, :sheets

    change_column_default :loops, :number, 0

    add_column :loops, :date, :date
    add_column :loops, :bis, :integer, default: 0
    add_column :loops, :observations, :string
  end
end
