class ProyectoDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_pro
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
    records.map do |pro|
      [
        index_pro(pro),
        pro.nro_fojas.to_s,
        get_iniciadores(pro),
        pro.asunto.to_s,
        pro.observaciones.to_s,
        to_date_time(pro.updated_at),
        associated_file(pro)
      ]
    end
  end

  def get_iniciadores(pro)
    resp = ""
    iniciadores_organos = pro.organo_de_gobiernos.map{ |x| {type: "OrganoDeGobierno", denominacion: x.denominacion } }
    iniciadores_organos.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_areas = pro.areas.map{ |x| {type: "Area", denominacion: x.denominacion } }
    iniciadores_areas.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_bloques = pro.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }
    iniciadores_bloques.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_comisions = pro.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }
    iniciadores_comisions.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_persons = pro.persons.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre } }
    iniciadores_persons.each do |b|
      resp = resp + b[:type] + ": " + b[:apellido].to_s + ", " + b[:nombre].to_s + ";\n"
    end
    iniciadores_reparticiones = pro.reparticion_oficials.map{ |x| {type: "ReparticionOficial", denominacion: x.denominacion } }
    iniciadores_reparticiones.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end
    iniciadores_dependencias = pro.dependencia_municipals.map{ |x| {type: "DependenciaMunicipal", denominacion: x.denominacion } }
    iniciadores_dependencias.each do |b|
      resp = resp + b[:type] + ": " + b[:denominacion].to_s + ";\n"
    end

    resp
  end

  def to_date(date)
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_time(date)
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end

  def associated_file pro
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoedit btn btn-xs btn-warning fa fa-pencil-square-o u' " +
      "data-id='#{pro.id}' title='Editar proyecto'></i>"
    else
      ''
    end +
    "<i class='btn btn-xs btn-success fa fa-download' " +
    "title='Descargar proyecto'></i></div>"
  end

  def proyectos
    fetch_records
  end

  def fetch_records
    proyecto = Proyecto.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]})"
        proyecto = proyecto.where(query)
      else
        query = ""
        proyecto = proyecto.where(query)
      end
    end
    proyecto.includes(:bloques).includes(:comisions).includes(:persons)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Proyecto.all
  end
end
