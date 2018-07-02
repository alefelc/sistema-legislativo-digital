require 'prawn/icon'
require 'barby'
require 'barby/outputter/prawn_outputter'

class Prawn::LoanCoupon < Prawn::Document
  # include Prawn::View
  Prawn::Font::AFM.hide_m17n_warning = true

  def initialize(loan, view_context)
    @view = view_context
    @loan = loan
    super()
    scissors_line
    user_sheet
    borrowed_sheet
  end

  private
  def scissors_line
    bounding_box([-10, 400], width: 600, height: 100) do
      icon "<icon size='12' color='AAAAAA'>fa-scissors</icon>  " + "_ " * 52, inline_format: true
    end
  end

  def user_sheet
    bounding_box([-30, 710], width: 600, height: 800) do
      transparent(0.3) do
        image "app/assets/images/concejo_logo_only.jpeg", position: :center, width: 300
      end
    end
    bounding_box([-30, 675], width: 600, height: 800) do
      text "CONCEJO DELIBERANTE CIUDAD RIO CUARTO", size: 20, align: :center
      move_down 20
      text "Préstamo de expediente legislativo número #{@loan.legislative_file.number}",
            size: 20, align: :center, style: :italic
      move_down 20
      text "Se hace entrega del expediente a #{@loan.person.full_name}", align: :center
      move_down 20
      text "con un plazo máximo de devolución de 72hs.", align: :center
      move_down 20
      text "Firma:" , align: :center
      move_down 20
      text ". "*20, align: :center
    end
    bounding_box([-30, 455], width: 600, height: 100) do
      text 'Comprobante para el usuario que entrega el expediente.',
            size: 10, align: :center, style: :italic
    end
  end

  def borrowed_sheet
    bounding_box([-30, 310], width: 600, height: 800) do
      transparent(0.3) do
        image "app/assets/images/concejo_logo_only.jpeg", position: :center, width: 300
      end
    end
    bounding_box([-30, 275], width: 600, height: 800) do
      text "CONCEJO DELIBERANTE CIUDAD RIO CUARTO", size: 20, align: :center
      move_down 20
      text "Préstamo de expediente legislativo número #{@loan.legislative_file.number}",
            size: 20, align: :center, style: :italic
      move_down 20
      text "Usted #{@loan.person.full_name} retiró dicho expediente el día #{@loan.borrowed_at}", align: :center
      move_down 20
      text "con un plazo máximo de devolución de 72hs.", align: :center
    end
    bounding_box([-30, 50], width: 600, height: 100) do
      text 'Comprobante para aquella persona que retiró el expediente.',
            size: 10, align: :center, style: :italic
    end
  end
end
