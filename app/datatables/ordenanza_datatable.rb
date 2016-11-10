class OrdenanzaDatatable
  def_delegator :@view, :norma_expediente
  def_delegator :@view, :fechas
  def_delegator :@view, :index_norma
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
    @sortable_columns ||= []
  end

  def searchable_columns
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |ord|
      [
        index_norma(ord),
        ord.sumario,
        fechas(ord),
        norma_expediente(ord),
        associated_file(ord)
      ]
    end
  end

  def associated_file ord
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{ord.id}' title='Editar norma'></i>"
    else
      ''
    end +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar norma'></i></div>"
  end

  def ordenanzas
    fetch_records
  end

  def fetch_records
    ordenanza = Ordenanza.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(sumario ilike '%#{params[:sSearch]}%')"
      unless params[:sSearch].to_i.zero?
        query = "(CONCAT(nro, bis, EXTRACT(year from sancion)) ilike '%#{params[:sSearch].to_i}%')"
      end
      ordenanza = ordenanza.where(query)
    end
    ordenanza.includes(:circuitos).includes(:destinos).includes(circuitos: [:expediente])
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Ordenanza.all
  end
end
