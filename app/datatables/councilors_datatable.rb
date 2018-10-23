class CouncilorsDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :current_user, :content_tag,
    :edit_councilor_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: councilors.count,
      iTotalDisplayRecords: councilors.count,
      data: data
    }
  end

  private

  def data
    paginated_councilors.map do |p|
      [
        full_name(p),
        current_block(p),
        p.phone,
        p.email,
        effective_time(p)
      ]
    end
  end

  def current_block(person)
    person.bloque.to_s
  end

  def full_name(person)
    content_tag :div, class: 'text-center current-url', 'data-url': edit_councilor_path(person) do
      "#{person.surname}, #{person.name}"
    end
  end

  def councilors
    Concejal.where(filter).order(id: :desc)
  end

  def columns
    %w(fullname cuit domicilio telefono email periods)
  end

  def sort_column(column)
    columns[column.to_i]
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["(name ILIKE ? OR surname ILIKE ?)"]
      binds += [search] * 2
    end
    [query.join(' OR ')] + binds
  end

  def paginated_councilors
    councilors.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def effective_time(councilor)
    if councilor.effective_time_to.blank?
      "No hay periodo asociado"
    elsif Date.current > councilor.effective_time_to
      "Mandato cumplido"
    else
      councilor.effective_time_to
    end
  end
end
