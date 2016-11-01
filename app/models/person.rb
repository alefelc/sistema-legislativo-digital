class Person < ActiveRecord::Base
  #== Concejal Associations
  # has_and_belongs_to_many :periodos
  # has_and_belongs_to_many :comisions
  # belongs_to :bloque

  #== Associations
  has_and_belongs_to_many :procedure
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
end
