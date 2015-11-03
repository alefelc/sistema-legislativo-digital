class ComunicacionOficialDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_com
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
    records.map do |com|
      [
        index_com(com),
        com.nro_fojas.to_s,
        get_iniciadores(com),
        com.asunto.to_s,
        com.observaciones.to_s,
        "Estado actual",
        to_date_time(com.updated_at),
        associated_file(com)
      ]
    end
  end

  def get_iniciadores com
    resp = ""
    iniciadores_bloques = com.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }
    iniciadores_bloques.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion] + ";\n"
    end  
    iniciadores_comisions = com.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
    iniciadores_comisions.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion] + ";\n"
    end
    iniciadores_personas = com.personas.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }
    iniciadores_personas.each do |b|
      resp = resp + b[:type] + ": " + b[:apellido] + ", " + b[:nombre] + ";\n"
    end

    resp
  end  

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end  

  def associated_file com
    "<div style='display: flex'>" +
    "<i class='btn btn-xs btn-danger fa fa-times remove-tr' data-remove='#{com.id}' title='Borrar comunicación oficial'></i>" +
    "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' data-id='#{com.id}' title='Editar comunicación oficial'></i>" +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar comunicación oficial'></i></div>"
  end

  def comunicacion_oficials
    fetch_records
  end

  def fetch_records
    comunicacion_oficial = ComunicacionOficial.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]})"
        comunicacion_oficial = comunicacion_oficial.where(query)
      else
        query = ""
        comunicacion_oficial = comunicacion_oficial.where(query)
      end  
    end
    comunicacion_oficial.includes(:bloques).includes(:comisions).includes(:personas)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    ComunicacionOficial.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end