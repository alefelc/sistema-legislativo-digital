class DeclaracionDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :norma_a_dispositivos
  def_delegator :@view, :dispositivos_a_norma
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
        decl.letra.to_s + " " +
        decl.nro.to_s + " " +
        decl.bis.to_s + " / " +
        decl.anio.to_s,
        decl.sancion,
        decl.descripcion,
        norma_a_dispositivos(decl),
        dispositivos_a_norma(decl),
        "Expedientes",
        associated_file(decl)
      ]
    end
  end 
 
  def associated_file decl
    # link_to nil, "#", class: "btn btn-xs btn-default"
    "file"
  end

  def declaraciones
    fetch_records
  end

  def fetch_records
    Declaracion.page(page).per(per_page)
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
