class PeopleDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to_if, :current_user, to: :@view

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
        p.type,
        link_to_if(p.nombre.present?, p.nombre, person_path(p)),
        link_to_if(p.apellido.present?, p.apellido, person_path(p)),
        p.domicilio,
        p.nro_doc,
        p.telefono,
        p.email,
        edit_button(p)
      ]
    end
  end

  def edit_button(person)
    link_to_if current_user.present?, '',
               edit_person_path(person),
               class: 'btn btn-warning fa fa-pencil-square-o person-edit',
               title: 'Editar persona',
               remote: true
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
