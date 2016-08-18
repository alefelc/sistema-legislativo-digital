class TramiteDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_tramite
  def_delegator :@view, :person_path
  def_delegator :@view, :link_to

  def as_json(options = {})
    {
      draw: params[:draw].to_i,
      recordsTotal: get_raw_records.count(:all),
      recordsFiltered: filter_records(get_raw_records).count(:all),
      data: data
    }
  end

  def sortable_columns
    @sortable_columns ||= []
  end

  def searchable_columns
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |tra|
      [
        index_tramite(tra),
        tra.type,
        tra.nro_fojas.to_s,
        tra.asunto.to_s,
        get_iniciadores(tra),
        tra.observaciones.to_s,
        to_date_time(tra.updated_at)
      ]
    end
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

  def to_date(date)
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time(date)
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def tramites
    fetch_records
  end

  def fetch_records
    tramite = Tramite.page(page).per(per_page).order(id: :desc)
    if params[:filtering].present?
      filters = JSON.parse(params[:filtering])
      if filters['created_at'].present?
        dates = filters['created_at']
        from = Date.parse(dates['from']) - 1.day
        to = Date.parse(dates['to']) + 1.day
        tramite = tramite.where(created_at: from..to)
      end
      if filters['types'].present?
        tramite = tramite.where(type: filters['types'].split(','))
      end
    end
    if params[:sSearch].present?
      query = "(tramites.id::text ilike '%#{params[:sSearch]}%') OR " +
      "(CONCAT(people.apellido, ' ', people.nombre) ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.asunto ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.observaciones ilike " +
      "'%#{params[:sSearch]}%')"

      persons_join = "LEFT JOIN people_tramites ON " +
      "people_tramites.tramite_id = tramites.id LEFT JOIN " +
      "people ON people.id = people_tramites.person_id"
      tramite = tramite.where(query).joins(persons_join)
    end
    tramite.includes(:bloques)
           .includes(:comisions)
           .includes(:areas)
           .includes(:organo_de_gobiernos)
           .includes(:municipal_offices)
           .includes(:reparticion_oficials)
           .includes(:persons)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Tramite.all
  end
end
