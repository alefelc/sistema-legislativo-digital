class PeopleDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :current_user, to: :@view

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
        p.id,
        p.type,
        p.name,
        p.surname,
        p.address,
        p.cuit_or_dni,
        p.phone,
        p.email,
        actions(p)
      ]
    end
  end

  def actions(p)
    link_to '', person_path(p), class: 'btn btn-info fa fa-eye'
  end

  def persons
    Person.where(filter).where.not(type: "Concejal").order(:id)
  end

  def columns
    %w(type nombre apellido domicilio nro_doc telefono email false)
  end

  def sort_column(column)
    columns[column.to_i]
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["(people.nombre ILIKE ?  OR people.apellido ILIKE ?)"]
      query += ["(people.nro_doc ILIKE ?  OR people.telefono ILIKE ?)"]
      query += ["(people.email ILIKE ?  OR people.domicilio ILIKE ?)"]
      binds += [search] * 6
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
