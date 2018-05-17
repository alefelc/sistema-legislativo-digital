class Prawn::People < Prawn::Document
  def initialize(view_context)
    @view = view_context
    super(page_size: "A4", page_layout: :landscape)
    header
    stroke do
      move_down 11
      horizontal_rule
    end
    content
  end

  private

  def header
    text "REPORTE PERSONAS 2018", align: :center
  end

  def content
    people = Person.where('created_at > ?', Date.today.beginning_of_year).order(id: :desc)
    th = ["Ingresado", "Nombre", "Apellido", "Dirección", "Teléfono", "Trámites"]
    rows = [th]
    people.each do |p|
      rows << [p.created_at.strftime('%d-%m'), p.name, p.surname, p.address, p.phone, p.procedure_ids.join(',')]
    end
    t = table(rows)
  end
end
