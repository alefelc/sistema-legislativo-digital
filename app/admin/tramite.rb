ActiveAdmin.register Tramite do

  menu label: "Todos los Trámites"

  config.current_filters = false

  actions :all

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
          super
        else
          super - %w[ show destroy new create edit ]
        end
      else
        super - %w[ show destroy new create edit ]
      end
    end
  end

  index title: 'Trámites' do
    id_column
    column "Trámite", :type
    column "Nro. de Fojas", :nro_fojas
    column "Asunto/Solicitud", :asunto
    column "Iniciador/Particular", :iniciador
    column :observaciones
    column "Firma"
  end
end
