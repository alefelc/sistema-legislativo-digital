module ProyectosHelper
  def tipo_iniciador_proyecto
    [
      ["Física", "Fisica"],
      ["Jurídica", "Juridica"],
      ["Reparticion Oficial", "ReparticionOficial"],
      ["Dependencia Municipal", "Dependencia Municipal"]
    ]
  end

  def get_iniciadores_bloques(pro)
    pro.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }
  end

  def get_iniciadores_comisions(pro)
    pro.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
  end

  def get_iniciadores_dependencias(pro)
    pro.municipal_offices.map{ |x| {type: "Dependencia Municipal", denominacion: x.denominacion } }
  end

  def get_iniciadores_organos(pro)
    pro.organo_de_gobiernos.map{ |x| {type: "OrganoDeGobierno", denominacion: x.denominacion, codigo: x.codigo } }
  end

  def get_iniciadores_areas(pro)
    pro.areas.map{ |x| {type: "Area", denominacion: x.denominacion, codigo: x.codigo } }
  end
end
