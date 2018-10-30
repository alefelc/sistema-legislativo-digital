class LegislativeFileDatatable
  delegate :content_tag, :params, :to_date, :legislative_file_path, :link_to,
    :build_initiators, :legislative_file_print_path, :current_user,
    :edit_legislative_file_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: legislative_files.count,
      iTotalDisplayRecords: legislative_files.count,
      data: data
    }
  end

  private
  def data
    paginated_legislative_files.map do |file|
      [
        file_number(file),
        file.topic,
        created_at(file),
        origin_procedures(file),
        attached_files(file)
      ]
    end
  end

  def attached_files(file)
    attachements = ""
    file.uploads.each do |upload|
      attachements += link_to('', upload.file.url,
        class: 'btn btn-success fa fa-download tooltip-text', target: '_blank',
        onclick: "preventRedirection();", title: short_file_name(upload))
    end
    attachements
  end

  def short_file_name(file)
    return file.file_file_name if file.file_file_name.length <= 26
    file.file_file_name[0..26] + '...'
  end

  def file_number(file)
    file_url = legislative_file_path(file)
    file_url = edit_legislative_file_path(file) if current_user.belongs_to_area? :legislative_secretary

    number = file.number.present? ? "##{file.number}" : 'S/N'
    content_tag :b, number, 'data-url': file_url, class: 'current-url'
  end

  def created_at(file)
    if file.date.blank?
      'Fecha sin especificar'
    else
      content_tag :div, file.date.to_date, style: "white-space:nowrap;"
    end
  end

  def origin_procedures(file)
    links = ""
    if file.origin_procedures.present?
      file.origin_procedures.each do |proc|
        links += content_tag(:div, link_to(proc, proc, class: 'label label-info', onclick: "preventRedirection();")).html_safe
      end
      links
    end
  end

  def legislative_files
    loops = "LEFT OUTER JOIN loops AS l ON l.legislative_file_id = legislative_files.id AND l.number = 0"
    if params[:search][:value].present?
      loops = "LEFT OUTER JOIN loops AS l ON l.legislative_file_id = legislative_files.id AND l.number = 0"
      LegislativeFile.joins(loops).includes(:loops).where filter
    else
      LegislativeFile.order(id: :desc).joins(loops).where(filter).includes :loops
    end
  end

  def columns
    %w(number nil date_at nil nil nil)
  end

  def filter
    query = []
    binds = []

    if params[:search][:value].present?
      search = "%#{params[:search][:value]}%"
      query += ["legislative_files.number ILIKE ?"]
      query += ["l.topic ILIKE ?"]
      binds += [search] * 2
    end
    [query.join(' OR ')] + binds
  end

  def paginated_legislative_files
    legislative_files.page(page).per per_page
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def truncate(string, length = 30, ellipsis = '...')
    return string if string.length <= length
    string.to_s[0..length] + ellipsis
  end

  def tooltip(string, length)
  end
end
