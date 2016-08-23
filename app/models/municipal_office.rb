class MunicipalOffice < ActiveRecord::Base
  has_many :municipal_offices_tramites
  has_many :tramites, through: :municipal_offices_tramites

  def type
    'Dependencia Municipal'
  end
end
