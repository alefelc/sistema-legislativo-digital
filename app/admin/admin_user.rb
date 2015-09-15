ActiveAdmin.register AdminUser do
  menu label: "Administrador"
  permit_params :email, :password, :password_confirmation

  index :title => 'Administradores'
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  config.filters = false

  form do |f|
    f.inputs "Detalles" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
