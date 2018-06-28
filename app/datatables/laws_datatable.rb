class LawsDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :content_tag, :law_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: laws.count,
      iTotalDisplayRecords: laws.count,
      data: data
    }
  end

  private
  def data
    paginated_laws.map do |law|
      [
        law_number(law),
        I18n.t("laws.types.#{law.law_type}"),
        law_session(law),
        law_legislative_file(law),
        law.created_at.strftime('%d/%m/%Y'),
        attached_files(law)
      ]
    end
  end

  def law_session(law)
    content_tag :div, law.id, class: 'label label-warning'
  end

  def law_legislative_file(law)
    content_tag :div, law.id, class: 'label label-info'
  end

  def law_number(law)
    content_tag :b, "##{law.number} / #{law.year}", 'data-url': law_path(law), class: 'current-url'
  end

  def attached_files(law)
    attachements = ""
    law.uploads.each do |upload|
      content_tag :div do
        attachements += content_tag(:div, link_to(upload.file_file_name,
          upload.file.url, class: 'label label-success', target: '_blank',
          onclick: "preventRedirection();"))
      end
    end
    attachements
  end

  def format_date(date)
    date.present? ? date.strftime('%d/%m/%Y - %H:%M') : ''
  end

  def laws
    Law.where(filter).order(created_at: :desc)
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
      query += ["(laws.number ILIKE ?)"]
      binds += [search] * 1
    end
    [query.join(' OR ')] + binds
  end

  def paginated_laws
    laws.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def actions(law)
    link_to '', law, class: 'btn btn-info fa fa-eye'
  end
end
