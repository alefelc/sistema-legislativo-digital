module ProyectosHelper
  def tipo_iniciador
    [
      ["Física", "Fisica"],
      ["Jurídica", "Juridica"]
    ]
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def get_iniciadores_bloques pro
    pro.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }  
  end

  def get_iniciadores_comisions pro
    pro.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
  end

  def get_iniciadores_personas pro
    pro.personas.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }  
  end

end