class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.belongs_to :tramite, index: true
      t.attachment :file
      t.timestamps null: false
    end
  end
end
