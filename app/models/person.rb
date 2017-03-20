class Person < ActiveRecord::Base
  #== Concejal Associations
  # has_and_belongs_to_many :periodos
  # has_and_belongs_to_many :comisions
  # belongs_to :bloque

  #== Associations
  has_and_belongs_to_many :procedures
  has_many :estado_procedure, as: :ref
  has_many :processes_signatories
  has_many :signed_paperwork,
           through: :processes_signatories,
           source: :process

  def full_name
    if surname.present? && name.present?
      "#{surname}, #{name}"
    elsif surname.present?
      surname
    elsif name.present?
      name
    else
      ''
    end
  end

  def fullname_with_dni
    cuit_or_dni.present? ? full_name + " (DNI: #{cuit_or_dni})" : full_name
  end

  def text
    if cuit_or_dni.present?
     "#{full_name} [dni/cuit: #{cuit_or_dni}]"
    else
      full_name
    end
  end
end
