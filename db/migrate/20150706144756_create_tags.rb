class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :nombre

      t.belongs_to :expediente, index: true

      t.timestamps null: false
    end
  end
end
