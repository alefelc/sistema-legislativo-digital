module ApplicationHelper

  def norma_a_dispositivos norma
    resp = "dsa"
    norma.modificadas.each do |n|
      resp
    end
    resp
  end

  def dispositivos_a_norma norma
    "dispositivos a norma"
  end

  def fechas norma
    resp = ""
    resp = resp + "Sanción: #{norma.sancion}\n"
    norma.destinos.each do |d|
      case d.tipo
      when 0
        resp = resp + "Comunicación: #{d.fecha}\n"
      when 1
        resp = resp + "Notificación: #{d.fecha}\n"
      end
    end
    resp
  end

  def index_norma norma
    link_to(norma.nro.to_s + "-" + norma.bis.to_s + "/" + norma.anio.to_s, edit_declaracion_path(norma), {remote: true, class: "linktoedit"})
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
    if current_page?(:declaracions)
      "Declaraciones"
    else
      "Normas"
    end
  end

end
