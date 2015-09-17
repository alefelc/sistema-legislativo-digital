ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  menu if: proc{ 
    if current_admin_user.present?
      current_admin_user.email.split('@')[1] == 'admin.com'
    end
    }, label: "Usuarios"

  
  actions :all

  controller do
    def action_methods
      if current_admin_user.present?
        if current_admin_user.email.split('@')[1] == 'admin.com'
          super
        elsif current_admin_user.email.split('@')[1] == 'invitado.com'
          super - %w[ destroy new create edit ] 
        elsif current_admin_user.email.split('@')[1] == 'entrada.com'
          super
        else
          super - %w[ show destroy new create edit ]    
        end
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
