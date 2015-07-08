class CreateAdjuntaFisicamentes < ActiveRecord::Migration
  def change
    create_table :adjunta_fisicamentes do |t|
    	t.belongs_to :adjuntado, index: true
  		t.belongs_to :adjunta, index: true

      t.timestamps null: false
    end
  end
end
