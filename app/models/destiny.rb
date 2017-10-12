class Destiny < ActiveRecord::Base
  # == Associations
	belongs_to :law

  # == Enums
  enum type_of_destiny: [:comunication, :notification, :publish]
end
