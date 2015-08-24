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
end
