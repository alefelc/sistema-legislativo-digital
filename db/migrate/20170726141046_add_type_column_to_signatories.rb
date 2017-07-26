class AddTypeColumnToSignatories < ActiveRecord::Migration
  def change
    add_column :procedure_signatories, :initiator_type, :integer
  end
end
