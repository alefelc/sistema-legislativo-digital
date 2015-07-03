class CreateComisionsAndTramitesJoinTable < ActiveRecord::Migration
  def change
  	create_table :comisions_tramites, id: false do |t|
      t.belongs_to :comision, index: true
      t.belongs_to :tramite, index: true
    end
  end
end
