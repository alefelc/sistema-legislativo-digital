class Periodo < ActiveRecord::Base
	has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
end
