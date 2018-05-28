require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/prawn_outputter'

class Prawn::Procedures < Prawn::Document
  # include Prawn::View
  Prawn::Font::AFM.hide_m17n_warning = true

  def initialize(params={}, view_context)
    @view = view_context
    if params[:procedure].present?
      @procedure = params[:procedure]
      super({ page_size: [200, 300] })
      order_number
      scissors_line
      barcode(30, 130)
      barcode(30, 30)
    else
      @procedures = Procedure.last(10)
      render_table(params)
    end
  end

  private
  def scissors_line
    bounding_box([-25, 110], width: 600, height: 100) do
      icon "<icon size='12' color='AAAAAA'>fa-scissors</icon>  " + "_ " * 52, inline_format: true
    end
  end

  def render_table(params=nil)
    header
    content(params)
    footer
  end

  def order_number
    text "Trámite nro #{@procedure.id}", size: 10, :align => :center
  end

  def barcode(x, y)
    _barcode = Barby::Code39.new(@procedure.id.to_s)
    _barcode.annotate_pdf(self, x: x, y: y)

    outputter = Barby::PrawnOutputter.new(_barcode)
    outputter.to_pdf
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

