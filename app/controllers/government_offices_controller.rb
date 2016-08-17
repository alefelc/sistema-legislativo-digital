class GovernmentOfficesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: GovernmentOfficesDatatable.new(view_context) }
    end
  end

  def show
    @gov_office = ReparticionOficial.find params[:id]
  end

  def edit
    @gov_office = ReparticionOficial.find params[:id]
    render layout: false
  end

  def update
    gov_office = ReparticionOficial.find params[:id]
    gov_office.update government_offices_params
    render json: gov_office
  end

  private

  def government_offices_params
    params.require(:government_office).permit(:denominacion)
  end
end
