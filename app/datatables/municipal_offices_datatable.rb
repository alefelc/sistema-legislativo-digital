class MunicipalOfficesDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to_if, :current_user, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: municipal_offices.count,
      iTotalDisplayRecords: municipal_offices.count,
      data: data
    }
  end

  private

  def data
    paginated_municipal_offices.map do |p|
      [
        link_to_if(p.denominacion.present?, p.denominacion, municipal_office_path(p)),
        edit_button(p)
      ]
    end
  end

  def edit_button(municipal_office)
    link_to_if current_user.present?, '',
               edit_municipal_office_path(municipal_office),
               class: 'btn btn-warning fa fa-pencil-square-o municipal-office-edit',
               title: 'Editar Dependencia Municipal',
               remote: true
  end

  def municipal_offices
    MunicipalOffice.where(filter).order(:id)
  end

  def columns
    %w(denomination false)
  end

  def sort_column(column)
    columns[column.to_i]
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["(denominacion ILIKE ?)"]
      binds += [search] * 1
    end
    [query.join(' OR ')] + binds
  end

  def paginated_municipal_offices
    municipal_offices.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end
end
