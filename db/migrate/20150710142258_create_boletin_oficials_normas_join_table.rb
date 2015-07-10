class CreateBoletinOficialsNormasJoinTable < ActiveRecord::Migration
  def change
    create_table :boletin_oficials_normas, id: false do |t|
      t.belongs_to :boletin_oficial, index: true
      t.belongs_to :norma, index: true
    end
  end
end
