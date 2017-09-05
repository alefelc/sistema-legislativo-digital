class MunicipalOfficesProcedure < ActiveRecord::Base
  # == Associations
  belongs_to :municipal_office
  belongs_to :procedure

  # == Validations
  validates :municipal_office, :procedure, presence: true
end
