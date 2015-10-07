module DeclaracionsHelper

  def refers_type
    [
      ["Aclara a", "aclarac"],
      ["Ad Referendum a", "adrefe"],
      ["Delega a", "delegado"],
      ["Deroga a", "derog"],
      ["Modifica a", "modif"],
      ["Promulga a", "promul"],
      ["Prorroga Suspencion a", "prorrog"],
      ["Prorroga Vigencia a", "provig"],
      ["Reglamente a", "reglamen"],
      ["Restituye Vigencia a", "restiv"],
      ["Suspende Vigencia a", "suspvig"],
      ["Veta Parcialmente a", "vetop"],
      ["Veta Totalmente a", "vetot"]
    ]
  end

  def refers_by_type(norma_rel)
    case norma_rel.tipo_relacion
      when "aclarac"
        return "Aclara a"
      when "adrefe"
        return "Ad Referendum"
      when "delegado"
        return "Delega a"
      when "derog"
        return "Deroga a"
      when "modif"
        return "Modifica a"
      when "promul"
        return "Promulga a"
      when "prorrog"
        return "Prorroga Suspención a"
      when "provig"
        return "Prorroga Vigencia a"
      when "reglamen"
        return "Reglamenta a"
      when "restiv"
        return "Restitutye Vigencia a"
      when "suspvig"
        return "Suspende Vigencia a"
      when "vetop"
        return "Veta Parcialmente a"
      when "vetot"
        return "Veta Totalmente a"
    end
  end

  def show_dates(norma_rel)
    output = ""
    output += "Desde #{norma_rel.desde}\n" if norma_rel.desde.present?
    output += "Hasta #{norma_rel.hasta}\n" if norma_rel.hasta.present?
    output
  end

  def search_value_classify(id_clasif, id_norm)
    Declaracion.find(id_norm).clasificacions.where(nombre: id_clasif).present? unless id_norm.nil?
  end

  def select_destiny
    [
      ["Comunicación", "0"],
      ["Notificación", "1"],
      ["Publicación", "2"]
    ]
  end
end
