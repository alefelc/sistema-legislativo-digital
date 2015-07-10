class CreateClasificacionNormaJoinTable < ActiveRecord::Migration
  def change
    create_table :clasificacions_normas, id: false do |t|
      t.belongs_to :clasificacion, index: true
      t.belongs_to :norma, index: true
    end
  end
end
