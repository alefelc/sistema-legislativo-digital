class CreateComisionesConcejalesJoinTable < ActiveRecord::Migration
  def change
    create_table :comisions_personas, id: false do |t|
      t.belongs_to :comision, index: true
      t.belongs_to :concejal, index: true
    end
  end
end
