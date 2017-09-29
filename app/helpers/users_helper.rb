module UsersHelper
  def areas_users_options()
    Area.all.collect { |p| [ p, p.id ] }
  end
end
