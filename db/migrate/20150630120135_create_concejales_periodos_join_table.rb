class CreateConcejalesPeriodosJoinTable < ActiveRecord::Migration
  def change
    create_table :periodos_personas, id: false do |t|
      t.belongs_to :concejal, index: true
      t.belongs_to :periodo, index: true
    end
  end
end
