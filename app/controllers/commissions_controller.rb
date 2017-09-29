class CommissionsController < ApplicationController
  def index
    @commissions = Comision.all
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def new
    @commission = Comision.new
  end

  def edit
    @commission = Comision.find params[:id]
  end

  def create
    @commission = Comision.new commission_params
  end

  def update
  end

  private
  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "denominacion ilike ?"
      Comision.where(w, q).to_json only: :id, methods: :text
    end
  end

  def commission_params
    params.require(:comision).permit(:denominacion, :periodos)
  end
end
