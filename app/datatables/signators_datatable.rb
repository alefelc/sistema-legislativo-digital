class SignatorsDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :content_tag, :edit_signator_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: signators.count,
      iTotalDisplayRecords: signators.count,
      data: data
    }
  end

  private
  def data
    paginated_signators.map do |signatory|
      [
        signatory_id(signatory),
        signatory.name,
        signatory.surname,
        signatory.position,
        signatory.contact_info,
        type_tr(signatory.initiator_type),
        format_date(signatory.leave_date)
      ]
    end
  end

  def type_tr(type)
    I18n.t "signatories.initiator_types.#{type}"
  end

  def signatory_id(signatory)
    content_tag :b, "##{signatory.id}", 'data-url': edit_signator_path(signatory), class: 'current-url'
  end

  def format_date(date)
    date.present? ? date.strftime('%d/%m/%Y') : ''
  end

  def signators
    ProcedureSignatory.where(filter).order(id: :desc)
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
      query += ["(surname ILIKE ?)"]
      query += ["(name ILIKE ?)"]
      query += ["(position ILIKE ?)"]
      binds += [search] * 3
    end
    [query.join(' OR ')] + binds
  end

  def paginated_signators
    signators.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end
end
