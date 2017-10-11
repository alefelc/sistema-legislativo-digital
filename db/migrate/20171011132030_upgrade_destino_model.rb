class UpgradeDestinoModel < ActiveRecord::Migration
  def up
    drop_table :destinos
    create_table :destinations, force: :cascade do |t|
      t.integer   :destiny
      t.reference :law, index: true
      t.date      :date
      t.string    :name
      t.timestamps
    end
  end

  def down
    create_table :destinos, force: :cascade do |t|
      t.integer    :tipo
      t.date       :fecha
      t.string     :destino
      t.reference  :norma, index: true
      t.timestamps
    end
  end
end
