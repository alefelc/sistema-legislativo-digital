class ProcedureDerivationDatatable
  delegate :params, :link_to, :content_tag, to: :@view

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
        derivation.procedure_id,
        derivation.derived_by,
        derivation.derived_at,
        derivation.received_by,
        derivation.received_at,
        confimation_button(derivation)
      ]
    end
  end

  private

  def confimation_button(derivation)
    if (derivation.received_at.blank?)
      link_to "#", class: 'btn btn-success' do
        content_tag :i, nil, class: 'fa fa-lg fa-check'
      end
    end
  end

  def get_raw_records
    ProcedureDerivation.order(id: :asc).where(filter)
  end

  def paginated_records
    get_raw_records.page(page).per(per_page)
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
