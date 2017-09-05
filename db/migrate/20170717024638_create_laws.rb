class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|

      t.timestamps null: false
    end
  end
end
