class AddColumnParticularToTramiteTable < ActiveRecord::Migration
  def change
    add_column :tramites, :iniciador, :string
    add_column :tramites, :domicilio, :string
    add_column :tramites, :telefono, :string
    add_column :tramites, :email, :string
    add_column :tramites, :nro_exp, :integer
    add_column :tramites, :anio_exp, :integer
    add_column :tramites, :bis_exp, :integer
    add_column :tramites, :comision, :string
    add_column :tramites, :concejales_firmantes, :string
  end
end
