class AddContingencyToProcedures < ActiveRecord::Migration
  def change
    add_belongs_to :procedures, :contingency_plan, index: true, foreign_key: true
  end
end
