class Prawn::Procedures
  include Prawn::View
  Prawn::Font::AFM.hide_m17n_warning = true

  def initialize(params=nil)
    @procedures = Procedure.last(10)
    render(params)
  end

  private
  def render(params=nil)
    header
    content(params)
    footer
  end

  def header
    text "Reporte de trámites"
  end

  def content(params=nil)
    th = ["ID", "Tipo", "Sumario", "Iniciador/es", "Fojas"]
    rows = [th]
    params = Procedure.last(10)
    params.each do |p|
      rows << [p.id, p.type, p.topic, p.initiators, p.sheets]
    end
    t = table(rows)
  end

  def footer

  end
end

