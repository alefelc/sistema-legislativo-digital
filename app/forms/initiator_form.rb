class InitiatorForm
  include ActiveModel::Model

  attr_accessor :type, :councilor_id, :partisan_block_id, :commission_id,
                :municipal_office_id, :particular_pyshic_id, :particular_legal_id,
                :official_distribution_id, :denomination, :name, :surname,
                :cuit_or_dni, :phone, :email, :address, :position, :position

  def initialize(params=nil)
  end
end
