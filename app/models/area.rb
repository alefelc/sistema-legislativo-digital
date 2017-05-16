class Area < ActiveRecord::Base
  has_many :users
  has_many :procedure_derivation
end
