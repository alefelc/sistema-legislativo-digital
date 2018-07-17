class PeopleDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :current_user, :content_tag, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: persons.count,
      iTotalDisplayRecords: persons.count,
      data: data
    }
  end

  private
  def data
    paginated_persons.map do |p|
      [
        person_type(p),
        p.name,
        p.surname,
        p.address,
        p.cuit_or_dni,
        p.phone,
        p.email
      ]
    end
  end

  def person_type(person)
      content_tag :b, person.type, 'data-url': person_path(person), class: 'current-url'
    end

  def actions(p)
    link_to '', person_path(p), class: 'btn btn-info fa fa-eye'
  end

  def persons
    Person.where(filter).where.not(type: "Concejal").order(id: :desc)
  end

  def columns
    %w(type name surname address cuit_or_dni phone email)
  end

  def sort_column(column)
    columns[column.to_i]
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["(people.name ILIKE ?  OR people.surname ILIKE ?)"]
      query += ["(people.cuit_or_dni ILIKE ?  OR people.phone ILIKE ?)"]
      query += ["(people.email ILIKE ?)"]
      binds += [search] * 5
    end
    [query.join(' OR ')] + binds
  end

  def paginated_persons
    persons.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end
end
