class RemoveReferenceToPersonasTablePeriodo < ActiveRecord::Migration
  def change
    remove_reference :personas, :periodo
  end
end
