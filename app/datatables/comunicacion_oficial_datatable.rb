class ComunicacionOficialDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_com
  def_delegator :@view, :current_user
  def_delegator :@view, :person_path
  def_delegator :@view, :link_to

  def as_json(options = {})
    {
      draw: params[:draw].to_i,
      recordsTotal:  get_raw_records.count(:all),
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
    records.map do |com|
      [
        index_com(com),
        com.nro_fojas.to_s,
        get_iniciadores(com),
        com.asunto.to_s,
        com.observaciones.to_s,
        to_date_time(com.updated_at),
        associated_file(com)
      ]
    end
  end

  def get_iniciadores(com)
    result = []
    com.organo_de_gobiernos.each { |b| result << "#{b.denominacion}" }
    com.areas.each { |b| result << "#{b.denominacion}" }
    com.bloques.each { |b| result << "#{b.denominacion}" }
    com.comisions.each { |b| result << "#{b.denominacion}" }
    com.persons.each { |b| result << b.full_name }
    com.reparticion_oficials.each { |b| result << "#{b.denominacion}" }
    com.dependencia_municipals.each { |b| result << "#{b.denominacion}" }
    result.join(' - ')
  end

  def to_date(date)
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time(date)
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def associated_file(com)
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{com.id}' title='Editar comunicación oficial'></i>"
    else
      ''
    end
  end

  def comunicacion_oficials
    fetch_records
  end

  def fetch_records
    comunicacion_oficial = ComunicacionOficial.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(tramites.id::text ilike '%#{params[:sSearch]}%') OR " +
      "(CONCAT(people.apellido, ' ', people.nombre) ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.asunto ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.observaciones ilike " +
      "'%#{params[:sSearch]}%')"

      persons_join = "LEFT JOIN people_tramites ON " +
      "people_tramites.tramite_id = tramites.id LEFT JOIN " +
      "people ON people.id = people_tramites.person_id"

      comunicacion_oficial = comunicacion_oficial.where(query).joins persons_join
    end
    comunicacion_oficial.includes(:bloques).includes(:comisions).includes(:persons)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    ComunicacionOficial.all
  end
end
