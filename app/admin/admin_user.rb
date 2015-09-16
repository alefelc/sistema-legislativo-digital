ActiveAdmin.register AdminUser do
  menu label: "Usuarios"
  permit_params :email, :password, :password_confirmation

  actions :all

  controller do
    def action_methods
      if current_admin_user.email.split('@')[1] == 'example.com'
        super
      elsif current_admin_user.email.split('@')[1] != 'guest.com'
        super - %w[ show destroy new create edit ]
      else
        super - %w[ show destroy new create edit ]
      end
    end
  end

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
