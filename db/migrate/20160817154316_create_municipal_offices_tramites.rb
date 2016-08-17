class CreateMunicipalOfficesTramites < ActiveRecord::Migration
  def change
    create_table :municipal_offices_tramites do |t|
      t.references :municipal_office, foreign_key: true
      t.references :tramite, foreign_key: true

      t.timestamps null: false
    end
  end
end
