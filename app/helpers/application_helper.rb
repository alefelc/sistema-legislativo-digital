module ApplicationHelper

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

  def index_com(com)
    link_to com.id.to_s, comunicacion_oficial_path(com)
  end

  def norma_expediente(norma)
    resp = ""
    norma.circuitos.each do |c|
      if (c.nro == 0)
        resp = resp + "Expediente: " + link_to(c.expediente.nro_exp, "expedientes/#{c.expediente.id}") + "\n"
      else
        resp= resp + "Circuito nro: #{c.nro}--> Expediente: " + link_to(c.expediente.nro_exp, "expediente/#{c.expediente.id}") + "\n"
      end
    end
    resp
  end

  def resolve_path_name
    return "Declaraciones" if current_page?(controller: :declaracions, action: :index)
    return "Declaración #{params[:id]}" if current_page?(controller: :declaracions, action: :show, id: params[:id].to_i)
    return "Ordenanzas" if current_page?(controller: :ordenanzas, action: :index)
    return "Ordenanza #{params[:id]}" if current_page?(controller: :ordenanzas, action: :show, id: params[:id].to_i)
    return "Decretos" if current_page?(controller: :decretos, action: :index)
    return "Decreto #{params[:id]}" if current_page?(controller: :decretos, action: :show, id: params[:id].to_i)
    return "Resoluciones" if current_page?(controller: :resolucions, action: :index)
    return "Resolución #{params[:id]}" if current_page?(controller: :resolucions, action: :show, id: params[:id].to_i)
    return "Especiales" if current_page?(controller: :especials, action: :index)
    return "Especial #{params[:id]}" if current_page?(controller: :especials, action: :show, id: params[:id].to_i)
    return "Otras Normas" if current_page?(controller: :otra_normas, action: :index)
    return "Otra Norma #{params[:id]}" if current_page?(controller: :otra_normas, action: :show, id: params[:id].to_i)
    return "Despachos" if current_page?(controller: :despachos, action: :index)
    return "Despacho #{params[:id]}" if current_page?(controller: :despachos, action: :show, id: params[:id].to_i)
    return "Condonaciones" if current_page?(controller: :condonacions, action: :index)
    return "Condonacion #{params[:id]}" if current_page?(controller: :condonacions, action: :show, id: params[:id].to_i)
    return "Peticiones Particulares" if current_page?(controller: :particulars, action: :index)
    return "Petición Particular #{params[:id]}" if current_page?(controller: :particulars, action: :show, id: params[:id].to_i)
    return "Proyectos" if current_page?(controller: :proyectos, action: :index)
    return "Proyecto #{params[:id]}" if current_page?(controller: :proyectos, action: :show, id: params[:id].to_i)
    return "Comunicaciones Oficiales" if current_page?(controller: :comunicacion_oficials, action: :index)
    return "Comunicación Oficial #{params[:id]}" if current_page?(controller: :comunicacion_oficials, action: :show, id: params[:id].to_i)
    return "Inicio" if current_page?(controller: :dashboard, action: :index)
  end

  def prepopulate_exps(norma)
    norma.expedientes.present? ? build_json_exp(norma.expedientes) : []
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

  def prepopulate_iniciadores(tramite)
    iniciadores = []
    case tramite.type
    when "Despacho"
    when "Condonacion"
      reparticiones = tramite.reparticion_oficials.present? ? build_json_reparticiones_select2(tramite.reparticion_oficials) : []
      personas = tramite.personas.present? ? build_json_iniciadores(tramite.personas) : []
      iniciadores = reparticiones + personas
    when "Peticion"
      personas = tramite.personas.present? ? build_json_iniciadores(tramite.personas) : []
      iniciadores = personas
    when "Proyecto"
    when "ComunicacionOficial"
    else
    end  
    iniciadores
  end  

  def build_json_iniciadores(pers)
    json_array = []
    pers.each { |x| json_array << { id: x.id, nombre: x.nombre , apellido: x.apellido, nro_doc: x.nro_doc, telefono: x.telefono, email: x.email, domicilio: x.domicilio, cuit: x.cuit, type: x.type} }
    json_array.as_json
  end

  def build_json_exp(exps)
    json_array = []
    exps.each do |x|
      json_array << {
        id: x.id,
        indice: "#{x.nro_exp}/#{x.bis}/#{x.anio.try(:year)}"
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
    norma.sumario.present? ? norma.sumario : " No tiene sumario"
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

end
