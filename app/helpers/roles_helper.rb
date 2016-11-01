require 'roles/activity.rb'

module RolesHelper
  def activities_sets
    Roles::Activity.activities_with_name
  end
end
