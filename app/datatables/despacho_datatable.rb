class DespachoDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_desp
  def_delegator :@view, :despacho_expedientes
  def_delegator :@view, :current_user

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
    records.map do |desp|
      [
        index_desp(desp),
        desp.nro_fojas.to_s,
        despacho_expedientes(desp),
        fix_date(desp),
        despacho_comisiones(desp),
        despacho_concejales(desp),
        desp.observaciones.to_s,
        associated_file(desp)
      ]
    end
  end

  def to_date(date)
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def despacho_comisiones(desp)
    string = ''
    desp.comisions.each do |c|
      string << "#{c.denominacion}; "
    end
    string[0..-3]
  end

  def despacho_concejales(desp)
    string = ''
    desp.concejals.each do |c|
      string << "#{c.apellido}, #{c.nombre}; "
    end
    string[0..-3]
  end

  def associated_file(desp)
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{desp.id}' title='Editar despacho'></i>"
    else
      ''
    end
  end

  def despachos
    fetch_records
  end

  def fetch_records
    despacho = Despacho.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(tramites.id::text ilike '%#{params[:sSearch]}%') OR " +
      #{}"(expedientes.nro_exp::text ilike '#{params[:sSearch]}') OR " +
      "(CONCAT(people.apellido, ' ', people.nombre) ilike " +
      "'%#{params[:sSearch]}%') OR (comisions.denominacion ilike " +
      "'%#{params[:sSearch]}%') OR (tramites.observaciones ilike " +
      "'%#{params[:sSearch]}%')"

      concejals_comisions_join = 'LEFT JOIN despachos_concejals ON ' +
      'despachos_concejals.despacho_id = tramites.id LEFT JOIN people ON ' +
      'people.id = despachos_concejals.concejal_id ' +
      'LEFT JOIN comisions_despachos ON ' +
      'comisions_despachos.despacho_id = tramites.id LEFT JOIN comisions ON ' +
      'comisions.id = comisions_despachos.comision_id'

      despacho = despacho.where(query).joins(concejals_comisions_join).uniq
    end
    despacho.includes(:circuitos).includes(:comisions).includes(:persons).includes(circuitos: [:expediente])
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Despacho.all
  end

  def fix_date(desp)
    if desp.fecha.present?
      to_date(desp.fecha)
    elsif desp.day.present? && desp.month.present? && desp.year.present?
      to_date(Date.parse("#{desp.day}/#{desp.month}/#{desp.year}"))
    elsif desp.month.present? && desp.year.present?
      "#{desp.month} - #{desp.year}"
    elsif desp.year.present?
      "Año: #{desp.year}"
    else
      ''
    end
  end
end
