class AddEnactmentDecreeFieldsOnLaws < ActiveRecord::Migration
  def change
    add_column :laws, :enactment_decree, :string
    add_column :laws, :enactment_decree_date, :date
    add_column :laws, :enactment_decree_upload_id, :integer, index: true
  end
end
