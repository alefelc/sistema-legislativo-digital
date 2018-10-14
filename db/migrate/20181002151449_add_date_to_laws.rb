class AddDateToLaws < ActiveRecord::Migration
  def change
    add_column :laws, :date, :date
  end
end
