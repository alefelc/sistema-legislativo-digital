class DeclaracionDatatable < AjaxDatatablesRails::Base

  def as_json(options = {})
    {
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
    declaraciones.map do |declaracion|
      [
        declaracion.letra,
        declaracion.nro,
        declaracion.bis,
      ]
    end
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

  def get_raw_declaracions
    Declaracion.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
