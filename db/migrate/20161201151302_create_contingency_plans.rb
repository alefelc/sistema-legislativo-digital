class CreateContingencyPlans < ActiveRecord::Migration
  def up
    create_table :contingency_plans do |t|
      t.text :reason
      t.date :date_at

      t.timestamps null: false
    end
  end

  def down
    drop_table :contingency_plans
  end
end
