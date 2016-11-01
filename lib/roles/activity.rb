module Roles::Activity
  ADMIN = [
    { name: "Configuraciones del sistema", activity: 'configurations:all' }
  ].freeze

  CONTINGENCY = [
    { name: "Contigencia en trámites", activity: 'procedure:contingency' }
  ].freeze

  PROCEDURE = [
    { name: "Crear trámites", activity: 'procedure:create' },
    { name: "Editar trámites", activity: 'procedure:edit' }
  ].freeze

  def self.admin_role()
    Role.create_with(activities: ADMIN + only_activities).
      find_or_create_by(name: 'admin', admin: true)
  end

  def self.activities()
    [
      PROCEDURE, ADMIN
    ]
  end

  def self.activities_with_name()
    names = %w(procedure admin)
    activities.map.with_index do |act, index|
      { activities: act, title: I18n.t("roles.#{names[index]}") }
    end.flatten
  end

  def self.only_activities()
    activities.flatten.collect { |a| a[:activity] }
  end
end
