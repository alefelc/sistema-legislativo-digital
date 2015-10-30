class Tramite < ActiveRecord::Base

	#== Associations
	has_and_belongs_to_many :personas
	has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_many :estado_tramites
  has_one :circuito

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def get_fecha
    to_date(self.fecha).to_s unless self.fecha.nil?
  end

  def get_fojas
    self.nro_fojas.to_s
  end

  def get_observaciones
    self.observaciones
  end

end
