module ApplicationHelper

  def norma_a_dispositivos norma
    resp = "dsa"
    norma.aclaradas.each do |n|
      resp
    end
    norma.delegadas.each do |n|
      resp
    end
    norma.derogadas.each do |n|
      resp
    end
    norma.modificadas.each do |n|
      resp
    end
    norma.reglamentadas.each do |n|
      resp
    end
    norma.prorroga_vigencia.each do |n|
      resp
    end
    norma.prorroga_suspension.each do |n|
      resp
    end
    norma.restituye_vigencia.each do |n|
      resp
    end
    norma.suspende_vigencia.each do |n|
      resp
    end
    norma.promulgacion.each do |n|
      resp
    end
    norma.ad_referendum.each do |n|
      resp
    end
    norma.veta_parcialmente.each do |n|
      resp
    end
    norma.veta_totalmente.each do |n|
      resp
    end
    resp  
  end

  def dispositivos_a_norma norma
    "dispositivos a norma"
  end
end
