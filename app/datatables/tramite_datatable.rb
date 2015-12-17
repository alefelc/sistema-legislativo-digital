class TramiteDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_tramite
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
    records.map do |tra|
      [
        index_tramite(tra),
        tra.type,
        tra.nro_fojas.to_s,
        tra.asunto.to_s,
        get_iniciadores(tra),
        tra.observaciones.to_s,
        to_date_time(tra.updated_at)
      ]
    end
  end

  def get_iniciadores tra
    resp = ""
    iniciadores_organos = tra.organo_de_gobiernos.map{ |x| {type: "OrganoDeGobierno", denominacion: x.denominacion } }
    iniciadores_organos.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_areas = tra.areas.map{ |x| {type: "Area", denominacion: x.denominacion } }
    iniciadores_areas.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_bloques = tra.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }
    iniciadores_bloques.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end  
    iniciadores_comisions = tra.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
    iniciadores_comisions.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_personas = tra.personas.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }
    iniciadores_personas.each do |b|
      resp = resp + b[:type] + ": " + b[:apellido].to_s + ", " + b[:nombre].to_s + ";\n"
    end
    iniciadores_reparticiones = tra.reparticion_oficials.map{ |x| {type: "ReparticionOficial", denominacion: x.denominacion } }
    iniciadores_reparticiones.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_dependencias = tra.dependencia_municipals.map{ |x| {type: "DependenciaMunicipal", denominacion: x.denominacion } }
    iniciadores_dependencias.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end

    resp
  end  

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def tramites
    fetch_records
  end

  def fetch_records
    tramite = Tramite.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]})"
        tramite = tramite.where(query)
      else
        query = ""
        tramite = tramite.where(query)
      end  
    end
    tramite.includes(:bloques).includes(:comisions).includes(:personas)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Tramite.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
