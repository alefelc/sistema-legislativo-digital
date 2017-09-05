class AddAreasUsersTable < ActiveRecord::Migration
  def change
    create_table :areas_users do |t|
      t.belongs_to :area, index: true
      t.belongs_to :user, index: true
    end
  end
end
