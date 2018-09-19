class AddPictureToPerson < ActiveRecord::Migration
  def change
    add_belongs_to :people, :picture, index: true
  end
end
