require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/prawn_outputter'

class Prawn::LegislativeFile < Prawn::Document
  def initialize(file, view_context)
    @view = view_context
    @file = file
    super({ page_size: 'LEGAL', font_size: 40, text: 30 })
    stroke_bounds
    header
    content
  end

  private

  def header
    move_down 20
    image "app/assets/images/dem_logo.jpg", position: :center, width: 125
    move_down 20
    text "CONCEJO DELIBERANTE", align: :center, size: 30, style: :bold
    text "RIO CUARTO", align: :center, size: 30, style: :bold
    move_down 50
    transparent(0.3) do
      image "app/assets/images/concejo_logo_only.jpeg", position: :center, width: 525
    end
  end

  def legislative_file_number_text
    font("app/pdfs/prawn/fonts/book_antiqua_bold.ttf") do
      return text "EXPEDIENTE LEGISLATIVO Nº:", size: 14, position: :center
    end
  end

  def formatted_file_number
    font("app/pdfs/prawn/fonts/book_antiqua_bold.ttf") do
      return text @file.number, size: 72
    end
  end

  def file_number
    bounding_box([0, 550], width: 200, height: 150) do
      # legislative_file_number_text
      text "EXP LEGISLATIVO Nº:", size: 14, style: :bold
    end
    bounding_box([160, 580], width: 250, height: 150) do
      formatted_file_number
    end
  end

  def content
    initiators = @file.initiators
    bounding_box([20, 600], width: 500, height: 580) do
      # stroke_bounds #DEBUG ONLY
      file_number

      bounding_box([0, 450], width: 500, height: 150) do
        # stroke_bounds #DEBUG ONLY
        text "INICIADOR/ES:", style: :bold, size: 14
        pad(20) { text "#{initiators}", size: 12, indent_paragraphs: 30 }
      end

      bounding_box([0, 250], width: 500, height: 250) do
        # stroke_bounds #DEBUG ONLY
        text "ASUNTO:", :style => :bold, size: 14
        pad(20) { text "#{@file.topic}", size: 12, indent_paragraphs: 30 }
      end

      bounding_box([0, 50], width: 500, height: 50) do
        # stroke_bounds #DEBUG ONLY
        footer
      end
    end
  end

  def footer
    text "INGRESO:  #{@file.date.to_date}", valign: :bottom, style: :bold
    barcode(410, 0)
  end

  def barcode(x, y)
    _barcode = Barby::Code39.new(@file.id.to_s)
    _barcode.annotate_pdf(self, x: x, y: y)

    outputter = Barby::PrawnOutputter.new(_barcode)
    outputter.to_pdf
  end
end
