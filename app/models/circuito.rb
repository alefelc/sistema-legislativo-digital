class Circuito < ActiveRecord::Base

  # == Associations
	belongs_to :expediente
	has_many :estado_expedientes
	has_many :tramites

	#== polymorfic association
  has_many :estado_tramites, as: :ref

  #== asociacion con orden del dia
	has_many :circuito_ordens
	has_many :orden_del_dias, :through => :circuito_ordens

  has_and_belongs_to_many :normas

  def type
    "Circuito"
  end

  def estados
    tr_html = ""
    estados = self.estado_expedientes.order(id: :asc)
    estados.each do |e|
      tr_html += "<tr class='states-tr' data-id='#{e.id}'" +
                  " data-fecha='#{e.fecha}' data-estado='#{e.tipo}' data-esp1='#{e.especificacion1}'" +
                  " data-esp2='#{e.especificacion2}'> " +
                  "<td> #{e.nombre.to_s} </td> " +
                  "<td> #{e.especificacion1} -->  #{e.especificacion2} </td>" +
                  "<td> #{e.fecha} </td>" +
                  "<td> </td> </tr>"
    end
    tr_html  
  end  

  def get_tramites
    self.tramites.as_json(methods: 'type')
  end  

end
