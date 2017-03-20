class InitiatorForm
  include ActiveModel::Model

  attr_accessor :type, :councilor_id, :partisan_block_id, :commission_id,
  							:municipal_office_id, :particular_pyshic_id, :particular_legal_id,
  							:official_distribution_id, :denomination

  def initialize(params=nil)
  end
end
