class Comision < ActiveRecord::Base

  #== Associations
	has_and_belongs_to_many :periodos
	has_and_belongs_to_many :personas

  def concejals
    self.personas.where type: "Concejal"
  end

end
