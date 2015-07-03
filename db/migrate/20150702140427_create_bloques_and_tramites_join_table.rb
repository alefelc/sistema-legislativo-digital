class CreateBloquesAndTramitesJoinTable < ActiveRecord::Migration
  def change
  	create_table :bloques_tramites, id: false do |t|
      t.belongs_to :bloque, index: true
      t.belongs_to :tramite, index: true
    end
  end
end
