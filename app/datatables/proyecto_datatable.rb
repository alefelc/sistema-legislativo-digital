class ProyectoDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_pro
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
    records.map do |pro|
      [
        index_pro(pro),
        pro.nro_fojas.to_s,
        get_iniciadores(pro),
        pro.asunto.to_s,
        pro.observaciones.to_s,
        to_date_time(pro.updated_at),
        associated_file(pro)
      ]
    end
  end

  def get_iniciadores(pro)
    result = []
    pro.organo_de_gobiernos.each { |b| result << "#{b.denominacion}" }
    pro.areas.each { |b| result << "#{b.denominacion}" }
    pro.bloques.each { |b| result << "#{b.denominacion}" }
    pro.comisions.each { |b| result << "#{b.denominacion}" }
    pro.persons.each { |b| result << link_to(b.full_name, person_path(b)) }
    pro.reparticion_oficials.each { |b| result << "#{b.denominacion}" }
    pro.dependencia_municipals.each { |b| result << "#{b.denominacion}" }
    result.join(' - ')
  end

  def to_date(date)
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time(date)
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def associated_file(pro)
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{pro.id}' title='Editar proyecto'></i>"
    else
      ''
    end
  end

  def proyectos
    fetch_records
  end

  def fetch_records
    proyecto = Proyecto.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(tramites.id::text ilike '%#{params[:sSearch]}%') OR " +
      "(CONCAT(people.apellido, ' ', people.nombre) ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.asunto ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.observaciones ilike " +
      "'%#{params[:sSearch]}%')"
      persons_join = "LEFT JOIN people_tramites ON " +
      "people_tramites.tramite_id = tramites.id LEFT JOIN " +
      "people ON people.id = people_tramites.person_id"
      proyecto = proyecto.where(query).joins(persons_join)
    end
    proyecto.includes(:bloques).includes(:comisions).includes(:persons)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Proyecto.all
  end
end
