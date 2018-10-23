class AddEffectiveTimeToCouncilors < ActiveRecord::Migration
  def change
    add_column :people, :effective_time_from, :date
    add_column :people, :effective_time_to, :date
  end
end
