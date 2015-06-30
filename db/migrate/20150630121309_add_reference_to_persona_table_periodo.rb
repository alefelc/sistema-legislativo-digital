class AddReferenceToPersonaTablePeriodo < ActiveRecord::Migration
  def change
    add_reference :personas, :periodo, index: true
  end
end
