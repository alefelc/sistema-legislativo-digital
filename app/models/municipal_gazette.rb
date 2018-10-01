class MunicipalGazette < ActiveRecord::Base
  belongs_to :law
  belongs_to :file
end
