class CreateComisionsAndDespachosJoinTable < ActiveRecord::Migration
  def change
    create_table :comisions_despachos, id: false do |t|
      t.belongs_to :despacho, index: true
      t.belongs_to :comision, index: true
    end
  end
end
