class DeleteSignatoryfield < ActiveRecord::Migration
  def up
    remove_column :procedure_signatories, :procedure_id
  end

  def down
    add_column :procedure_signatories, :procedure_id, :integer
  end
end
