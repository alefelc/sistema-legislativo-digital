class ExpedienteDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_exp
  def_delegator :@view, :to_date
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
    records.map do |exp|
      [
        index_exp(exp),
        exp.tema,
        to_date(exp.anio),
        exp.circuitos.count-1,
        associated_file(exp)
      ]
    end
  end

  def associated_file(exp)
    iniciador= ""
    puts ap exp if exp.circuitos.find_by(nro: 0).nil?
    exp.circuitos.find_by(nro: 0).tramites.each do |tramite|
      iniciadores = tramite.get_iniciadores
      if iniciadores.present?
        iniciadores.each do |i|
          case i[:type]
          when "OrganoDeGobierno"
            iniciador += i[:denominacion].to_s + " / \n"
          when "Area"
            iniciador += i[:denominacion].to_s + " / \n"
          when "Bloque"
            iniciador += i[:denominacion].to_s + " / \n"
          when "Comision"
            iniciador += i[:denominacion].to_s + " / \n"
          when "ReparticionOficial"
            iniciador += i[:denominacion].to_s + " / \n"
          when "MunicipalOffice"
            iniciador += i[:denominacion].to_s + " / \n"
          when "Concejal"
            iniciador += i[:apellido].to_s + ", " + i[:nombre].to_s + " - #{i[:bloque]}" + " / \n"
          else
            iniciador += i[:apellido].to_s + ", " + i[:nombre].to_s + " / \n"
          end
        end
      end
    end
    iniciador =  iniciador.present? ? iniciador.upcase[0..-4] : ''
    "<div style='display: flex'>" +
    if current_user.present?
      "<i class='linktoprint btn btn-danger fa fa-print' data-expediente='#{exp.id}' data-nro='#{exp.nro_exp}' data-iniciador='#{iniciador}' data-asunto='#{exp.tema.try(:upcase)}' data-anio='#{to_date(exp.anio)}' title='Imprimir Carátula'></i>" +
      "<i class='linktoedit btn btn-warning fa fa-pencil-square-o' data-id='#{exp.id}' title='Editar Expediente'></i>"
    else
      ''
    end
  end

  def expedientes
    fetch_records
  end

  def fetch_records
    expedientes = Expediente.page(page).per(per_page).order(id: :desc)
    if params[:sSearch].present?
      query = "(tema ilike '%#{params[:sSearch]}%')"
      unless params[:sSearch].to_i.zero?
        query = "(nro_exp = '#{params[:sSearch]}')"
      end
      expedientes = expedientes.where(query)
    end
    expedientes.includes(:circuitos)
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def get_raw_records
    Expediente.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
