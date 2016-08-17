class GovernmentOfficesDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to_if, :current_user, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: government_offices.count,
      iTotalDisplayRecords: government_offices.count,
      data: data
    }
  end

  private

  def data
    paginated_government_offices.map do |p|
      [
        link_to_if(p.denominacion.present?, p.denominacion, government_office_path(p)),
        edit_button(p)
      ]
    end
  end

  def edit_button(gov_office)
    link_to_if current_user.present?, '',
               edit_government_office_path(gov_office),
               class: 'btn btn-warning fa fa-pencil-square-o gov-office-edit',
               title: 'Editar Reparticion Oficial',
               remote: true
  end

  def government_offices
    ReparticionOficial.where(filter).order(:id)
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

  def paginated_government_offices
    government_offices.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end
end
