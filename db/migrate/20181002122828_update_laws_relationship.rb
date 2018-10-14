class UpdateLawsRelationship < ActiveRecord::Migration
  def change
    add_belongs_to :laws, :municipal_gazette, index: true, foreign_key: true
    remove_column :municipal_gazettes, :law_id, :integer
  end
end
