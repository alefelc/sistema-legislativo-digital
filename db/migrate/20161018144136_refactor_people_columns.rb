class RefactorPeopleColumns < ActiveRecord::Migration
  def change
    rename_column :people, :nombre, :name
    rename_column :people, :apellido, :surname
    rename_column :people, :nro_doc, :cuit_or_dni
    rename_column :people, :telefono, :phone
    rename_column :people, :domicilio, :address
    remove_column :people, :cargo
    remove_column :people, :tipo_doc
    remove_column :people, :cuit
    add_column :people, :position, :string
  end
end
