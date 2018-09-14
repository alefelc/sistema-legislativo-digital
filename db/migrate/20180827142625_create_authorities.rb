class CreateAuthorities < ActiveRecord::Migration
  def change
    create_table :authorities do |t|
      t.belongs_to :periodo
      t.belongs_to :person
      t.integer :internal_position
      t.date :assumption_date
      t.date :recess_date

      t.timestamps null: false
    end
  end
end
