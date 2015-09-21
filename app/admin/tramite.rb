ActiveAdmin.register Tramite do

  menu label: "Todos los Trámites"

  config.current_filters = false

  actions :all

  filter :id, label: "Nro. Trámite"
  filter :asunto
  filter :iniciador
  filter :type, label: "Trámite"
  filter :observaciones
  filter :created_at, label: "Creado el"
  filter :updated_at, label: "Actualizado el"

  controller do
    def action_methods
        super - %w[ destroy new create edit ]
    end
  end

  index title: 'Trámites' do
    id_column
    column "Trámite", :type
    column "Nro. de Fojas", :nro_fojas
    column "Asunto/Solicitud", :asunto
    column "Iniciador/Particular", :iniciador
    column :observaciones
    column "Actualizado", :updated_at
    column "Firma"
    actions
  end
end
