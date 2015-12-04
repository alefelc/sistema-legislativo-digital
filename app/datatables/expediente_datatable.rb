class ExpedienteDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_exp
  def_delegator :@view, :to_date

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
    records.map do |exp|
      [
        index_exp(exp),
        exp.tema,
        to_date(exp.anio),
        exp.circuitos.count-1,
        associated_file(exp)
      ]
    end
  end

  def associated_file(exp)
    "<div style='display: flex'>" +
    "<i class='btn btn-xs btn-danger fa fa-print' data-expediente='#{exp.id}' title='Imprimir Carátula'></i>" +
    "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o' data-id='#{exp.id}' title='Editar Expediente'></i>" +
    "<i class='linktocircuit btn btn-xs btn-info fa fa-copyright' data-id='#{exp.id}' title='Editar Circuitos'></i>" +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar Expediente'></i></div>"
  end

  def expedientes
    fetch_records
  end

  def fetch_records
    expedientes = Expediente.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(tema ilike '%#{params[:sSearch]}%')"
      unless params[:sSearch].to_i.zero?
        query = "(nro_exp = '#{params[:sSearch]}')"
      end
      expedientes = expedientes.where(query)
    end
    expedientes.includes(:circuitos)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Expediente.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
