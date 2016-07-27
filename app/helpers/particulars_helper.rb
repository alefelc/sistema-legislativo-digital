module ParticularsHelper
  def tipo_iniciador_particular
    [
      ["Física", "Fisica"],
      ["Jurídica", "Juridica"]
    ]
  end

  def to_date_time(date)
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def get_iniciadores_bloques(part)
    part.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }  
  end

  def get_iniciadores_comisions(part)
    part.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
  end
end
