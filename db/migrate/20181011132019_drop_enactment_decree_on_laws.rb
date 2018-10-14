class DropEnactmentDecreeOnLaws < ActiveRecord::Migration
  def change
    remove_column :laws, :enactment_decree_id, :integer, index: true
  end
end
