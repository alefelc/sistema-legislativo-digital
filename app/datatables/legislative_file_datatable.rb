class LegislativeFileDatatable
  delegate :content_tag, :params, :to_date, :legislative_file_path, :link_to,
    :build_initiators, :legislative_file_print_path, to: :@view

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
    attachements = []
    file.uploads.each do |upload|
      content_tag :div do
        attachements << content_tag(:div, link_to(upload.file_file_name, upload.file.url))
      end
    end
    attachements
  end

  def file_number(file)
    content_tag :div, file.number, 'data-url': legislative_file_path(file), class: 'current-url'
  end

  def created_at(file)
    content_tag :div, file.created_at.to_date, style: "white-space:nowrap;"
  end

  def origin_procedures(file)
    links = []
    if file.origin_procedures.present?
      file.origin_procedures.each do |proc|
        links << content_tag(:div, link_to(proc, proc))
      end
      links
    end
  end

  def legislative_files
    LegislativeFile.order(id: :desc).where filter
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
      # query += ["legislative_files.id ILIKE ? OR legislative_files.code ILIKE ? OR legislative_files.type_course ILIKE ? OR legislative_files.division ILIKE ? OR legislative_files.subdivision ILIKE ?" ]
      binds += [search] * 1
    end

    # if params[:date_from].present? && params[:date_to].present?
    #   query += ["created_at BETWEEN ? AND ?"]
    #   binds += [params[:date_from]]
    #   binds += [params[:date_to]]
    # end

    # if params[:derivation_filter].present?
    #   ## Improve CONSTANTS HERE!!!!
    #   case params[:derivation_filter]
    #   when 'without_derivation'
    #     query += ['legislative_files.procedure_derivation_id IS null']
    #   when 'all_legislative_files'
    #     # DO NOTHING
    #     # query += ['legislative_files.procedure_derivation_id IS NOT null']
    #   when 'without_reception'
    #     query += ['legislative_files.procedure_derivation_id IS NOT null']
    #   when 'with_reception'
    #     query += ['legislative_files.procedure_derivation_id IS NOT null']
    #   end
    # end

    [query.join(' AND ')] + binds
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
end
