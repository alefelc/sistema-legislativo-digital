class CreateContingencyPlans < ActiveRecord::Migration
  def change
    create_table :contingency_plans do |t|
      t.text :reason
      t.date :date_at

      t.timestamps null: false
    end
  end
end
