class AddLawsToUploadsModel < ActiveRecord::Migration
  def change
    add_reference :uploads, :law, index: true
  end
end
