class PendienteDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :index_tra
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
        index_tra(tra),
        tra.type,
        tra.asunto,
        associated_file(tra)
      ]
    end
  end

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def to_date_for_input date
    date.strftime("%Y-%m-%d") unless date.nil?
  end

  def to_date_time date
    date.strftime("%d/%m/%Y - %R") unless date.nil?
  end  

  def associated_file tra
    "<div style='display: flex'>" +
    "<i class='linktocreate btn btn-xs btn-success fa fa-check-square-o u' data-id='#{tra.id}' data-type='#{tra.type}' data-nro_fojas='#{tra.nro_fojas}' data-asunto='#{tra.asunto}' data-fecha='#{to_date_for_input(tra.created_at)}' title='Crear Expediente'></i>"+ "</div>"
  end

  def pendientes
    fetch_records
  end

  def fetch_records
    ## buscar los que esten derivados a legislacion y no finalizados
    tramite = Tramite.page(page).per(per_page).where(pendiente: true).order(updated_at: :desc)
    if params[:sSearch].present?
      unless params[:sSearch].to_i.zero?
        query = "(tramites.id = #{params[:sSearch]})"
        tramite = tramite.where(query)
      else
        query = ""
        tramite = tramite.where(query)
      end  
    end
    tramite
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
