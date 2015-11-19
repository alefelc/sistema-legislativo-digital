class ExpedienteAdministrativo < ActiveRecord::Base

	belongs_to :expediente

  def get_anio_expediente_adm
    if self.anio.present?
      " Año " + self.anio.year.to_s + " - "
    else
      " - Año no asignado"
    end
  end

end
