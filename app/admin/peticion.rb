ActiveAdmin.register Peticion do

  permit_params :nro_fojas, :iniciador, :domicilio, :telefono, :email, :asunto, :observaciones, :destino, :usuario

  actions :all

  filter :id, label: "Nro. Trámite"
  filter :asunto
  filter :iniciador
  filter :observaciones
  filter :destino
  filter :created_at, label: "Creado el"
  filter :updated_at, label: "Actualizado el"

  controller do
    def action_methods
      if current_admin_user.present?
        if current_admin_user.email.split('@')[1] == 'admin.com'
          super
        elsif current_admin_user.email.split('@')[1] == 'invitado.com'
          super - %w[ destroy new create edit ]
        elsif current_admin_user.email.split('@')[1] == 'entrada.com'
          super - %w[ destroy ]
        else
          super - %w[ show destroy new create edit ]
        end
      else
        super - %w[ show destroy new create edit ]
      end
    end
  end

  # parent
  menu label: "Peticiones generales"

  index title: "Peticiones Generales" do
    column "Nro. Trámite", :id
    column :nro_fojas
    column :iniciador
    column :asunto
    column :observaciones
    column :destino
    column "Actualizado", :updated_at
    actions
  end

  show title: proc { |pet| "Nro. Trámite: #{pet.id}" } do
    attributes_table do
      row "Nro. Trámite" do peticion.id end
      row :nro_fojas
      row :iniciador
      row :domicilio
      row :telefono
      row :email
      row :asunto
      row :observaciones
      row :destino
      row "Creado el" do peticion.created_at end
      row "Actualizado el" do peticion.updated_at end
      row "Actualizado por" do peticion.usuario end
    end
  end

  form do |f|
    f.inputs do
      f.input :nro_fojas
      f.input :iniciador
      f.input :domicilio
      f.input :telefono
      f.input :email
      f.input :asunto, :input_html => { :rows => 5 }
      f.input :observaciones, :input_html => { :rows => 5 }
      f.input :destino
      f.input :usuario, label: "Usuario", :input_html => { readonly: true, class: "usuario-resp" }
    end
    f.actions
  end

end
