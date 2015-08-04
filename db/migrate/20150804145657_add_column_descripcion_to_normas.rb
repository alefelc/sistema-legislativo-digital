class AddColumnDescripcionToNormas < ActiveRecord::Migration
  def change
    ## Add column descripcion for special normas
    add_column :normas, :descripcion, :text
  end
end
