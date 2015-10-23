class CondonacionDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :condonacione_path

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
        link_to(cond.id, condonacione_path(cond)),
        cond.nro_fojas.to_s,
        cond.personas.first.try(:nombre),
        cond.asunto,
        cond.observaciones,
        to_date(cond.updated_at),
        associated_file(cond)
      ]
    end
  end

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def associated_file cond
    "<div style='display: flex'>" +
    "<i class='btn btn-xs btn-danger fa fa-times remove-tr' data-remove='#{cond.id}' title='Borrar condonacion'></i>" +
    "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' data-id='#{cond.id}' title='Editar condonacion'></i>" +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar condonacion'></i></div>"
  end

  def fetch_records
    condonacion = Condonacion.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]}) OR (expedientes.nro_exp = '#{params[:sSearch]}')"
        condonacion = condonacion.where(query).joins(:expedientes)
      else
        query = "(CONCAT(personas.apellido, ' ', personas.nombre) ilike '%#{params[:sSearch]}%') OR (comisions.denominacion ilike '%#{params[:sSearch]}%')"
        condonacion = condonacion.where(query).joins(:concejals).joins(:comisions)
      end
    end
    condonacion.includes(:personas)
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

  # ==== Insert 'presenter'-like methods below if necessary
end
