class LegislativeFileDatatable
  delegate :content_tag, :params, :to_date, :legislative_file_path, :link_to, to: :@view

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
        file.number,
        file.topic,
        file.created_at.to_date,
        (file.origin_procedure.present? ? link_to(file.origin_procedure, file.origin_procedure) : ""),
        (file.loops.count - 1),
        content_tag(:i, nil, class: 'linktoprint btn btn-danger fa fa-print fa-lg',
          'data-expediente': file.id, 'data-nro': file.number, 'data-iniciador': '',
          'data-asunto': file.topic.try(:upcase), 'data-anio': to_date(file.date),
          title: 'Imprimir Carátula') +
        link_to('', legislative_file_path(file), class: 'btn btn-info fa fa-lg fa-eye')
      ]
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
      query += ["legislative_files.id::text ILIKE ?"]
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
