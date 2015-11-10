class ReparticionOficialsAndTramites < ActiveRecord::Migration
  def change
    create_table :reparticion_oficials_tramites, id: false do |t|
      t.belongs_to :reparticion_oficial, index: true
      t.belongs_to :tramite, index: true
    end  
  end
end
