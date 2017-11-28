class SessionDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: legislative_sessions.count,
      iTotalDisplayRecords: legislative_sessions.count,
      data: data
    }
  end

  private
  def data
    paginated_legislative_sessions.map do |session|
      [
        session.id,
        session.number,
        I18n.t("sessions.types.#{session.session_type}"),
        format_date(session.started_at),
        session.place,
        session.secret,
        session.observation,
        actions(session)
      ]
    end
  end

  def format_date(date)
    date.present? ? date.strftime('%d/%m/%Y - %H:%M') : ''
  end

  def legislative_sessions
    LegislativeSession.where(filter).order(:id)
  end

  def columns
    %w(id session_type started_at place secret observacion false)
  end

  def sort_column(column)
    columns[column.to_i]
  end

  def filter
    query = []
    binds = []

    ## Must be fixed
    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["(people.nombre ILIKE ?  OR people.apellido ILIKE ?)"]
      query += ["(people.nro_doc ILIKE ?  OR people.telefono ILIKE ?)"]
      query += ["(people.email ILIKE ?  OR people.domicilio ILIKE ?)"]
      binds += [search] * 6
    end
    [query.join(' OR ')] + binds
  end

  def paginated_legislative_sessions
    legislative_sessions.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def actions(session)
    link_to '', session, class: 'btn btn-info fa fa-eye'
  end
end
