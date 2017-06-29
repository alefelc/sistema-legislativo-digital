class RenameTagsColumns < ActiveRecord::Migration
  def change
    rename_column :tags, :nombre, :name
  end
end
