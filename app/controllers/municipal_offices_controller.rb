class MunicipalOfficesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: MunicipalOfficesDatatable.new(view_context) }
    end
  end

  def show
    @municipal_office = DependenciaMunicipal.find params[:id]
  end

  def edit
    @municipal_office = DependenciaMunicipal.find params[:id]
    render layout: false
  end

  def update
    municipal_office = DependenciaMunicipal.find params[:id]
    municipal_office.update municipal_offices_params
    render json: municipal_office
  end

  private

  def municipal_offices_params
    params.require(:municipal_office).permit(:denominacion)
  end
end
