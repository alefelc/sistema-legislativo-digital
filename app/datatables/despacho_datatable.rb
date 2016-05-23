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
        to_date(desp.fecha),
        despacho_comisiones(desp),
        despacho_concejales(desp),
        desp.observaciones.to_s,
        associated_file(desp)
      ]
    end
  end

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def despacho_comisiones desp
    string = ''
    desp.comisions.each do |c|
      string << "#{c.denominacion}; "
    end
    string[0..-3]
  end

  def despacho_concejales desp
    string = ''
    desp.concejals.each do |c|
      string << "#{c.apellido}, #{c.nombre}; "
    end
    string[0..-3]
  end

  def associated_file desp
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{desp.id}' title='Editar despacho'></i>"
    else
      ''
    end +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar despacho'></i></div>"
  end

  def despachos
    fetch_records
  end

  def fetch_records
    despacho = Despacho.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]}) OR " +
        "(expedientes.nro_exp = '#{params[:sSearch]}')"
        despacho = despacho.where query
      else
        query = "(CONCAT(persons.apellido, ' ', persons.nombre) ilike " +
        "'%#{params[:sSearch]}%') OR (comisions.denominacion ilike " +
        "'%#{params[:sSearch]}%')"
        despacho = despacho.where(query).joins(:concejals).joins :comisions
      end
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
end
