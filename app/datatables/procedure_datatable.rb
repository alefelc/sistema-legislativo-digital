class ProcedureDatatable
  delegate :index_procedure, :person_path, :link_to, :peticion_path,
           :human_attribute_name, :params, :content_tag, :procedure_path,
           to: :@view

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
        show_id(proc.id, Procedure.human_attribute_name(proc.type)),
        get_iniciadores(proc),
        proc.topic,
        to_date_time(proc.created_at),
        proc.sheets,
        actions(proc)
      ]
    end
  end

  def show_id(id, type)
    "#{content_tag :b, id} #{content_tag :i, type}"
  end

  def actions(proc)
    link_to '', procedure_path(proc), class: 'btn btn-info fa fa-eye'
  end

  def procedures
    Procedure.order(id: :asc).where(filter)
  end

  def columns
    %w(id type nil topic created_at sheets)
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["courses.name ILIKE ? OR courses.code ILIKE ?
                  OR courses.type_course ILIKE ? OR courses.division ILIKE ?
                  OR courses.subdivision ILIKE ?" ]
      binds += [search] * 5
    end

    [query.join(' AND ')] + binds
  end

  def paginated_procedures
    procedures.page(page).per(per_page)
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
    tra.areas.each { |b| result << "#{b.denominacion}" }
    tra.bloques.each { |b| result << "#{b.denominacion}" }
    tra.comisions.each { |b| result << "#{b.denominacion}" }
    tra.persons.each { |b| result << link_to(b.full_name, person_path(b)) }
    tra.reparticion_oficials.each { |b| result << "#{b.denominacion}" }
    tra.municipal_offices.each { |b| result << "#{b.denominacion}" }
    result.join ' - '
  end

  # def to_date(date)
  #   date.strftime("%d/%m/%Y") unless date.nil?
  # end

  def to_date_time(date)
    date_only = date.strftime("%d/%m/%Y")
    time_only = date.strftime("%R")
    datetime = content_tag :div, date_only, class: 'text-center'
    datetime += content_tag :div, time_only, class: 'text-center'
    datetime
  end

  # def tramites
  #   fetch_records
  # end

  # def fetch_records
  #   tramite = Tramite.page(page).per(per_page).order(id: :desc)
  #   if params[:filtering].present?
  #     filters = JSON.parse(params[:filtering])
  #     if filters['created_at'].present?
  #       dates = filters['created_at']
  #       from = Date.parse(dates['from']) - 1.day
  #       to = Date.parse(dates['to']) + 1.day
  #       tramite = tramite.where(created_at: from..to)
  #     end
  #     if filters['types'].present?
  #       tramite = tramite.where(type: filters['types'].split(','))
  #     end
  #   end
  #   if params[:sSearch].present?
  #     query = "(tramites.id::text ilike '%#{params[:sSearch]}%') OR " +
  #     "(CONCAT(people.apellido, ' ', people.nombre) ilike " +
  #     "'%#{params[:sSearch]}%') OR (tramites.asunto ilike " +
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
  # end

  # def per_page
  #   params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  # end

  # def page
  #   params[:iDisplayStart].to_i/per_page + 1
  # end

  # def get_raw_records
  #   Tramite.all
  # end
end
