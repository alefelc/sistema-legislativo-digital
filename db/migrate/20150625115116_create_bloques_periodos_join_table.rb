class CreateBloquesPeriodosJoinTable < ActiveRecord::Migration
  def change
  	create_table :bloques_periodos, id: false do |t|
  		t.belongs_to :bloque , index: true
  		t.belongs_to :periodo, index: true	      
  	end
  end
end
