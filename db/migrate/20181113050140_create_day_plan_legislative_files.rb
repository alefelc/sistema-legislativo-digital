class CreateDayPlanLegislativeFiles < ActiveRecord::Migration
  def change
    create_table :day_plan_legislative_files do |t|
      t.references :day_plan, index: true
      t.references :loop, index: true
      t.integer :order
      t.integer :state, default: 0
      t.integer :position
      t.text :description

      t.timestamps null: false
    end
  end
end
