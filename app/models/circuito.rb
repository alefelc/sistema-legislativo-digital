class Circuito < ActiveRecord::Base

  # == Associations
	belongs_to :expediente
	has_many :estado_expedientes
	has_many :tramites

	#== polymorfic association
  has_many :estado_tramites, as: :ref

  #== asociacion con orden del dia
	has_many :circuito_ordens
	has_many :orden_del_dias, :through => :circuito_ordens

  has_and_belongs_to_many :normas

  def type
    "Circuito"
  end  

  def get_tramites
    self.tramites.as_json(methods: 'type')
  end  

end
