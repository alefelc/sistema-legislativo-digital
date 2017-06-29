module LegislativeFilesHelper
  def file_states(default=nil)
    options = [
      ['Iniciado', 'Iniciado'],
      ['A comision', 'A comision'],
      ['Orden del dia', 'Orden del dia'],
      ['Sancionado', 'Sancionado'],
      ['Retirado', 'Retirado']
    ]
    return options_for_select options, options[default] if default.present?
    options_for_select options
  end

  def humanize_states(state)
    date_at = state.date_at.to_s
    text = case state.name
    when "initialized"
      if state.loop.nil? || state.loop.number.zero?
        "Expediente iniciado el día #{date_at} " \
        "#{state.procedure.present? ? "por el trámite #{link_to state.procedure, state.procedure}" : ''}"
      else
        "Circuito nro #{state.loop.number} iniciado el día #{date_at} " \
        "#{state.procedure.present? ? "por el trámite #{link_to state.procedure, state.procedure}" : ''}"
      end
    when "in_comision"
      # if have only one comision
      "Derivado el día #{date_at} a la comision de "
      # else
      "Derivado el día #{date_at} a las comisiones de "
      # end
    when "dispatched"
      "Despachado el día #{date_at} con el trámite "
    when "day_plan"
      "Ingresa en la orden del día nro ... el día #{date_at}"
    when "sanctioned"
      ""
    when "retired"
      ""
    end.html_safe
  end

  def new_procedure(loop)
    return [] if loop.origin_procedure.blank?
    options_for_select [[loop.origin_procedure, loop.origin_procedure.id]], [loop.origin_procedure]
  end

  def origin_procedure(loop)
    if loop.origin_procedure.present?
      link_to loop.origin_procedure, loop.origin_procedure
    else
      'No se encontró trámite asociado'
    end
  end
end
