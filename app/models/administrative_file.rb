class AdministrativeFile < ActiveRecord::Base
  #== Associations
	belongs_to :legislative_file
  belongs_to :procedure

  #== Validations
  # validates :nro_exp, presence: true

  def get_anio_expediente_adm
    if self.anio.present?
      " Año " + self.anio.year.to_s + " - "
    else
      " - Año no asignado"
    end
  end

  def to_s
    output = ''
    output += "Nro #{number} " if number.present?
    output += "Letra #{letter} " if letter.present?
    output += "Año #{year} " if year.present?
    output += "(Fojas #{sheets}) " if sheets.present?
  end
end
