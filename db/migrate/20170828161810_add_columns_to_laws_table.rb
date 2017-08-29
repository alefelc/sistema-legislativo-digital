class AddColumnsToLawsTable < ActiveRecord::Migration
  def change
    add_column :laws, :law_type, :integer
    add_column :laws, :number, :string
    add_column :laws, :letter, :string
    add_column :laws, :year, :string
  end
end
