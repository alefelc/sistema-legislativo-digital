class MunicipalOfficesTramite < ActiveRecord::Base
  # == Associations
  belongs_to :municipal_office
  belongs_to :tramite

  # == Validations
  validates :municipal_office, :tramite, presence: true
end
