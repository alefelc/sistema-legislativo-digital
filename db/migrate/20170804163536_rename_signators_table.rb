class RenameSignatorsTable < ActiveRecord::Migration
  def change
    rename_column :processes_signatories, :process_id, :procedure_id
    rename_column :processes_signatories, :person_id, :procedure_signatory_id
  end
end
