class CouncilorsDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :current_user, :content_tag, to: :@view

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
        p.full_name,
        p.cuit_or_dni,
        p.address,
        p.phone,
        p.email,
        format_periods(p.periodos),
        edit_button(p)
      ]
    end
  end

  def edit_button(councilor)
    link_to edit_councilor_path(councilor), class: 'btn btn-warning', title: 'Editar Concejal' do
      content_tag 'i', '', class: 'fa fa-pencil-square-o'
    end
  end

  def councilors
    Concejal.where(filter).order(:id)
  end

  def columns
    %w(fullname cuit domicilio telefono email periods false)
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

  def format_periods(periods)
    ## link_to coming soon...
    periods.collect(&:format).join('\n')
  end
end
