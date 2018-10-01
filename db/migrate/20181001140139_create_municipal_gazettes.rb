class CreateMunicipalGazettes < ActiveRecord::Migration
  def change
    create_table :municipal_gazettes do |t|
      t.integer :number
      t.date :release_date
      t.belongs_to :law, index: true, foreign_key: true
      t.belongs_to :upload, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
