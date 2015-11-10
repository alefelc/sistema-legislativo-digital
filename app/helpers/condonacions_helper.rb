module CondonacionsHelper
  def tipo_iniciador_condonacion
    [
      ["Física", "Fisica"],
      ["Jurídica", "Juridica"],
      ["Reparticion Oficial", "ReparticionOficial"]
    ]
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def get_iniciadores_bloques cond
    cond.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }  
  end

  def get_iniciadores_comisions cond
    cond.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
  end

  def get_iniciadores_reparticiones cond
    cond.reparticion_oficials.map{ |x| {type: "ReparticionOficial", denominacion: x.denominacion } }
  end

  def get_iniciadores_personas cond
    cond.personas.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }  
  end

end