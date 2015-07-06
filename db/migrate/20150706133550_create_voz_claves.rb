class CreateVozClaves < ActiveRecord::Migration
  def change
    create_table :voz_claves do |t|
      t.string :nombre

      ## VozClave tiene un expediente
      t.belongs_to :expediente, index: true

      t.timestamps null: false
    end
  end
end
