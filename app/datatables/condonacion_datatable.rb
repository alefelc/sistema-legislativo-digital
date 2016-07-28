class CondonacionDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_cond
  def_delegator :@view, :current_user
  def_delegator :@view, :person_path
  def_delegator :@view, :link_to

  def as_json(options = {})
    {
      :draw => params[:draw].to_i,
      :recordsTotal =>  get_raw_records.count(:all),
      :recordsFiltered => filter_records(get_raw_records).count(:all),
      :data => data
    }
  end

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= []
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |cond|
      [
        index_cond(cond),
        cond.nro_fojas.to_s,
        get_iniciadores(cond),
        cond.asunto.to_s,
        cond.observaciones.to_s,
        to_date_time(cond.updated_at),
        associated_file(cond)
      ]
    end
  end

  def get_iniciadores cond
    result = []
    cond.reparticion_oficials.each { |b| result << "#{b.denominacion}" }
    cond.persons.each do |b|
      result << link_to(b.full_name, person_path(b))
    end
    result.join(' - ')
  end

  def to_date date
    date.strftime('%d/%m/%Y') unless date.nil?
  end

  def to_date_time date
    date.strftime('%d/%m/%Y - %R') unless date.nil?
  end

  def associated_file cond
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{cond.id}' title='Editar condonación'></i>"
    else
      ''
    end
  end

  def condonacions
    fetch_records
  end

  def fetch_records
    condonacion = Condonacion.page(page).per(per_page).order id: :desc
    if params[:sSearch].present?
      query = "(tramites.id::text ilike '%#{params[:sSearch]}%') OR " +
      "(CONCAT(people.apellido, ' ', people.nombre) ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.asunto ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.observaciones ilike " +
      "'%#{params[:sSearch]}%')"

      persons_join = "LEFT JOIN people_tramites ON " +
      "people_tramites.tramite_id = tramites.id LEFT JOIN " +
      "people ON people.id = people_tramites.person_id"
      condonacion = condonacion.where(query).joins(persons_join)
    end
    condonacion.includes(:bloques).includes(:comisions).includes(:persons)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Condonacion.all
  end
end
