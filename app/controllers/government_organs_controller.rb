class GovernmentOrgansController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: GovernmentOrgansDatatable.new(view_context) }
    end
  end

  def show
    @government_organ = OrganoDeGobierno.find params[:id]
  end

  def edit
    @government_organ = OrganoDeGobierno.find params[:id]
    render layout: false
  end

  def update
    government_organ = OrganoDeGobierno.find params[:id]
    government_organ.update government_organs_params
    render json: government_organ
  end

  private

  def government_organs_params
    params.require(:government_organ).permit(:denominacion)
  end
end
