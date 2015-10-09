module ApplicationHelper

  def dispositivos_a_norma norma
    "dispositivos a norma"
  end

  def fechas norma
    resp = ""
    if norma.sancion.present?
      resp = resp + "Sanción: #{norma.sancion}\n"
    end
    norma.destinos.each do |d|
      case d.tipo
      when 0
        resp = resp + "Comunic: #{d.fecha}\n"
      when 1
        resp = resp + "Notific: #{d.fecha}\n"
      when 2
        resp = resp + "Public: #{d.fecha}\n"
      end
    end
    resp
  end

  def index_decl norma
    link_to norma.nro.to_s + "-" + norma.bis.to_s + "/" + norma.sancion.try(:year).to_s, declaracion_path(norma)
  end

  def index_ord norma
    link_to norma.nro.to_s + "-" + norma.bis.to_s + "/" + norma.sancion.try(:year).to_s, ordenanza_path(norma)
  end

  def index_dec norma
    link_to norma.nro.to_s + "-" + norma.bis.to_s + "/" + norma.sancion.try(:year).to_s, decreto_path(norma)
  end

  def norma_expediente norma
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
    return "Inicio" if current_page?(controller: :dashboard, action: :index)
  end

  def prepopulate_exps norma
    norma.expedientes.present? ? build_json_exp(norma.expedientes) : []
  end

  def prepopulate_tags norma
    norma.tags.present? ? build_json_tags(norma.tags) : []
  end

  def build_json_exp exps
    json_array = []
    exps.each do |x|
      year = x.anio.present? ? x.anio.year.to_s : ""
      json_array << {
        id: x.id,
        indice: x.nro_exp + "/" + x.bis.to_s + "/" + year
      }
    end
    json_array
  end

  def build_json_tags tags
    json_array = []
    tags.each { |x| json_array << { id: x.id, nombre: x.nombre } }
    json_array.to_json
  end

  def indice norma
    x = norma.modifica
    year = x.sancion.present? ? x.sancion.year.to_s : ""
    "#{x.type}: #{x.nro}/#{x.bis}/#{year}"
  end

  def to_date date
    date.strftime("%d/%m/%Y")
  end

  def get_digesto_actual
    ## por ahora lo dejo con el last para obtener el ultimo osea el actual. Hay que agregarle el campo año al digesto
    Digesto.last
  end

  def tipo_destinos tipo
    case tipo
    when 0
      "Comunicación"
    when 1
      "Notificación"
    when 2
      "Publicación"
    end
  end
end
