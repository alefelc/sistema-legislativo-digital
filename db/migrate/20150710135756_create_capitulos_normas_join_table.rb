class CreateCapitulosNormasJoinTable < ActiveRecord::Migration
  def change
    create_table :capitulos_normas, id: false do |t|
      t.belongs_to :capitulo, index: true
      t.belongs_to :norma, index: true
    end
  end
end
