module ComunicacionOficialsHelper
  def tipo_iniciador
    [
      ["Física", "Fisica"],
      ["Jurídica", "Juridica"]
    ]
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def get_iniciadores_bloques com
    com.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }  
  end

  def get_iniciadores_comisions com
    com.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
  end

  def get_iniciadores_personas com
    com.personas.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }  
  end

end