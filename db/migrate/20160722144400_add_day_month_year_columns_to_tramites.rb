class AddDayMonthYearColumnsToTramites < ActiveRecord::Migration
  def change
    add_column :tramites, :day, :integer
    add_column :tramites, :month, :integer
    add_column :tramites, :year, :integer
  end
end
