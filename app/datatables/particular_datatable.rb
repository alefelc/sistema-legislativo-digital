class ParticularDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_part
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
    records.map do |part|
      [
        index_part(part),
        part.nro_fojas.to_s,
        get_iniciadores(part),
        part.asunto.to_s,
        part.observaciones.to_s,
        to_date_time(part.updated_at),
        associated_file(part)
      ]
    end
  end

  def get_iniciadores part
    resp = ''
    iniciadores_personas = part.personas.map do |x|
      { type: x.type, apellido: x.apellido, nombre: x.nombre }
    end
    iniciadores_personas.each do |b|
      resp = resp + b[:type] + ": " + b[:apellido].to_s + ", " + b[:nombre].to_s + ";\n"
    end

    resp
  end

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def associated_file part
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{part.id}' title='Editar petición particular'></i>"
    else
      ''
    end +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar petición particular'></i></div>"
  end

  def particulars
    fetch_records
  end

  def fetch_records
    particular = Peticion.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]})"
        particular = particular.where(query)
      else
        query = ""
        particular = particular.where(query)
      end
    end
    particular.includes(:bloques).includes(:comisions).includes(:personas)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Peticion.all
  end
end
