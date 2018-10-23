class Bloque < ActiveRecord::Base

  #== Associations
  has_many :bloque_periodos
	has_many :periodos, through: :bloque_periodos
  has_many :concejals
  has_and_belongs_to_many :procedures

  has_many :estado_procedures, as: :ref

  validates :denominacion, presence: true
  validates :periodos, presence: true

  def type
    'Bloque'
  end

  def text
    self.denominacion
  end

  def to_s
    self.denominacion
  end
end
