module Roles::Activity
  ADMIN = [
    { name: "Configuraciones del sistema", activity: 'configurations:all' }
  ].freeze

  CONTINGENCY_PLAN = [
    { name: "Crear contigencia", activity: 'contingency_plan:create' },
    { name: "Editar contigencia", activity: 'contingency_plan:update' }
  ].freeze

  PROCEDURE = [
    { name: 'Crear trámites', activity: 'procedure:create', parent: :create },
    { name: 'Tipo de trámite', activity: 'procedure:type_create', child: :create },
    { name: 'Fojas', activity: 'procedure:sheets_create', child: :create },
    { name: 'Asunto', activity: 'procedure:topic_create', child: :create },
    { name: 'Iniciadores', activity: 'procedure:initiators_create', child: :create },
    { name: 'Observaciones', activity: 'procedure:observations_create', child: :create },
    { name: 'Trámite finalizado?', activity: 'procedure:finalized_create', child: :create },
    { name: 'Archivos adjuntos', activity: 'procedure:upload_create', child: :create },
    { name: 'Cargar derivaciones', activity: 'procedure:derivations_create', child: :create },

    { name: 'Editar trámites', activity: 'procedure:edit', parent: :create },
    { name: 'Tipo de trámite', activity: 'procedure:type_update', child: :edit },
    { name: 'Fojas', activity: 'procedure:sheets_update', child: :edit },
    { name: 'Asunto', activity: 'procedure:topic_update', child: :edit },
    { name: 'Iniciadores', activity: 'procedure:initiators_update', child: :edit },
    { name: 'Observaciones', activity: 'procedure:observations_update', child: :edit },
    { name: 'Trámite finalizado?', activity: 'procedure:finalized_update', child: :edit },
    { name: 'Archivos adjuntos', activity: 'procedure:upload_update', child: :edit },
    { name: 'Editar derivaciones', activity: 'procedure:derivations_update', child: :edit }
  ].freeze

  ADMINISTRATIVE_FILE = [
    { name: "Crear exped. administrativos", activity: 'administrative_file:create' },
    { name: "Editar exped. administrativos", activity: 'administrative_file:update' }
  ].freeze

  LEGISLATIVE_FILE = [
    { name: "Crear exped. legislativos", activity: 'legislative_file:create' },
    { name: "Editar exped. legislativos", activity: 'legislative_file:update' }
  ].freeze

  def self.admin_role()
    Role.create_with(activities: ADMIN + only_activities).
      find_or_create_by(name: 'admin', admin: true)
  end

  def self.activities()
    [
      PROCEDURE, ADMIN, ADMINISTRATIVE_FILE, CONTINGENCY_PLAN, LEGISLATIVE_FILE
    ]
  end

  def self.activities_with_name()
    names = %w(procedure admin administrative_file contingency_plan legislative_file)
    activities.map.with_index do |act, index|
      { activities: act, title: I18n.t("roles.#{names[index]}") }
    end.flatten
  end

  def self.only_activities()
    activities.flatten.collect { |a| a[:activity] }
  end
end
