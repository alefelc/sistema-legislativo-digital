class Loop < ActiveRecord::Base
  # == Associations
  belongs_to :legislative_file
  has_many :legislative_file_states
  accepts_nested_attributes_for :legislative_file_states, :reject_if => :all_blank, :allow_destroy => true
  has_many :procedures
  has_and_belongs_to_many :despachos, join_table: 'loops_despachos'

  #== Polymorfic association
  has_many :estado_procedures, as: :ref

  #== Asociacion con orden del dia
  has_many :loop_ordens
  has_many :orden_del_dias, :through => :loop_ordens

  has_and_belongs_to_many :normas

  before_create :set_loop_number

  def type
    "Loop"
  end

  def estados
    tr_html = ""
    estados = self.estado_legislative_files.order(id: :asc)
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

  def get_procedures
    self.procedures.as_json(methods: 'type')
  end

  private

  def set_loop_number
    if self.nro.nil?
      if legislative_file.present?
        self.nro = legislative_file.last_loop.nro + 1
      else
        self.nro = nil
      end
    end
  end
end
