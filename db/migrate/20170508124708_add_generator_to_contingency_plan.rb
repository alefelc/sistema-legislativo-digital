class AddGeneratorToContingencyPlan < ActiveRecord::Migration
  def change
    add_column :contingency_plans, :generator, :text
  end
end
