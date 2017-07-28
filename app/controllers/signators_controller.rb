class SignatorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def create
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
      w = "surname ilike ? OR name ilike ?"
      ProcedureSignatory.where(w, q, q).to_json only: :id, methods: :text
    end
  end
end
