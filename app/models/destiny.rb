class Destiny < ActiveRecord::Base
  # == Associations
	belongs_to :law

  # == Enums
  enum law_type: [:comunication, :notification, :publish]
end
