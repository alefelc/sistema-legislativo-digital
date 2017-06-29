class ProcedureDerivationDatatable
  delegate :params, :link_to, :content_tag, :derivated_procedure_path,
    :new_legislative_file_path, :procedure_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: get_raw_records.count,
      iTotalDisplayRecords: paginated_records.count,
      data: data
    }
  end

  def data
    paginated_records.map do |derivation|
      [
        procedure_link(derivation.procedure_id),
        derived_by_link(derivation),
        derivation.derived_at.to_s,
        received_by_link(derivation),
        derivation.received_at.to_s,
        confimation_button(derivation)
      ]
    end
  end

  private

  def received_by_link(derivation)
    if derivation.received_by.present?
      link_to derivation.received_by.full_name, derivation.received_by
    end
  end

  def derived_by_link(derivation)
    if derivation.derived_by.present?
      link_to derivation.derived_by.full_name, derivation.derived_by
    end
  end

  def procedure_link(proc_id)
    link_to proc_id, procedure_path(proc_id)
  end
  def confimation_button(derivation)
    unless derivation.received_at.present?
      link_to derivated_procedure_path(derivation), method: :put, class: 'btn btn-success btn-confirm-derivation', remote: true do
        content_tag :i, nil, class: 'fa fa-lg fa-check'
      end
    end
  end

  def get_raw_records
    ProcedureDerivation.order(id: :desc)#.where filter
  end

  def paginated_records
    get_raw_records.page(page).per per_page
  end

  def filter
    ""
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def page
    params[:start].to_i / per_page + 1
  end
end
