class EstadoProcedure < ActiveRecord::Base

  #== Associations
  belongs_to :procedure

  belongs_to :ref, polymorphic: true

  before_create :set_pendient_to_procedure

  def set_pendient_to_procedure
    if (self.tipo == "2" && self.ref_type == "Area")
      derivado = self.ref
      if (derivado.codigo == "LEG")
        self.procedure.update pendiente: true
      end
    else
      if (self.tipo == "3" || self.tipo == "4")
        self.procedure.update pendiente: false
      end
    end
  end

end
