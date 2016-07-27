class EstadoTramite < ActiveRecord::Base

  #== Associations
  belongs_to :tramite

  belongs_to :ref, polymorphic: true

  before_create :set_pendient_to_tramite

  def set_pendient_to_tramite
    if (self.tipo == "2" && self.ref_type == "Area")
      derivado = self.ref
      if (derivado.codigo == "LEG")
        self.tramite.update pendiente: true
      end
    else
      if (self.tipo == "3" || self.tipo == "4")
        self.tramite.update pendiente: false
      end
    end
  end

end
