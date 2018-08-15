class DayPlansDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :content_tag, :day_plan_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: day_plans.count,
      iTotalDisplayRecords: day_plans.count,
      data: data
    }
  end

  private
  def data
    paginated_day_plans.map do |day_plan|
      [
        day_plan_number(day_plan),
        I18n.t("day_plans.types.#{day_plan.day_plan_type}"),
        day_plan_session(day_plan),
        day_plan_legislative_file(day_plan),
        day_plan.created_at.strftime('%d/%m/%Y'),
        attached_files(day_plan)
      ]
    end
  end

  def day_plan_session(day_plan)
    # states = day_plan.legislative_file_states.sanctioned
    # return unless states.present?
    # session = states.first.legislative_session
    # return unless session.present?
    session = day_plan.legislative_session
    return if session.nil?
    link_to session, session, class: 'label label-warning'
  end

  def day_plan_legislative_file(day_plan)
    file_ids = day_plan.legislative_file_states.collect &:legislative_file_id
    files = LegislativeFile.where id: file_ids
    return unless files.present?
    labels = ""
    files.each do |lf|
      labels += content_tag(:div, link_to(lf, lf, class: 'label label-info'), class: 'float-left')
    end
    labels.html_safe
  end

  def day_plan_number(day_plan)
    content_tag :b, "##{day_plan.number} / #{day_plan.year}", 'data-url': day_plan_path(day_plan), class: 'current-url'
  end

  def attached_files(day_plan)
    attachements = ""
    day_plan.uploads.each do |upload|
      content_tag :div do
        attachements += content_tag(:div, link_to('',
          upload.file.url, class: 'btn btn-success fa fa-download tooltip-text', target: '_blank',
          onclick: "preventRedirection();", title: upload.file_file_name))
      end
    end
    attachements
  end

  def format_date(date)
    date.present? ? date.strftime('%d/%m/%Y - %H:%M') : ''
  end

  def day_plans
    DayPlan.where(filter).order(created_at: :desc)
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
      query += ["(day_plans.number ILIKE ?)"]
      binds += [search] * 1
    end
    [query.join(' OR ')] + binds
  end

  def paginated_day_plans
    day_plans.page(page).per(per_page)
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def actions(day_plan)
    link_to '', day_plan, class: 'btn btn-info fa fa-eye'
  end
end
