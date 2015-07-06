class AddDesdeHastaFieldsOnComision < ActiveRecord::Migration
  def change
    add_column :comisions, :vig_desde, :date
    add_column :comisions, :vig_hasta, :date
  end
end
