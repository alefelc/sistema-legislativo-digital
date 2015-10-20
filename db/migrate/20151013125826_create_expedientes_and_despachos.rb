class CreateExpedientesAndDespachos < ActiveRecord::Migration
  def change
    create_table :expedientes_despachos do |t|
      t.belongs_to :expediente, index: true
      t.belongs_to :despacho, index: true
    end
    remove_column :tramites, :expediente_id
  end
end
