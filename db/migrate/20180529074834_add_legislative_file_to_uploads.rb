class AddLegislativeFileToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :legislative_file, index: true
  end
end
