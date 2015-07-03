class Comision < ActiveRecord::Base

  #== Associations
	has_and_belongs_to_many :periodos
	has_and_belongs_to_many :concejals
	has_and_belongs_to_many :tramites

end
