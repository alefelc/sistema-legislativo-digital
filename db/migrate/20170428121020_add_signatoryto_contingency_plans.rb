class AddSignatorytoContingencyPlans < ActiveRecord::Migration
  def change
    add_column :contingency_plans, :signatory, :text
  end
end
