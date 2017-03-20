class MunicipalOffice < ActiveRecord::Base
  has_many :municipal_offices_procedures
  has_many :procedures, through: :municipal_offices_procedures

  def type
    'Dependencia Municipal'
  end

  def text
  	denominacion
  end
end
