class CreateProcessesSignatories < ActiveRecord::Migration
  def change
    create_table :processes_signatories do |t|
      t.belongs_to :process, index: true
      t.belongs_to :person, index: true

      t.timestamps null: false
    end
  end
end
