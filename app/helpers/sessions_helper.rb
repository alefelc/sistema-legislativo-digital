module SessionsHelper
  def session_types
    Session.session_types.keys.map do |s|
      [I18n.t("sessions.types.#{s}"), s]
    end
  end
end
