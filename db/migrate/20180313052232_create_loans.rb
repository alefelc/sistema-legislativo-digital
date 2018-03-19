class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.belongs_to :legislative_file, index: true
      t.belongs_to :person, index: true
      t.datetime :borrowed_at
      t.datetime :returned_at

      t.timestamps null: false
    end
  end
end
