class CreateCircuitos < ActiveRecord::Migration
  def change
    create_table :circuitos do |t|

    	## Circuito tine un expediente
      t.belongs_to :expediente, index: true

      ## Circuito tiene un tramite
      t.belongs_to :tramite, index: true

      t.timestamps null: false
    end
  end
end
