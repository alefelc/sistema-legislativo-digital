module LegislativeFilesHelper
  def file_states(default=nil)
    options = [
      ['A comision', 'in_comision'],
      ['Orden del dia', 'day_plan'],
      ['Sancionado', 'sanctioned'],
      ['Retirado', 'retired']
    ]
    return options_for_select options, default if default.present?
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
      text = if state.comisions.length <= 1
        "Derivado el día #{date_at} a la comision de:"
      else
        "Derivado el día #{date_at} a las comisiones de:"
      end
      li_content = []
      state.comisions.each { |c| li_content << content_tag(:li, c.denominacion)  }

      [text, content_tag(:ul, li_content.join.html_safe)].join.html_safe
    when "dispatched"
      "Despacho ingresado el día #{date_at} con el trámite #{link_to state.procedure, state.procedure}"
    when "day_plan"
      "Ingresa en la orden del día nro ... el día #{date_at}"
    when "sanctioned"
      "Sancionado en la sesión nro #{link_to "##{state.session.id}", state.session} el dia #{date_at}"
    when "retired"
      "Retirado ...."
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

  def build_specification(state)
    results = []
    procedure = state.legislative_file.origin_procedure
    case state.name
    when 'initialized'
      procedure.organo_de_gobiernos.each { |b| results << "#{content_tag :strong, b.denominacion} #{content_tag :small, "(#{b.codigo})"}" }
      procedure.bloques.each { |b| results << "#{content_tag :strong, b.denominacion} #{content_tag :small, '(Bloque partidario)'}" }
      procedure.comisions.each { |b| results << "#{content_tag :strong, b.denominacion} #{content_tag :small, '(Comisión)'}" }
      procedure.persons.each { |b| results << "#{content_tag :strong, b.full_name} #{content_tag :small, "(#{I18n.t("persons.types.#{b.type}")})"}" }
      procedure.reparticion_oficials.each { |b| results << "#{content_tag :strong, b.denominacion} #{content_tag :small, '(Repartición oficial)'}" }
      procedure.municipal_offices.each { |b| results << "#{content_tag :strong, b.denominacion} #{content_tag :small, '(Dependencia municipal)'}" }
    when 'dispatched'
      procedure.comisions.each { |b| results << "#{content_tag :strong, b.denominacion} #{content_tag :small, '(Comisión)'}" }
    end
    results
  end

  def build_signators(state)
    procedure = state.legislative_file.origin_procedure
    procedure.procedure_signatories.join(' - ')
  end

  def build_small_state_procedure(state)
    if state.initialized? || state.dispatched?
      content_tag :small do
        link_to "Trámite #{state.procedure}", state.procedure
      end
    elsif state.session.present?
      content_tag :small do
        link_to state.session, state.session
      end
    end
  end

  def build_small_state_type(state)
    content_tag :small do
      I18n.t("legislative_file_states.types.#{state.state_type}")
    end
  end

  def calculate_sheets(loop)
    if loop.origin_procedure.present?
      loop.sheets.to_i + loop.origin_procedure.administrative_files.sum(:sheets) +
      loop.legislative_file_states.dispatched.collect(&:procedure).inject(0){ |sum,x| sum + x.sheets }
    else
      loop.sheets.to_i +
      loop.legislative_file_states.dispatched.collect(&:procedure).inject(0){ |sum,x| sum + x.sheets }
    end
  end

  def state_date(state)
    state.dispatched? ? state.procedure.full_date : state.date_at
  end

  def build_initiators(file)
    file.first_loop.origin_procedure.try(:get_iniciadores)
  end
end
