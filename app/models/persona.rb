class Persona < ActiveRecord::Base

  #== Concejal Associations
  # has_and_belongs_to_many :periodos
  # has_and_belongs_to_many :comisions
  # belongs_to :bloque

  #== Persona Associations
  has_one :usuario
  has_and_belongs_to_many :tramites

  has_many :estado_tramites, as: :ref

end
