ActiveAdmin.register Condonacion do

  permit_params :nro_fojas, :iniciador, :domicilio, :telefono, :email, :asunto, :observaciones, :usuario

  # parent
  menu label: "Condonaciones"

  actions :all

  filter :id, label: "Nro. Trámite"
  filter :asunto
  filter :iniciador
  filter :observaciones
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

  index title: "Condonaciones" do
    column "Nro. Trámite", :id
    column :nro_fojas
    column "Particular", :iniciador
    column :domicilio
    column :telefono
    column :email
    column "Solicitud", :asunto
    column :observaciones
    column "Actualizado", :updated_at
    actions
  end

  show title: proc { |cond| "Nro. Trámite: #{cond.id}" } do
    attributes_table do
      row "Nro. Trámite" do condonacion.id end
      row :nro_fojas
      row "Particular" do condonacion.iniciador end
      row :domicilio
      row :telefono
      row :email
      row "Solicitud" do condonacion.asunto end
      row :observaciones
      row "Creado el" do condonacion.created_at end
      row "Actualizado el" do condonacion.updated_at end
      row "Actualizado por" do condonacion.usuario end
    end
  end

  form do |f|
    f.inputs do
      f.input :nro_fojas
      f.input :iniciador, label: "Particular"
      f.input :domicilio
      f.input :telefono
      f.input :email
      f.input :asunto, label: "Solicitud", :input_html => { :rows => 5 }
      f.input :observaciones, :input_html => { :rows => 5 }
      f.input :usuario, label: "Usuario", :input_html => { readonly: true, class: "usuario-resp" }
    end
    f.actions
  end

end
