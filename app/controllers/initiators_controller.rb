class InitiatorsController < ApplicationController
  def new
    @initiator = Person.new
    render layout: false
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: get_index_json }
    end
  end

  def create
  end

  def update
  end

  private
  def get_index_json
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "name ilike ?"
      Person.where(w, q).limit(20).as_json
    else
      #InitiatorsDatatable.new(view_context)
    end
  end
end
