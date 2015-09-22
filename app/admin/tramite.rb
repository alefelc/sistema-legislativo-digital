ActiveAdmin.register Tramite do

  menu label: "Todos los Trámites"

  config.current_filters = false

  actions :all

  filter :id, label: "Nro."
  filter :asunto
  filter :iniciador
  filter :type, as: :select, :collection => proc{ %w( Condonacion Despacho Peticion ) }, :include_blank => true, label: "Tipo de tramite"
  filter :observaciones
  filter :created_at, label: "Creado el"
  filter :updated_at, label: "Actualizado el"

  controller do
    def action_methods
        super - %w[ destroy new create edit ]
    end
  end

  index title: 'Trámites' do
    column "Nro.", :id
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
