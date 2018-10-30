class AddFieldsOnAuthorities < ActiveRecord::Migration
  def change
    add_column :people, :ddjj_id, :integer, index: true
  end
end
