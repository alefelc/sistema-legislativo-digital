class DayPlansController < ApplicationController
  def new
    @dayplan = DayPlan.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  private
  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "number ilike ?"
      DayPlan.where(w, q).to_json(only: :id, methods: :text)
    else
      DayPlansDatatable.new(view_context)
    end
  end
end
