class ProcedureDatatable
  delegate :index_procedure, :person_path, :link_to, :peticion_path,
           :human_attribute_name, :params, :content_tag, :procedure_path,
           :derivated_procedures_path, :check_box_tag, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: procedures.count,
      iTotalDisplayRecords: procedures.count,
      data: data
    }
  end

  private
  def data
    paginated_procedures.map do |proc|
      [
        actions(proc),
        show_id(proc),
        get_iniciadores(proc),
        proc.topic,
        to_date_time(proc.created_at),
        content_tag(:div, proc.sheets, class: 'text-center')
      ]
    end
  end

  def show_id(proc)
    type = if proc.type.present?
      Procedure.human_attribute_name proc.type
    else
      "No asig."
    end
    content_tag :div, class: 'text-center current-url', 'data-url': procedure_path(proc) do
      "#{content_tag :b, proc} #{content_tag :i, type}".html_safe
    end
  end

  def actions(proc)
    return if params[:show_derivations].eql? "false"
    if proc.procedure_derivation.present?
      if proc.procedure_derivation.received_at.present?
        title_attr = "Trámite derivado #{proc.procedure_derivation.derived_at.strftime('%d/%m %H:%M')}\n"
        title_attr += "Trámite recepcionado #{proc.procedure_derivation.received_at.strftime('%d/%m %H:%M')}"
        content_tag :div, "",
          class: 'btn btn-default fa fa-lg fa-envelope-open-o tooltip-text active',
          title: title_attr
      else
        title_attr = "Trámite derivado #{proc.procedure_derivation.derived_at.strftime('%d/%m %H:%M')}"
        content_tag :div, "",
          class: 'btn btn-default fa fa-lg fa-envelope tooltip-text active',
          title: title_attr
      end
    else
      title_attr = "Click para derivar #{proc}"
      link_to derivated_procedures_path(procedure_id: proc.id), method: :post,
        class: 'btn btn-check btn-success tooltip-text', title: title_attr,
        remote: true, data: { confirm: "¿Desea derivar el trámite #{proc}?" } do
          content_tag :i, nil, class: 'fa fa-lg fa-check'
      end
    end
  end

  def procedures
    if params[:search][:value].present?
      persons_join = "INNER JOIN people_procedures ON " +
      "people_procedures.procedure_id = procedures.id INNER JOIN " +
      "people ON people.id = people_procedures.person_id"
      Procedure.order(id: :desc).joins(persons_join).where(filter)
        .includes(:persons).distinct
    else
      Procedure.order(id: :desc).where filter
    end
  end

  def columns
    %w(id type nil topic created_at sheets)
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      #   tramite = Tramite.page(page).per(per_page).order(id: :desc)
      #   if params[:sSearch].present?
      #     query = "(tramites.asunto ilike " +
      #     "'%#{params[:sSearch]}%') OR (tramites.observaciones ilike " +
      #     "'%#{params[:sSearch]}%')"

      #     persons_join = "LEFT JOIN people_tramites ON " +
      #     "people_tramites.tramite_id = tramites.id LEFT JOIN " +
      #     "people ON people.id = people_tramites.person_id"
      #     tramite = tramite.where(query).joins(persons_join)
      #   end
      #   tramite.includes(:bloques)
      #          .includes(:comisions)
      #          .includes(:areas)
      #          .includes(:organo_de_gobiernos)
      #          .includes(:municipal_offices)
      #          .includes(:reparticion_oficials)
      #          .includes(:persons)
      search = "%#{params[:search][:value]}%"
      query += [
        "(procedures.id::text ILIKE ? OR \
        procedures.topic ILIKE ? OR \
        procedures.observations ILIKE ? OR \
        CONCAT(people.name, ' ', people.surname) ILIKE ? OR \
        CONCAT(people.surname, ' ', people.name) ILIKE ?)"
      ]
      binds += [search] * 5
    end

    if params[:date_from].present? && params[:date_to].present?
      query += ["created_at BETWEEN ? AND ?"]
      binds += [params[:date_from]]
      binds += [params[:date_to]]
    end

    if params[:type_filter].present?
      types_filter = []
      params[:type_filter].each { |type| types_filter += ["procedures.type = '#{type}'"] }
      query += [types_filter.join(' OR ')]
    end

    if params[:derivation_filter].present?
      ## Improve CONSTANTS HERE!!!!
      case params[:derivation_filter]
      when 'without_derivation'
        query += ['procedures.procedure_derivation_id IS null']
      when 'all_procedures'
        # DO NOTHING
        # query += ['procedures.procedure_derivation_id IS NOT null']
      when 'without_reception'
        query += ['procedures.procedure_derivation_id IS NOT null']
      when 'with_reception'
        query += ['procedures.procedure_derivation_id IS NOT null']
      end
    end

    [query.join(' AND ')] + binds
  end

  def paginated_procedures
    procedures.page(page).per per_page
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def get_iniciadores(tra)
    result = []
    tra.organo_de_gobiernos.each { |b| result << "#{b.denominacion}" }
    tra.bloques.each { |b| result << "#{b.denominacion}" }
    tra.comisions.each { |b| result << "#{b.denominacion}" }
    tra.persons.each { |b| result << b.full_name }
    tra.reparticion_oficials.each { |b| result << "#{b.denominacion}" }
    tra.municipal_offices.each { |b| result << "#{b.denominacion}" }
    result.join ' - '
  end

  def to_date_time(date)
    date_only = date.strftime("%d/%m/%Y")
    time_only = date.strftime("%R")
    datetime = content_tag :div, date_only, class: 'text-center'
    datetime += content_tag :div, time_only, class: 'text-center'
    datetime
  end
end
