module LegislativeFileStatesHelper
  def states_types
    options_for_select [
      %w(Parlamentario parliamentary),
      %w(Administrativo administrative),
      %w(Comisión comision)
    ]
  end
end
