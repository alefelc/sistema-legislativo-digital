class Prawn::Procedures
  include Prawn::View

  def initialize(params=nil)
    @procedures = Procedure.last(10)
    text "Reporte de trámites"
  end
end

