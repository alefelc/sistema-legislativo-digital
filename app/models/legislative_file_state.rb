class LegislativeFilesState < ActiveRecord::Base

	belongs_to :circuito
  belongs_to :ref, polymorphic: true

end
