class ModifyEstadoExpedientesForPolymorphicAssociation < ActiveRecord::Migration
  def change
    remove_column :estado_expedientes, :id_ref
    remove_column :estado_expedientes, :id_ref_id
    remove_column :estado_expedientes, :id_ref_type

    add_column :estado_expedientes, :ref_id, :integer
    add_column :estado_expedientes, :ref_type, :string

    add_index :estado_expedientes, :ref_id
  end
end
