class CreateTableSeccionAndOrdenDelDiaJoinTable < ActiveRecord::Migration
  def change
  	create_table :orden_del_dia_seccions, id: false do |t|
      t.belongs_to :orden_del_dia, index: true
      t.belongs_to :seccion, index: true
    end
  end
end
