class CondonacionDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_cond
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
        index_cond(cond),
        cond.nro_fojas.to_s,
        get_iniciadores(cond),
        cond.asunto.to_s,
        cond.observaciones.to_s,
        to_date_time(cond.updated_at),
        associated_file(cond)
      ]
    end
  end

  def get_iniciadores cond
    resp = ""
    ##iniciadores_bloques = cond.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }
    ##iniciadores_bloques.each do |b|
    ##  resp = resp + b[:type] + ": " + b[:denominacion] + ";\n"
    ##end  
    ##iniciadores_comisions = cond.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
    ##iniciadores_comisions.each do |b|
    ##  resp = resp + b[:type] + ": " + b[:denominacion] + ";\n"
    ##end
    iniciadores_reparticions = cond.reparticion_oficials.map{ |x| {type: "ReparticionOficial", denominacion: x.denominacion } }
    iniciadores_reparticions.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_personas = cond.personas.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }
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

  def associated_file cond
    "<div style='display: flex'>" +
    "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' data-id='#{cond.id}' title='Editar condonación'></i>" +
    "<i class='btn btn-xs btn-success fa fa-download' title='Descargar condonación'></i></div>"
  end

  def condonacions
    fetch_records
  end

  def fetch_records
    condonacion = Condonacion.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]})"
        condonacion = condonacion.where(query)
      else
        query = ""
        condonacion = condonacion.where(query)
      end  
    end
    condonacion.includes(:bloques).includes(:comisions).includes(:personas)
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
