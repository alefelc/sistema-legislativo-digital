class DecretoDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :dispositivos_a_norma
  def_delegator :@view, :norma_expediente
  def_delegator :@view, :fechas
  def_delegator :@view, :index_dec
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
    records.map do |dec|
      [
        index_dec(dec),
        dec.sumario,
        fechas(dec),
        norma_expediente(dec),
        associated_file(dec)
      ]
    end
  end

  def associated_file dec
    "<div style='display: flex'>" +
    "<i class='btn btn-xs btn-danger fa fa-times remove-tr' data-remove='#{dec.id}' title='Borrar norma'></i>" +
    "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' data-id='#{dec.id}' title='Editar norma'></i>" +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar norma'></i></div>"
  end

  def decretos
    fetch_records
  end

  def fetch_records
    decreto = Decreto.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(sumario ilike '%#{params[:sSearch]}%')"
      unless params[:sSearch].to_i.zero?
        query = "(CONCAT(nro, bis, EXTRACT(year from sancion)) ilike '%#{params[:sSearch].to_i}%')"
      end
      decreto = decreto.where(query)
    end
    decreto.includes(:circuitos).includes(:destinos).includes(circuitos: [:expediente])
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Decreto.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end