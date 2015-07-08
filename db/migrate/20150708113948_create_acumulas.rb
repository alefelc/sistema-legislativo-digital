class CreateAcumulas < ActiveRecord::Migration
  def change
    create_table :acumulas do |t|
    	t.belongs_to :acumulado, index: true
  		t.belongs_to :acumula, index: true

      t.timestamps null: false
    end
  end
end
