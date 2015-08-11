class AddColumnOrdenToLibro < ActiveRecord::Migration
  def change
    add_column :libros, :orden, :integer
    add_column :titulos, :orden, :integer
    add_column :capitulos, :orden, :integer
  end
end
