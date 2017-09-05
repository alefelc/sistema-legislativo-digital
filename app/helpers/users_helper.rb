module UsersHelper
  def areas_users_options(user)
    options_for_select(Area.all.collect { |p| [p.name, p.id] }, user.area_id)
  end
end
