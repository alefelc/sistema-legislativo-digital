class ExpedienteAdministrativo < ActiveRecord::Base
  #== Associations
	belongs_to :expediente
  belongs_to :procedure

  #== Validations
  validates :nro_exp, presence: true

  def get_anio_expediente_adm
    if self.anio.present?
      " Año " + self.anio.year.to_s + " - "
    else
      " - Año no asignado"
    end
  end
end
