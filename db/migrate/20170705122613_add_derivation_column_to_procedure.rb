class AddDerivationColumnToProcedure < ActiveRecord::Migration
  def change
    add_reference :procedures, :procedure_derivation, foreign_key: true
  end
end
