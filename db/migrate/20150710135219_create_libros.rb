class CreateLibros < ActiveRecord::Migration
  def change
    create_table :libros do |t|
      t.string :nombre
      t.belongs_to :digesto

      t.timestamps null: false
    end
  end
end
