class CreateNormasOtraPublicacionsJoinTable < ActiveRecord::Migration
  def change
    create_table :normas_otra_publicacions, id: false do |t|
      t.belongs_to :norma, index: true
      t.belongs_to :otra_publicacion, index: true
    end
  end
end
