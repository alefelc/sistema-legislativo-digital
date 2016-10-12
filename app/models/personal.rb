class Personal < ActiveRecord::Base
  ##associations
  has_one :user
  has_many :estado_procedures, as: :ref

  def type
    "Personal"
  end
end
