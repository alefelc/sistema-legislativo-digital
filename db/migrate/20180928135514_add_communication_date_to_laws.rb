class AddCommunicationDateToLaws < ActiveRecord::Migration
  def change
    add_column :laws, :communication_date, :date
  end
end
