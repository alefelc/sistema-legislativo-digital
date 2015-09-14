module DeclaracionsHelper

  def refers_type
    [
      ["modifica", 1],
      ["deroga", 2]
    ]
  end

  def search_value_classify(id_clasif, id_norm)
    Declaracion.find(id_norm).clasificacions.where(nombre: id_clasif).present? unless id_norm.nil?
  end  
end
