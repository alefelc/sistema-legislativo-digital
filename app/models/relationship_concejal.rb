class RelationshipConcejal < ActiveRecord::Base
	belongs_to :suplente
	belongs_to :titular
end
