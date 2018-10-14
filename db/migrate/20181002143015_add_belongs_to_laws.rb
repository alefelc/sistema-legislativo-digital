class AddBelongsToLaws < ActiveRecord::Migration
  def change
    add_reference :laws, :enactment_decree, index: true
  end
end
