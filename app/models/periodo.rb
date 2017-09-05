class Periodo < ActiveRecord::Base

  #== Associations
  has_many :bloque_periodos
  has_many :bloques, through: :bloque_periodos
	has_and_belongs_to_many :comisions
  has_and_belongs_to_many :concejals

  # busco los periodos entre desde y hasta
  def self.find_by_year(desde, hasta)
    self.where('extract(year from desde) = ? AND
                  extract(year from hasta) = ?', desde, hasta)
  end

  def format
    "#{desde} - #{hasta}"
  end

  def self.current_period
    Periodo.order(hasta: :desc).first
  end
end
