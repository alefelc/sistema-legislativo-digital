class MunicipalGazette < ActiveRecord::Base
  # == Associations
  belongs_to :upload
  has_one :law
end
