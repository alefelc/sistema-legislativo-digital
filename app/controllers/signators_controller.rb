class SignatorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def create
    if params[:name].blank? && params[:surname].blank? && params[:position].blank? &&
      params[:contact_info].blank?
      return render json: { status: :ok }
    end
    signatory = ProcedureSignatory.create signator_params

    render json: signatory.to_json(methods: :text)
  end

  private

  def signator_params
    params.permit :name, :surname, :position, :contact_info, :initiator_type
  end

  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "(surname ilike ? OR name ilike ?) AND initiator_type = ?"
      type = ProcedureSignatory.initiator_types[params[:initiator_type].to_sym]
      ProcedureSignatory.where(w, q, q, type).to_json only: :id, methods: :text
    end
  end
end
