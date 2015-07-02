class CreatePersonasAndTramitesJoinTable < ActiveRecord::Migration
  def change
		create_table :personas_tramites, id: false do |t|
      t.belongs_to :persona, index: true
      t.belongs_to :tramite, index: true
    end 
  end
end
