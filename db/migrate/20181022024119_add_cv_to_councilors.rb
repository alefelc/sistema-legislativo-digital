class AddCvToCouncilors < ActiveRecord::Migration
  def change
    add_column :people, :cv_id, :integer, foreign_key: true, index: true
  end
end
