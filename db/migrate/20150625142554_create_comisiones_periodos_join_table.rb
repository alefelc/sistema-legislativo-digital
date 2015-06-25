class CreateComisionesPeriodosJoinTable < ActiveRecord::Migration
  def change
  	create_table :comisions_periodos, id: false do |t|
      t.belongs_to :comision, index: true
      t.belongs_to :periodo, index: true
    end
  end
end
