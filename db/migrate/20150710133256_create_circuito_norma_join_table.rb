class CreateCircuitoNormaJoinTable < ActiveRecord::Migration
  def change
    create_table :circuitos_normas, id: false do |t|
      t.belongs_to :circuito, index: true
      t.belongs_to :norma, index: true
    end
  end
end
