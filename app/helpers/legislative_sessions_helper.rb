module LegislativeSessionsHelper
  def session_types
    LegislativeSession.session_types.keys.map do |s|
      [I18n.t("sessions.types.#{s}"), s]
    end
  end
end
