class Bloque < ActiveRecord::Base

  #== Associations
  has_many :bloque_periodos
	has_many :periodos, through: :bloque_periodos
  has_many :concejals
  has_and_belongs_to_many :tramites

  has_many :estado_tramites, as: :ref

end
