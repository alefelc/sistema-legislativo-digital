class AddProcedureSignatory < ActiveRecord::Migration
  def change
    create_table :procedure_signatories do |t|
      t.string :name
      t.string :surname
      t.text :contact_info
      t.text :position
      t.belongs_to :procedure, index: true

      t.timestamp null: false
    end
  end
end
