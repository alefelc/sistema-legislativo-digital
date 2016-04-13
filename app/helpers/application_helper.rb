module ApplicationHelper
  def get_estados
    [
      ["Seleccione Estado", 0],
      ["A Comisión", 3],
      ["Orden del Día", 2],
      ["Sancionado", 5],
      ["Retirado", 7]
    ]
  end

  def sancion_options1
    [
      ["Aprob. Art. 151 R.I.","Aprob. Art. 151 R.I."],
      ["Aprob. S/T c/desp.","Aprob. S/T c/desp."],
      ["Aprob. S/T s/desp.","Aprob. S/T s/desp."],
      ["Aprobado","Aprobado"],
      ["Arch. S/T c/desp.","Arch. S/T c/desp."],
      ["Arch. S/T s/desp.","Arch. S/T s/desp."],
      ["Archivado","Archivado"],
      ["Decision Acuerdo","Decision Acuerdo"],
      ["Decisión Art. 71","Decisión Art. 71"],
      ["Rech. S/T c/desp.","Rech. S/T c/desp."],
      ["Rech. S/T s/desp.","Rech. S/T s/desp."],
      ["Rechazado","Rechazado"],
      ["Retirado","Retirado"]
    ]
  end

  def sancion_options2
    [
      ["Aprob. Simple","Aprob. Simple"],
      ["1° Lectura","1° Lectura"],
      ["2° Lectura","2° Lectura"]
    ]
  end

  def dictamina_options1
    Periodo.last.comisions.map{ |x| [x.denominacion, x.denominacion] }
  end

  def dictamina_options2
    [
      ["No Especificado","NoEspecificado"],
      ["Mayoría","Mayoría"],
      ["Minoría","Minoría"],
      ["Unánime","Unánime"]
    ]
  end

  def fechas(norma)
    resp = ""
    if norma.sancion.present?
      resp = resp + "Sanción: #{norma.sancion}\n"
    end
    norma.destinos.each do |d|
      case d.tipo
      when 0
        return resp + "Comunic: #{d.fecha}\n"
      when 1
        return resp + "Notific: #{d.fecha}\n"
      when 2
        return resp + "Public: #{d.fecha}\n"
      end
    end
  end

  def index_exp(exp)
    link_to exp.nro_exp, exp
  end

  def index_norma(norma)
    link_to "#{norma.nro}-#{norma.bis}/#{norma.sancion.try(:year)}", norma
  end

  def index_desp(desp)
    link_to desp.id.to_s, despacho_path(desp)
  end

  def index_part(part)
    link_to part.id.to_s, particular_path(part)
  end

  def index_cond(cond)
    link_to cond.id.to_s, condonacion_path(cond)
  end

  def index_pro(pro)
    link_to pro.id.to_s, proyecto_path(pro)
  end

  def index_tramite(tramite)
    link_to tramite.id.to_s, tramite
  end

  def index_tramites(tramites)
    resp = ""
    tramites.each do |t|
      resp += t.type.to_s + ": " + link_to(t.id.to_s, t) + " \n"
    end
    resp
  end

  def index_com(com)
    link_to com.id.to_s, comunicacion_oficial_path(com)
  end

  def index_tra(tra)
    case tra.type
    when "Proyecto"
      link_to tra.id.to_s, proyecto_path(tra)
    when "Peticion"
      link_to tra.id.to_s, particular_path(tra)
    when "Despacho"
      link_to tra.id.to_s, despacho_path(tra)
    when "Condonacion"
      link_to tra.id.to_s, condonacion_path(tra)
    when "ComunicacionOficial"
      link_to tra.id.to_s, comunicacion_oficial_path(tra)
    else
    end
  end


  def norma_expediente(norma)
    resp = ""
    norma.circuitos.each do |c|
      if (c.nro == 0)
        resp = resp + "Expediente: " + link_to(c.expediente.nro_exp, "/expedientes/#{c.expediente.id}") + "\n"
      else
        resp= resp + "Circuito nro: #{c.nro}--> Expediente: " + link_to(c.expediente.nro_exp, "/expedientes/#{c.expediente.id}") + "\n"
      end
    end
    resp
  end

  def resolve_path_name
    return "Declaraciones" if current_page? controller: :declaracions, action: :index
    return "Ordenanzas" if current_page? controller: :ordenanzas, action: :index
    return "Decretos" if current_page? controller: :decretos, action: :index
    return "Resoluciones" if current_page? controller: :resolucions, action: :index
    return "Especiales" if current_page? controller: :especials, action: :index
    return "Otras Normas" if current_page? controller: :otra_normas, action: :index
    return "Despachos" if current_page? controller: :despachos, action: :index
    return "Despacho de Comisión" if current_page? controller: :despachos, action: :show, :id => params[:id].to_s
    return "Condonaciones" if current_page? controller: :condonacions, action: :index
    return "Condonación" if current_page? controller: :condonacions, action: :show, :id => params[:id].to_s
    return "Peticiones Particulares" if current_page? controller: :particulars, action: :index
    return "Petición Particular" if current_page? controller: :particulars, action: :show, :id => params[:id].to_s
    return "Proyectos" if current_page? controller: :proyectos, action: :index
    return "Proyecto" if current_page? controller: :proyectos, action: :show, :id => params[:id].to_s
    return "Comunicaciones Oficiales" if current_page? controller: :comunicacion_oficials, action: :index
    return "Comunicación Oficial" if current_page? controller: :comunicacion_oficials, action: :show, :id => params[:id].to_s
    return "Expedientes" if current_page? controller: :expedientes, action: :index
    return "Trámites Pendientes" if current_page? controller: :pendientes, action: :index
    return "Reportes de Trámites" if current_page? controller: :reports, action: :mesa_de_entradas
    return "Reportes de Expedientes" if current_page? controller: :reports, action: :expedientes
    return "Reportes de Normas" if current_page? controller: :reports, action: :normas
    return "Inicio" if current_page? controller: :dashboard, action: :index
    return ""
  end

  def prepopulate_exps(norma)
    norma.expedientes.present? ? build_json_exp(norma.expedientes, norma) : []
  end

  def prepopulate_exps_despacho(despacho)
    despacho.expedientes.present? ? build_json_exp_despacho(despacho.expedientes, despacho) : []
  end

  def prepopulate_tags(norma)
    norma.tags.present? ? build_json_tags(norma.tags) : []
  end

  def prepopulate_comisions(desp)
    desp.comisions.present? ? build_json_comisions(desp.comisions) : []
  end

  def prepopulate_concejals(desp)
    desp.concejals.present? ? build_json_concejals(desp.concejals) : []
  end

  def prepopulate_tramites(exp)
    exp.circuitos.present? ? exp.circuitos.find_by(nro: 0).get_tramites : ""
  end

  def prepopulate_adjunta_exp(exp)
    exp.present? ? exp.adjunta : ""
  end

  def prepopulate_acumula_exp(exp)
    exp.present? ? exp.acumula : ""
  end

  def prepopulate_iniciadores(tramite)
    iniciadores = []
    case tramite.type
    when "Condonacion"
      reparticiones = tramite.reparticion_oficials.present? ? build_json_reparticiones_select2(tramite.reparticion_oficials) : []
      personas = tramite.personas.present? ? build_json_iniciadores(tramite.personas) : []
      iniciadores = reparticiones + personas
    when "Peticion"
      personas = tramite.personas.present? ? build_json_iniciadores(tramite.personas) : []
      iniciadores = personas
    when "Proyecto"
      bloques = tramite.bloques.present? ? build_json_bloques_select2(tramite.bloques) : []
      comisiones = tramite.comisions.present? ? build_json_comisions_select2(tramite.comisions) : []
      areas = tramite.areas.present? ? build_json_areas_select2(tramite.areas) : []
      org_gobiernos = tramite.organo_de_gobiernos.present? ? build_json_organo_de_gobiernos_select2(tramite.organo_de_gobiernos) : []
      reparticiones = tramite.reparticion_oficials.present? ? build_json_reparticiones_select2(tramite.reparticion_oficials) : []
      dependencias = tramite.dependencia_municipals.present? ? build_json_dependencias_select2(tramite.dependencia_municipals) : []
      personas = tramite.personas.present? ? build_json_iniciadores(tramite.personas) : []
      iniciadores = bloques + comisiones + areas + org_gobiernos + reparticiones + dependencias + personas
    when "ComunicacionOficial"
      bloques = tramite.bloques.present? ? build_json_bloques_select2(tramite.bloques) : []
      comisiones = tramite.comisions.present? ? build_json_comisions_select2(tramite.comisions) : []
      areas = tramite.areas.present? ? build_json_areas_select2(tramite.areas) : []
      org_gobiernos = tramite.organo_de_gobiernos.present? ? build_json_organo_de_gobiernos_select2(tramite.organo_de_gobiernos) : []
      reparticiones = tramite.reparticion_oficials.present? ? build_json_reparticiones_select2(tramite.reparticion_oficials) : []
      dependencias = tramite.dependencia_municipals.present? ? build_json_dependencias_select2(tramite.dependencia_municipals) : []
      personas = tramite.personas.present? ? build_json_iniciadores(tramite.personas) : []
      iniciadores = bloques + comisiones + areas + org_gobiernos + reparticiones + dependencias + personas
    else
    end
    iniciadores
  end

  def build_json_iniciadores(pers)
    json_array = []
    pers.each { |x| json_array << { id: x.id, nombre: x.nombre , apellido: x.apellido, nro_doc: x.nro_doc, telefono: x.telefono, email: x.email, domicilio: x.domicilio, cuit: x.cuit, type: x.type} }
    json_array.as_json
  end

  def build_json_exp(exps , norma)
    json_array = []
    exps.each do |x|
      nro_c = x.circuitos.count - 1
      array_c = norma.circuitos.map { |x| x.nro }
      json_array << {
        id: x.id,
        indice: "#{x.nro_exp}/#{x.bis}/#{x.anio.try(:year)}",
        nro_c: nro_c,
        array_c: array_c
      }
    end
    json_array
  end

  def build_json_exp_despacho(exps, despacho)
    json_array = []
    exps.each do |x|
      nro_c = x.circuitos.count - 1
      array_c = despacho.circuitos.map { |x| x.nro }
      json_array << {
        id: x.id,
        indice: "#{x.nro_exp}/#{x.bis}/#{x.anio.try(:year)}",
        nro_c: nro_c,
        array_c: array_c
      }
    end
    json_array
  end

  def build_json_tags(tags)
    json_array = []
    tags.each { |x| json_array << { id: x.id, nombre: x.nombre } }
    json_array.to_json
  end

  def build_json_comisions(comisions)
    json_array = []
    comisions.each { |x| json_array << [ id: x.id, denominacion: x.denominacion , type: "Comision" ] }
    json_array.as_json
  end

  def build_json_comisions_select2(comisions)
    json_array = []
    comisions.each { |x| json_array << { id: x.id, denominacion: x.denominacion , type: "Comision" } }
    json_array.as_json
  end

  def build_json_reparticiones_select2(reparticiones)
    json_array = []
    reparticiones.each { |x| json_array << { id: x.id, denominacion: x.denominacion, type: "ReparticionOficial" } }
    json_array.as_json
  end

  def build_json_dependencias_select2(dependencias)
    json_array = []
    dependencias.each { |x| json_array << { id: x.id, denominacion: x.denominacion, type: "DependenciaMunicipal" } }
    json_array.as_json
  end

  def build_json_areas_select2(areas)
    json_array = []
    areas.each { |x| json_array << { id: x.id, denominacion: x.denominacion, codigo: x.codigo , type: "Area" } }
    json_array.as_json
  end

  def build_json_organo_de_gobiernos_select2(organos)
    json_array = []
    organos.each { |x| json_array << { id: x.id, denominacion: x.denominacion, codigo: x.codigo, type: "OrganoDeGobierno" } }
    json_array.as_json
  end

  def build_json_bloques_select2(bloques)
    json_array = []
    bloques.each { |x| json_array << { id: x.id, denominacion: x.denominacion, type: "Bloque" } }
    json_array.as_json
  end

  def build_json_concejals(concejals)
    json_array = []
    concejals.each { |x| json_array << [ id: x.id, nombre: x.apellido + ", " + x.nombre ] }
    json_array.to_json
  end

  def indice(norma)
    x = norma.modifica
    "#{x.type}: #{x.nro}/#{x.bis}/#{x.sancion.try(:year)}"
  end

  def to_date(date)
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def get_digesto_actual
    ## por ahora lo dejo con el last para obtener el ultimo osea el actual. Hay que agregarle el campo año al digesto
    Digesto.last
  end

  def tipo_destinos(tipo)
    case tipo
    when 0
      "Comunicación"
    when 1
      "Notificación"
    when 2
      "Publicación"
    end
  end

  def get_sumario(norma)
    norma.sumario.present? ? norma.sumario : ' No tiene sumario'
  end

  def get_plazo_vigencia(norma)
    "#{norma.plazo_anio.to_i} años, " +
    "#{norma.plazo_mes.to_i} meses y " +
    "#{norma.plazo_dia.to_i} dias "
  end

  def get_nro(norma)
    norma.nro.present? ?  norma.nro.to_s : " Numero no asignado"
  end

  def get_anio_sancion(norma)
    norma.sancion.present? ? " Año #{norma.sancion.year}" : " - Año no asignado"
  end

  def get_sancion(norma)
    norma.sancion.present? ? " Sancionada el #{to_date(norma.sancion)}" : " Sancion no cargada"
  end

  def get_sancion_estado(exp, estado_exp)
    exp.circuitos.find_by(nro: 0).normas.where(sancion:estado_exp.fecha)
  end

  def tramites_type
    [
      ["Despachos"],
      ["Condonaciones"],
      ["Peticiones Particulares"],
      ["Proyectos"],
      ["Comunicaciones Oficiales"]
    ]
  end

  def to_date_time(date)
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end
end
