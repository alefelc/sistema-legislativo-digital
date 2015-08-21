class AddPolymorphicRefForEstadoTramites < ActiveRecord::Migration
  def change

    add_column :estado_tramites, :ref_id, :integer
    add_column :estado_tramites, :ref_type, :string

    add_index  :estado_tramites, :ref_id
  end
end
