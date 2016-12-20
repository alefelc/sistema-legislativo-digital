class ProcedureDatatable
  delegate :index_procedure, :person_path, :link_to, :peticion_path,
           :human_attribute_name, :params, :content_tag, :procedure_path,
           to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: procedures.count,
      iTotalDisplayRecords: procedures.count,
      data: data
    }
  end

  private
  def data
    paginated_procedures.map do |proc|
      [
        #index_procedure(proc),
        link_to(proc.id, procedure_path(proc), class: 'btn'),
        Procedure.human_attribute_name(proc.type),
        "iniciadores",
        proc.topic,
        #get_iniciadores(proc),
        to_date_time(proc.created_at),
        proc.sheets
      ]
    end
  end

  def procedures
    Procedure.order(id: :asc).where(filter)
  end

  def columns
    %w(id type nil topic created_at sheets)
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["courses.name ILIKE ? OR courses.code ILIKE ?
                  OR courses.type_course ILIKE ? OR courses.division ILIKE ?
                  OR courses.subdivision ILIKE ?" ]
      binds += [search] * 5
    end

    [query.join(' AND ')] + binds
  end

  def paginated_procedures
    procedures.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end
end
