class AddColumnTipoToNormas < ActiveRecord::Migration
  def change
    ## Para diferenciar normas especiales
    add_column :normas, :tipo, :integer
  end
end
