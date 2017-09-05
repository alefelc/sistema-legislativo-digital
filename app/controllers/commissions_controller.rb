class CommissionsController < ApplicationController
  def index
    @commissions = Comision.all
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  private
  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "denominacion ilike ?"
      Comision.where(w, q).to_json only: :id, methods: :text
    end
  end
end
