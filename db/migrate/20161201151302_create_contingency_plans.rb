class CreateContingencyPlans < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.table_exists? 'contingency_plans'
      create_table :contingency_plans do |t|
        t.text :reason
        t.date :date_at

        t.timestamps null: false
      end
    end
  end

  def down
    drop_table :contingency_plans
  end
end
