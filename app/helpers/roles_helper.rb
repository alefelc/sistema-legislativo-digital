require 'roles/activity.rb'

module RolesHelper
  def activities_sets
    Roles::Activity.activities_with_name
  end

  def show_activities(activities)
    return "Este rol no tiene permisos asignados" if activities.blank?

    result = []
    permissions = activities.map { |a| a.split(':').first }.uniq
    permissions.each do |p|
      result << content_tag(:strong, I18n.t("roles.activities.#{p}"))
      li_s = activities.map { |a| a.split(':').last if a.split(':').first == p }.compact
      li_s = li_s.map { |li| content_tag(:li, I18n.t("roles.actions.#{p}.#{li}")) }
      result << content_tag(:ul, li_s.join(' ').html_safe).html_safe
    end

    result.join(" ").html_safe
  end
end
