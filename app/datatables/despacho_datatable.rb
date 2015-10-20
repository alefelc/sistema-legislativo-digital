class DespachoDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_desp
  def_delegator :@view, :despacho_expedientes
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
    string = ""
    desp.comisions.each do |c|
      string << c.denominacion.to_s + "; "
    end
    string[0..-3]
  end

  def despacho_concejales desp
    string = ""
    desp.concejals.each do |c|
      string << c.apellido.to_s + ", "+ c.nombre.to_s + "; "
    end
    string[0..-3]
  end

  def associated_file desp
    "<div style='display: flex'>" +
    "<i class='btn btn-xs btn-danger fa fa-times remove-tr' data-remove='#{desp.id}' title='Borrar despacho'></i>" +
    "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' data-id='#{desp.id}' title='Editar despacho'></i>" +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar despacho'></i></div>"
  end

  def despachos
    fetch_records
  end

  def fetch_records
    despacho = Despacho.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]}) OR (expedientes.nro_exp = '#{params[:sSearch]}')"
        despacho = despacho.where(query).joins(:expedientes)
      else
        query = "(CONCAT(personas.apellido, ' ', personas.nombre) ilike '%#{params[:sSearch]}%') OR (comisions.denominacion ilike '%#{params[:sSearch]}%')"
        despacho = despacho.where(query).joins(:concejals).joins(:comisions)
      end  
    end
    despacho.includes(:expedientes).includes(:comisions).includes(:personas)
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

  # ==== Insert 'presenter'-like methods below if necessary
end
