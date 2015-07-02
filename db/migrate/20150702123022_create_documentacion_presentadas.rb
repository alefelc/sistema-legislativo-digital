class CreateDocumentacionPresentadas < ActiveRecord::Migration
  def change
    create_table :documentacion_presentadas do |t|
      t.string :tipo
      t.belongs_to :condonacion, index: true

      t.timestamps null: false
    end
  end
end
