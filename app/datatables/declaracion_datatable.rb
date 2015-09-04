class DeclaracionDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :norma_a_dispositivos
  def_delegator :@view, :dispositivos_a_norma
  def_delegator :@view, :norma_expediente
  def_delegator :@view, :fechas
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
    records.map do |decl|
      [
        decl.nro.to_s + "-" +
        decl.bis.to_s + "/" +
        decl.anio.to_s,
        decl.sumario,
        fechas(decl),
        norma_expediente(decl),
        associated_file(decl)
      ]
    end
  end

  def associated_file decl
    "<i class=\"btn btn-xs fa fa-download\"></i>"
  end

  def declaraciones
    fetch_records
  end

  def fetch_records
    declaracion = Declaracion.page(page).per(per_page)
    if params[:sSearch].present?
      declaracion = declaracion.where("sumario ilike '%#{params[:sSearch]}%'")
    end
    declaracion
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Declaracion.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
