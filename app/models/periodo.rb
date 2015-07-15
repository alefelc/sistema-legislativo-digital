class Periodo < ActiveRecord::Base

  #== Associations
  has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_and_belongs_to_many :concejals

  # busco los periodos entre desde y hasta
  def self.find_by_year(desde, hasta) 
    self.where('extract(year from desde) = ? AND 
                  extract(year from hasta) = ?', desde, hasta)  
  end
end
