class CrateTableRelationShipConcejal < ActiveRecord::Migration
  def change
  	create_table :relationship_concejals do |t|
  		t.belongs_to :suplente, index: true
  		t.belongs_to :titular, index: true
      t.timestamps null: false
  	end
  end
end
