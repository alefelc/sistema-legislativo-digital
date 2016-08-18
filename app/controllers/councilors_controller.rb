class CouncilorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: CouncilorsDatatable.new(view_context) }
    end
  end

  def show
    @councilor = Concejal.find params[:id]
  end

  def edit
    @councilor = Concejal.find params[:id]
    render layout: false
  end

  def update
    councilor = Concejal.find params[:id]
    councilor.update councilors_params
    render json: councilor
  end

  private

  def councilors_params
    params.require(:councilor).permit(:nombre, :apellido, :cuit, :telefono, :email,
                                      :domicilio, :cargo, :bloque_id)
  end
end
