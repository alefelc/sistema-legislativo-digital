class AuthorityDecorator < Draper::Decorator
  delegate_all

  def internal_position
    I18n.t("authorities.positions.#{object.internal_position}")
  end

  def full_name
    "#{object.person.surname}, #{object.person.name}"
  end

  def bloc_party
    object.person.try :bloque
  end

  def edit_url
    h.edit_authority_path object
  end

  def dni
    object.person.cuit_or_dni || 'S/N'
  end

  def phone
    object.person.phone || 'S/N'
  end

  def picture
    h.image_tag h.image_path('no_image.jpg'),
      class: 'profile-user-img img-responsive img-circle',
      alt: 'User profile picture'
  end

  def assumption_date
    object.assumption_date.to_default_s if object.assumption_date.present?
  end

  def recess_date
    object.recess_date.to_default_s if object.recess_date.present?
  end

  def authority_positions
    h.options_for_select(
      [
        ['Presidencia', :president],
        ['Vicepresidente Primero', :first_vicepresident],
        ['Vicepresidente Segundo', :second_vicepresident],
        ['Vicepresidente Tercero', :third_vicepresident],
        ['Prosecretario', :prosecutor],
        ['Secretario', :secretary],
      ], object.internal_position)
  end

  def authority_periods
    Periodo.order(hasta: :desc).map { |period| [period, period.id] }
  end
end
