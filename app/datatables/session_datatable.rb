class SessionDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :edit_legislative_session_path,
  :content_tag, to: :@view

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
        session_number(session),
        session_type(session),
        session.place,
        session_secret(session),
        session_day_plan(session),
        format_date(session.started_at),
      ]
    end
  end

  def session_day_plan(session)
    content_tag :div, "##{session.number}", class: 'label label-primary', onclick: 'preventRedirection();'
  end

  def session_secret(session)
    session.secret ? 'Si' : 'No'
  end

  def session_number(session)
    number = "##{session.number}"
    content_tag :div, class: 'text-center current-url', 'data-url': edit_legislative_session_path(session) do
      "#{content_tag :b, number}".html_safe
    end
  end

  def session_type(session)
    I18n.t("sessions.types.#{session.session_type}")
  end

  def format_date(date)
    date.present? ? date.strftime('%d/%m/%Y - %H:%M') : ''
  end

  def legislative_sessions
    LegislativeSession.where(filter).order(created_at: :desc)
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
      query += ["(number::text ILIKE ?)"]
      binds += [search] * 1
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
end
